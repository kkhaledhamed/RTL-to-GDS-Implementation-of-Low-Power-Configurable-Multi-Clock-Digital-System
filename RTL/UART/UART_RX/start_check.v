module start_check (
	input wire 						 CLK, 
	input wire 						 RST,
	input wire 						 start_chk_en,
	input wire 						 sampled_bit,
	output reg                       start_glitch
	);

	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			start_glitch <= 0;
		end else if (start_chk_en) begin
			start_glitch <= sampled_bit ;
		end 	
	end

endmodule