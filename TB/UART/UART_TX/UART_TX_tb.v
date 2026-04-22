`timescale 1ns / 1ps

module UART_TX_tb();
    // Parameters
    parameter CLK_PERIOD = 5;     // 200 MHz clock (5 ns period)
    parameter UART_DATA_WIDTH = 8;
    
    // Signals Declarations
    reg                       CLK;
    reg                       RST;
    reg                       PAR_TYP;
    reg                       PAR_EN;
    reg                       DATA_VALID;
    reg [UART_DATA_WIDTH-1:0] P_DATA;
    
    wire TX_OUT;
    wire Busy;
    
    // Instantiate UART_TX
    UART_TX #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) DUT (
        .CLK(CLK),
        .RST(RST),
        .PAR_TYP(PAR_TYP),
        .PAR_EN(PAR_EN),
        .DATA_VALID(DATA_VALID),
        .P_DATA(P_DATA),
        .TX_OUT(TX_OUT),
        .Busy(Busy)
    );
    
    // Clock generation 
    initial begin
        CLK = 0;
        forever #(CLK_PERIOD/2) CLK = ~CLK;
    end
        
    // Main test sequence
    initial begin
        //VCD dumping for waveform analysis
        $dumpfile("UART_TX.vcd");
        $dumpvars;

        // Initialize inputs
        init();

        // Reset Inputs
        reset();
        
        // Test Case 1: No Parity (PAR_EN=0)
        $display("\n===== Test Case 1: No Parity =====");
        send_byte(8'hA5, 0, 0);
        verify_frame(8'hA5, 0, 0);
        repeat(20) @(negedge CLK);
        
        // Test Case 2: Even Parity (PAR_EN=1, PAR_TYP=0)
        $display("\n===== Test Case 2: Even Parity =====");
        send_byte(8'hF3, 1, 0);
        verify_frame(8'hF3, 1, 0);
        repeat(20) @(negedge CLK);
        
        // Test Case 3: Odd Parity (PAR_EN=1, PAR_TYP=1)
        $display("\n===== Test Case 3: Odd Parity =====");
        send_byte(8'h7C, 1, 1);
        verify_frame(8'h7C, 1, 1);
        repeat(20) @(negedge CLK);
        
        // Test Case 4: Back-to-back transmission
        $display("\n===== Test Case 4: Back-to-Back Transmission =====");
        send_byte(8'h11, 0, 0);
        verify_frame(8'h11, 0, 0);
        send_byte(8'h22, 1, 0);
        verify_frame(8'h22, 1, 0);
        repeat(20) @(negedge CLK);
        
        $display("\nAll tests passed successfully!");
        $stop;
    end

    // Task to initialize inputs
    task init;
        begin
            DATA_VALID = 0;
            P_DATA = 0;
            PAR_EN = 0;
            PAR_TYP = 0; 
        end
    endtask

    // Task to reset (Async active low)
    task reset;
        begin
            RST = 1'b0;
            @(negedge CLK);
            RST = 1'b1;
            @(negedge CLK);
            RST = 1'b0;
            @(negedge CLK);
            RST = 1'b1; 
        end
    endtask 

    // Task to send a byte
    task send_byte;
        input [UART_DATA_WIDTH-1:0] data;
        input                       par_en;
        input                       par_typ;
    begin
        P_DATA = data;
        PAR_EN = par_en;
        PAR_TYP = par_typ;
        DATA_VALID = 1;
        #CLK_PERIOD
        DATA_VALID = 0;
    end
    endtask
    
    // Task to verify frame sent
    integer i;
    reg exp_parity;
    task verify_frame;
        input [UART_DATA_WIDTH-1:0] exp_data;
        input                       par_en;
        input                       par_typ;
        reg    [10:0]               frame_out, frame_out_exp; //(stop[1],parity[1],data[8],start[1])
    begin
               
        // Wait for start of frame 
        @(posedge Busy); // @(negedge TX_OUT)

        
        // Sample data bits (LSB first)
        for (i = 0; i < 11; i=i+1) begin
            @(negedge CLK);
            frame_out[i] = TX_OUT;
        end
        
        // Verify parity bit if enabled
        if (par_en) begin
            exp_parity = (par_typ) ? ~^exp_data : ^exp_data;
        end else begin
            exp_parity = 1'b1;
        end
        
        frame_out_exp = {1'b1,exp_parity,P_DATA,1'b0};

        if (frame_out_exp === frame_out) begin
            $display("Test case succeded");
        end else begin
            $display("Test case failed");
        end
    end
    endtask
    
    // Test Monitor and results
    initial begin
        $monitor("TX_OUT = %b, Busy = %b at %t", TX_OUT, Busy, $time);
    end
    
endmodule