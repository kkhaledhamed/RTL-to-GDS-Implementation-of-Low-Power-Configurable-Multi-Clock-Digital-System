`timescale 1ns/1ps

module RST_SYNC_tb;

  // -----------------------------
  // Parameters
  // -----------------------------
  localparam NUM_STAGES = 2;
  localparam CLK_PERIOD = 10;

  // -----------------------------
  // Signals
  // -----------------------------
  reg  CLK;
  reg  RST;         // async active-low reset
  wire SYNC_RST;    // synchronized reset

  // -----------------------------
  // DUT instantiation
  // -----------------------------
  RST_SYNC #(
    .NUM_STAGES(NUM_STAGES)
  ) DUT (
    .CLK     (CLK),
    .RST     (RST),
    .SYNC_RST(SYNC_RST)
  );

  // -----------------------------
  // Clock generation
  // -----------------------------
  always #(CLK_PERIOD/2) CLK = ~CLK;

  // -----------------------------
  // Task: Apply Async Reset
  // -----------------------------
  task apply_reset;
    begin
      RST = 0;
      #(3*CLK_PERIOD);   
      RST = 1;
    end
  endtask

  // -----------------------------
  // Task: Initialize Signals
  // -----------------------------
  task init;
    begin
      CLK = 0;
      RST = 1;   
    end
  endtask

  // -----------------------------
  // Stimulus
  // -----------------------------
  initial begin
    // Dump waves
    $dumpfile("RST_SYNC.vcd");
    $dumpvars;

    // Init
    init();

    // Apply reset sequence
    apply_reset();

    // Keep running to observe deassertion latency
    #(2*CLK_PERIOD);

    // Apply reset sequence
    apply_reset();

    // Keep running to observe deassertion latency
    #(2*CLK_PERIOD);

    $stop;
  end

  // -----------------------------
  // Monitor
  // -----------------------------
  initial begin
    $monitor("[%0t] RST=%b | SYNC_RST=%b", $time, RST, SYNC_RST);
  end

endmodule
