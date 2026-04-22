module FSM_RX #(parameter UART_DATA_WIDTH = 8)(
	input wire 						 CLK, 
	input wire 						 RST,
	
	input wire 						 PAR_EN,	
	input wire     [5:0]			 prescale,
	input wire                       par_err,
	input wire     [5:0]             edge_cnt,
	input wire     [3:0]             bit_cnt,
	input wire                       start_glitch,
	input wire                       stop_err,
	input wire                       S_DATA,
	
	output reg 						 par_chk_en,	
	output reg 						 start_chk_en,
	output reg						 enable,
	output reg                       data_samp_en,
	output reg 						 stop_chk_en,
	output reg 						 deser_en,
	output reg					     data_valid
	);

	// FSM Current & Next states
	(*fsm_encoding = "gray"*)
	reg [2:0] current_state, next_state;
	
	// FSM states
	localparam  [2:0]   IDLE     = 3'b000 ,
                       	START    = 3'b001 , // start_bit
					   	SER      = 3'b010 , // ser_data
					   	PAR      = 3'b011 , // par_bit
					   	STOP     = 3'b100 , // stop_bit
					   	ERROR    = 3'b101 ;

    wire [5:0] NEG_EDGE, NEG_EDGE_MINUS;

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
			
			IDLE : begin
				if (!S_DATA) begin
					next_state = START;
				end else begin
					next_state = IDLE;
				end
			end 
			
			START: begin
				if (bit_cnt == 0 && edge_cnt == NEG_EDGE) begin
					if (start_glitch) begin
						next_state = IDLE;
					end else begin
						next_state = SER;
					end 
				end else begin
					next_state = START;
				end
			end
			
			SER  : begin
				if (bit_cnt == 8 && edge_cnt == NEG_EDGE) begin
					if (PAR_EN) begin
						next_state = PAR;
					end else begin
						next_state = STOP;
					end 
				end else begin
					next_state = SER;
				end
			end
			
			PAR  : begin
				if (bit_cnt == 9 && edge_cnt == NEG_EDGE) begin
					next_state = STOP;
				end else begin
					next_state = PAR;
				end
			end
			
			STOP : begin
				// In STOP state:
				if (PAR_EN) begin
				    if (bit_cnt == 10 && edge_cnt == NEG_EDGE_MINUS) begin  
				        next_state = ERROR;
				    end else begin
				        next_state = STOP;
				    end
				end else begin
				    if (bit_cnt == 9 && edge_cnt == NEG_EDGE_MINUS) begin  
				        next_state = ERROR;
				    end else begin
				        next_state = STOP;
				    end
				end
			end

			ERROR: begin
	            if(!S_DATA)
					next_state = START ;
				else
				    next_state = IDLE ; 									  
            end	
			
			default : begin
				next_state = IDLE;
			end
		
		endcase
	end

	// Output Logic
	always @(*) begin 
		
		// Default values
		par_chk_en   = 0;	
		start_chk_en = 0;
		enable       = 0;
		data_samp_en = 0;
		stop_chk_en  = 0;
		deser_en     = 0;
		data_valid   = 0;

		if (current_state == IDLE) begin
			if (!S_DATA) begin
				start_chk_en = 1;
				enable       = 1;
				data_samp_en = 1;
			end

		end else if (current_state == START) begin
			start_chk_en = 1;
			enable       = 1;
			data_samp_en = 1;

		end else if (current_state == SER) begin
			enable       = 1;
			data_samp_en = 1;
			deser_en     = 1;

		end else if (current_state == PAR) begin
			par_chk_en   = 1;
			enable       = 1;
			data_samp_en = 1;

		end else if (current_state == STOP) begin
			enable       = 1;
			data_samp_en = 1;
			stop_chk_en  = 1;

		end else if (current_state == ERROR) begin
			data_samp_en = 1;
			if (par_err || stop_err) begin
				data_valid = 0;
			end else begin
				data_valid = 1;
			end
		end
	end


	assign  NEG_EDGE       = (prescale - 1) ;
	assign  NEG_EDGE_MINUS = (prescale - 2) ;


endmodule