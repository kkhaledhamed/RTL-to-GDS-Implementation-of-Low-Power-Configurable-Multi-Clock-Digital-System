module serializer #(
    parameter UART_DATA_WIDTH = 8
) (
    input  wire                      CLK,
    input  wire                      RST,
    input  wire [UART_DATA_WIDTH-1:0] P_DATA,
    input  wire                      DATA_VALID,
    input  wire                      Busy,
    input  wire                      SER_EN,

    output wire                      SER_DONE,
    output wire                      SER_DATA
);

    // Counter width based on data width
    localparam COUNTER_WIDTH = $clog2(UART_DATA_WIDTH);

    // Internal registers
    reg [UART_DATA_WIDTH-1:0] P_DATA_REG;
    reg [COUNTER_WIDTH-1:0]   SER_COUNTER;

    // Shift register (load on DATA_VALID, shift on SER_EN)
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            P_DATA_REG <= {UART_DATA_WIDTH{1'b0}};
        else if (DATA_VALID && !Busy)
            P_DATA_REG <= P_DATA;
        else if (SER_EN)
            P_DATA_REG <= P_DATA_REG >> 1; // shift right
    end

    // Serial counter
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            SER_COUNTER <= {COUNTER_WIDTH{1'b0}};
        else if (SER_EN)
            SER_COUNTER <= SER_COUNTER + 1'b1;
        else
            SER_COUNTER <= {COUNTER_WIDTH{1'b0}};
    end

    // Output assignments
    assign SER_DATA = P_DATA_REG[0];  // LSB first
    assign SER_DONE = (SER_COUNTER == (UART_DATA_WIDTH-1));

endmodule
