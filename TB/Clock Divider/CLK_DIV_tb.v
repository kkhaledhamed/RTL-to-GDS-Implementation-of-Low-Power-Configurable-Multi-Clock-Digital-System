`timescale 1ns/1ps

module CLK_DIV_tb ;
	// Parameters
	parameter DIV_RATIO  = 8;  
	parameter CLK_PERIOD = 10;

	// Signals Declarations
	reg I_ref_clk; 
	reg I_rst_n;
	reg I_clk_en;
	reg [DIV_RATIO-1:0] I_div_ratio;
	wire O_div_clk;

	// Clock Generation
	initial begin
		I_ref_clk = 0;
		forever #(CLK_PERIOD/2) I_ref_clk = ~I_ref_clk; 
	end
	
	// DUT Instantiation
	CLK_DIV #(.DIV_RATIO(DIV_RATIO)) DUT (.*);
	
	// Dumping 
	initial begin
		$dumpfile("CLK_DIV.vcd");
		$dumpvars(0, CLK_DIV_tb);
	end
	
	// Tasks
	task reset;
	begin
		I_rst_n = 0;
		#(2*CLK_PERIOD);
		I_rst_n = 1;
	end
	endtask

	task apply_input(input [DIV_RATIO-1:0] ratio);
	begin
		I_clk_en   = 1;
		I_div_ratio = ratio;
		$display("[%0t] Applying divide ratio = %0d", $time, ratio);
	end
	endtask

	task init;
		begin
			I_clk_en   = 0;
			I_div_ratio = 0;
		end
	endtask   

	// Test Sequence
	initial begin
		// Initial values
		init();

		// Apply reset
		reset();

		// Case 1: Divide by 2 (even)
		apply_input(2);
		#(10*CLK_PERIOD);

		// Case 2: Divide by 3 (odd)
		apply_input(3);
		#(10*CLK_PERIOD);

		// Case 3: Divide by 4 (even)
		apply_input(4);
		#(10*CLK_PERIOD);

		// Case 4: Divide by 5 (odd)
		apply_input(5);
		#(10*CLK_PERIOD);

		// Finish simulation
		$stop;
	end

endmodule
