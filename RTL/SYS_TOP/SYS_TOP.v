module SYS_TOP #(
    // ALU Parameters
    parameter N   = 8, 
    parameter OPERAND_WIDTH = N, 
    parameter FUN_WIDTH     = 4,
    parameter ALU_OUTPUT_WIDTH  = 2*N,

    // REG_FILE Parameters
    parameter MEM_DEPTH = 16,
    parameter MEM_WIDTH = 8,
    parameter ADDR_WIDTH = $clog2(MEM_DEPTH), // 4

    // UART parameter
    parameter UART_DATA_WIDTH = 8
) (
    // Global Signals
    input  wire REF_CLK,
    input  wire UART_CLK,
    input  wire RST,

    // Input Ports
    input  wire RX_IN,
    
    // Output Ports
    output wire TX_OUT,
    output wire parity_error,
    output wire Stop_Error
);

/* =============== Internal Connections =============== */

    // Reset Signals
    wire SYNC_UART_RST, SYNC_REF_RST;

    // UART Signals
    wire [OPERAND_WIDTH-1:0]   UART_CONFIG; 
    wire [UART_DATA_WIDTH-1:0] RX_OUT_P;
    wire                       RX_OUT_V;
    wire [UART_DATA_WIDTH-1:0] RX_OUT_P_SYNC;
    wire                       RX_OUT_V_SYNC;
    
    wire [UART_DATA_WIDTH-1:0] TX_IN_P;
    wire                       TX_IN_V;
    wire [UART_DATA_WIDTH-1:0] TX_OUT_S;
    wire                       TX_OUT_V; //== !FIFO EMPTY

    wire                       TX_BUSY;
    wire                       TX_BUSY_PULSE;

    // FIFO Signals
    wire                       FIFO_FULL;
    wire                       F_EMPTY;
    wire                       RD_INC;
    wire                       WR_INC;
    wire [MEM_WIDTH-1:0]       WR_DATA;
    wire [MEM_WIDTH-1:0]       RD_DATA;

    // Register File Signals 
    wire                       WrEn;
    wire                       RdEn;
    wire [ADDR_WIDTH-1:0]      Address;
    wire [MEM_WIDTH-1:0]       WrData;
    wire [MEM_WIDTH-1:0]       RdData;
    wire                       RdData_Valid;

    // ALU Signals 
    wire [OPERAND_WIDTH-1:0]   OP_A; // REG0
    wire [OPERAND_WIDTH-1:0]   OP_B; // REG1
    wire [FUN_WIDTH-1:0]       ALU_FUN;
    wire                       ALU_ENABLE;
    wire [ALU_OUTPUT_WIDTH-1:0] ALU_OUT;
    wire                       ALU_OUT_VALID;

    // Clock Signals
    wire                       GATE_EN;
    wire                       ALU_CLK;
    wire                       CLKDIV_EN;
    wire [MEM_WIDTH-1:0]       DIV_RATIO;
    wire [MEM_WIDTH-1:0]       DIV_RATIO_RX;
    wire                       UART_TX_CLK;
    wire                       UART_RX_CLK;

