module FSM_TX #(parameter UART_DATA_WIDTH = 8) (
	input  wire       				  CLK,
	input  wire       				  RST,
	input  wire       			      DATA_VALID,
	input  wire       				  PAR_EN,
	input  wire       				  SER_DONE,

	output reg        				  SER_EN,
	output reg        				  Busy,
	output reg        	[1:0]	    mux_sel
	);

	// FSM states
	(*fsm_encoding = "gray"*)
	reg [2:0] current_state, next_state;
	
	// FSM Current & Next states
	localparam [2:0] IDLE  = 3'b000,
					 START = 3'b001, // start_bit
					 SER   = 3'b010, // ser_data
					 PAR   = 3'b011, // par_bit
					 STOP  = 3'b100; // stop_bit	

	// Internal output register for Busy
	reg Busy_REG;

	// Current state logic
	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			current_state <= IDLE;
		end else begin
			current_state <= next_state;
		end
	end

	// Next state logic
	always @(*) begin 
        case (current_state)
            IDLE  : next_state = (DATA_VALID) ? START : IDLE;
            START : next_state = SER;
            SER   : next_state = (SER_DONE) ? (PAR_EN ? PAR : STOP) : SER;
            PAR   : next_state = STOP;
            STOP  : next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

	// Output logic
	always @(*) begin 
		SER_EN   = 1'b0;
		Busy_REG = 1'b0;
		mux_sel  = 2'b00;
		case (current_state)
			IDLE: begin
				SER_EN   = 1'b0;
				Busy_REG = 1'b0;
				mux_sel  = 2'b11;
			end
			START: begin
				SER_EN   = 1'b0;
				Busy_REG = 1'b1;
				mux_sel  = 2'b00;
			end
			SER: begin
				SER_EN   = 1'b1;
				Busy_REG = 1'b1;
				mux_sel  = 2'b01;
			end
			PAR: begin
				SER_EN   = 1'b0;
				Busy_REG = 1'b1;
				mux_sel  = 2'b10;
			end
			STOP: begin
				SER_EN   = 1'b0;
				Busy_REG = 1'b1;
				mux_sel  = 2'b11;
			end
			default : begin 
				SER_EN   = 1'b0;
				Busy_REG = 1'b0;
				mux_sel  = 2'b00;
			end
		endcase
	end

	// Output busy registering
	always @(posedge CLK or negedge RST) begin 
		if(~RST) begin
			Busy  <= 1'B0;
		end else begin
			Busy  <= Busy_REG;
		end
	end

endmodule
