module MUX (
    input  wire        CLK,
    input  wire        RST,
    input  wire [1:0]  mux_sel,
    input  wire        IN0,   // start_bit
    input  wire        IN1,   // ser_data
    input  wire        IN2,   // par_bit 
    input  wire        IN3,   // stop_bit
    output reg         MUX_OUT    // TX_OUT
);

    reg mux_comb;

    // Combinational MUX
    always @(*) begin
        mux_comb = 1'b1; // default
        case (mux_sel)
            2'b00: mux_comb = IN0;
            2'b01: mux_comb = IN1;
            2'b10: mux_comb = IN2;
            2'b11: mux_comb = IN3;
        endcase
    end

    // Registered output
    always @(posedge CLK or negedge RST) begin 
        if (!RST)
            MUX_OUT <= 1'b0;
        else
            MUX_OUT <= mux_comb;
    end

endmodule
