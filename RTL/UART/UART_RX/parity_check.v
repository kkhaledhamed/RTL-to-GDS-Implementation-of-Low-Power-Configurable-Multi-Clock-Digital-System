module parity_check #(parameter UART_DATA_WIDTH = 8)(
    input  wire                         CLK, 
    input  wire                         RST,
    input  wire                         par_chk_en,
    input  wire                         sampled_bit,
    input  wire                         PAR_TYPE,   // 0: Even, 1: Odd
    input  wire [UART_DATA_WIDTH-1:0]   P_DATA,
    output reg                          par_err
);

    reg par_val;

    // Compute parity 
    always @(*) begin
        case (PAR_TYPE)
            1'b0: par_val = ^P_DATA;   // Even parity
            1'b1: par_val = ~^P_DATA;  // Odd parity
            default: par_val = 1'b0;
        endcase
    end

    // Parity check
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            par_err <= 1'b0;
        end
        else if (par_chk_en) begin
            case ({sampled_bit, par_val})
                2'b00, 2'b11: par_err <= 1'b0;  // match -> no error
                2'b01, 2'b10: par_err <= 1'b1;  // mismatch -> error
                default: par_err <= 1'b0;
            endcase
        end
    end

endmodule
