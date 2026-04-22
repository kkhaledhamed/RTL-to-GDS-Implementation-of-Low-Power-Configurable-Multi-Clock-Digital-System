module PRESCALE_MUX #(
	parameter MEM_WIDTH = 8
	)(
	input wire [5:0] 			  PRESCALE,
	output reg [MEM_WIDTH-1:0]    DIV_RATIO_MUX
	);

	always @(*) begin 
		if (PRESCALE == 6'b100000) begin
			DIV_RATIO_MUX = 1;
		end else if (PRESCALE == 6'b010000) begin
			DIV_RATIO_MUX = 2;
		end else if (PRESCALE == 6'b001000) begin
			DIV_RATIO_MUX = 4;
		end else if (PRESCALE == 6'b000100) begin
			DIV_RATIO_MUX = 8;
		end else begin
			DIV_RATIO_MUX = 1;
		end
	end
endmodule