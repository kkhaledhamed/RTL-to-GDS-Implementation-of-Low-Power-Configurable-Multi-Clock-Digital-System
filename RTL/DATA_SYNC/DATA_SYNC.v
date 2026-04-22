module DATA_SYNC #(
   parameter NUM_STAGES = 2,
   parameter BUS_WIDTH  = 8
)(
   input  wire                   CLK,
   input  wire                   RST,          // Active low reset
   input  wire                   BUS_ENABLE,   // Source domain enable
   input  wire [BUS_WIDTH-1:0]   Unsync_bus,   // Async bus
   output reg  [BUS_WIDTH-1:0]   SYNC_BUS,     // Synced bus
   output reg                    ENABLE_PULSE  // One-cycle pulse
);

  // Internal Registers
  reg [NUM_STAGES-1:0] sync_reg;    // Synchronizer for BUS_ENABLE
  reg pulse_gen_d;                  // Delayed version for edge detect
  wire pulse_gen;

  // -------------------------------
  // Synchronize BUS_ENABLE
  // -------------------------------
  always @(posedge CLK or negedge RST) begin
    if (!RST)
      sync_reg <= {NUM_STAGES{1'b0}};
    else
      sync_reg <= {sync_reg[NUM_STAGES-2:0], BUS_ENABLE};
  end

  // -------------------------------
  // Pulse Generation 
  // -------------------------------
  always @(posedge CLK or negedge RST) begin
    if (!RST)
      pulse_gen_d <= 1'b0;
    else
      pulse_gen_d <= sync_reg[NUM_STAGES-1];
  end

  assign pulse_gen = ~pulse_gen_d & sync_reg[NUM_STAGES-1];

  // -------------------------------
  // Output Logic
  // -------------------------------
  always @(posedge CLK or negedge RST) begin
    if (!RST) begin
      ENABLE_PULSE <= 1'b0;
      SYNC_BUS     <= {BUS_WIDTH{1'b0}};
    end else begin
      ENABLE_PULSE <= pulse_gen;  
      if (pulse_gen)
        SYNC_BUS <= Unsync_bus;   
    end
  end

endmodule
