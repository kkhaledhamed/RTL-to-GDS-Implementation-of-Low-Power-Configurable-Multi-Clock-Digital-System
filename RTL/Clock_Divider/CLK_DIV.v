module CLK_DIV #(parameter DIV_RATIO = 4)(
	// Input Ports
	input wire I_ref_clk, // UART_CLK
	input wire I_rst_n,   // RST_SYNC_2
	input wire I_clk_en,  // Supply
	input wire [DIV_RATIO-1:0] I_div_ratio, // RegFile

	// Output Port
	output wire O_div_clk //UART_TX AND UART_RX
	);

	// Internal Connections
	wire                   ClK_DIV_EN;
	wire                   ZERO, ONE;
	wire                   TYPE;// 0: Even and 1: Odd
	wire [DIV_RATIO-2:0]   half_toggle, half_toggle_plus;
	reg                    ODD_EDGE_FLAG;
	reg  [DIV_RATIO-2:0]   counter ;
	reg                    DIV_CLK_reg;

	always @(posedge I_ref_clk or negedge I_rst_n) begin 
		if(~I_rst_n) begin
			DIV_CLK_reg   <= 0;
			counter       <= 0;
			ODD_EDGE_FLAG <= 1;
		end else if(ClK_DIV_EN) begin
			if (!TYPE && (counter == half_toggle)) begin
				// Even division: toggle at half the ratio
				DIV_CLK_reg <= ~DIV_CLK_reg;
				counter   <= 0;
			end else if (( TYPE && ( (counter == half_toggle) && ODD_EDGE_FLAG)) ||  ( TYPE &&(counter == half_toggle_plus) && !ODD_EDGE_FLAG) ) begin
				// Odd division: toggle at half-ratio and full-ratio points
				DIV_CLK_reg     <= ~DIV_CLK_reg;
				counter       <= 0;
				ODD_EDGE_FLAG <= ~ ODD_EDGE_FLAG;
			end else begin
				counter <= counter + 1;
			end
		end 
		// If ClK_DIV_EN is low, DIV_CLK_reg holds its last value.
	end

	// Muxing the output by reset
	assign O_div_clk = ~ClK_DIV_EN ? I_ref_clk : DIV_CLK_reg;

	// Calculate toggle points
	assign half_toggle      = ((I_div_ratio >> 1)-1);
	assign half_toggle_plus = half_toggle + 1; // I_div_ratio - half_toggle: Overshoots with odds

	// Determine if ratio is even (0) or odd (1)
	assign TYPE             = I_div_ratio[0];
	
	// The divider is active only when enabled and ratio is valid
	assign ZERO = (I_div_ratio == 0);
	assign ONE  = (I_div_ratio == 1);

	// The divider is active only when enabled and ratio is valid
	assign ClK_DIV_EN = I_clk_en & !ONE & !ZERO;

endmodule