/* =============== Instantiations =============== */

    // Reset Synchronizers
    RST_SYNC #(.NUM_STAGES(2)) RST_SYNC_UART_UNIT (
        .RST(RST),
        .CLK(UART_CLK),
        .SYNC_RST(SYNC_UART_RST)
    );

    RST_SYNC #(.NUM_STAGES(2)) RST_SYNC_REF_UNIT (
        .RST(RST),
        .CLK(REF_CLK),
        .SYNC_RST(SYNC_REF_RST)
    );

    // Data Synchronizer (UART RX to REF_CLK domain)
    DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(UART_DATA_WIDTH)) DATA_SYNC_UNIT (
        .CLK(REF_CLK),
        .RST(SYNC_REF_RST),
        .Unsync_bus(RX_OUT_P),
        .BUS_ENABLE(RX_OUT_V),
        .SYNC_BUS(RX_OUT_P_SYNC),
        .ENABLE_PULSE(RX_OUT_V_SYNC)
    );

    // Async FIFO (REF_CLK to UART_TX_CLK domain)
    FIFO #(.DATASIZE(UART_DATA_WIDTH), .MEMDEPTH(8)) FIFO_UNIT (
        .wclk(REF_CLK),
        .wrst_n(SYNC_REF_RST),
        .winc(TX_IN_V),
        .wdata(TX_IN_P),
        .rclk(UART_TX_CLK),
        .rrst_n(SYNC_UART_RST),
        .rinc(TX_BUSY_PULSE),
        .rdata(TX_OUT_S),
        .wfull(FIFO_FULL),
        .rempty(TX_OUT_V)
    );

    // Pulse Generator for FIFO read control
    PULSE_GEN PULSE_GEN_UNIT (
        .CLK(UART_TX_CLK),
        .RST(SYNC_UART_RST),
        .LVL_SIG(TX_BUSY),
        .PULSE_SIG(TX_BUSY_PULSE)
    );

    // Clock Divider for UART_TX
    CLK_DIV #(.DIV_RATIO(8)) CLK_DIV_TX_UNIT (
        .I_ref_clk(UART_CLK),
        .I_rst_n(SYNC_UART_RST),
        .I_clk_en(CLKDIV_EN),
        .I_div_ratio(DIV_RATIO),
        .O_div_clk(UART_TX_CLK)
    );

    // Clock Divider MUX for UART_TX
    PRESCALE_MUX #(.MEM_WIDTH(8)) PRESCALE_MUX_UNIT (
	.PRESCALE(UART_CONFIG[7:2]),
	.DIV_RATIO_MUX(DIV_RATIO_RX)
	);

    // Clock Divider for UART_RX (
    CLK_DIV #(.DIV_RATIO(8)) CLK_DIV_RX_UNIT (
        .I_ref_clk(UART_CLK),
        .I_rst_n(SYNC_UART_RST),
        .I_clk_en(CLKDIV_EN),
        .I_div_ratio(DIV_RATIO_RX), 
        .O_div_clk(UART_RX_CLK)
    );

    // UART Module
    UART #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) UART_UNIT (
        .RST(SYNC_UART_RST),
        .TX_CLK(UART_TX_CLK),
        .RX_CLK(UART_RX_CLK),
        .RX_IN_S(RX_IN),
        .RX_OUT_P(RX_OUT_P),
        .RX_OUT_V(RX_OUT_V),
        .TX_IN_P(TX_OUT_S),
        .TX_IN_V(~TX_OUT_V), // Transmit when FIFO not empty
        .TX_OUT_S(TX_OUT),
        .TX_OUT_V(TX_BUSY),
        .Prescale(UART_CONFIG[7:2]),
        .parity_enable(UART_CONFIG[0]),
        .parity_type(UART_CONFIG[1]),
        .parity_error(parity_error),
        .Stop_Error(Stop_Error)
    );

    // System Controller
    SYS_CTRL #(
        .N(N),
        .OPERAND_WIDTH(OPERAND_WIDTH),
        .FUN_WIDTH(FUN_WIDTH),
        .ALU_OUTPUT_WIDTH(ALU_OUTPUT_WIDTH),
        .MEM_DEPTH(MEM_DEPTH),
        .MEM_WIDTH(MEM_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .UART_DATA_WIDTH(UART_DATA_WIDTH)
    ) SYS_CTRL_UNIT (
        .CLK(REF_CLK),
        .RST(SYNC_REF_RST),
        .ALU_OUT(ALU_OUT),
        .ALU_OUT_VALID(ALU_OUT_VALID),
        .ALU_FUN(ALU_FUN),
        .ALU_ENABLE(ALU_ENABLE),
        .RdData(RdData),
        .RdData_Valid(RdData_Valid),
        .Address(Address),
        .WrEn(WrEn),
        .RdEn(RdEn),
        .WrData(WrData),
        .CLK_EN(GATE_EN),
        .RX_P_DATA(RX_OUT_P_SYNC),
        .RX_D_VLD(RX_OUT_V_SYNC),
        .TX_P_DATA(TX_IN_P),
        .TX_D_VLD(TX_IN_V),
        .FIFO_FULL(FIFO_FULL),
        .clk_div_en(CLKDIV_EN)
    );

    // Register File
    REG_FILE #(
        .MEM_DEPTH(MEM_DEPTH),
        .MEM_WIDTH(MEM_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) REG_FILE_UNIT (
        .CLK(REF_CLK),
        .RST(SYNC_REF_RST),
        .WrEn(WrEn),
        .RdEn(RdEn),
        .Address(Address),
        .WrData(WrData),
        .RdData(RdData),
        .RdData_Valid(RdData_Valid),
        .REG0(OP_A),
        .REG1(OP_B),
        .REG2(UART_CONFIG),
        .REG3(DIV_RATIO)
    );

    // Clock Gating for ALU
    CLK_GATE CLOCK_GATE_UNIT (
        .CLK(REF_CLK),
        .CLK_EN(GATE_EN),
        .GATED_CLK(ALU_CLK)
    );

    // ALU
    ALU #(
        .N(N),
        .OPERAND_WIDTH(OPERAND_WIDTH),
        .FUN_WIDTH(FUN_WIDTH),
        .ALU_OUTPUT_WIDTH(ALU_OUTPUT_WIDTH)
    ) ALU_UNIT (
        .CLK(ALU_CLK),
        .RST(SYNC_REF_RST),
        .A(OP_A),
        .B(OP_B),
        .ALU_FUN(ALU_FUN),
        .ALU_ENABLE(ALU_ENABLE),
        .ALU_OUT(ALU_OUT),
        .ALU_OUT_VALID(ALU_OUT_VALID)
    );

endmodule
