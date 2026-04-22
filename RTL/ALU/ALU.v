module ALU #(
	parameter N   = 8, 
	OPERAND_WIDTH = N, 
    FUN_WIDTH     = 4,
    ALU_OUTPUT_WIDTH  = 2*N)
( 
	// Input Ports
	input  wire 		              CLK,RST,
	input  wire [OPERAND_WIDTH-1:0]   A, // REG0
									  B, // REG1
	input  wire [FUN_WIDTH-1:0]       ALU_FUN, // SYS_CTRL
	input  wire 					  ALU_ENABLE,  // SYS_CTRL
	
	// Output Ports
	output reg  [ALU_OUTPUT_WIDTH-1:0] ALU_OUT, // SYS_CTRL
	output reg        ALU_OUT_VALID // SYS_CTRL
);
	
	// Internal Register 
	reg [ALU_OUTPUT_WIDTH-1:0] ALU_OUT_Comb;
	reg ALU_OUT_VALID_Comb; 

	/* ======== Functionality ======== */
	// Combinational Cloud
	always @(*) begin 
		ALU_OUT_Comb      = 'b0;
		ALU_OUT_VALID_Comb    = 0;
		if (ALU_ENABLE) begin
			ALU_OUT_VALID_Comb    = 1;
			case(ALU_FUN) 
			4'b0000: begin
				ALU_OUT_Comb = A + B;
			end
			4'b0001: begin
				ALU_OUT_Comb = A - B;
			end
			4'b0010: begin
				ALU_OUT_Comb = A * B;
			end
			4'b0011: begin
				if (B == 'b0) begin
					ALU_OUT_Comb  = {ALU_OUTPUT_WIDTH{1'b1}};
					// Indication to infinity, A/0 -> INFINITY 
				end
				else begin
					ALU_OUT_Comb = A / B;
				end
			end
			4'b0100: begin
				ALU_OUT_Comb = A & B;
			end
			4'b0101: begin
				ALU_OUT_Comb = A | B;
			end
			4'b0110: begin
				ALU_OUT_Comb = ~(A & B);
			end
			4'b0111: begin
				ALU_OUT_Comb = ~(A | B);			
			end
			4'b1000: begin
				ALU_OUT_Comb = A ^ B;			
			end
			4'b1001: begin
				ALU_OUT_Comb = ~(A ^ B);
			end
			4'b1010: begin
				if ( A == B) begin
					ALU_OUT_Comb = 'h1;  // Another Method : ALU_OUT_Comb = (A==B) ? 16'b1 : 16'b0 ;
				end else begin
					ALU_OUT_Comb = 'h0;
				end
			end
			4'b1011: begin
				if ( A > B) begin
					ALU_OUT_Comb = 'h2;
				end else begin
					ALU_OUT_Comb = 'h0;
				end		
			end
			4'b1100: begin
				if ( A < B) begin
					ALU_OUT_Comb = 'h3;
				end else begin
					ALU_OUT_Comb = 'h0;
				end
			end
			4'b1101: begin
				ALU_OUT_Comb = A >> 1;
			end
			4'b1110: begin
				ALU_OUT_Comb = A << 1;
			end
			default: begin
				ALU_OUT_Comb      = 'b0;
			end 
		endcase
		end else begin
			ALU_OUT_VALID_Comb    = 0;
		end
	end

	// Output registering
	always @(posedge CLK or negedge RST) begin 
		if (!RST) begin
			ALU_OUT <= 'b0;
			ALU_OUT_VALID <= 0;
		end else begin
			ALU_OUT   <= ALU_OUT_Comb;
			ALU_OUT_VALID <= ALU_OUT_VALID_Comb;
		end
	end

	/* Could merge the above 2 always blocks into one sequential always block 
		and assign to ALU_OUT directly without an internal signal*/

endmodule