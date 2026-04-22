module stop_check (
    input  wire CLK, 
    input  wire RST,
    input  wire stop_chk_en,
    input  wire sampled_bit,
    output reg  stop_err
);

    always @(posedge CLK or negedge RST) begin 
        if (~RST) begin
            stop_err <= 1'b0;
        end 
        else if (stop_chk_en && (sampled_bit == 1'b0)) begin
            stop_err <= 1'b1;
        end 
        else begin
            stop_err <= 1'b0;
        end
    end

endmodule
