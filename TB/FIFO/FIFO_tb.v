`timescale 1ns/1ps

module FIFO_tb;

    // -------- Parameters --------
    parameter DATASIZE    = 8;    // data size
    parameter ADDRSIZE    = 3;    // address size
    parameter MEMDEPTH    = 8;    // fifo depth
    parameter BURSTDEPTH   = 9;    // burst length
    parameter WCLK_PERIOD = 10;   // write clock period (100 MHz)
    parameter RCLK_PERIOD = 25;   // read clock period (40 MHz)

    // -------- DUT Signals --------
    reg                   wclk;     // write domain clock
    reg                   wrst_n;   // write domain active-low reset  
    reg                   winc;     // write enable pulse
    reg                   rclk;     // read domain clock
    reg                   rrst_n;   // read domain active-low reset 
    reg                   rinc;     // read enable pulse
    reg  [DATASIZE-1:0]   wdata;    // write data bus 
    wire [DATASIZE-1:0]   rdata;    // read data bus
    wire                  wfull;    // fifo full flag
    wire                  rempty;   // fifo empty flag

    // -------- FIFO internal memory (stimulus source) --------
    reg [DATASIZE-1:0] mem [BURSTDEPTH-1:0];

    // -------- Clocks Generation --------
    initial begin
        wclk = 0;
        forever #(WCLK_PERIOD/2) wclk = ~wclk;
    end

    initial begin
        rclk = 0;
        forever #(RCLK_PERIOD/2) rclk = ~rclk;
    end

    // -------- Module Instantiation -------- 
    FIFO #(
        .DATASIZE(DATASIZE),
        .ADDRSIZE(ADDRSIZE),
        .MEMDEPTH(MEMDEPTH)
    ) DUT (
        .wclk   (wclk),
        .wrst_n (wrst_n),
        .rclk   (rclk),
        .rrst_n (rrst_n),
        .winc   (winc),
        .rinc   (rinc),
        .wdata  (wdata),
        .rdata  (rdata),
        .wfull  (wfull),
        .rempty (rempty)
    );

    integer i, j;

    // -------- Loading values --------
    initial begin
        for (i = 0; i < BURSTDEPTH; i=i+1) begin
             mem[i] = i;
        end
    end

    // -------- Write Operation --------
    initial begin
        // waveform
        $dumpfile("FIFO.vcd");
        $dumpvars;

        // init signals
        init();

        // reset write domain
        write_reset();

        // send BURSTDEPTH words
        for (i = 0; i < BURSTDEPTH; i = i + 1) begin
            write_burst(mem[i]);
        end
    end

    // -------- Read Operation --------
    initial begin
        // reset read domain
        read_reset();

        // wait until FIFO has some data
        wait (!rempty);

        for (j = 0; j < BURSTDEPTH; j = j + 1) begin
            read_burst();
        end
    end

// -------- Tasks --------
    task init;
    begin
        wclk   = 1'b0;
        rclk   = 1'b0;
        wrst_n = 1'b1;
        rrst_n = 1'b1;
        winc   = 1'b0;
        rinc   = 1'b0;
        wdata  =  'b0;
    end
    endtask

    task write_reset;
    begin
        wrst_n = 1'b0;   
        #(WCLK_PERIOD);
        wrst_n = 1'b1;   
    end
    endtask

    task read_reset;
    begin
        rrst_n = 1'b0;   
        #(RCLK_PERIOD);
        rrst_n = 1'b1;
    end
    endtask

    task write_burst;
        input [DATASIZE-1:0] DATA;
        begin
            // Wait for not full
            while (wfull) begin
                @(negedge wclk);
                $display("[%0t] WRITE: Waiting (FIFO Full)", $time);
            end
            
            @(negedge wclk);
            wdata = DATA;
            winc  = 1'b1;
            @(negedge wclk);
            winc  = 1'b0;
            $display("[%0t] WRITE: Data = %0h", $time, DATA);
        end
    endtask

    task read_burst;
        begin
             while (rempty) begin
                @(negedge rclk);
                $display("[%0t] READ: Waiting (FIFO Empty)", $time);
            end

            @(negedge rclk);
            @(negedge rclk);
            $display("[%0t] READ: Data = %0h", $time, rdata);
            rinc = 1'b1;
            @(negedge rclk);
            rinc = 1'b0;
        end
    endtask


    // -------- Simulation End --------
    initial begin
        #2000;
        $display("[%0t] Simulation Finished", $time);
        $stop;
    end

endmodule
