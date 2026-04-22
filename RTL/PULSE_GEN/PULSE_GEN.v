module PULSE_GEN (
	// Input Ports
   input  wire                   CLK,      // UART_TX
   input  wire                   RST,      // RST_SYNC_2
   input  wire                   LVL_SIG,  // UART_TX

   // Output Port
   output wire                    PULSE_SIG  // ASYNC_FIFO
);

	// Internal Registers
	reg PULSE_GEN_REG0, PULSE_GEN_REG1;

	/* ======== Functionality ======== */
	always @(posedge CLK or negedge RST) begin 
        if (!RST) begin
            PULSE_GEN_REG0  <= 1'b0;
            PULSE_GEN_REG1  <= 1'b0;
        end else begin
            PULSE_GEN_REG0  <= LVL_SIG;
            PULSE_GEN_REG1  <= PULSE_GEN_REG0;
        end
    end

    // Pulse generation logic, Assert PULSE_SIG for one cycle when LVL_SIG changes from 0 to 1
    assign PULSE_SIG = (!PULSE_GEN_REG1) && PULSE_GEN_REG0;
endmodule