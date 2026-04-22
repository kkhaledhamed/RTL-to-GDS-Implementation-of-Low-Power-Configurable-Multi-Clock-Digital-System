`timescale 1ns/1ps

module UART_RX_tb ();

    // Parameters 
    parameter DATA_WIDTH    = 8;  
    parameter TX_CLK_PERIOD = 8680;    // 115.2 KHz (1/115200 * 10^9)

    // Signals Declarations 
    reg RX_CLK;
    reg TX_CLK;
    reg RST;
    reg PAR_TYPE;
    reg PAR_EN;
    reg [5:0] Prescale;
    reg RX_IN;
    wire [DATA_WIDTH-1:0] P_DATA;
    wire data_valid;
    wire Parity_Error;
    wire Stop_Error;

    // Test tracking
    integer test_number;

    // Instantiate UART_RX
    UART_RX #(.UART_DATA_WIDTH(DATA_WIDTH)) DUT (.CLK(RX_CLK), .*);

    // ------------------ Tasks ------------------ 

    // Task to initialize inputs
    task init;
        begin
            Prescale    = 8; 
            RX_CLK      = 0;
            TX_CLK      = 0;
            RST         = 1;    
            PAR_TYPE    = 0;
            PAR_EN      = 0;
            RX_IN       = 1;
            test_number = 1;
        end
    endtask

    // Task to reset (Async active low)
    task reset;
        begin
            #(TX_CLK_PERIOD)
            RST = 1'b0;           
            #(TX_CLK_PERIOD)
            RST = 1'b1;
        end
    endtask

    // Task to send a byte
    task send_frame;
        input [DATA_WIDTH-1:0] DATA;
        input PAR_EN_cfg;
        input PAR_TYPE_cfg;
        input [5:0] PRESCALE_cfg;
        integer i;
        reg parity_bit;
        begin
            PAR_EN   = PAR_EN_cfg;
            PAR_TYPE = PAR_TYPE_cfg;
            Prescale = PRESCALE_cfg;

            // parity bit
            if (PAR_EN) begin
                if (PAR_TYPE == 0) 
                    // Even parity
                    parity_bit = ^DATA;
                else 
                    // Odd parity
                    parity_bit = ~^DATA;
            end

            // Send start bit (0)
            @(posedge TX_CLK);
            RX_IN = 1'b0;
            
            // Send data bits (LSB first)
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                @(posedge TX_CLK);
                RX_IN = DATA[i];
            end
            
            // Send parity bit if enabled
            if (PAR_EN) begin
                @(posedge TX_CLK);
                RX_IN = parity_bit;
            end

            // Send stop bit (1)
            @(posedge TX_CLK);
            RX_IN = 1'b1;
        end
    endtask

    // Task to verify frame sent
    task verify_frame;
        input [DATA_WIDTH-1:0] expected_out;
        input [4:0] test_number;
        begin
            @(posedge data_valid);
            if (P_DATA == expected_out) 
                $display("Test Case %d PASSED", test_number);
            else 
                $display("Test Case %d FAILED: Expected %h, Got %h", test_number, expected_out, P_DATA);
        end
    endtask

    // Main test sequence
    initial begin
        // Dumping for waveform analysis
        $dumpfile("UART_RX.vcd");
        $dumpvars;

        // Initialize
        init();
        
        // Apply reset
        reset();
        
        // ======================= Test Cases =======================

        // Test Case 1: Odd Parity, Prescale=32
        $display("\n===== Test Case 1: Odd Parity (Prescale=32) =====");
        send_frame(8'hBB, 1'b1, 1'b1, 6'd32); verify_frame(8'hBB, 1);

        // Test Case 2: Even Parity, Prescale=32
        $display("\n===== Test Case 2: Even Parity (Prescale=32) =====");
        send_frame(8'hBB, 1'b1, 1'b0, 6'd32); verify_frame(8'hBB, 2);

        // Test Case 3: No Parity, Prescale=32
        $display("\n===== Test Case 3: No Parity (Prescale=32) =====");
        send_frame(8'hBB, 1'b0, 1'b0, 6'd32); verify_frame(8'hBB, 3);

        // Test Case 4: Odd Parity, Prescale=16
        $display("\n===== Test Case 4: Odd Parity (Prescale=16) =====");
        send_frame(8'hBB, 1'b1, 1'b1, 6'd16); verify_frame(8'hBB, 4);

        // Test Case 5: Even Parity, Prescale=16
        $display("\n===== Test Case 5: Even Parity (Prescale=16) =====");
        send_frame(8'hBB, 1'b1, 1'b0, 6'd16); verify_frame(8'hBB, 5);

        // Test Case 6: No Parity, Prescale=16
        $display("\n===== Test Case 6: No Parity (Prescale=16) =====");
        send_frame(8'hBB, 1'b0, 1'b0, 6'd16); verify_frame(8'hBB, 6);

        // Test Case 7: Odd Parity, Prescale=8
        $display("\n===== Test Case 7: Odd Parity (Prescale=8) =====");
        send_frame(8'hBB, 1'b1, 1'b1, 6'd8 ); verify_frame(8'hBB, 7);

        // Test Case 8: Even Parity, Prescale=8
        $display("\n===== Test Case 8: Even Parity (Prescale=8) =====");
        send_frame(8'hBB, 1'b1, 1'b0, 6'd8 ); verify_frame(8'hBB, 8);

        // Test Case 9: No Parity, Prescale=8
        $display("\n===== Test Case 9: No Parity (Prescale=8) =====");
        send_frame(8'hBB, 1'b0, 1'b0, 6'd8 ); verify_frame(8'hBB, 9);

        $display("\nAll tests completed");
        $stop;
    end

    // Test Monitor and results 
    initial begin
        $monitor("Time=%0t ns , P_DATA=%h , data_valid=%b , Parity_Error=%b , Stop_Error=%b", 
                 $time, P_DATA, data_valid, Parity_Error, Stop_Error);
    end

    // Clock Generation
    
    // TX Clock generation (115.2 KHz)
    always #(TX_CLK_PERIOD/2) TX_CLK = ~TX_CLK;

    // RX Clock generation based on prescale
    always #(TX_CLK_PERIOD/Prescale/2) RX_CLK = ~RX_CLK;

endmodule
