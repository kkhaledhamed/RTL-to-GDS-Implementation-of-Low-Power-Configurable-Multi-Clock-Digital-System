`timescale 1ns/1ps

module UART_TB;

/////////////////////////////////////////////////////////
///////////////////// Parameters ////////////////////////
/////////////////////////////////////////////////////////

parameter UART_DATA_WIDTH = 8;
parameter CLK_PERIOD = 8.68;  // 115.2 KHz
parameter PRESCALE = 32;      // Default prescale value
parameter BAUD_RATE = 115200;
parameter BIT_TIME = 1000000000 / BAUD_RATE; // 8680 ns per bit

/////////////////////////////////////////////////////////
//////////////////// DUT Signals ////////////////////////
/////////////////////////////////////////////////////////

// Global signals
reg                     RST_TB;
reg                     TX_CLK_TB;
reg                     RX_CLK_TB;

// RX Interface (Receiver side)
reg                     RX_IN_S_TB;
wire [UART_DATA_WIDTH-1:0] RX_OUT_P_TB;
wire                    RX_OUT_V_TB;

// TX Interface (Transmitter side)
reg  [UART_DATA_WIDTH-1:0] TX_IN_P_TB;
reg                     TX_IN_V_TB;
wire                    TX_OUT_S_TB;
wire                    TX_OUT_V_TB;

// Configuration
reg  [5:0]             Prescale_TB;
reg                     parity_enable_TB;
reg                     parity_type_TB;
wire                    parity_error_TB;
wire                    Stop_Error_TB;

// Testbench control
integer                 test_num = 0;
integer                 error_count = 0;
integer                 success_count = 0;

// Synchronization
reg                     tx_data_sent;
reg [UART_DATA_WIDTH-1:0] expected_data;

////////////////////////////////////////////////////////
////////////////// initial block /////////////////////// 
////////////////////////////////////////////////////////

initial begin
    // Initialize signals
    initialize();
    
    // Apply reset
    reset();
    
    $display("==========================================");
    $display("UART Full-Duplex Testbench Started");
    $display("==========================================");
    
    // Wait for initial stabilization
    #(BIT_TIME * 2);
    
    // Test 1: Basic full-duplex communication without parity
    test_full_duplex(1'b0, 1'b0, PRESCALE, "No Parity");
    
    // Test 2: Full-duplex with even parity
    test_full_duplex(1'b1, 1'b0, PRESCALE, "Even Parity");
    
    // Test 3: Full-duplex with odd parity
    test_full_duplex(1'b1, 1'b1, PRESCALE, "Odd Parity");
    
    // Test 4: Different prescale value
    test_full_duplex(1'b0, 1'b0, 16, "No Parity, Prescale=16");
    
    // Display final results
    display_results();
    
    $stop;
end

///////////////////// Clock Generators //////////////////

always #(CLK_PERIOD/2) TX_CLK_TB = ~TX_CLK_TB;
always #(CLK_PERIOD/2) RX_CLK_TB = ~RX_CLK_TB;

// Connect TX output to RX input for loopback testing
assign RX_IN_S_TB = TX_OUT_S_TB;

////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

task initialize;
begin
    TX_CLK_TB = 1'b0;
    RX_CLK_TB = 1'b0;
    RST_TB = 1'b1;
    TX_IN_P_TB = {UART_DATA_WIDTH{1'b0}};
    TX_IN_V_TB = 1'b0;
    Prescale_TB = PRESCALE;
    parity_enable_TB = 1'b0;
    parity_type_TB = 1'b0;
    tx_data_sent = 1'b0;
    expected_data = {UART_DATA_WIDTH{1'b0}};
end
endtask

task reset;
begin
    $display("Applying reset...");
    #(CLK_PERIOD);
    RST_TB = 1'b0;
    #(CLK_PERIOD * 10);
    RST_TB = 1'b1;
    #(CLK_PERIOD * 5);
    $display("Reset completed.");
end
endtask

task test_full_duplex;
    input par_en;
    input par_type;
    input [5:0] prescale;
    input [80:0] test_name;
    
    integer i;
    reg [UART_DATA_WIDTH-1:0] test_byte;
begin
    test_num = test_num + 1;
    $display("\nTest %0d: %s, Prescale=%0d", test_num, test_name, prescale);
    $display("--------------------------------------------------");
    
    // Configure UART
    Prescale_TB = prescale;
    parity_enable_TB = par_en;
    parity_type_TB = par_type;
    
    // Wait for configuration to settle
    #(BIT_TIME * 2);
    
    // Test multiple data packets
    for (i = 0; i < 4; i = i + 1) begin
        test_byte = $random & {UART_DATA_WIDTH{1'b1}};
        
        $display("Sending byte %0d: 0x%h", i, test_byte);
        
        // Send data through TX
        send_tx_data(test_byte);
        
        // Wait and check received data
        check_rx_data(test_byte, i);
        
        // Delay between packets
        #(BIT_TIME * 3);
    end
end
endtask

task send_tx_data;
    input [UART_DATA_WIDTH-1:0] data;
begin
    // Wait for TX to be ready
    wait_for_tx_ready();
    
    @(posedge TX_CLK_TB);
    TX_IN_P_TB = data;
    TX_IN_V_TB = 1'b1;
    @(posedge TX_CLK_TB);
    TX_IN_V_TB = 1'b0;
    
    expected_data = data;
    tx_data_sent = 1'b1;
    
    $display("TX: Data 0x%h sent at time %0t ns", data, $time);
end
endtask

task wait_for_tx_ready;
    integer timeout;
begin
    timeout = 0;
    while (TX_OUT_V_TB && timeout < 1000) begin
        @(posedge TX_CLK_TB);
        timeout = timeout + 1;
    end
    
    if (timeout >= 1000) begin
        $display("ERROR: TX busy timeout");
        error_count = error_count + 1;
    end
end
endtask

task check_rx_data;
    input [UART_DATA_WIDTH-1:0] expected;
    input integer packet_num;
    
    integer timeout;
    integer bit_timeout;
    reg data_received;
begin
    data_received = 0;
    timeout = 0;
    bit_timeout = (Prescale_TB * 12 * 2); // Allow 2 full frame times
    
    $display("Waiting for RX data valid...");
    
    // Wait for data valid signal with timeout
    while (!RX_OUT_V_TB && timeout < bit_timeout) begin
        @(posedge RX_CLK_TB);
        timeout = timeout + 1;
        
        // Debug: show RX data as it changes
        if (RX_OUT_P_TB !== {UART_DATA_WIDTH{1'b0}}) begin
            $display("  RX data changing: 0x%h at time %0t ns", RX_OUT_P_TB, $time);
        end
    end
    
    if (RX_OUT_V_TB) begin
        if (RX_OUT_P_TB === expected) begin
            $display("SUCCESS: Packet %0d - Received correct data 0x%h", 
                     packet_num, RX_OUT_P_TB);
            success_count = success_count + 1;
        end else begin
            $display("ERROR: Packet %0d - Expected 0x%h, Got 0x%h", 
                     packet_num, expected, RX_OUT_P_TB);
            error_count = error_count + 1;
        end
        
        // Check for errors
        monitor_errors(packet_num);
        
    end else begin
        $display("ERROR: Packet %0d - Timeout waiting for data valid (timeout=%0d)", 
                 packet_num, timeout);
        $display("  Last RX data: 0x%h", RX_OUT_P_TB);
        error_count = error_count + 1;
    end
    
    tx_data_sent = 1'b0;
end
endtask

task monitor_errors;
    input integer packet_num;
begin
    if (parity_error_TB) begin
        $display("ERROR: Packet %0d - Parity error detected", packet_num);
        error_count = error_count + 1;
    end
    
    if (Stop_Error_TB) begin
        $display("ERROR: Packet %0d - Stop bit error detected", packet_num);
        error_count = error_count + 1;
    end
end
endtask

task display_results;
begin
    $display("\n==========================================");
    $display("Test Results Summary");
    $display("==========================================");
    $display("Total Tests Run: %0d", test_num);
    $display("Successful Packets: %0d", success_count);
    $display("Errors Detected: %0d", error_count);
    
    if (error_count == 0) begin
        $display("*** ALL TESTS PASSED ***");
    end else begin
        $display("*** SOME TESTS FAILED ***");
    end
    $display("==========================================");
end
endtask

// Enhanced monitoring process
initial begin
    forever begin
        @(posedge RX_CLK_TB);
        if (RX_OUT_V_TB) begin
            $display("MONITOR: RX data valid detected: 0x%h at time %0t ns", 
                     RX_OUT_P_TB, $time);
        end
    end
end

// TX monitoring
initial begin
    forever begin
        @(posedge TX_CLK_TB);
        if (TX_IN_V_TB) begin
            $display("MONITOR: TX starting transmission: 0x%h at time %0t ns", 
                     TX_IN_P_TB, $time);
        end
    end
end

//////////////////////////////////////////////////////// 
///////////////// Design Instantiation //////////////////
////////////////////////////////////////////////////////

UART #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) DUT (
    // Global signals
    .RST(RST_TB),
    .TX_CLK(TX_CLK_TB),
    .RX_CLK(RX_CLK_TB),
    
    // RX Interface
    .RX_IN_S(RX_IN_S_TB),
    .RX_OUT_P(RX_OUT_P_TB),
    .RX_OUT_V(RX_OUT_V_TB),
    
    // TX Interface
    .TX_IN_P(TX_IN_P_TB),
    .TX_IN_V(TX_IN_V_TB),
    .TX_OUT_S(TX_OUT_S_TB),
    .TX_OUT_V(TX_OUT_V_TB),
    
    // Configuration
    .Prescale(Prescale_TB),
    .parity_enable(parity_enable_TB),
    .parity_type(parity_type_TB),
    .parity_error(parity_error_TB),
    .Stop_Error(Stop_Error_TB)
);

endmodule