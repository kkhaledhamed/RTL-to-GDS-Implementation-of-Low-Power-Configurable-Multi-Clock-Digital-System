module data_sampling #(parameter UART_DATA_WIDTH = 8)(
	input wire 						 CLK, 
	input wire 						 RST,
	//UART_RX support oversampling by 8, 16, 32
	input wire     [5:0]			 prescale,
	input wire     [5:0]             edge_cnt,
	input wire                       RX_IN,
	input wire                       data_samp_en,
	output reg 						 sampled_bit
	);

	
	// Internal Signals
	wire [4:0] NEG_EDGE,
			   NEG_EDGE_MINUS,
			   NEG_EDGE_PLUS;

	// 3 bits, 1 bit for each sample
	reg [2:0] samples;

	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			samples <= 0;
		end else if (data_samp_en) begin

			case (edge_cnt)
                NEG_EDGE_MINUS: begin
                	samples[0] <= RX_IN; 
                end 
                
                NEG_EDGE: begin
                	samples[1] <= RX_IN;
                end       
                
                NEG_EDGE_PLUS: begin
                	samples[2] <= RX_IN; 
                end 
            endcase

		end else begin
			samples <= 0;
		end
	end

	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			sampled_bit <= 0;
		end else if(data_samp_en)begin

			case (samples)
                3'b011, 3'b101, 3'b110, 3'b111: begin
                	sampled_bit <= 1;
                end 
                default: begin
                	sampled_bit <= 0;
                end	
            endcase
		
		end
	end

	// 3 Edges sampling
	assign NEG_EDGE       = (prescale >> 1) - 1;
	assign NEG_EDGE_MINUS = NEG_EDGE - 1;
	assign NEG_EDGE_PLUS  = NEG_EDGE + 1;

endmodule