module memory #(
	parameter ADDRSIZE = 3,
	parameter DATASIZE = 8,
	parameter MEMDEPTH = 8
)(
	input  wire [DATASIZE-1:0]  wdata,
	input  wire [ADDRSIZE-1:0]  waddr,
	input  wire [ADDRSIZE-1:0]  raddr,
	input  wire 			    wclk,
	input  wire 			    winc,
	input  wire 			    wfull,
	input  wire 			    wrst_n,
	output wire  [DATASIZE-1:0] rdata
);
	// FIFO storage buffer
	reg [DATASIZE-1:0] mem [MEMDEPTH-1:0];

	// Write Clock Enable
	wire wclken;
	assign wclken = winc && !wfull;

	// Counter
	integer i;

	// Write operation
	always @(posedge wclk or negedge wrst_n) begin 
		if (~wrst_n) begin
		 	for (i = 0; i < MEMDEPTH; i=i+1) begin
		 		mem[i] <= 'b0;
		 	end
		end else if (wclken) begin
			mem[waddr] <= wdata;
		end
	end

	// Async Read operation
	assign rdata = mem[raddr];
endmodule