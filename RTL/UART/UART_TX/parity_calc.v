module parity_calc #(
    parameter UART_DATA_WIDTH = 8
) (
    input  wire [UART_DATA_WIDTH-1:0] P_DATA,
    input  wire                       Busy,
    input  wire                       DATA_VALID,
    input  wire                       PAR_TYPE,
    input  wire                       PAR_EN,
    input  wire                       CLK,
    input  wire                       RST,
    output reg                        par_bit
);

    // Internal register to hold input data
    reg [UART_DATA_WIDTH-1:0] P_DATA_REG;

    // Capture input data when valid and transmitter is idle
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            P_DATA_REG <= {UART_DATA_WIDTH{1'b0}};
        else if (DATA_VALID && !Busy)
            P_DATA_REG <= P_DATA;
    end

    // Parity calculation
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            par_bit <= 1'b0;
        else if (PAR_EN) begin
            case (PAR_TYPE)
                1'b0: par_bit <= ^P_DATA_REG;   // Even parity
                1'b1: par_bit <= ~^P_DATA_REG;  // Odd parity
                default: par_bit <= 1'b0;
            endcase
        end
    end

endmodule
