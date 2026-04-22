module RST_SYNC #(
  parameter NUM_STAGES = 2   // Number of synchronizer stages
)(
  input  wire CLK,
  input  wire RST,        // Active low asynchronous reset
  output wire SYNC_RST    // Synchronized reset (active high release)
);

  // Synchronizer register chain
  reg [NUM_STAGES-1:0] sync_reg;

  // Reset Synchronizer
  always @(posedge CLK or negedge RST) begin
    if (!RST)
      sync_reg <= {NUM_STAGES{1'b0}};               // Assert reset immediately
    else
      sync_reg <= {sync_reg[NUM_STAGES-2:0], 1'b1}; // Release synchronously
  end

  assign SYNC_RST = sync_reg[NUM_STAGES-1];

endmodule
