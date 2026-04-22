module UART_TX #(parameter UART_DATA_WIDTH = 8)(
	input wire 						 CLK,
	input wire 						 RST,
	input wire 						 PAR_TYP,
	input wire 						 PAR_EN,
	input wire 						 DATA_VALID,
	input wire [UART_DATA_WIDTH-1:0] P_DATA,

	output wire                      TX_OUT,
	output wire                      Busy
	);
	
	// Internal connections
	wire        ser_done,
				ser_en,
				ser_data,
				par_bit;

	wire [1:0]  mux_sel;

	// Instantiations
	
	serializer #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) serializer_unit(
	.CLK(CLK),
	.RST(RST),
	.P_DATA(P_DATA),
	.DATA_VALID(DATA_VALID),
	.Busy(Busy),
	.SER_EN(ser_en),
	.SER_DONE(ser_done),
	.SER_DATA(ser_data)
	);

	MUX MUX_unit(
	.CLK(CLK),
	.RST(RST),
	.mux_sel(mux_sel),
	.IN0(1'b0),         //start_bit
	.IN1(ser_data),     //ser_data
	.IN2(par_bit),      //par_bit 
	.IN3(1'b1),         //stop_bit
	.MUX_OUT(TX_OUT)    //TX_OUT
	);

	FSM_TX #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) FSM_TX_unit(
	.CLK(CLK),
	.RST(RST),
	.DATA_VALID(DATA_VALID),
	.PAR_EN(PAR_EN),
	.SER_DONE(ser_done),
	.SER_EN(ser_en),
	.Busy(Busy),
	.mux_sel(mux_sel)
	);

	parity_calc #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) parity_calc_unit (
	.P_DATA(P_DATA),
	.Busy(Busy),
	.DATA_VALID(DATA_VALID),
	.PAR_TYPE(PAR_TYP),
	.PAR_EN(PAR_EN),
	.CLK(CLK),
	.RST(RST),
	.par_bit(par_bit)
	);
endmodule
