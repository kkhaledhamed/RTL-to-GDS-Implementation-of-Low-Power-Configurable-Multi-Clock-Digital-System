module REG_FILE # (
	parameter MEM_DEPTH = 16,
	parameter MEM_WIDTH = 8,
    parameter ADDR_WIDTH = $clog2(MEM_DEPTH))
(
	// Input Ports
    input  wire                   WrEn,
    input  wire                   RdEn,
    input  wire                   CLK,
    input  wire                   RST,
    input  wire  [ADDR_WIDTH-1:0] Address,
    input  wire  [MEM_WIDTH-1:0]  WrData,

    // Output Ports 
    output reg   [MEM_WIDTH-1:0]  RdData,
    output reg   	              RdData_Valid,

    // Reserved Registers
    output wire   [MEM_WIDTH-1:0]  REG0,
    output wire   [MEM_WIDTH-1:0]  REG1,
    output wire   [MEM_WIDTH-1:0]  REG2,
    output wire   [MEM_WIDTH-1:0]  REG3
);

integer i; // Counter

// Internal Memory
reg [MEM_WIDTH-1:0] mem [0:MEM_DEPTH-1];

// Assigning Reserved Registers
assign REG0 = mem[0]; // ALU Operand A
assign REG1 = mem[1]; // ALU Operand B
assign REG2 = mem[2]; // UART
assign REG3 = mem[3]; // Clock Divider

/* ======== Functionality ======== */
always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		for (i=0; i < MEM_DEPTH; i=i+1) begin
			if (i == 2) begin
				mem[i]<= 'b100000_0_1; // Prescale=32, Parity Type=0, Parity Enable=1
			end else if (i == 3) begin
				mem[i]<= 'b00_100000; // Div Ratio = 32
			end else begin
				mem[i]<='b0;
			end
		end
		RdData_Valid <= 0;
		RdData <= 'b0;	
	end
	else if (WrEn && !RdEn) begin
		mem[Address]<=WrData;
	end
	else if (RdEn && !WrEn) begin
		RdData_Valid <= 1'b1;
		RdData<=mem[Address];
	end else begin // Idle or simultaneous Rd and Wr
		RdData_Valid <= 1'b0;
	end
end
endmodule