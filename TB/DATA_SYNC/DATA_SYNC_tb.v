`timescale 1ns/1ps

module DATA_SYNC_tb;

  // -----------------------------
  // Parameters
  // -----------------------------
  localparam NUM_STAGES = 2;
  localparam BUS_WIDTH  = 8;
  localparam CLK_PERIOD = 10;

  // -----------------------------
  // Signals
  // -----------------------------
  reg                    CLK;
  reg                    RST;
  reg                    BUS_ENABLE;
  reg  [BUS_WIDTH-1:0]   Unsync_bus;
  wire [BUS_WIDTH-1:0]   SYNC_BUS;
  wire                   ENABLE_PULSE;

  // -----------------------------
  // DUT instantiation
  // -----------------------------
  DATA_SYNC #(
    .NUM_STAGES(NUM_STAGES),
    .BUS_WIDTH (BUS_WIDTH)
  ) DUT (
    .CLK         (CLK),
    .RST         (RST),
    .BUS_ENABLE  (BUS_ENABLE),
    .Unsync_bus  (Unsync_bus),
    .SYNC_BUS    (SYNC_BUS),
    .ENABLE_PULSE(ENABLE_PULSE)
  );

  // -----------------------------
  // Clock generation
  // -----------------------------
  always #(CLK_PERIOD/2) CLK = ~CLK;

  // -----------------------------
  // Task: Apply Reset
  // -----------------------------
  task apply_reset;
    begin
      RST = 0;
      #(2*CLK_PERIOD);
      RST = 1;
    end
  endtask

  // -----------------------------
  // Task: Send Data
  // -----------------------------
  task send_data(input [BUS_WIDTH-1:0] data);
    begin
      Unsync_bus = data;
      BUS_ENABLE = 1;
      #(2*CLK_PERIOD);   // stretch enable for safe sync
      BUS_ENABLE = 0;
    end
  endtask

  // -----------------------------
  // Task: Initialize Signals
  // -----------------------------
  task init;
    begin
      CLK        = 0;
      RST        = 0;
      BUS_ENABLE = 0;
      Unsync_bus = 0;
    end
  endtask 

  // -----------------------------
  // Stimulus
  // -----------------------------
  initial begin
    // Dump waves
    $dumpfile("DATA_SYNC.vcd");
    $dumpvars;

    // Init
    init();

    // Reset
    apply_reset();

    // Send transactions
    send_data(8'hFF);
    #(4*CLK_PERIOD);
    send_data(8'hCC);
    #(4*CLK_PERIOD);
    send_data(8'h10);
    #(4*CLK_PERIOD);

    $stop;
  end

  // -----------------------------
  // Monitor
  // -----------------------------
  initial begin
    $monitor("[%0t] RST=%b BUS_ENABLE=%b Unsync_bus=0x%0h | ENABLE_PULSE=%b SYNC_BUS=0x%0h", 
             $time, RST, BUS_ENABLE, Unsync_bus, ENABLE_PULSE, SYNC_BUS);
  end

endmodule
