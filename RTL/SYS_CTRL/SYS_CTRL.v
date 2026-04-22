module SYS_CTRL #(
	// ALU Paramters
	parameter N   = 8, 
	OPERAND_WIDTH = N, 
    FUN_WIDTH     = 4,
    ALU_OUTPUT_WIDTH  = 2*N,

    // REG_FILE Paramters
	parameter MEM_DEPTH = 16,
	parameter MEM_WIDTH = 8,
    parameter ADDR_WIDTH = $clog2(MEM_DEPTH), // 4

    // UART parameter
    parameter UART_DATA_WIDTH = 8
	) (

	// Global Signals
   input  wire                   	   CLK,      // REF_CLK
   input  wire                         RST,      // RST_SYNC

   // ALU Interface
   input   wire [ALU_OUTPUT_WIDTH-1:0]     ALU_OUT,  
   input   wire 						   ALU_OUT_VALID,  
   output  reg [FUN_WIDTH-1:0]             ALU_FUN, 
   output  reg 					           ALU_ENABLE,  

   // Reg File Interface
   input  wire   [MEM_WIDTH-1:0]  RdData,   
   input  wire   				  RdData_Valid,
   output reg   [ADDR_WIDTH-1:0]  Address,
   output reg                     WrEn,
   output reg                     RdEn,
   output reg   [MEM_WIDTH-1:0]   WrData,

   // Clock Gate Interface
   output  reg 					    CLK_EN,  

   // UART Interface
   input wire [UART_DATA_WIDTH-1:0] RX_P_DATA, 
   input wire                       RX_D_VLD,
   output reg [UART_DATA_WIDTH-1:0] TX_P_DATA, 
   output reg                       TX_D_VLD,

   // FIFO Interface
   input    wire                 FIFO_FULL,
   // Clock Divider Interface
   output reg                      clk_div_en
);
	// Reserved start values for supported commands
	localparam  [7:0]   RF_WR_CMD  		   = 8'hAA ,
	                    RF_RD_CMD          = 8'hBB ,
						ALU_OPER_W_OP_CMD  = 8'hCC ,
						ALU_OPER_W_NOP_CMD = 8'hDD ;

	// States
	localparam [3:0]    IDLE 			   		  = 4'b0000,
						RF_WR_WRITE_ADDRESS 	  = 4'b0001, 
						RF_WR_WRITE_DATA    	  = 4'b0010, 
						RF_RD_READ_ADDRESS  	  = 4'b0011, 
						RF_RD_WRITE_BACK_DATA     = 4'b0100, 
						ALU_OPER_W_OPA     		  = 4'b0101, 
						ALU_OPER_W_OPB            = 4'b0110, 
						ALU_OPER_FUN       		  = 4'b0111, 
						ALU_STORE           	  = 4'b1000, 
						ALU_WAIT_BYTE1     		  = 4'b1001, 
						ALU_WAIT_BYTE2     		  = 4'b1010; 

	// Current and Next States
	reg [3:0] current_state, next_state;

	// Save Flags for ALU and RF
	reg ALU_OUT_SAVE_FLAG, RF_ADDRESS_SAVE_FLAG;

	// Internal Registers
	reg [MEM_WIDTH-1:0]        RF_ADDR_REG;       // Store register address
	reg [ALU_OUTPUT_WIDTH-1:0] ALU_OUTPUT_REG;    // Store ALU result on 2 times

	// Internal Registers Storage Logic 
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            RF_ADDR_REG <= 'b0;
        end else if (RF_ADDRESS_SAVE_FLAG) begin
            RF_ADDR_REG <= RX_P_DATA;  // Save register address
        end
    end

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            ALU_OUTPUT_REG <= 'b0;
        end else if (ALU_OUT_SAVE_FLAG) begin
            ALU_OUTPUT_REG <= ALU_OUT;  // Save ALU result
        end
    end

	// Current State Seq Logic
	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			current_state <= IDLE;
		end else begin
			current_state <= next_state;
		end
	end

	// ========== Register File Operations ========== //
	// Write: 0xAA -> Address -> Data
	// Read: 0xBB -> Address -> Send Data

	// ========== ALU Operations ========== //
	// With operands: 0xCC -> OPA -> OPB -> FUNC -> Send Result
	// Without operands: 0xDD -> FUNC -> Send Result  

	// Next State Comb Logic
	always @(*) begin 
		case (current_state)
			IDLE: begin
				if (RX_D_VLD) begin
					if (RX_P_DATA == RF_WR_CMD) begin
						next_state = RF_WR_WRITE_ADDRESS;
					end else if (RX_P_DATA == RF_RD_CMD) begin
						next_state = RF_RD_READ_ADDRESS;
					end else if (RX_P_DATA == ALU_OPER_W_OP_CMD) begin
						next_state = ALU_OPER_W_OPA;
					end else if (RX_P_DATA == ALU_OPER_W_NOP_CMD) begin
						next_state = ALU_OPER_FUN;
					end else begin
						next_state = IDLE;
					end
				end else begin
					next_state = IDLE;
				end
			end
			RF_WR_WRITE_ADDRESS: begin
				if (RX_D_VLD) begin
					next_state = RF_WR_WRITE_DATA;
				end else begin
					next_state = RF_WR_WRITE_ADDRESS;
				end
			end
			RF_WR_WRITE_DATA: begin
				if (RX_D_VLD) begin
					next_state = IDLE;
				end else begin
					next_state = RF_WR_WRITE_DATA;
				end
			end
			RF_RD_READ_ADDRESS: begin
				if (RX_D_VLD) begin
					next_state = RF_RD_WRITE_BACK_DATA;
				end else begin
					next_state = RF_RD_READ_ADDRESS;
				end
			end
			RF_RD_WRITE_BACK_DATA: begin
				if (RdData_Valid) begin
					next_state = IDLE;
				end else begin
					next_state = RF_RD_WRITE_BACK_DATA;
				end
			end
			ALU_OPER_W_OPA: begin
				if (RX_D_VLD) begin
					next_state = ALU_OPER_W_OPB;
				end else begin
					next_state = ALU_OPER_W_OPA;
				end
			end
			ALU_OPER_W_OPB: begin
				if (RX_D_VLD) begin
					next_state = ALU_OPER_FUN;
				end else begin
					next_state = ALU_OPER_W_OPB;
				end
			end
			ALU_OPER_FUN: begin
				if (RX_D_VLD) begin
					next_state = ALU_STORE;
				end else begin
					next_state = ALU_OPER_FUN;
				end
			end
			ALU_STORE: begin
				if (ALU_OUT_VALID) begin
					next_state = ALU_WAIT_BYTE1;
				end else begin
					next_state = ALU_STORE;
				end
			end
			ALU_WAIT_BYTE1: begin
				next_state = ALU_WAIT_BYTE2;
			end
			ALU_WAIT_BYTE2: begin
				next_state = IDLE;
			end
			default : begin 
				next_state = IDLE;
			end
		endcase
	end

	// Output Comb Logic
	always @(*) begin 

			// Default values
		    ALU_ENABLE 	   		 = 1'b0;
		    ALU_FUN    	   		 = 'b0;
		    CLK_EN     	   		 = 1'b0;
		    clk_div_en 	   		 = 1'b1; // Always On
		    WrEn       	   	 	 = 1'b0;
		    RdEn       	   	 	 = 1'b0;
		    Address        	     = 'b0;
		    WrData         	     = 'b0;
		    TX_P_DATA      	     = 'b0;
		    TX_D_VLD       	     = 1'b0;
		    ALU_OUT_SAVE_FLAG    = 1'b0;
		    RF_ADDRESS_SAVE_FLAG = 1'b0;	

		case (current_state)

			IDLE: begin
				ALU_ENABLE 	   		 = 1'b0;
			    ALU_FUN    	   		 = 'b0;
			    CLK_EN     	   		 = 1'b0;
			    clk_div_en 	   		 = 1'b1;
			    WrEn       	   	 	 = 1'b0;
			    RdEn       	   	 	 = 1'b0;
			    Address        	     = 'b0;
			    WrData         	     = 'b0;
			    TX_P_DATA      	     = 'b0;
			    TX_D_VLD       	     = 1'b0;
			    ALU_OUT_SAVE_FLAG    = 1'b0;
			    RF_ADDRESS_SAVE_FLAG = 1'b0;
			end

			RF_WR_WRITE_ADDRESS: begin
				RF_ADDRESS_SAVE_FLAG = RX_D_VLD;
			end

			RF_WR_WRITE_DATA: begin
				Address = RF_ADDR_REG[ADDR_WIDTH-1:0];
			    WrData  = RX_P_DATA;
			    WrEn    = RX_D_VLD;
			end

			RF_RD_READ_ADDRESS: begin
				Address  = RX_P_DATA[ADDR_WIDTH-1:0];
				RdEn     = RX_D_VLD;
			end

			RF_RD_WRITE_BACK_DATA: begin
				if (RdData_Valid && !FIFO_FULL) begin
			    	TX_P_DATA    = RdData;
			    	TX_D_VLD     = 1'b1;
			    end else begin
			    	TX_D_VLD     = 1'b1;
			    end
			end

			ALU_OPER_W_OPA: begin
				WrEn    = RX_D_VLD;
	            Address = 4'b0000;  // REG0 address for Operand A
	            WrData  = RX_P_DATA;
			end

			ALU_OPER_W_OPB: begin
				WrEn    = RX_D_VLD;
	            Address = 4'b0001;  // REG1 address for Operand B
	            WrData  = RX_P_DATA;
			end

			ALU_OPER_FUN: begin
				CLK_EN     = 1'b1;
				ALU_FUN    = RX_P_DATA[FUN_WIDTH-1:0];
				ALU_ENABLE = RX_D_VLD;
			end

			ALU_STORE: begin
				CLK_EN            = 1'b1;
				ALU_OUT_SAVE_FLAG = ALU_OUT_VALID;
			end

			ALU_WAIT_BYTE1: begin
				CLK_EN            = 1'b1;
				if (!FIFO_FULL) begin
					TX_P_DATA = ALU_OUTPUT_REG [MEM_WIDTH-1:0];// Lower byte
					TX_D_VLD  = 1'b1;
				end else begin
					TX_D_VLD  = 1'b0;
				end
			end

			ALU_WAIT_BYTE2: begin
				if (!FIFO_FULL) begin
					TX_P_DATA = ALU_OUTPUT_REG [2*MEM_WIDTH-1:MEM_WIDTH];// Upper byte
					TX_D_VLD  = 1'b1;
				end else begin
					TX_D_VLD  = 1'b0;
				end
			end

			default : begin 
				// Default values
			    ALU_ENABLE 	   		 = 1'b0;
			    ALU_FUN    	   		 = 'b0;
			    CLK_EN     	   		 = 1'b0;
			    clk_div_en 	   		 = 1'b1;
			    WrEn       	   	 	 = 1'b0;
			    RdEn       	   	 	 = 1'b0;
			    Address        	     = 'b0;
			    WrData         	     = 'b0;
			    TX_P_DATA      	     = 'b0;
			    TX_D_VLD       	     = 1'b0;
			    ALU_OUT_SAVE_FLAG    = 1'b0;
			    RF_ADDRESS_SAVE_FLAG = 1'b0;
			end
		endcase
	end
endmodule