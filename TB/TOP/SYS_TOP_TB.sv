`timescale 1ns/1ps

module SYS_TOP_TB ;
    /* ================== Signals Declaration ================== */
    reg  REF_CLK;
    reg  UART_CLK;
    reg  RST;
    reg  RX_IN;
    wire TX_OUT;
    wire parity_error;
    wire Stop_Error;

    /* ================== Parameters ================== */
    parameter REF_CLK_PERIOD  = 20;        // 50 MHz
    parameter UART_CLK_PERIOD = 271.2673611; // 3.6864 MHz

    // Reserved Registers
    parameter RF_WR_CMD          = 8'hAA;   
    parameter RF_RD_CMD          = 8'hBB;   
    parameter ALU_OPER_W_OP_CMD  = 8'hCC;   
    parameter ALU_OPER_W_NOP_CMD = 8'hDD;   

    // ALU Parameters
    parameter N                  = 8, 
              OPERAND_WIDTH      = N, 
              FUN_WIDTH          = 4,
              ALU_OUTPUT_WIDTH   = 2*N;

    // REG_FILE Parameters
    parameter MEM_DEPTH          = 16,
              MEM_WIDTH          = 8,
              ADDR_WIDTH         = $clog2(MEM_DEPTH); // 4

    // UART parameter
    parameter UART_DATA_WIDTH    = 8;

    // Test variables
    integer test_pass_count = 0;
    integer test_fail_count = 0;

    /* ================== Clocks Generation ================== */

    // REF Clock Generator
    initial begin
        REF_CLK = 0;
        forever #(REF_CLK_PERIOD/2) REF_CLK = ~REF_CLK; 
    end

    // UART RX Clock Generator
    initial begin
        UART_CLK = 0;
        forever #(UART_CLK_PERIOD/2) UART_CLK = ~UART_CLK; 
    end

    /* ================== DUT Instantiaion ================== */
    SYS_TOP #(
        .N(N), 
        .OPERAND_WIDTH(OPERAND_WIDTH), 
        .FUN_WIDTH(FUN_WIDTH),
        .ALU_OUTPUT_WIDTH(ALU_OUTPUT_WIDTH),
        .MEM_DEPTH(MEM_DEPTH),
        .MEM_WIDTH(MEM_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .UART_DATA_WIDTH(UART_DATA_WIDTH)
    ) DUT (.*);

    /* ================== Test Stimulus ================== */
    initial begin
        RX_IN = 1;
        
        // Reset the system
        RESET();
        
        /* =========================================================================
           CONFIGURATION #1: PRESCALE = 32, PARITY = ENABLED (EVEN)
           ======================================================================== */
        $display("===============================================================");
        $display("=== Configuration 1: PRESCALE=32, PARITY=ENABLED, TYPE=EVEN ===");
        $display("===============================================================");

        WR_CMD (8'h81, 8'h02);   // BY DEFAULT
        $display("Testing Configuration...");
        CHECK_WRITE(8'h81, 8'h02);

        WR_CMD (8'hBB, 8'h04);  
        $display("Testing Write...");
        CHECK_WRITE(8'hBB, 8'h04);

        RD_CMD (8'h04);         
        $display("Testing Read...");
        CHECK_READ(8'h04);

        /* ================== EXHAUSTIVE ALU TESTING ================== */

        // Test all ALU operations with operands
        ALU_OP_W_OP (8'h01, 8'h09, 8'h0); 
        $display("Testing ALU ADD Operation With Operands...");
        CHECK_ALU(4'h0, 8'h01, 8'h09, 16'h000A);

        ALU_OP_W_OP (8'h0F, 8'h03, 8'h1); 
        $display("Testing ALU SUB Operation With Operands...");
        CHECK_ALU(4'h1, 8'h0F, 8'h03, 16'h000C);

        ALU_OP_W_OP (8'h10, 8'h02, 8'h2); 
        $display("Testing ALU MUL Operation With Operands...");
        CHECK_ALU(4'h2, 8'h10, 8'h02, 16'h0020);

        ALU_OP_W_OP (8'h64, 8'h0A, 8'h3); 
        $display("Testing ALU DIV Operation With Operands...");
        CHECK_ALU(4'h3, 8'h64, 8'h0A, 16'h000A);

        ALU_OP_W_OP (8'h0F, 8'hF0, 8'h4); 
        $display("Testing ALU AND Operation With Operands...");
        CHECK_ALU(4'h4, 8'h0F, 8'hF0, 16'h0000);

        ALU_OP_W_OP (8'hFF, 8'hAA, 8'h5); 
        $display("Testing ALU OR Operation With Operands...");
        CHECK_ALU(4'h5, 8'hFF, 8'hAA, 16'h00FF);

        ALU_OP_W_OP (8'h33, 8'hCC, 8'h6); 
        $display("Testing ALU NAND Operation With Operands...");
        CHECK_ALU(4'h6, 8'h33, 8'hCC, 16'hFFFF);

        ALU_OP_W_OP (8'h55, 8'hAA, 8'h7); 
        $display("Testing ALU NOR Operation With Operands...");
        CHECK_ALU(4'h7, 8'h55, 8'hAA, 16'hFF00);

        ALU_OP_W_OP (8'h0F, 8'hF0, 8'h8); 
        $display("Testing ALU XOR Operation With Operands...");
        CHECK_ALU(4'h8, 8'h0F, 8'hF0, 16'h00FF);

        ALU_OP_W_OP (8'h0F, 8'hF0, 8'h9); 
        $display("Testing ALU XNOR Operation With Operands...");
        CHECK_ALU(4'h9, 8'h0F, 8'hF0, 16'hFF00);

        ALU_OP_W_OP (8'h0A, 8'h0A, 8'hA); 
        $display("Testing ALU EQUAL Operation With Operands...");
        CHECK_ALU(4'hA, 8'h0A, 8'h0A, 16'h0001);

        ALU_OP_W_OP (8'h0B, 8'h0A, 8'hB); 
        $display("Testing ALU GREATER Operation With Operands...");
        CHECK_ALU(4'hB, 8'h0B, 8'h0A, 16'h0002);

        ALU_OP_W_OP (8'h09, 8'h0A, 8'hC); 
        $display("Testing ALU LESS Operation With Operands...");
        CHECK_ALU(4'hC, 8'h09, 8'h0A, 16'h0003);

        ALU_OP_W_OP (8'hAA, 8'h00, 8'hD); 
        $display("Testing ALU SHIFT RIGHT Operation With Operands...");
        CHECK_ALU(4'hD, 8'hAA, 8'h00, 16'h0055);

        ALU_OP_W_OP (8'h55, 8'h00, 8'hE); 
        $display("Testing ALU SHIFT LEFT Operation With Operands...");
        CHECK_ALU(4'hE, 8'h55, 8'h00, 16'h00AA);

        // Test ALU operations with no operands (using pre-loaded registers)
        WR_CMD (8'h05, 8'h00); // Loading A
        WR_CMD (8'h05, 8'h01); // Loading B
        ALU_OP_W_NOP (8'h0);              
        $display("Testing ALU ADD Operation With No Operands...");
        CHECK_ALU(4'h0, 8'h05, 8'h05, 16'h000A);

        WR_CMD (8'h02, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h1);              
        $display("Testing ALU SUB Operation With No Operands...");
        CHECK_ALU(4'h1, 8'h02, 8'h02, 16'h0000);

        WR_CMD (8'h03, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h2);              
        $display("Testing ALU MUL Operation With No Operands...");
        CHECK_ALU(4'h2, 8'h03, 8'h02, 16'h0006);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h04, 8'h01);
        ALU_OP_W_NOP (8'h3);              
        $display("Testing ALU DIV Operation With No Operands...");
        CHECK_ALU(4'h3, 8'h01, 8'h04, 16'h0000);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h01, 8'h01);
        ALU_OP_W_NOP (8'h4);              
        $display("Testing ALU AND Operation With No Operands...");
        CHECK_ALU(4'h4, 8'h01, 8'h01, 16'h0001);

        WR_CMD (8'h08, 8'h00);
        WR_CMD (8'h00, 8'h01);
        ALU_OP_W_NOP (8'h5);              
        $display("Testing ALU OR Operation With No Operands...");
        CHECK_ALU(4'h5, 8'h08, 8'h00, 16'h0008);

        WR_CMD (8'h05, 8'h00);
        WR_CMD (8'h05, 8'h01);
        ALU_OP_W_NOP (8'h6);              
        $display("Testing ALU NAND Operation With No Operands...");
        CHECK_ALU(4'h6, 8'h05, 8'h05, 16'hFFFA);

        WR_CMD (8'h03, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h7);              
        $display("Testing ALU NOR Operation With No Operands...");
        CHECK_ALU(4'h7, 8'h03, 8'h02, 16'hFFFC);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h8);              
        $display("Testing ALU XOR Operation With No Operands...");
        CHECK_ALU(4'h8, 8'h01, 8'h02, 16'h0003);

        WR_CMD (8'h0F, 8'h00);
        WR_CMD (8'hF0, 8'h01);
        ALU_OP_W_NOP (8'h9);              
        $display("Testing ALU XNOR Operation With No Operands...");
        CHECK_ALU(4'h9, 8'h0F, 8'hF0, 16'hFF00);

        WR_CMD (8'h0A, 8'h00);
        WR_CMD (8'h0A, 8'h01);
        ALU_OP_W_NOP (8'hA);              
        $display("Testing ALU EQUAL Operation With No Operands...");
        CHECK_ALU(4'hA, 8'h0A, 8'h0A, 16'h0001);

        WR_CMD (8'h0B, 8'h00);
        WR_CMD (8'h0A, 8'h01);
        ALU_OP_W_NOP (8'hB);              
        $display("Testing ALU GREATER Operation With No Operands...");
        CHECK_ALU(4'hB, 8'h0B, 8'h0A, 16'h0002);

        WR_CMD (8'h09, 8'h00);
        WR_CMD (8'h0A, 8'h01);
        ALU_OP_W_NOP (8'hC);              
        $display("Testing ALU LESS Operation With No Operands...");
        CHECK_ALU(4'hC, 8'h09, 8'h0A, 16'h0003);

        WR_CMD (8'hAA, 8'h00);
        WR_CMD (8'h00, 8'h01);
        ALU_OP_W_NOP (8'hD);              
        $display("Testing ALU SHIFT RIGHT Operation With No Operands...");
        CHECK_ALU(4'hD, 8'hAA, 8'h00, 16'h0055);

        WR_CMD (8'h55, 8'h00);
        WR_CMD (8'h00, 8'h01);
        ALU_OP_W_NOP (8'hE);              
        $display("Testing ALU SHIFT LEFT Operation With No Operands...");
        CHECK_ALU(4'hE, 8'h55, 8'h00, 16'h00AA);

        /* =========================================================================
           CONFIGURATION #2: PRESCALE = 32, PARITY = ENABLED (ODD)
           ======================================================================== */
        $display("===============================================================");
        $display("=== Configuration 2: PRESCALE=32, PARITY=ENABLED, TYPE=ODD ===");
        $display("===============================================================");

        WR_CMD (8'h83, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h83, 8'h02);

        WR_CMD (8'h55, 8'h05);  
        $display("Testing Write...");
        CHECK_WRITE(8'h55, 8'h05);

        RD_CMD (8'h05);         
        $display("Testing Read...");
        CHECK_READ(8'h05);

        ALU_OP_W_OP (8'h0F, 8'h03, 8'h1); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h1, 8'h0F, 8'h03, 16'h000C);

        WR_CMD (8'h02, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h1);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h1, 8'h02, 8'h02, 16'h0000);

        /* =========================================================================
           CONFIGURATION #3: PRESCALE = 32, PARITY = DISABLED
           ======================================================================== */
        $display("====================================================");
        $display("=== Configuration 3: PRESCALE=32, PARITY=DISABLED ===");
        $display("====================================================");

        WR_CMD (8'h80, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h80, 8'h02);

        WR_CMD (8'hAA, 8'h06);  
        $display("Testing Write...");
        CHECK_WRITE(8'hAA, 8'h06);

        RD_CMD (8'h06);         
        $display("Testing Read...");
        CHECK_READ(8'h06);

        ALU_OP_W_OP (8'h10, 8'h02, 8'h2); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h2, 8'h10, 8'h02, 16'h0020);

        WR_CMD (8'h03, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h2);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h2, 8'h03, 8'h02, 16'h0006);

        /* =========================================================================
           CONFIGURATION #4: PRESCALE = 16, PARITY = ENABLED (EVEN)
           ======================================================================== */
        $display("===============================================================");   
        $display("=== Configuration 4: PRESCALE=16, PARITY=ENABLED, TYPE=EVEN ===");
        $display("===============================================================");

        WR_CMD (8'h41, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h41, 8'h02);

        WR_CMD (8'hCC, 8'h07);  
        $display("Testing Write...");
        CHECK_WRITE(8'hCC, 8'h07);

        RD_CMD (8'h07);         
        $display("Testing Read...");
        CHECK_READ(8'h07);

        ALU_OP_W_OP (8'h64, 8'h0A, 8'h3); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h3, 8'h64, 8'h0A, 16'h000A);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h04, 8'h01);
        ALU_OP_W_NOP (8'h3);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h3, 8'h01, 8'h04, 16'h0000);

        /* =========================================================================
           CONFIGURATION #5: PRESCALE = 16, PARITY = ENABLED (ODD)
           ======================================================================== */
        $display("===============================================================");   
        $display("=== Configuration 5: PRESCALE=16, PARITY=ENABLED, TYPE=ODD ===");
        $display("===============================================================");

        WR_CMD (8'h43, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h43, 8'h02);

        WR_CMD (8'hDD, 8'h08);  
        $display("Testing Write...");
        CHECK_WRITE(8'hDD, 8'h08);

        RD_CMD (8'h08);         
        $display("Testing Read...");
        CHECK_READ(8'h08);

        ALU_OP_W_OP (8'h0F, 8'hF0, 8'h4); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h4, 8'h0F, 8'hF0, 16'h0000);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h01, 8'h01);
        ALU_OP_W_NOP (8'h4);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h4, 8'h01, 8'h01, 16'h0001);

        /* =========================================================================
           CONFIGURATION #6: PRESCALE = 16, PARITY = DISABLED
           ======================================================================== */
        $display("=====================================================");
        $display("=== Configuration 6: PRESCALE=16, PARITY=DISABLED ===");
        $display("=====================================================");

        WR_CMD (8'h40, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h40, 8'h02);

        WR_CMD (8'hEE, 8'h09);  
        $display("Testing Write...");
        CHECK_WRITE(8'hEE, 8'h09);

        RD_CMD (8'h09);         
        $display("Testing Read...");
        CHECK_READ(8'h09);

        ALU_OP_W_OP (8'hFF, 8'hAA, 8'h5); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h5, 8'hFF, 8'hAA, 16'h00FF);

        WR_CMD (8'h08, 8'h00);
        WR_CMD (8'h00, 8'h01);
        ALU_OP_W_NOP (8'h5);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h5, 8'h08, 8'h00, 16'h0008);

        /* =========================================================================
           CONFIGURATION #7: PRESCALE = 8, PARITY = ENABLED (EVEN)
           ======================================================================== */
        $display("==============================================================");   
        $display("=== Configuration 7: PRESCALE=8, PARITY=ENABLED, TYPE=EVEN ===");
        $display("==============================================================");

        WR_CMD (8'h21, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h21, 8'h02);

        WR_CMD (8'h12, 8'h0A);  
        $display("Testing Write...");
        CHECK_WRITE(8'h12, 8'h0A);

        RD_CMD (8'h0A);         
        $display("Testing Read...");
        CHECK_READ(8'h0A);

        ALU_OP_W_OP (8'h33, 8'hCC, 8'h6); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h6, 8'h33, 8'hCC, ~(8'h33 & 8'hCC));

        WR_CMD (8'h05, 8'h00);
        WR_CMD (8'h05, 8'h01);
        ALU_OP_W_NOP (8'h6);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h6, 8'h05, 8'h05, ~(8'h05 & 8'h05));

        /* =========================================================================
           CONFIGURATION #8: PRESCALE = 8, PARITY = ENABLED (ODD)
           ======================================================================== */
        $display("=============================================================");   
        $display("=== Configuration 8: PRESCALE=8, PARITY=ENABLED, TYPE=ODD ===");
        $display("=============================================================");

        WR_CMD (8'h23, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h23, 8'h02);

        WR_CMD (8'h34, 8'h0B);  
        $display("Testing Write...");
        CHECK_WRITE(8'h34, 8'h0B);

        RD_CMD (8'h0B);         
        $display("Testing Read...");
        CHECK_READ(8'h0B);

        ALU_OP_W_OP (8'h55, 8'hAA, 8'h7); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h7, 8'h55, 8'hAA, ~(8'h55 | 8'hAA));

        WR_CMD (8'h03, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h7);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h7, 8'h03, 8'h02, ~(8'h03 | 8'h02));

        /* =========================================================================
           CONFIGURATION #9: PRESCALE = 8, PARITY = DISABLED
           ======================================================================== */
        $display("====================================================");
        $display("=== Configuration 9: PRESCALE=8, PARITY=DISABLED ===");
        $display("====================================================");
        WR_CMD (8'h20, 8'h02);  
        $display("Testing Configuration...");
        CHECK_WRITE(8'h20, 8'h02);

        WR_CMD (8'h78, 8'h0C);  
        $display("Testing Write...");
        CHECK_WRITE(8'h78, 8'h0C);

        RD_CMD (8'h0C);         
        $display("Testing Read...");
        CHECK_READ(8'h0C);

        ALU_OP_W_OP (8'h0F, 8'hF0, 8'h8); 
        $display("Testing ALU Operation With Operands...");
        CHECK_ALU(4'h8, 8'h0F, 8'hF0, 16'h00FF);

        WR_CMD (8'h01, 8'h00);
        WR_CMD (8'h02, 8'h01);
        ALU_OP_W_NOP (8'h8);              
        $display("Testing ALU Operation With No Operands...");
        CHECK_ALU(4'h8, 8'h01, 8'h02, 16'h0003);

    /* =========================================================================
				////////////////////				TEST SUMMARY            ////////////////////
		   ======================================================================== */

        $display("===============================================================");
        $display("======================= SUMMARY REPORT ========================");
        $display("===============================================================");
        $display("Total passed tests                        							: %0d", test_pass_count);
        $display("Total failed tests                        							: %0d", test_fail_count);
        $display("===============================================================");

        #(REF_CLK_PERIOD * 500);
        $stop;
    end

    /* ================== Dump File ================== */
    initial begin
        $dumpfile("SYS_TOP.vcd");
        $dumpvars;
    end

    /* ================== Tasks ================== */

    // Reset Task
    task RESET;
        begin
            $display("Applying System Reset...");
            RST = 0; // Assert Reset
            #(REF_CLK_PERIOD * 10);
            RST = 1; // De-assert Reset
            #(REF_CLK_PERIOD * 10);
            $display("Reset Completed");
        end
    endtask 

    // Load frame task: Construct frame to be sent 
    task LOAD_FRAME (input [UART_DATA_WIDTH-1:0] DATA);
        integer i;
        begin
            /* ========================= Sequence of operation ========================= 
            ///////////////////////////// {0,[0:7],<0,1>,1} ////////////////////////////
            Load Start bit -> Load Frame -> Calculate Parity(If any) -> End with end bit
            */
            
            // Load start bit
            @(posedge DUT.UART_UNIT.TX_CLK)
            RX_IN = 1'b0;

            // Load frame data bits (LSB first)
            for(i=0; i<8; i=i+1) begin
                @(posedge DUT.UART_UNIT.TX_CLK)    
                RX_IN = DATA[i];
            end

            // Calculate Parity if enabled
            if (DUT.REG_FILE_UNIT.REG2[0]) begin
                @(posedge DUT.UART_UNIT.TX_CLK)
                if (!DUT.REG_FILE_UNIT.REG2[1]) begin
                    // Even Parity
                    RX_IN = ^DATA;
                end else begin
                    // Odd Parity
                    RX_IN = ~^DATA;
                end
            end

            // Load stop bit
            @(posedge DUT.UART_UNIT.TX_CLK)
            RX_IN = 1'b1;
        end
    endtask 

    // Write Command
    task WR_CMD (input [UART_DATA_WIDTH-1:0] DATA, input [UART_DATA_WIDTH-1:0] ADDRESS);
        begin
            LOAD_FRAME(RF_WR_CMD);
            LOAD_FRAME(ADDRESS);
            LOAD_FRAME(DATA);
        end
    endtask 

    // Read Command
    task RD_CMD (input [UART_DATA_WIDTH-1:0] ADDRESS);
        begin
            LOAD_FRAME(RF_RD_CMD);
            LOAD_FRAME(ADDRESS);
        end
    endtask 

    // ALU operation command with operands
    task ALU_OP_W_OP (input [UART_DATA_WIDTH-1:0] OPERAND_A, OPERAND_B, FUNCTION);
        begin
            LOAD_FRAME(ALU_OPER_W_OP_CMD);
            LOAD_FRAME(OPERAND_A);
            LOAD_FRAME(OPERAND_B);
            LOAD_FRAME(FUNCTION);
        end
    endtask 

    // ALU operation command with no operands
    task ALU_OP_W_NOP (input [UART_DATA_WIDTH-1:0] FUNCTION);
        begin
            LOAD_FRAME(ALU_OPER_W_NOP_CMD);
            LOAD_FRAME(FUNCTION);
        end
    endtask 

    // Check write operation task
    task CHECK_WRITE (input [UART_DATA_WIDTH-1:0] DATA, input [UART_DATA_WIDTH-1:0] ADDRESS);
        begin
            wait(DUT.REG_FILE_UNIT.WrEn)
            @(posedge REF_CLK);
            @(posedge REF_CLK); 
            if(DUT.REG_FILE_UNIT.mem[ADDRESS[UART_DATA_WIDTH-1:0]] == DATA) begin
                $display("WRITE PASS: Address 0x%0h = 0x%0h \n", ADDRESS, DATA);
                test_pass_count = test_pass_count + 1;
            end else begin
                $display("WRITE FAIL: Address 0x%0h = 0x%0h \n", ADDRESS, DATA);
                test_fail_count = test_fail_count + 1;
            end    
        end
    endtask 

    // Check read operation task
    task CHECK_READ (input [UART_DATA_WIDTH-1:0] ADDRESS);
        reg [10:0] OUT_DUT, OUT_EXPECTED;     //(start, data, parity, stop), {0,[0:7],<0,1>,1}
        reg parity;
        integer   i  ;

        begin
            // System output
            @(posedge DUT.UART_UNIT.TX_OUT_V)
            for(i=0; i<11; i=i+1) begin
                @(negedge DUT.UART_UNIT.TX_CLK) OUT_DUT[i] = TX_OUT ;
            end
            
            // Calculate expected parity bit     
            if(DUT.REG_FILE_UNIT.REG2[0]) begin
                if(DUT.REG_FILE_UNIT.REG2[1]) begin
                    // ODD Parity
                    parity = ~^DUT.REG_FILE_UNIT.mem[ADDRESS[ADDR_WIDTH-1:0]];
                end else begin
                    // Even Parity
                    parity = ^DUT.REG_FILE_UNIT.mem[ADDRESS[ADDR_WIDTH-1:0]];
                end
            end else begin
                parity = 1'b1;
            end
            
            // System expected output
            if(DUT.REG_FILE_UNIT.REG2[0])
                OUT_EXPECTED = {1'b1,parity,DUT.REG_FILE_UNIT.mem[ADDRESS[UART_DATA_WIDTH-1:0]],1'b0} ;
            else
                OUT_EXPECTED = {1'b1,1'b1,DUT.REG_FILE_UNIT.mem[ADDRESS[UART_DATA_WIDTH-1:0]],1'b0} ;
                    
            if(OUT_DUT == OUT_EXPECTED) begin
                $display("READ PASS: Address 0x%0h = 0x%0h \n", ADDRESS, DUT.REG_FILE_UNIT.mem[ADDRESS[ADDR_WIDTH-1:0]]);
                test_pass_count = test_pass_count + 1;
            end else begin
                $display("READ FAIL: Address 0x%0h, Expected Frame: 0x%0h, Got Frame: 0x%0h \n", ADDRESS, OUT_EXPECTED, OUT_DUT);
                test_fail_count = test_fail_count + 1;
            end
        end
    endtask

    // Check ALU operation task
    task CHECK_ALU (input [3:0] FUNCTION, input [7:0] OPERAND_A, input [7:0] OPERAND_B, input [15:0] EXPECTED_RESULT);
        reg [10:0] OUT_DUT_BYTE0, OUT_DUT_BYTE1;
        reg [10:0] OUT_EXPECTED_BYTE0, OUT_EXPECTED_BYTE1;
        reg parity0, parity1;
        integer i;
        begin
            // Capture first byte from DUT
            @(posedge DUT.UART_UNIT.TX_OUT_V)
            for(i=0; i<11; i=i+1) begin
                @(negedge DUT.UART_UNIT.TX_CLK) OUT_DUT_BYTE0[i] = TX_OUT;
            end
            
            // Capture second byte from DUT
            @(posedge DUT.UART_UNIT.TX_OUT_V)
            for(i=0; i<11; i=i+1) begin
                @(negedge DUT.UART_UNIT.TX_CLK) OUT_DUT_BYTE1[i] = TX_OUT;
            end
            
            // Calculate expected parity bits
            if(DUT.REG_FILE_UNIT.REG2[0]) begin
                if(DUT.REG_FILE_UNIT.REG2[1]) begin
                    // ODD Parity
                    parity0 = ~^EXPECTED_RESULT[7:0];
                    parity1 = ~^EXPECTED_RESULT[15:8];
                end else begin
                    // Even Parity
                    parity0 = ^EXPECTED_RESULT[7:0];
                    parity1 = ^EXPECTED_RESULT[15:8];
                end
            end else begin
                parity0 = 1'b1;
                parity1 = 1'b1;
            end
            
            // System expected output
            if(DUT.REG_FILE_UNIT.REG2[0]) begin
                OUT_EXPECTED_BYTE0 = {1'b1, parity0, EXPECTED_RESULT[7:0], 1'b0};
                OUT_EXPECTED_BYTE1 = {1'b1, parity1, EXPECTED_RESULT[15:8], 1'b0};
            end else begin
                OUT_EXPECTED_BYTE0 = {1'b1, 1'b1, EXPECTED_RESULT[7:0], 1'b0};
                OUT_EXPECTED_BYTE1 = {1'b1, 1'b1, EXPECTED_RESULT[15:8], 1'b0};
            end
            
            if((OUT_DUT_BYTE0 == OUT_EXPECTED_BYTE0) && (OUT_DUT_BYTE1 == OUT_EXPECTED_BYTE1)) begin
                $display("ALU OPERATION PASS: Function 0x%0h, Operand_A=0x%0h, Operand_B=0x%0h, Result = 0x%0h \n", 
                         FUNCTION, OPERAND_A, OPERAND_B, EXPECTED_RESULT);
                test_pass_count = test_pass_count + 1;
            end else begin
                $display("ALU FAIL: Function 0x%0h, Operand_A=0x%0h, Operand_B=0x%0h, Expected = 0x%0h \n", 
                         FUNCTION, OPERAND_A, OPERAND_B, EXPECTED_RESULT);
                $display("Byte0: Expected 0x%0h, Got 0x%0h", OUT_EXPECTED_BYTE0, OUT_DUT_BYTE0);
                $display("Byte1: Expected 0x%0h, Got 0x%0h", OUT_EXPECTED_BYTE1, OUT_DUT_BYTE1);
                test_fail_count = test_fail_count + 1;
            end
        end
    endtask

    /* ================== Test Monitor & Results ================== 
    initial begin
        $monitor("Time: %0t ns | RST: %0b | RX_IN: %0b | TX_OUT: %0b | Parity_Error: %0b | Stop_Error: %0b", 
                  $time, RST, RX_IN, TX_OUT, parity_error, Stop_Error); 
    end 
    */
endmodule