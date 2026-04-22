/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct  1 20:22:00 2025
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
  SDFFRQX1M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module RST_SYNC_NUM_STAGES2_test_0 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
  SDFFRQX1M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 ( CLK, RST, BUS_ENABLE, 
        Unsync_bus, SYNC_BUS, ENABLE_PULSE, test_si, test_so, test_se );
  input [7:0] Unsync_bus;
  output [7:0] SYNC_BUS;
  input CLK, RST, BUS_ENABLE, test_si, test_se;
  output ENABLE_PULSE, test_so;
  wire   pulse_gen_d, n1, n4, n6, n8, n10, n12, n14, n16, n18, n22;
  wire   [1:0] sync_reg;
  assign test_so = sync_reg[1];

  SDFFRQX2M pulse_gen_d_reg ( .D(sync_reg[1]), .SI(SYNC_BUS[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(pulse_gen_d) );
  SDFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .SI(sync_reg[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(sync_reg[1]) );
  SDFFRQX2M \SYNC_BUS_reg[7]  ( .D(n18), .SI(SYNC_BUS[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[7]) );
  SDFFRQX2M \SYNC_BUS_reg[6]  ( .D(n16), .SI(SYNC_BUS[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[6]) );
  SDFFRQX2M \SYNC_BUS_reg[4]  ( .D(n12), .SI(SYNC_BUS[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[4]) );
  SDFFRQX2M \SYNC_BUS_reg[0]  ( .D(n4), .SI(ENABLE_PULSE), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[0]) );
  SDFFRQX2M \SYNC_BUS_reg[3]  ( .D(n10), .SI(SYNC_BUS[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[3]) );
  SDFFRQX2M \SYNC_BUS_reg[5]  ( .D(n14), .SI(SYNC_BUS[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[5]) );
  SDFFRQX2M \SYNC_BUS_reg[1]  ( .D(n6), .SI(SYNC_BUS[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[1]) );
  SDFFRQX2M ENABLE_PULSE_reg ( .D(n22), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ENABLE_PULSE) );
  SDFFRQX2M \SYNC_BUS_reg[2]  ( .D(n8), .SI(SYNC_BUS[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[2]) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(BUS_ENABLE), .SI(pulse_gen_d), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n22) );
  NAND2BX2M U4 ( .AN(pulse_gen_d), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n22), .B0(SYNC_BUS[0]), .B1(n1), .Y(n4)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n22), .B0(SYNC_BUS[1]), .B1(n1), .Y(n6)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n22), .B0(SYNC_BUS[2]), .B1(n1), .Y(n8)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n22), .B0(SYNC_BUS[3]), .B1(n1), .Y(n10) );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n22), .B0(SYNC_BUS[4]), .B1(n1), .Y(n12) );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n22), .B0(SYNC_BUS[5]), .B1(n1), .Y(
        n14) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n22), .B0(SYNC_BUS[6]), .B1(n1), .Y(
        n16) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n22), .B0(SYNC_BUS[7]), .B1(n1), .Y(
        n18) );
endmodule


module memory_ADDRSIZE3_DATASIZE8_MEMDEPTH8_test_1 ( wdata, waddr, raddr, wclk, 
        winc, wfull, wrst_n, rdata, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclk, winc, wfull, wrst_n, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N10, N11, N12, \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n182, n183, n184, n185,
         n186;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign test_so2 = \mem[7][7] ;
  assign test_so1 = \mem[5][4] ;

  SDFFRQX2M \mem_reg[5][7]  ( .D(n133), .SI(\mem[5][6] ), .SE(n186), .CK(wclk), 
        .RN(n164), .Q(\mem[5][7] ) );
  SDFFRQX2M \mem_reg[5][6]  ( .D(n132), .SI(\mem[5][5] ), .SE(n185), .CK(wclk), 
        .RN(n164), .Q(\mem[5][6] ) );
  SDFFRQX2M \mem_reg[5][5]  ( .D(n131), .SI(test_si2), .SE(n184), .CK(wclk), 
        .RN(n164), .Q(\mem[5][5] ) );
  SDFFRQX2M \mem_reg[5][4]  ( .D(n130), .SI(\mem[5][3] ), .SE(n183), .CK(wclk), 
        .RN(n164), .Q(\mem[5][4] ) );
  SDFFRQX2M \mem_reg[5][3]  ( .D(n129), .SI(\mem[5][2] ), .SE(n186), .CK(wclk), 
        .RN(n164), .Q(\mem[5][3] ) );
  SDFFRQX2M \mem_reg[5][2]  ( .D(n128), .SI(\mem[5][1] ), .SE(n185), .CK(wclk), 
        .RN(n164), .Q(\mem[5][2] ) );
  SDFFRQX2M \mem_reg[5][1]  ( .D(n127), .SI(\mem[5][0] ), .SE(n184), .CK(wclk), 
        .RN(n164), .Q(\mem[5][1] ) );
  SDFFRQX2M \mem_reg[5][0]  ( .D(n126), .SI(\mem[4][7] ), .SE(n183), .CK(wclk), 
        .RN(n164), .Q(\mem[5][0] ) );
  SDFFRQX2M \mem_reg[1][7]  ( .D(n101), .SI(\mem[1][6] ), .SE(n186), .CK(wclk), 
        .RN(n167), .Q(\mem[1][7] ) );
  SDFFRQX2M \mem_reg[1][6]  ( .D(n100), .SI(\mem[1][5] ), .SE(n185), .CK(wclk), 
        .RN(n167), .Q(\mem[1][6] ) );
  SDFFRQX2M \mem_reg[1][5]  ( .D(n99), .SI(\mem[1][4] ), .SE(n184), .CK(wclk), 
        .RN(n167), .Q(\mem[1][5] ) );
  SDFFRQX2M \mem_reg[1][4]  ( .D(n98), .SI(\mem[1][3] ), .SE(n183), .CK(wclk), 
        .RN(n167), .Q(\mem[1][4] ) );
  SDFFRQX2M \mem_reg[1][3]  ( .D(n97), .SI(\mem[1][2] ), .SE(n186), .CK(wclk), 
        .RN(n167), .Q(\mem[1][3] ) );
  SDFFRQX2M \mem_reg[1][2]  ( .D(n96), .SI(\mem[1][1] ), .SE(n185), .CK(wclk), 
        .RN(n167), .Q(\mem[1][2] ) );
  SDFFRQX2M \mem_reg[1][1]  ( .D(n95), .SI(\mem[1][0] ), .SE(n184), .CK(wclk), 
        .RN(n167), .Q(\mem[1][1] ) );
  SDFFRQX2M \mem_reg[1][0]  ( .D(n94), .SI(\mem[0][7] ), .SE(n183), .CK(wclk), 
        .RN(n167), .Q(\mem[1][0] ) );
  SDFFRQX2M \mem_reg[7][7]  ( .D(n149), .SI(\mem[7][6] ), .SE(n186), .CK(wclk), 
        .RN(n163), .Q(\mem[7][7] ) );
  SDFFRQX2M \mem_reg[7][6]  ( .D(n148), .SI(\mem[7][5] ), .SE(n185), .CK(wclk), 
        .RN(n163), .Q(\mem[7][6] ) );
  SDFFRQX2M \mem_reg[7][5]  ( .D(n147), .SI(\mem[7][4] ), .SE(n184), .CK(wclk), 
        .RN(n163), .Q(\mem[7][5] ) );
  SDFFRQX2M \mem_reg[7][4]  ( .D(n146), .SI(\mem[7][3] ), .SE(n183), .CK(wclk), 
        .RN(n163), .Q(\mem[7][4] ) );
  SDFFRQX2M \mem_reg[7][3]  ( .D(n145), .SI(\mem[7][2] ), .SE(n186), .CK(wclk), 
        .RN(n163), .Q(\mem[7][3] ) );
  SDFFRQX2M \mem_reg[7][2]  ( .D(n144), .SI(\mem[7][1] ), .SE(n185), .CK(wclk), 
        .RN(n163), .Q(\mem[7][2] ) );
  SDFFRQX2M \mem_reg[7][1]  ( .D(n143), .SI(\mem[7][0] ), .SE(n184), .CK(wclk), 
        .RN(n163), .Q(\mem[7][1] ) );
  SDFFRQX2M \mem_reg[7][0]  ( .D(n142), .SI(\mem[6][7] ), .SE(n183), .CK(wclk), 
        .RN(n163), .Q(\mem[7][0] ) );
  SDFFRQX2M \mem_reg[3][7]  ( .D(n117), .SI(\mem[3][6] ), .SE(n186), .CK(wclk), 
        .RN(n165), .Q(\mem[3][7] ) );
  SDFFRQX2M \mem_reg[3][6]  ( .D(n116), .SI(\mem[3][5] ), .SE(n185), .CK(wclk), 
        .RN(n165), .Q(\mem[3][6] ) );
  SDFFRQX2M \mem_reg[3][5]  ( .D(n115), .SI(\mem[3][4] ), .SE(n184), .CK(wclk), 
        .RN(n165), .Q(\mem[3][5] ) );
  SDFFRQX2M \mem_reg[3][4]  ( .D(n114), .SI(\mem[3][3] ), .SE(n183), .CK(wclk), 
        .RN(n165), .Q(\mem[3][4] ) );
  SDFFRQX2M \mem_reg[3][3]  ( .D(n113), .SI(\mem[3][2] ), .SE(n186), .CK(wclk), 
        .RN(n166), .Q(\mem[3][3] ) );
  SDFFRQX2M \mem_reg[3][2]  ( .D(n112), .SI(\mem[3][1] ), .SE(n185), .CK(wclk), 
        .RN(n166), .Q(\mem[3][2] ) );
  SDFFRQX2M \mem_reg[3][1]  ( .D(n111), .SI(\mem[3][0] ), .SE(n184), .CK(wclk), 
        .RN(n166), .Q(\mem[3][1] ) );
  SDFFRQX2M \mem_reg[3][0]  ( .D(n110), .SI(\mem[2][7] ), .SE(n183), .CK(wclk), 
        .RN(n166), .Q(\mem[3][0] ) );
  SDFFRQX2M \mem_reg[6][7]  ( .D(n141), .SI(\mem[6][6] ), .SE(n186), .CK(wclk), 
        .RN(n163), .Q(\mem[6][7] ) );
  SDFFRQX2M \mem_reg[6][6]  ( .D(n140), .SI(\mem[6][5] ), .SE(n185), .CK(wclk), 
        .RN(n163), .Q(\mem[6][6] ) );
  SDFFRQX2M \mem_reg[6][5]  ( .D(n139), .SI(\mem[6][4] ), .SE(n184), .CK(wclk), 
        .RN(n163), .Q(\mem[6][5] ) );
  SDFFRQX2M \mem_reg[6][4]  ( .D(n138), .SI(\mem[6][3] ), .SE(n183), .CK(wclk), 
        .RN(n163), .Q(\mem[6][4] ) );
  SDFFRQX2M \mem_reg[6][3]  ( .D(n137), .SI(\mem[6][2] ), .SE(n186), .CK(wclk), 
        .RN(n164), .Q(\mem[6][3] ) );
  SDFFRQX2M \mem_reg[6][2]  ( .D(n136), .SI(\mem[6][1] ), .SE(n185), .CK(wclk), 
        .RN(n164), .Q(\mem[6][2] ) );
  SDFFRQX2M \mem_reg[6][1]  ( .D(n135), .SI(\mem[6][0] ), .SE(n184), .CK(wclk), 
        .RN(n164), .Q(\mem[6][1] ) );
  SDFFRQX2M \mem_reg[6][0]  ( .D(n134), .SI(\mem[5][7] ), .SE(n183), .CK(wclk), 
        .RN(n164), .Q(\mem[6][0] ) );
  SDFFRQX2M \mem_reg[2][7]  ( .D(n109), .SI(\mem[2][6] ), .SE(n186), .CK(wclk), 
        .RN(n166), .Q(\mem[2][7] ) );
  SDFFRQX2M \mem_reg[2][6]  ( .D(n108), .SI(\mem[2][5] ), .SE(n185), .CK(wclk), 
        .RN(n166), .Q(\mem[2][6] ) );
  SDFFRQX2M \mem_reg[2][5]  ( .D(n107), .SI(\mem[2][4] ), .SE(n184), .CK(wclk), 
        .RN(n166), .Q(\mem[2][5] ) );
  SDFFRQX2M \mem_reg[2][4]  ( .D(n106), .SI(\mem[2][3] ), .SE(n183), .CK(wclk), 
        .RN(n166), .Q(\mem[2][4] ) );
  SDFFRQX2M \mem_reg[2][3]  ( .D(n105), .SI(\mem[2][2] ), .SE(n186), .CK(wclk), 
        .RN(n166), .Q(\mem[2][3] ) );
  SDFFRQX2M \mem_reg[2][2]  ( .D(n104), .SI(\mem[2][1] ), .SE(n185), .CK(wclk), 
        .RN(n166), .Q(\mem[2][2] ) );
  SDFFRQX2M \mem_reg[2][1]  ( .D(n103), .SI(\mem[2][0] ), .SE(n184), .CK(wclk), 
        .RN(n166), .Q(\mem[2][1] ) );
  SDFFRQX2M \mem_reg[2][0]  ( .D(n102), .SI(\mem[1][7] ), .SE(n183), .CK(wclk), 
        .RN(n166), .Q(\mem[2][0] ) );
  SDFFRQX2M \mem_reg[4][7]  ( .D(n125), .SI(\mem[4][6] ), .SE(n186), .CK(wclk), 
        .RN(n165), .Q(\mem[4][7] ) );
  SDFFRQX2M \mem_reg[4][6]  ( .D(n124), .SI(\mem[4][5] ), .SE(n185), .CK(wclk), 
        .RN(n165), .Q(\mem[4][6] ) );
  SDFFRQX2M \mem_reg[4][5]  ( .D(n123), .SI(\mem[4][4] ), .SE(n184), .CK(wclk), 
        .RN(n165), .Q(\mem[4][5] ) );
  SDFFRQX2M \mem_reg[4][4]  ( .D(n122), .SI(\mem[4][3] ), .SE(n183), .CK(wclk), 
        .RN(n165), .Q(\mem[4][4] ) );
  SDFFRQX2M \mem_reg[4][3]  ( .D(n121), .SI(\mem[4][2] ), .SE(n186), .CK(wclk), 
        .RN(n165), .Q(\mem[4][3] ) );
  SDFFRQX2M \mem_reg[4][2]  ( .D(n120), .SI(\mem[4][1] ), .SE(n185), .CK(wclk), 
        .RN(n165), .Q(\mem[4][2] ) );
  SDFFRQX2M \mem_reg[4][1]  ( .D(n119), .SI(\mem[4][0] ), .SE(n184), .CK(wclk), 
        .RN(n165), .Q(\mem[4][1] ) );
  SDFFRQX2M \mem_reg[4][0]  ( .D(n118), .SI(\mem[3][7] ), .SE(n183), .CK(wclk), 
        .RN(n165), .Q(\mem[4][0] ) );
  SDFFRQX2M \mem_reg[0][7]  ( .D(n93), .SI(\mem[0][6] ), .SE(n186), .CK(wclk), 
        .RN(n167), .Q(\mem[0][7] ) );
  SDFFRQX2M \mem_reg[0][6]  ( .D(n92), .SI(\mem[0][5] ), .SE(n185), .CK(wclk), 
        .RN(n167), .Q(\mem[0][6] ) );
  SDFFRQX2M \mem_reg[0][5]  ( .D(n91), .SI(\mem[0][4] ), .SE(n184), .CK(wclk), 
        .RN(n167), .Q(\mem[0][5] ) );
  SDFFRQX2M \mem_reg[0][4]  ( .D(n90), .SI(\mem[0][3] ), .SE(n183), .CK(wclk), 
        .RN(n167), .Q(\mem[0][4] ) );
  SDFFRQX2M \mem_reg[0][3]  ( .D(n89), .SI(\mem[0][2] ), .SE(n186), .CK(wclk), 
        .RN(n168), .Q(\mem[0][3] ) );
  SDFFRQX2M \mem_reg[0][2]  ( .D(n88), .SI(\mem[0][1] ), .SE(n185), .CK(wclk), 
        .RN(n168), .Q(\mem[0][2] ) );
  SDFFRQX2M \mem_reg[0][1]  ( .D(n87), .SI(\mem[0][0] ), .SE(n184), .CK(wclk), 
        .RN(n168), .Q(\mem[0][1] ) );
  SDFFRQX2M \mem_reg[0][0]  ( .D(n86), .SI(test_si1), .SE(n183), .CK(wclk), 
        .RN(n168), .Q(\mem[0][0] ) );
  NOR2BX2M U66 ( .AN(n80), .B(waddr[2]), .Y(n76) );
  BUFX2M U67 ( .A(n83), .Y(n160) );
  BUFX2M U68 ( .A(n84), .Y(n159) );
  BUFX2M U69 ( .A(n85), .Y(n158) );
  BUFX2M U70 ( .A(n162), .Y(n167) );
  BUFX2M U71 ( .A(n162), .Y(n166) );
  BUFX2M U72 ( .A(n161), .Y(n165) );
  BUFX2M U73 ( .A(n161), .Y(n164) );
  BUFX2M U74 ( .A(n161), .Y(n163) );
  BUFX2M U75 ( .A(n162), .Y(n168) );
  BUFX2M U76 ( .A(wrst_n), .Y(n162) );
  BUFX2M U77 ( .A(wrst_n), .Y(n161) );
  NAND3X2M U78 ( .A(n169), .B(n178), .C(n82), .Y(n81) );
  NAND3X2M U79 ( .A(n169), .B(n178), .C(n76), .Y(n75) );
  NAND3X2M U80 ( .A(n76), .B(n169), .C(waddr[1]), .Y(n78) );
  NAND3X2M U81 ( .A(waddr[0]), .B(n76), .C(waddr[1]), .Y(n79) );
  NAND3X2M U82 ( .A(n76), .B(n178), .C(waddr[0]), .Y(n77) );
  INVX2M U83 ( .A(wdata[0]), .Y(n170) );
  INVX2M U84 ( .A(wdata[1]), .Y(n171) );
  INVX2M U85 ( .A(wdata[2]), .Y(n172) );
  INVX2M U86 ( .A(wdata[3]), .Y(n173) );
  INVX2M U87 ( .A(wdata[4]), .Y(n174) );
  INVX2M U88 ( .A(wdata[5]), .Y(n175) );
  INVX2M U89 ( .A(wdata[6]), .Y(n176) );
  INVX2M U90 ( .A(wdata[7]), .Y(n177) );
  OAI2BB2X1M U91 ( .B0(n75), .B1(n170), .A0N(\mem[0][0] ), .A1N(n75), .Y(n86)
         );
  OAI2BB2X1M U92 ( .B0(n75), .B1(n171), .A0N(\mem[0][1] ), .A1N(n75), .Y(n87)
         );
  OAI2BB2X1M U93 ( .B0(n75), .B1(n172), .A0N(\mem[0][2] ), .A1N(n75), .Y(n88)
         );
  OAI2BB2X1M U94 ( .B0(n75), .B1(n173), .A0N(\mem[0][3] ), .A1N(n75), .Y(n89)
         );
  OAI2BB2X1M U95 ( .B0(n75), .B1(n174), .A0N(\mem[0][4] ), .A1N(n75), .Y(n90)
         );
  OAI2BB2X1M U96 ( .B0(n75), .B1(n175), .A0N(\mem[0][5] ), .A1N(n75), .Y(n91)
         );
  OAI2BB2X1M U97 ( .B0(n75), .B1(n176), .A0N(\mem[0][6] ), .A1N(n75), .Y(n92)
         );
  OAI2BB2X1M U98 ( .B0(n75), .B1(n177), .A0N(\mem[0][7] ), .A1N(n75), .Y(n93)
         );
  OAI2BB2X1M U99 ( .B0(n170), .B1(n78), .A0N(\mem[2][0] ), .A1N(n78), .Y(n102)
         );
  OAI2BB2X1M U100 ( .B0(n171), .B1(n78), .A0N(\mem[2][1] ), .A1N(n78), .Y(n103) );
  OAI2BB2X1M U101 ( .B0(n172), .B1(n78), .A0N(\mem[2][2] ), .A1N(n78), .Y(n104) );
  OAI2BB2X1M U102 ( .B0(n173), .B1(n78), .A0N(\mem[2][3] ), .A1N(n78), .Y(n105) );
  OAI2BB2X1M U103 ( .B0(n174), .B1(n78), .A0N(\mem[2][4] ), .A1N(n78), .Y(n106) );
  OAI2BB2X1M U104 ( .B0(n175), .B1(n78), .A0N(\mem[2][5] ), .A1N(n78), .Y(n107) );
  OAI2BB2X1M U105 ( .B0(n176), .B1(n78), .A0N(\mem[2][6] ), .A1N(n78), .Y(n108) );
  OAI2BB2X1M U106 ( .B0(n177), .B1(n78), .A0N(\mem[2][7] ), .A1N(n78), .Y(n109) );
  OAI2BB2X1M U107 ( .B0(n170), .B1(n79), .A0N(\mem[3][0] ), .A1N(n79), .Y(n110) );
  OAI2BB2X1M U108 ( .B0(n171), .B1(n79), .A0N(\mem[3][1] ), .A1N(n79), .Y(n111) );
  OAI2BB2X1M U109 ( .B0(n172), .B1(n79), .A0N(\mem[3][2] ), .A1N(n79), .Y(n112) );
  OAI2BB2X1M U110 ( .B0(n173), .B1(n79), .A0N(\mem[3][3] ), .A1N(n79), .Y(n113) );
  OAI2BB2X1M U111 ( .B0(n174), .B1(n79), .A0N(\mem[3][4] ), .A1N(n79), .Y(n114) );
  OAI2BB2X1M U112 ( .B0(n175), .B1(n79), .A0N(\mem[3][5] ), .A1N(n79), .Y(n115) );
  OAI2BB2X1M U113 ( .B0(n176), .B1(n79), .A0N(\mem[3][6] ), .A1N(n79), .Y(n116) );
  OAI2BB2X1M U114 ( .B0(n177), .B1(n79), .A0N(\mem[3][7] ), .A1N(n79), .Y(n117) );
  OAI2BB2X1M U115 ( .B0(n170), .B1(n77), .A0N(\mem[1][0] ), .A1N(n77), .Y(n94)
         );
  OAI2BB2X1M U116 ( .B0(n171), .B1(n77), .A0N(\mem[1][1] ), .A1N(n77), .Y(n95)
         );
  OAI2BB2X1M U117 ( .B0(n172), .B1(n77), .A0N(\mem[1][2] ), .A1N(n77), .Y(n96)
         );
  OAI2BB2X1M U118 ( .B0(n173), .B1(n77), .A0N(\mem[1][3] ), .A1N(n77), .Y(n97)
         );
  OAI2BB2X1M U119 ( .B0(n174), .B1(n77), .A0N(\mem[1][4] ), .A1N(n77), .Y(n98)
         );
  OAI2BB2X1M U120 ( .B0(n175), .B1(n77), .A0N(\mem[1][5] ), .A1N(n77), .Y(n99)
         );
  OAI2BB2X1M U121 ( .B0(n176), .B1(n77), .A0N(\mem[1][6] ), .A1N(n77), .Y(n100) );
  OAI2BB2X1M U122 ( .B0(n177), .B1(n77), .A0N(\mem[1][7] ), .A1N(n77), .Y(n101) );
  OAI2BB2X1M U123 ( .B0(n170), .B1(n81), .A0N(\mem[4][0] ), .A1N(n81), .Y(n118) );
  OAI2BB2X1M U124 ( .B0(n171), .B1(n81), .A0N(\mem[4][1] ), .A1N(n81), .Y(n119) );
  OAI2BB2X1M U125 ( .B0(n172), .B1(n81), .A0N(\mem[4][2] ), .A1N(n81), .Y(n120) );
  OAI2BB2X1M U126 ( .B0(n173), .B1(n81), .A0N(\mem[4][3] ), .A1N(n81), .Y(n121) );
  OAI2BB2X1M U127 ( .B0(n174), .B1(n81), .A0N(\mem[4][4] ), .A1N(n81), .Y(n122) );
  OAI2BB2X1M U128 ( .B0(n175), .B1(n81), .A0N(\mem[4][5] ), .A1N(n81), .Y(n123) );
  OAI2BB2X1M U129 ( .B0(n176), .B1(n81), .A0N(\mem[4][6] ), .A1N(n81), .Y(n124) );
  OAI2BB2X1M U130 ( .B0(n177), .B1(n81), .A0N(\mem[4][7] ), .A1N(n81), .Y(n125) );
  OAI2BB2X1M U131 ( .B0(n170), .B1(n160), .A0N(\mem[5][0] ), .A1N(n160), .Y(
        n126) );
  OAI2BB2X1M U132 ( .B0(n171), .B1(n160), .A0N(\mem[5][1] ), .A1N(n160), .Y(
        n127) );
  OAI2BB2X1M U133 ( .B0(n172), .B1(n160), .A0N(\mem[5][2] ), .A1N(n160), .Y(
        n128) );
  OAI2BB2X1M U134 ( .B0(n173), .B1(n160), .A0N(\mem[5][3] ), .A1N(n160), .Y(
        n129) );
  OAI2BB2X1M U135 ( .B0(n174), .B1(n160), .A0N(\mem[5][4] ), .A1N(n160), .Y(
        n130) );
  OAI2BB2X1M U136 ( .B0(n175), .B1(n160), .A0N(\mem[5][5] ), .A1N(n160), .Y(
        n131) );
  OAI2BB2X1M U137 ( .B0(n176), .B1(n160), .A0N(\mem[5][6] ), .A1N(n160), .Y(
        n132) );
  OAI2BB2X1M U138 ( .B0(n177), .B1(n160), .A0N(\mem[5][7] ), .A1N(n160), .Y(
        n133) );
  OAI2BB2X1M U139 ( .B0(n170), .B1(n159), .A0N(\mem[6][0] ), .A1N(n159), .Y(
        n134) );
  OAI2BB2X1M U140 ( .B0(n171), .B1(n159), .A0N(\mem[6][1] ), .A1N(n159), .Y(
        n135) );
  OAI2BB2X1M U141 ( .B0(n172), .B1(n159), .A0N(\mem[6][2] ), .A1N(n159), .Y(
        n136) );
  OAI2BB2X1M U142 ( .B0(n173), .B1(n159), .A0N(\mem[6][3] ), .A1N(n159), .Y(
        n137) );
  OAI2BB2X1M U143 ( .B0(n174), .B1(n159), .A0N(\mem[6][4] ), .A1N(n159), .Y(
        n138) );
  OAI2BB2X1M U144 ( .B0(n175), .B1(n159), .A0N(\mem[6][5] ), .A1N(n159), .Y(
        n139) );
  OAI2BB2X1M U145 ( .B0(n176), .B1(n159), .A0N(\mem[6][6] ), .A1N(n159), .Y(
        n140) );
  OAI2BB2X1M U146 ( .B0(n177), .B1(n159), .A0N(\mem[6][7] ), .A1N(n159), .Y(
        n141) );
  OAI2BB2X1M U147 ( .B0(n170), .B1(n158), .A0N(\mem[7][0] ), .A1N(n158), .Y(
        n142) );
  OAI2BB2X1M U148 ( .B0(n171), .B1(n158), .A0N(\mem[7][1] ), .A1N(n158), .Y(
        n143) );
  OAI2BB2X1M U149 ( .B0(n172), .B1(n158), .A0N(\mem[7][2] ), .A1N(n158), .Y(
        n144) );
  OAI2BB2X1M U150 ( .B0(n173), .B1(n158), .A0N(\mem[7][3] ), .A1N(n158), .Y(
        n145) );
  OAI2BB2X1M U151 ( .B0(n174), .B1(n158), .A0N(\mem[7][4] ), .A1N(n158), .Y(
        n146) );
  OAI2BB2X1M U152 ( .B0(n175), .B1(n158), .A0N(\mem[7][5] ), .A1N(n158), .Y(
        n147) );
  OAI2BB2X1M U153 ( .B0(n176), .B1(n158), .A0N(\mem[7][6] ), .A1N(n158), .Y(
        n148) );
  OAI2BB2X1M U154 ( .B0(n177), .B1(n158), .A0N(\mem[7][7] ), .A1N(n158), .Y(
        n149) );
  NOR2BX2M U155 ( .AN(winc), .B(wfull), .Y(n80) );
  AND2X2M U156 ( .A(waddr[2]), .B(n80), .Y(n82) );
  NAND3X2M U157 ( .A(waddr[0]), .B(n178), .C(n82), .Y(n83) );
  NAND3X2M U158 ( .A(waddr[1]), .B(n169), .C(n82), .Y(n84) );
  NAND3X2M U159 ( .A(waddr[1]), .B(waddr[0]), .C(n82), .Y(n85) );
  INVX2M U160 ( .A(waddr[1]), .Y(n178) );
  INVX2M U161 ( .A(waddr[0]), .Y(n169) );
  MX2X2M U162 ( .A(n66), .B(n65), .S0(N12), .Y(rdata[0]) );
  MX4X1M U163 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n157), .S1(N11), .Y(n66) );
  MX4X1M U164 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n156), .S1(N11), .Y(n65) );
  MX2X2M U165 ( .A(n68), .B(n67), .S0(N12), .Y(rdata[1]) );
  MX4X1M U166 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n157), .S1(N11), .Y(n68) );
  MX4X1M U167 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n156), .S1(N11), .Y(n67) );
  MX2X2M U168 ( .A(n70), .B(n69), .S0(N12), .Y(rdata[2]) );
  MX4X1M U169 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n157), .S1(N11), .Y(n70) );
  MX4X1M U170 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n156), .S1(N11), .Y(n69) );
  MX2X2M U171 ( .A(n72), .B(n71), .S0(N12), .Y(rdata[3]) );
  MX4X1M U172 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n157), .S1(N11), .Y(n72) );
  MX4X1M U173 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n156), .S1(N11), .Y(n71) );
  MX2X2M U174 ( .A(n74), .B(n73), .S0(N12), .Y(rdata[4]) );
  MX4X1M U175 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n157), .S1(N11), .Y(n74) );
  MX4X1M U176 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n156), .S1(N11), .Y(n73) );
  MX2X2M U177 ( .A(n151), .B(n150), .S0(N12), .Y(rdata[5]) );
  MX4X1M U178 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n157), .S1(N11), .Y(n151) );
  MX4X1M U179 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n156), .S1(N11), .Y(n150) );
  MX2X2M U180 ( .A(n153), .B(n152), .S0(N12), .Y(rdata[6]) );
  MX4X1M U181 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n157), .S1(N11), .Y(n153) );
  MX4X1M U182 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n156), .S1(N11), .Y(n152) );
  MX2X2M U183 ( .A(n155), .B(n154), .S0(N12), .Y(rdata[7]) );
  MX4X1M U184 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n157), .S1(N11), .Y(n155) );
  MX4X1M U185 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n156), .S1(N11), .Y(n154) );
  BUFX2M U186 ( .A(N10), .Y(n156) );
  BUFX2M U187 ( .A(N10), .Y(n157) );
  INVXLM U188 ( .A(test_se), .Y(n182) );
  INVXLM U189 ( .A(n182), .Y(n183) );
  INVXLM U190 ( .A(n182), .Y(n184) );
  INVXLM U191 ( .A(n182), .Y(n185) );
  INVXLM U192 ( .A(n182), .Y(n186) );
endmodule


module sync_r2w_ADDRSIZE3_test_1 ( wclk, wrst_n, rptr, wq2_rptr, test_se );
  input [3:0] rptr;
  output [3:0] wq2_rptr;
  input wclk, wrst_n, test_se;

  wire   [3:0] wq1_rptr;

  SDFFRQX2M \wq2_rptr_reg[3]  ( .D(wq1_rptr[3]), .SI(wq2_rptr[2]), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wq2_rptr[3]) );
  SDFFRQX2M \wq2_rptr_reg[2]  ( .D(wq1_rptr[2]), .SI(wq2_rptr[1]), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wq2_rptr[2]) );
  SDFFRQX2M \wq2_rptr_reg[1]  ( .D(wq1_rptr[1]), .SI(wq2_rptr[0]), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wq2_rptr[1]) );
  SDFFRQX2M \wq2_rptr_reg[0]  ( .D(wq1_rptr[0]), .SI(wq1_rptr[3]), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wq2_rptr[0]) );
  SDFFRQX2M \wq1_rptr_reg[3]  ( .D(rptr[3]), .SI(wq1_rptr[2]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wq1_rptr[3]) );
  SDFFRQX2M \wq1_rptr_reg[2]  ( .D(rptr[2]), .SI(wq1_rptr[1]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wq1_rptr[2]) );
  SDFFRQX2M \wq1_rptr_reg[1]  ( .D(rptr[1]), .SI(wq1_rptr[0]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wq1_rptr[1]) );
  SDFFRQX2M \wq1_rptr_reg[0]  ( .D(rptr[0]), .SI(rptr[3]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wq1_rptr[0]) );
endmodule


module sync_w2r_ADDRSIZE3_test_1 ( rclk, rrst_n, wptr, rq2_wptr, test_si, 
        test_se );
  input [3:0] wptr;
  output [3:0] rq2_wptr;
  input rclk, rrst_n, test_si, test_se;

  wire   [3:0] rq1_wptr;

  SDFFRQX2M \rq2_wptr_reg[3]  ( .D(rq1_wptr[3]), .SI(rq2_wptr[2]), .SE(test_se), .CK(rclk), .RN(rrst_n), .Q(rq2_wptr[3]) );
  SDFFRQX2M \rq2_wptr_reg[2]  ( .D(rq1_wptr[2]), .SI(rq2_wptr[1]), .SE(test_se), .CK(rclk), .RN(rrst_n), .Q(rq2_wptr[2]) );
  SDFFRQX2M \rq2_wptr_reg[1]  ( .D(rq1_wptr[1]), .SI(rq2_wptr[0]), .SE(test_se), .CK(rclk), .RN(rrst_n), .Q(rq2_wptr[1]) );
  SDFFRQX2M \rq2_wptr_reg[0]  ( .D(rq1_wptr[0]), .SI(rq1_wptr[3]), .SE(test_se), .CK(rclk), .RN(rrst_n), .Q(rq2_wptr[0]) );
  SDFFRQX2M \rq1_wptr_reg[3]  ( .D(wptr[3]), .SI(rq1_wptr[2]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rq1_wptr[3]) );
  SDFFRQX2M \rq1_wptr_reg[2]  ( .D(wptr[2]), .SI(rq1_wptr[1]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rq1_wptr[2]) );
  SDFFRQX2M \rq1_wptr_reg[1]  ( .D(wptr[1]), .SI(rq1_wptr[0]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rq1_wptr[1]) );
  SDFFRQX2M \rq1_wptr_reg[0]  ( .D(wptr[0]), .SI(test_si), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rq1_wptr[0]) );
endmodule


module wptr_full_ADDRSIZE3_test_1 ( wfull, waddr, wptr, wq2_rptr, winc, wclk, 
        wrst_n, test_si, test_se );
  output [2:0] waddr;
  output [3:0] wptr;
  input [3:0] wq2_rptr;
  input winc, wclk, wrst_n, test_si, test_se;
  output wfull;
  wire   \wbin[3] , wfull_next, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [3:0] wbin_next;
  wire   [2:0] wgray_next;

  SDFFRQX2M \wbin_reg[3]  ( .D(wbin_next[3]), .SI(waddr[2]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(\wbin[3] ) );
  SDFFRQX2M \wbin_reg[2]  ( .D(wbin_next[2]), .SI(waddr[1]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  SDFFRQX2M wfull_reg ( .D(wfull_next), .SI(\wbin[3] ), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  SDFFRQX2M \wbin_reg[0]  ( .D(wbin_next[0]), .SI(test_si), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(waddr[0]) );
  SDFFRQX2M \wbin_reg[1]  ( .D(wbin_next[1]), .SI(waddr[0]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  SDFFRQX2M \wptr_reg[0]  ( .D(wgray_next[0]), .SI(wfull), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[0]) );
  SDFFRQX2M \wptr_reg[3]  ( .D(wbin_next[3]), .SI(wptr[2]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[3]) );
  SDFFRQX2M \wptr_reg[2]  ( .D(wgray_next[2]), .SI(wptr[1]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wptr[2]) );
  SDFFRQX2M \wptr_reg[1]  ( .D(wgray_next[1]), .SI(wptr[0]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wptr[1]) );
  CLKXOR2X2M U12 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(wgray_next[1]) );
  CLKXOR2X2M U13 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(wgray_next[0]) );
  CLKXOR2X2M U14 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(wgray_next[2]) );
  NOR4X1M U15 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(wfull_next) );
  XNOR2X2M U16 ( .A(wbin_next[3]), .B(wq2_rptr[3]), .Y(n11) );
  XNOR2X2M U17 ( .A(wgray_next[2]), .B(wq2_rptr[2]), .Y(n10) );
  CLKXOR2X2M U18 ( .A(wq2_rptr[0]), .B(wgray_next[0]), .Y(n12) );
  NOR2BX2M U19 ( .AN(winc), .B(wfull), .Y(n17) );
  XNOR2X2M U20 ( .A(n14), .B(\wbin[3] ), .Y(wbin_next[3]) );
  NAND3X2M U21 ( .A(waddr[1]), .B(n15), .C(waddr[2]), .Y(n14) );
  XNOR2X2M U22 ( .A(n16), .B(waddr[2]), .Y(wbin_next[2]) );
  NAND2X2M U23 ( .A(waddr[1]), .B(n15), .Y(n16) );
  AND2X2M U24 ( .A(waddr[0]), .B(n17), .Y(n15) );
  CLKXOR2X2M U25 ( .A(n15), .B(waddr[1]), .Y(wbin_next[1]) );
  CLKXOR2X2M U26 ( .A(wq2_rptr[1]), .B(wgray_next[1]), .Y(n13) );
  CLKXOR2X2M U27 ( .A(n17), .B(waddr[0]), .Y(wbin_next[0]) );
endmodule


module rptr_empty_ADDRSIZE3_test_1 ( rempty, raddr, rptr, rq2_wptr, rinc, rclk, 
        rrst_n, test_si, test_se );
  output [2:0] raddr;
  output [3:0] rptr;
  input [3:0] rq2_wptr;
  input rinc, rclk, rrst_n, test_si, test_se;
  output rempty;
  wire   \rbin[3] , rempty_next, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [3:0] rbin_next;
  wire   [2:0] rgray_next;

  SDFFRQX2M \rbin_reg[3]  ( .D(rbin_next[3]), .SI(raddr[2]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(\rbin[3] ) );
  SDFFRQX2M \rbin_reg[2]  ( .D(rbin_next[2]), .SI(raddr[1]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  SDFFRQX2M \rbin_reg[0]  ( .D(rbin_next[0]), .SI(test_si), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(raddr[0]) );
  SDFFRQX2M \rbin_reg[1]  ( .D(rbin_next[1]), .SI(raddr[0]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  SDFFRQX2M \rptr_reg[0]  ( .D(rgray_next[0]), .SI(rempty), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[0]) );
  SDFFRQX2M \rptr_reg[3]  ( .D(rbin_next[3]), .SI(rptr[2]), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[3]) );
  SDFFRQX2M \rptr_reg[2]  ( .D(rgray_next[2]), .SI(rptr[1]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rptr[2]) );
  SDFFRQX2M \rptr_reg[1]  ( .D(rgray_next[1]), .SI(rptr[0]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rptr[1]) );
  SDFFSQX1M rempty_reg ( .D(rempty_next), .SI(\rbin[3] ), .SE(test_se), .CK(
        rclk), .SN(rrst_n), .Q(rempty) );
  CLKXOR2X2M U13 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(rgray_next[2]) );
  CLKXOR2X2M U14 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(rgray_next[1]) );
  CLKXOR2X2M U15 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(rgray_next[0]) );
  XNOR2X2M U16 ( .A(n14), .B(\rbin[3] ), .Y(rbin_next[3]) );
  NAND3X2M U17 ( .A(raddr[1]), .B(n15), .C(raddr[2]), .Y(n14) );
  NOR4X1M U18 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(rempty_next) );
  CLKXOR2X2M U19 ( .A(rq2_wptr[3]), .B(rbin_next[3]), .Y(n11) );
  CLKXOR2X2M U20 ( .A(rq2_wptr[2]), .B(rgray_next[2]), .Y(n10) );
  CLKXOR2X2M U21 ( .A(rq2_wptr[0]), .B(rgray_next[0]), .Y(n12) );
  NOR2BX2M U22 ( .AN(rinc), .B(rempty), .Y(n17) );
  XNOR2X2M U23 ( .A(n16), .B(raddr[2]), .Y(rbin_next[2]) );
  NAND2X2M U24 ( .A(raddr[1]), .B(n15), .Y(n16) );
  AND2X2M U25 ( .A(raddr[0]), .B(n17), .Y(n15) );
  CLKXOR2X2M U26 ( .A(n15), .B(raddr[1]), .Y(rbin_next[1]) );
  CLKXOR2X2M U27 ( .A(rq2_wptr[1]), .B(rgray_next[1]), .Y(n13) );
  CLKXOR2X2M U28 ( .A(n17), .B(raddr[0]), .Y(rbin_next[0]) );
endmodule


module FIFO_DATASIZE8_MEMDEPTH8_test_1 ( wclk, wrst_n, rclk, rrst_n, winc, 
        rinc, wdata, rdata, wfull, rempty, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wrst_n, rclk, rrst_n, winc, rinc, test_si2, test_si1, test_se;
  output wfull, rempty, test_so2, test_so1;
  wire   n1, n2, n3, n4, n5;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  assign test_so2 = wptr[3];

  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(wrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
  memory_ADDRSIZE3_DATASIZE8_MEMDEPTH8_test_1 mem_UNIT ( .wdata(wdata), 
        .waddr(waddr), .raddr(raddr), .wclk(wclk), .winc(winc), .wfull(wfull), 
        .wrst_n(n3), .rdata(rdata), .test_si2(test_si2), .test_si1(test_si1), 
        .test_so2(n5), .test_so1(test_so1), .test_se(test_se) );
  sync_r2w_ADDRSIZE3_test_1 sync_r2w_UNIT ( .wclk(wclk), .wrst_n(n3), .rptr(
        rptr), .wq2_rptr(wq2_rptr), .test_se(test_se) );
  sync_w2r_ADDRSIZE3_test_1 sync_w2r_UNIT ( .rclk(rclk), .rrst_n(n1), .wptr(
        wptr), .rq2_wptr(rq2_wptr), .test_si(wq2_rptr[3]), .test_se(test_se)
         );
  wptr_full_ADDRSIZE3_test_1 wptr_full_UNIT ( .wfull(wfull), .waddr(waddr), 
        .wptr(wptr), .wq2_rptr(wq2_rptr), .winc(winc), .wclk(wclk), .wrst_n(n3), .test_si(rq2_wptr[3]), .test_se(test_se) );
  rptr_empty_ADDRSIZE3_test_1 rptr_empty_UNIT ( .rempty(rempty), .raddr(raddr), 
        .rptr(rptr), .rq2_wptr(rq2_wptr), .rinc(rinc), .rclk(rclk), .rrst_n(n1), .test_si(n5), .test_se(test_se) );
endmodule


module PULSE_GEN_test_1 ( CLK, RST, LVL_SIG, PULSE_SIG, test_si, test_so, 
        test_se );
  input CLK, RST, LVL_SIG, test_si, test_se;
  output PULSE_SIG, test_so;
  wire   PULSE_GEN_REG1, PULSE_GEN_REG0;
  assign test_so = PULSE_GEN_REG1;

  SDFFRQX2M PULSE_GEN_REG0_reg ( .D(LVL_SIG), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(PULSE_GEN_REG0) );
  SDFFRQX2M PULSE_GEN_REG1_reg ( .D(PULSE_GEN_REG0), .SI(PULSE_GEN_REG0), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(PULSE_GEN_REG1) );
  NOR2BX2M U5 ( .AN(PULSE_GEN_REG0), .B(PULSE_GEN_REG1), .Y(PULSE_SIG) );
endmodule


module CLK_DIV_DIV_RATIO8_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_DIV_RATIO8_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_DIV_RATIO8_test_1 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk, test_si, test_so, test_se );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en, test_si, test_se;
  output O_div_clk, test_so;
  wire   N3, DIV_CLK_reg, ODD_EDGE_FLAG, N16, N17, N18, N19, N20, N21, N22,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n1, n2, n3, n4, n5, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] counter;
  wire   [6:0] half_toggle;
  wire   [6:0] half_toggle_plus;
  assign test_so = counter[6];

  SDFFRQX2M DIV_CLK_reg_reg ( .D(n24), .SI(test_si), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(DIV_CLK_reg) );
  SDFFSQX2M ODD_EDGE_FLAG_reg ( .D(n25), .SI(DIV_CLK_reg), .SE(test_se), .CK(
        I_ref_clk), .SN(I_rst_n), .Q(ODD_EDGE_FLAG) );
  SDFFRQX2M \counter_reg[6]  ( .D(n26), .SI(counter[5]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n32), .SI(ODD_EDGE_FLAG), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n27), .SI(counter[4]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n28), .SI(counter[3]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n29), .SI(counter[2]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n30), .SI(counter[1]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n31), .SI(counter[0]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[1]) );
  OR2X2M U5 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n1) );
  INVX2M U6 ( .A(I_div_ratio[5]), .Y(n15) );
  OAI2BB1X2M U11 ( .A0N(n50), .A1N(n51), .B0(I_clk_en), .Y(N3) );
  MX2X2M U15 ( .A(DIV_CLK_reg), .B(I_ref_clk), .S0(N3), .Y(O_div_clk) );
  CLKINVX1M U16 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U17 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n1), .Y(
        half_toggle[1]) );
  OR2X1M U18 ( .A(n1), .B(I_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U19 ( .A0N(n1), .A1N(I_div_ratio[3]), .B0(n2), .Y(half_toggle[2])
         );
  NOR2X1M U20 ( .A(n2), .B(I_div_ratio[4]), .Y(n3) );
  AO21XLM U21 ( .A0(n2), .A1(I_div_ratio[4]), .B0(n3), .Y(half_toggle[3]) );
  CLKNAND2X2M U22 ( .A(n3), .B(n15), .Y(n4) );
  OAI21X1M U23 ( .A0(n3), .A1(n15), .B0(n4), .Y(half_toggle[4]) );
  XNOR2X1M U24 ( .A(I_div_ratio[6]), .B(n4), .Y(half_toggle[5]) );
  NOR2X1M U25 ( .A(I_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U26 ( .A(I_div_ratio[7]), .B(n5), .Y(half_toggle[6]) );
  AO22X1M U27 ( .A0(N3), .A1(counter[0]), .B0(N16), .B1(n16), .Y(n32) );
  AO22X1M U28 ( .A0(N3), .A1(counter[1]), .B0(N17), .B1(n16), .Y(n31) );
  AO22X1M U29 ( .A0(N3), .A1(counter[2]), .B0(N18), .B1(n16), .Y(n30) );
  AO22X1M U30 ( .A0(N3), .A1(counter[3]), .B0(N19), .B1(n16), .Y(n29) );
  AO22X1M U31 ( .A0(N3), .A1(counter[4]), .B0(N20), .B1(n16), .Y(n28) );
  AO22X1M U32 ( .A0(N3), .A1(counter[5]), .B0(N21), .B1(n16), .Y(n27) );
  AO22X1M U33 ( .A0(N3), .A1(counter[6]), .B0(N22), .B1(n16), .Y(n26) );
  AND3X1M U34 ( .A(n17), .B(n18), .C(n19), .Y(n16) );
  XNOR2X1M U35 ( .A(ODD_EDGE_FLAG), .B(n20), .Y(n25) );
  NAND2BX1M U36 ( .AN(n18), .B(n17), .Y(n20) );
  CLKINVX1M U37 ( .A(N3), .Y(n17) );
  CLKXOR2X2M U38 ( .A(DIV_CLK_reg), .B(n21), .Y(n24) );
  AOI21X1M U39 ( .A0(n18), .A1(n19), .B0(N3), .Y(n21) );
  OR2X1M U40 ( .A(n22), .B(I_div_ratio[0]), .Y(n19) );
  CLKNAND2X2M U41 ( .A(n23), .B(I_div_ratio[0]), .Y(n18) );
  MXI2X1M U42 ( .A(n33), .B(n22), .S0(ODD_EDGE_FLAG), .Y(n23) );
  NAND4X1M U43 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n22) );
  NOR4X1M U44 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n37) );
  CLKXOR2X2M U45 ( .A(half_toggle[2]), .B(counter[2]), .Y(n41) );
  CLKXOR2X2M U46 ( .A(half_toggle[1]), .B(counter[1]), .Y(n40) );
  CLKXOR2X2M U47 ( .A(half_toggle[0]), .B(counter[0]), .Y(n39) );
  CLKXOR2X2M U48 ( .A(half_toggle[6]), .B(counter[6]), .Y(n38) );
  XNOR2X1M U49 ( .A(counter[4]), .B(half_toggle[4]), .Y(n36) );
  XNOR2X1M U50 ( .A(counter[5]), .B(half_toggle[5]), .Y(n35) );
  XNOR2X1M U51 ( .A(counter[3]), .B(half_toggle[3]), .Y(n34) );
  NAND4X1M U52 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n33) );
  NOR4X1M U53 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n45) );
  CLKXOR2X2M U54 ( .A(half_toggle_plus[2]), .B(counter[2]), .Y(n49) );
  CLKXOR2X2M U55 ( .A(half_toggle_plus[1]), .B(counter[1]), .Y(n48) );
  CLKXOR2X2M U56 ( .A(half_toggle_plus[0]), .B(counter[0]), .Y(n47) );
  CLKXOR2X2M U57 ( .A(half_toggle_plus[6]), .B(counter[6]), .Y(n46) );
  XNOR2X1M U58 ( .A(counter[4]), .B(half_toggle_plus[4]), .Y(n44) );
  XNOR2X1M U59 ( .A(counter[5]), .B(half_toggle_plus[5]), .Y(n43) );
  XNOR2X1M U60 ( .A(counter[3]), .B(half_toggle_plus[3]), .Y(n42) );
  NOR4X1M U61 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n51) );
  NOR3X1M U62 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), 
        .Y(n50) );
  CLK_DIV_DIV_RATIO8_0_DW01_inc_0 add_37 ( .A(counter), .SUM({N22, N21, N20, 
        N19, N18, N17, N16}) );
  CLK_DIV_DIV_RATIO8_0_DW01_inc_1 add_48 ( .A(half_toggle), .SUM(
        half_toggle_plus) );
endmodule


module PRESCALE_MUX_MEM_WIDTH8 ( PRESCALE, DIV_RATIO_MUX );
  input [5:0] PRESCALE;
  output [7:0] DIV_RATIO_MUX;
  wire   n2, n3, n4, n12;

  NOR4BX1M U11 ( .AN(PRESCALE[4]), .B(n4), .C(PRESCALE[2]), .D(PRESCALE[3]), 
        .Y(DIV_RATIO_MUX[1]) );
  NOR4BX1M U12 ( .AN(PRESCALE[3]), .B(n4), .C(PRESCALE[2]), .D(PRESCALE[4]), 
        .Y(DIV_RATIO_MUX[2]) );
  NOR4X1M U13 ( .A(n2), .B(PRESCALE[3]), .C(PRESCALE[5]), .D(PRESCALE[4]), .Y(
        DIV_RATIO_MUX[3]) );
  OR3X2M U14 ( .A(PRESCALE[0]), .B(PRESCALE[1]), .C(n12), .Y(n2) );
  OR3X2M U15 ( .A(PRESCALE[1]), .B(PRESCALE[5]), .C(PRESCALE[0]), .Y(n4) );
  INVX2M U16 ( .A(PRESCALE[2]), .Y(n12) );
  NOR3X2M U17 ( .A(n3), .B(DIV_RATIO_MUX[2]), .C(DIV_RATIO_MUX[1]), .Y(
        DIV_RATIO_MUX[0]) );
  NOR4X1M U18 ( .A(PRESCALE[4]), .B(PRESCALE[3]), .C(n12), .D(n4), .Y(n3) );
  INVX2M U3 ( .A(1'b1), .Y(DIV_RATIO_MUX[4]) );
  INVX2M U5 ( .A(1'b1), .Y(DIV_RATIO_MUX[5]) );
  INVX2M U7 ( .A(1'b1), .Y(DIV_RATIO_MUX[6]) );
  INVX2M U9 ( .A(1'b1), .Y(DIV_RATIO_MUX[7]) );
endmodule


module CLK_DIV_DIV_RATIO8_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_DIV_RATIO8_1_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_DIV_RATIO8_test_0 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk, test_si, test_so, test_se );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en, test_si, test_se;
  output O_div_clk, test_so;
  wire   N3, DIV_CLK_reg, ODD_EDGE_FLAG, N16, N17, N18, N19, N20, N21, N22, n2,
         n3, n4, n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [6:0] counter;
  wire   [6:0] half_toggle;
  wire   [6:0] half_toggle_plus;
  assign test_so = counter[6];

  SDFFRQX2M DIV_CLK_reg_reg ( .D(n61), .SI(test_si), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(DIV_CLK_reg) );
  SDFFRQX2M \counter_reg[6]  ( .D(n59), .SI(counter[5]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n53), .SI(ODD_EDGE_FLAG), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n58), .SI(counter[4]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n57), .SI(counter[3]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n56), .SI(counter[2]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n55), .SI(counter[1]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n54), .SI(counter[0]), .SE(test_se), .CK(
        I_ref_clk), .RN(I_rst_n), .Q(counter[1]) );
  SDFFSQX1M ODD_EDGE_FLAG_reg ( .D(n60), .SI(DIV_CLK_reg), .SE(test_se), .CK(
        I_ref_clk), .SN(I_rst_n), .Q(ODD_EDGE_FLAG) );
  OR2X2M U6 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n2) );
  OAI2BB1X2M U11 ( .A0N(n51), .A1N(n52), .B0(I_clk_en), .Y(N3) );
  INVX2M U15 ( .A(I_div_ratio[5]), .Y(n16) );
  MX2X2M U16 ( .A(DIV_CLK_reg), .B(I_ref_clk), .S0(N3), .Y(O_div_clk) );
  CLKINVX1M U17 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U18 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n2), .Y(
        half_toggle[1]) );
  OR2X1M U19 ( .A(n2), .B(I_div_ratio[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(I_div_ratio[3]), .B0(n3), .Y(half_toggle[2])
         );
  NOR2X1M U21 ( .A(n3), .B(I_div_ratio[4]), .Y(n4) );
  AO21XLM U22 ( .A0(n3), .A1(I_div_ratio[4]), .B0(n4), .Y(half_toggle[3]) );
  CLKNAND2X2M U23 ( .A(n4), .B(n16), .Y(n5) );
  OAI21X1M U24 ( .A0(n4), .A1(n16), .B0(n5), .Y(half_toggle[4]) );
  XNOR2X1M U25 ( .A(I_div_ratio[6]), .B(n5), .Y(half_toggle[5]) );
  NOR2X1M U26 ( .A(I_div_ratio[6]), .B(n5), .Y(n15) );
  CLKXOR2X2M U27 ( .A(I_div_ratio[7]), .B(n15), .Y(half_toggle[6]) );
  AO22X1M U28 ( .A0(N3), .A1(counter[0]), .B0(N16), .B1(n17), .Y(n53) );
  AO22X1M U29 ( .A0(N3), .A1(counter[1]), .B0(N17), .B1(n17), .Y(n54) );
  AO22X1M U30 ( .A0(N3), .A1(counter[2]), .B0(N18), .B1(n17), .Y(n55) );
  AO22X1M U31 ( .A0(N3), .A1(counter[3]), .B0(N19), .B1(n17), .Y(n56) );
  AO22X1M U32 ( .A0(N3), .A1(counter[4]), .B0(N20), .B1(n17), .Y(n57) );
  AO22X1M U33 ( .A0(N3), .A1(counter[5]), .B0(N21), .B1(n17), .Y(n58) );
  AO22X1M U34 ( .A0(N3), .A1(counter[6]), .B0(N22), .B1(n17), .Y(n59) );
  AND3X1M U35 ( .A(n18), .B(n19), .C(n20), .Y(n17) );
  XNOR2X1M U36 ( .A(ODD_EDGE_FLAG), .B(n21), .Y(n60) );
  NAND2BX1M U37 ( .AN(n19), .B(n18), .Y(n21) );
  CLKINVX1M U38 ( .A(N3), .Y(n18) );
  CLKXOR2X2M U39 ( .A(DIV_CLK_reg), .B(n22), .Y(n61) );
  AOI21X1M U40 ( .A0(n19), .A1(n20), .B0(N3), .Y(n22) );
  OR2X1M U41 ( .A(n23), .B(I_div_ratio[0]), .Y(n20) );
  CLKNAND2X2M U42 ( .A(n33), .B(I_div_ratio[0]), .Y(n19) );
  MXI2X1M U43 ( .A(n34), .B(n23), .S0(ODD_EDGE_FLAG), .Y(n33) );
  NAND4X1M U44 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n23) );
  NOR4X1M U45 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U46 ( .A(half_toggle[2]), .B(counter[2]), .Y(n42) );
  CLKXOR2X2M U47 ( .A(half_toggle[1]), .B(counter[1]), .Y(n41) );
  CLKXOR2X2M U48 ( .A(half_toggle[0]), .B(counter[0]), .Y(n40) );
  CLKXOR2X2M U49 ( .A(half_toggle[6]), .B(counter[6]), .Y(n39) );
  XNOR2X1M U50 ( .A(counter[4]), .B(half_toggle[4]), .Y(n37) );
  XNOR2X1M U51 ( .A(counter[5]), .B(half_toggle[5]), .Y(n36) );
  XNOR2X1M U52 ( .A(counter[3]), .B(half_toggle[3]), .Y(n35) );
  NAND4X1M U53 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n34) );
  NOR4X1M U54 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  CLKXOR2X2M U55 ( .A(half_toggle_plus[2]), .B(counter[2]), .Y(n50) );
  CLKXOR2X2M U56 ( .A(half_toggle_plus[1]), .B(counter[1]), .Y(n49) );
  CLKXOR2X2M U57 ( .A(half_toggle_plus[0]), .B(counter[0]), .Y(n48) );
  CLKXOR2X2M U58 ( .A(half_toggle_plus[6]), .B(counter[6]), .Y(n47) );
  XNOR2X1M U59 ( .A(counter[4]), .B(half_toggle_plus[4]), .Y(n45) );
  XNOR2X1M U60 ( .A(counter[5]), .B(half_toggle_plus[5]), .Y(n44) );
  XNOR2X1M U61 ( .A(counter[3]), .B(half_toggle_plus[3]), .Y(n43) );
  NOR4X1M U62 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n52) );
  NOR3X1M U63 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), 
        .Y(n51) );
  CLK_DIV_DIV_RATIO8_1_DW01_inc_0 add_37 ( .A(counter), .SUM({N22, N21, N20, 
        N19, N18, N17, N16}) );
  CLK_DIV_DIV_RATIO8_1_DW01_inc_1 add_48 ( .A(half_toggle), .SUM(
        half_toggle_plus) );
endmodule


module serializer_UART_DATA_WIDTH8_test_1 ( CLK, RST, P_DATA, DATA_VALID, Busy, 
        SER_EN, SER_DONE, SER_DATA, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, Busy, SER_EN, test_si, test_se;
  output SER_DONE, SER_DATA, test_so;
  wire   N23, N24, N25, N27, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n12, n13, n14, n35,
         n38, n39;
  wire   [7:1] P_DATA_REG;
  wire   [2:0] SER_COUNTER;
  assign SER_DONE = N27;
  assign test_so = n35;

  SDFFRQX2M \P_DATA_REG_reg[6]  ( .D(n29), .SI(P_DATA_REG[5]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[6]) );
  SDFFRQX2M \P_DATA_REG_reg[5]  ( .D(n30), .SI(P_DATA_REG[4]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[5]) );
  SDFFRQX2M \P_DATA_REG_reg[4]  ( .D(n31), .SI(P_DATA_REG[3]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[4]) );
  SDFFRQX2M \P_DATA_REG_reg[3]  ( .D(n32), .SI(P_DATA_REG[2]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[3]) );
  SDFFRQX2M \P_DATA_REG_reg[2]  ( .D(n33), .SI(P_DATA_REG[1]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[2]) );
  SDFFRQX2M \P_DATA_REG_reg[1]  ( .D(n34), .SI(SER_DATA), .SE(n39), .CK(CLK), 
        .RN(RST), .Q(P_DATA_REG[1]) );
  SDFFRQX2M \P_DATA_REG_reg[7]  ( .D(n28), .SI(P_DATA_REG[6]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(P_DATA_REG[7]) );
  SDFFRQX2M \P_DATA_REG_reg[0]  ( .D(n27), .SI(test_si), .SE(n39), .CK(CLK), 
        .RN(RST), .Q(SER_DATA) );
  SDFFRQX2M \SER_COUNTER_reg[1]  ( .D(N24), .SI(SER_COUNTER[0]), .SE(n39), 
        .CK(CLK), .RN(RST), .Q(SER_COUNTER[1]) );
  SDFFRQX2M \SER_COUNTER_reg[2]  ( .D(N25), .SI(n14), .SE(n39), .CK(CLK), .RN(
        RST), .Q(SER_COUNTER[2]) );
  SDFFRQX2M \SER_COUNTER_reg[0]  ( .D(N23), .SI(P_DATA_REG[7]), .SE(n39), .CK(
        CLK), .RN(RST), .Q(SER_COUNTER[0]) );
  NOR2X2M U14 ( .A(n13), .B(n12), .Y(n17) );
  NOR2X2M U15 ( .A(n12), .B(n17), .Y(n15) );
  INVX2M U16 ( .A(SER_EN), .Y(n13) );
  AND3X2M U17 ( .A(SER_COUNTER[0]), .B(SER_COUNTER[2]), .C(SER_COUNTER[1]), 
        .Y(N27) );
  OAI2BB2X1M U18 ( .B0(n25), .B1(n13), .A0N(SER_COUNTER[2]), .A1N(N23), .Y(N25) );
  AOI32X1M U19 ( .A0(SER_COUNTER[0]), .A1(n35), .A2(SER_COUNTER[1]), .B0(
        SER_COUNTER[2]), .B1(n14), .Y(n25) );
  INVX2M U20 ( .A(SER_COUNTER[2]), .Y(n35) );
  NOR2X2M U21 ( .A(n13), .B(SER_COUNTER[0]), .Y(N23) );
  BUFX2M U22 ( .A(n18), .Y(n12) );
  NOR2BX2M U23 ( .AN(DATA_VALID), .B(Busy), .Y(n18) );
  NOR2X2M U24 ( .A(n26), .B(n13), .Y(N24) );
  CLKXOR2X2M U25 ( .A(SER_COUNTER[0]), .B(n14), .Y(n26) );
  OAI2BB1X2M U26 ( .A0N(SER_DATA), .A1N(n15), .B0(n16), .Y(n27) );
  AOI22X1M U27 ( .A0(P_DATA_REG[1]), .A1(n17), .B0(P_DATA[0]), .B1(n12), .Y(
        n16) );
  OAI2BB1X2M U28 ( .A0N(P_DATA_REG[1]), .A1N(n15), .B0(n24), .Y(n34) );
  AOI22X1M U29 ( .A0(P_DATA_REG[2]), .A1(n17), .B0(P_DATA[1]), .B1(n12), .Y(
        n24) );
  OAI2BB1X2M U30 ( .A0N(n15), .A1N(P_DATA_REG[2]), .B0(n23), .Y(n33) );
  AOI22X1M U31 ( .A0(P_DATA_REG[3]), .A1(n17), .B0(P_DATA[2]), .B1(n12), .Y(
        n23) );
  OAI2BB1X2M U32 ( .A0N(n15), .A1N(P_DATA_REG[3]), .B0(n22), .Y(n32) );
  AOI22X1M U33 ( .A0(P_DATA_REG[4]), .A1(n17), .B0(P_DATA[3]), .B1(n12), .Y(
        n22) );
  OAI2BB1X2M U34 ( .A0N(n15), .A1N(P_DATA_REG[4]), .B0(n21), .Y(n31) );
  AOI22X1M U35 ( .A0(P_DATA_REG[5]), .A1(n17), .B0(P_DATA[4]), .B1(n12), .Y(
        n21) );
  OAI2BB1X2M U36 ( .A0N(n15), .A1N(P_DATA_REG[5]), .B0(n20), .Y(n30) );
  AOI22X1M U37 ( .A0(P_DATA_REG[6]), .A1(n17), .B0(P_DATA[5]), .B1(n12), .Y(
        n20) );
  OAI2BB1X2M U38 ( .A0N(n15), .A1N(P_DATA_REG[6]), .B0(n19), .Y(n29) );
  AOI22X1M U39 ( .A0(P_DATA_REG[7]), .A1(n17), .B0(P_DATA[6]), .B1(n12), .Y(
        n19) );
  AO22X1M U40 ( .A0(n15), .A1(P_DATA_REG[7]), .B0(P_DATA[7]), .B1(n12), .Y(n28) );
  INVX2M U41 ( .A(SER_COUNTER[1]), .Y(n14) );
  INVXLM U42 ( .A(test_se), .Y(n38) );
  INVXLM U43 ( .A(n38), .Y(n39) );
endmodule


module MUX_test_1 ( CLK, RST, mux_sel, IN0, IN1, IN2, IN3, MUX_OUT, test_si, 
        test_se );
  input [1:0] mux_sel;
  input CLK, RST, IN0, IN1, IN2, IN3, test_si, test_se;
  output MUX_OUT;
  wire   mux_comb, n3, n4, n2;

  SDFFRQX2M MUX_OUT_reg ( .D(mux_comb), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(MUX_OUT) );
  INVX2M U4 ( .A(mux_sel[0]), .Y(n2) );
  OAI2B2X1M U5 ( .A1N(mux_sel[1]), .A0(n3), .B0(mux_sel[1]), .B1(n4), .Y(
        mux_comb) );
  AOI22X1M U6 ( .A0(IN0), .A1(n2), .B0(mux_sel[0]), .B1(IN1), .Y(n4) );
  AOI22X1M U7 ( .A0(IN2), .A1(n2), .B0(IN3), .B1(mux_sel[0]), .Y(n3) );
endmodule


module FSM_TX_UART_DATA_WIDTH8_test_1 ( CLK, RST, DATA_VALID, PAR_EN, SER_DONE, 
        SER_EN, Busy, mux_sel, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input CLK, RST, DATA_VALID, PAR_EN, SER_DONE, test_si, test_se;
  output SER_EN, Busy, test_so;
  wire   Busy_REG, n11, n12, n13, n14, n15, n5, n6, n7, n8, n9, n10;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M Busy_reg ( .D(Busy_REG), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Busy) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n5), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(Busy), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  OAI31X1M U7 ( .A0(n10), .A1(n9), .A2(n7), .B0(n14), .Y(next_state[0]) );
  NAND3X2M U8 ( .A(n15), .B(n8), .C(DATA_VALID), .Y(n14) );
  INVX2M U9 ( .A(n15), .Y(n6) );
  INVX2M U10 ( .A(SER_EN), .Y(n7) );
  INVX2M U11 ( .A(SER_DONE), .Y(n9) );
  OAI32X1M U12 ( .A0(n5), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n13), .B1(n7), .Y(next_state[1]) );
  NOR2X2M U13 ( .A(PAR_EN), .B(n9), .Y(n13) );
  OAI21X2M U14 ( .A0(n12), .A1(n5), .B0(n6), .Y(mux_sel[1]) );
  OAI21X2M U15 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n6), .Y(
        mux_sel[0]) );
  OAI221X1M U16 ( .A0(n6), .A1(n8), .B0(current_state[2]), .B1(n5), .C0(n12), 
        .Y(Busy_REG) );
  NOR2X2M U17 ( .A(current_state[0]), .B(current_state[1]), .Y(n15) );
  NOR2X2M U18 ( .A(n12), .B(current_state[0]), .Y(SER_EN) );
  NAND2X2M U19 ( .A(current_state[1]), .B(n8), .Y(n12) );
  INVX2M U20 ( .A(current_state[2]), .Y(n8) );
  INVX2M U21 ( .A(current_state[0]), .Y(n5) );
  NOR2X2M U22 ( .A(n11), .B(n12), .Y(next_state[2]) );
  AOI21X2M U23 ( .A0(SER_DONE), .A1(n10), .B0(current_state[0]), .Y(n11) );
  INVX2M U24 ( .A(PAR_EN), .Y(n10) );
endmodule


module parity_calc_UART_DATA_WIDTH8_test_1 ( P_DATA, Busy, DATA_VALID, 
        PAR_TYPE, PAR_EN, CLK, RST, par_bit, test_si, test_se );
  input [7:0] P_DATA;
  input Busy, DATA_VALID, PAR_TYPE, PAR_EN, CLK, RST, test_si, test_se;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25,
         n2;
  wire   [7:0] P_DATA_REG;

  SDFFRQX2M \P_DATA_REG_reg[5]  ( .D(n21), .SI(P_DATA_REG[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[5]) );
  SDFFRQX2M \P_DATA_REG_reg[1]  ( .D(n13), .SI(P_DATA_REG[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[1]) );
  SDFFRQX2M \P_DATA_REG_reg[4]  ( .D(n19), .SI(P_DATA_REG[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[4]) );
  SDFFRQX2M \P_DATA_REG_reg[0]  ( .D(n11), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA_REG[0]) );
  SDFFRQX2M \P_DATA_REG_reg[2]  ( .D(n15), .SI(P_DATA_REG[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[2]) );
  SDFFRQX2M par_bit_reg ( .D(n9), .SI(P_DATA_REG[7]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(par_bit) );
  SDFFRQX2M \P_DATA_REG_reg[3]  ( .D(n17), .SI(P_DATA_REG[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[3]) );
  SDFFRQX2M \P_DATA_REG_reg[6]  ( .D(n23), .SI(P_DATA_REG[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[6]) );
  SDFFRQX2M \P_DATA_REG_reg[7]  ( .D(n25), .SI(P_DATA_REG[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_REG[7]) );
  NOR2BX2M U2 ( .AN(DATA_VALID), .B(Busy), .Y(n7) );
  XNOR2X2M U3 ( .A(P_DATA_REG[2]), .B(P_DATA_REG[3]), .Y(n5) );
  XOR3XLM U4 ( .A(P_DATA_REG[5]), .B(P_DATA_REG[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U5 ( .A(P_DATA_REG[7]), .B(P_DATA_REG[6]), .Y(n6) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n9) );
  INVX2M U7 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U8 ( .A(n3), .B(PAR_TYPE), .C(n4), .Y(n1) );
  XOR3XLM U9 ( .A(P_DATA_REG[1]), .B(P_DATA_REG[0]), .C(n5), .Y(n4) );
  AO2B2X2M U10 ( .B0(P_DATA[0]), .B1(n7), .A0(P_DATA_REG[0]), .A1N(n7), .Y(n11) );
  AO2B2X2M U11 ( .B0(P_DATA[1]), .B1(n7), .A0(P_DATA_REG[1]), .A1N(n7), .Y(n13) );
  AO2B2X2M U12 ( .B0(P_DATA[2]), .B1(n7), .A0(P_DATA_REG[2]), .A1N(n7), .Y(n15) );
  AO2B2X2M U13 ( .B0(P_DATA[3]), .B1(n7), .A0(P_DATA_REG[3]), .A1N(n7), .Y(n17) );
  AO2B2X2M U14 ( .B0(P_DATA[4]), .B1(n7), .A0(P_DATA_REG[4]), .A1N(n7), .Y(n19) );
  AO2B2X2M U15 ( .B0(P_DATA[5]), .B1(n7), .A0(P_DATA_REG[5]), .A1N(n7), .Y(n21) );
  AO2B2X2M U16 ( .B0(P_DATA[6]), .B1(n7), .A0(P_DATA_REG[6]), .A1N(n7), .Y(n23) );
  AO2B2X2M U17 ( .B0(P_DATA[7]), .B1(n7), .A0(P_DATA_REG[7]), .A1N(n7), .Y(n25) );
endmodule


module UART_TX_UART_DATA_WIDTH8_test_1 ( CLK, RST, PAR_TYP, PAR_EN, DATA_VALID, 
        P_DATA, TX_OUT, Busy, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, DATA_VALID, test_si, test_se;
  output TX_OUT, Busy;
  wire   ser_en, ser_done, ser_data, par_bit, n1, n2, n3, n4;
  wire   [1:0] mux_sel;

  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  serializer_UART_DATA_WIDTH8_test_1 serializer_unit ( .CLK(CLK), .RST(n1), 
        .P_DATA(P_DATA), .DATA_VALID(DATA_VALID), .Busy(Busy), .SER_EN(ser_en), 
        .SER_DONE(ser_done), .SER_DATA(ser_data), .test_si(par_bit), .test_so(
        n3), .test_se(test_se) );
  MUX_test_1 MUX_unit ( .CLK(CLK), .RST(n1), .mux_sel(mux_sel), .IN0(1'b0), 
        .IN1(ser_data), .IN2(par_bit), .IN3(1'b1), .MUX_OUT(TX_OUT), .test_si(
        n3), .test_se(test_se) );
  FSM_TX_UART_DATA_WIDTH8_test_1 FSM_TX_unit ( .CLK(CLK), .RST(n1), 
        .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .SER_DONE(ser_done), 
        .SER_EN(ser_en), .Busy(Busy), .mux_sel(mux_sel), .test_si(test_si), 
        .test_so(n4), .test_se(test_se) );
  parity_calc_UART_DATA_WIDTH8_test_1 parity_calc_unit ( .P_DATA(P_DATA), 
        .Busy(Busy), .DATA_VALID(DATA_VALID), .PAR_TYPE(PAR_TYP), .PAR_EN(
        PAR_EN), .CLK(CLK), .RST(n1), .par_bit(par_bit), .test_si(n4), 
        .test_se(test_se) );
endmodule


module data_sampling_UART_DATA_WIDTH8_test_1 ( CLK, RST, prescale, edge_cnt, 
        RX_IN, data_samp_en, sampled_bit, test_si, test_so, test_se );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, data_samp_en, test_si, test_se;
  output sampled_bit, test_so;
  wire   n20, n24, n25, n26, \add_65/carry[4] , \add_65/carry[3] ,
         \add_65/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  wire   [2:0] samples;
  wire   [4:0] NEG_EDGE_MINUS;
  wire   [4:0] NEG_EDGE;
  wire   [4:0] NEG_EDGE_PLUS;
  assign test_so = samples[2];

  SDFFRQX2M \samples_reg[2]  ( .D(n26), .SI(samples[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[2]) );
  SDFFRQX2M \samples_reg[0]  ( .D(n24), .SI(sampled_bit), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(samples[0]) );
  SDFFRQX2M \samples_reg[1]  ( .D(n25), .SI(samples[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[1]) );
  SDFFRQX2M sampled_bit_reg ( .D(n20), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_bit) );
  INVX2M U3 ( .A(NEG_EDGE[2]), .Y(n8) );
  ADDHX1M U4 ( .A(NEG_EDGE[2]), .B(\add_65/carry[2] ), .CO(\add_65/carry[3] ), 
        .S(NEG_EDGE_PLUS[2]) );
  ADDHX1M U5 ( .A(NEG_EDGE[1]), .B(NEG_EDGE[0]), .CO(\add_65/carry[2] ), .S(
        NEG_EDGE_PLUS[1]) );
  ADDHX1M U6 ( .A(NEG_EDGE[3]), .B(\add_65/carry[3] ), .CO(\add_65/carry[4] ), 
        .S(NEG_EDGE_PLUS[3]) );
  INVX2M U7 ( .A(prescale[3]), .Y(n4) );
  CLKINVX1M U8 ( .A(prescale[1]), .Y(NEG_EDGE[0]) );
  NOR2X1M U9 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  AO21XLM U10 ( .A0(prescale[1]), .A1(prescale[2]), .B0(n1), .Y(NEG_EDGE[1])
         );
  CLKNAND2X2M U11 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U12 ( .A0(n1), .A1(n4), .B0(n2), .Y(NEG_EDGE[2]) );
  XNOR2X1M U13 ( .A(prescale[4]), .B(n2), .Y(NEG_EDGE[3]) );
  NOR2X1M U14 ( .A(prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U15 ( .A(prescale[5]), .B(n3), .Y(NEG_EDGE[4]) );
  NOR2X1M U16 ( .A(NEG_EDGE[1]), .B(NEG_EDGE[0]), .Y(n5) );
  AO21XLM U17 ( .A0(NEG_EDGE[0]), .A1(NEG_EDGE[1]), .B0(n5), .Y(
        NEG_EDGE_MINUS[1]) );
  CLKNAND2X2M U18 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U19 ( .A0(n5), .A1(n8), .B0(n6), .Y(NEG_EDGE_MINUS[2]) );
  XNOR2X1M U20 ( .A(NEG_EDGE[3]), .B(n6), .Y(NEG_EDGE_MINUS[3]) );
  NOR2X1M U21 ( .A(NEG_EDGE[3]), .B(n6), .Y(n7) );
  CLKXOR2X2M U26 ( .A(NEG_EDGE[4]), .B(n7), .Y(NEG_EDGE_MINUS[4]) );
  CLKXOR2X2M U27 ( .A(\add_65/carry[4] ), .B(NEG_EDGE[4]), .Y(NEG_EDGE_PLUS[4]) );
  MXI2X1M U28 ( .A(n9), .B(n10), .S0(n11), .Y(n26) );
  NOR4X1M U29 ( .A(n12), .B(n13), .C(edge_cnt[5]), .D(n14), .Y(n11) );
  OAI31X1M U30 ( .A0(n15), .A1(n16), .A2(n17), .B0(n18), .Y(n13) );
  XNOR2X1M U31 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n18) );
  OR2X1M U32 ( .A(n27), .B(n28), .Y(n15) );
  NAND4X1M U33 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n12) );
  XNOR2X1M U34 ( .A(edge_cnt[1]), .B(NEG_EDGE_PLUS[1]), .Y(n32) );
  XNOR2X1M U35 ( .A(edge_cnt[2]), .B(NEG_EDGE_PLUS[2]), .Y(n31) );
  XNOR2X1M U36 ( .A(edge_cnt[3]), .B(NEG_EDGE_PLUS[3]), .Y(n30) );
  XNOR2X1M U37 ( .A(edge_cnt[4]), .B(NEG_EDGE_PLUS[4]), .Y(n29) );
  CLKNAND2X2M U38 ( .A(samples[2]), .B(data_samp_en), .Y(n9) );
  MXI2X1M U39 ( .A(n33), .B(n10), .S0(n34), .Y(n25) );
  NOR4X1M U40 ( .A(n35), .B(n27), .C(n14), .D(n28), .Y(n34) );
  CLKXOR2X2M U41 ( .A(edge_cnt[4]), .B(NEG_EDGE[4]), .Y(n28) );
  CLKXOR2X2M U42 ( .A(edge_cnt[3]), .B(NEG_EDGE[3]), .Y(n27) );
  OR2X1M U43 ( .A(n17), .B(n16), .Y(n35) );
  NAND3BX1M U44 ( .AN(edge_cnt[5]), .B(n36), .C(n37), .Y(n16) );
  XNOR2X1M U45 ( .A(edge_cnt[0]), .B(NEG_EDGE[0]), .Y(n37) );
  XNOR2X1M U46 ( .A(edge_cnt[1]), .B(NEG_EDGE[1]), .Y(n36) );
  CLKXOR2X2M U47 ( .A(edge_cnt[2]), .B(NEG_EDGE[2]), .Y(n17) );
  CLKNAND2X2M U48 ( .A(samples[1]), .B(data_samp_en), .Y(n33) );
  MXI2X1M U49 ( .A(n38), .B(n10), .S0(n14), .Y(n24) );
  AND4X1M U50 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n14) );
  NOR3X1M U51 ( .A(n43), .B(edge_cnt[5]), .C(n44), .Y(n42) );
  CLKXOR2X2M U52 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n44) );
  CLKXOR2X2M U53 ( .A(edge_cnt[4]), .B(NEG_EDGE_MINUS[4]), .Y(n43) );
  XNOR2X1M U54 ( .A(edge_cnt[2]), .B(NEG_EDGE_MINUS[2]), .Y(n41) );
  XNOR2X1M U55 ( .A(edge_cnt[3]), .B(NEG_EDGE_MINUS[3]), .Y(n40) );
  XNOR2X1M U56 ( .A(edge_cnt[1]), .B(NEG_EDGE_MINUS[1]), .Y(n39) );
  CLKNAND2X2M U57 ( .A(data_samp_en), .B(RX_IN), .Y(n10) );
  CLKNAND2X2M U58 ( .A(samples[0]), .B(data_samp_en), .Y(n38) );
  CLKMX2X2M U59 ( .A(sampled_bit), .B(n45), .S0(data_samp_en), .Y(n20) );
  OAI2BB1X1M U60 ( .A0N(samples[1]), .A1N(samples[0]), .B0(n46), .Y(n45) );
  OAI21X1M U61 ( .A0(samples[0]), .A1(samples[1]), .B0(samples[2]), .Y(n46) );
endmodule


module deserializer_UART_DATA_WIDTH8_test_1 ( CLK, RST, deser_en, prescale, 
        edge_cnt, sampled_bit, P_DATA, test_si, test_so, test_se );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sampled_bit, test_si, test_se;
  output test_so;
  wire   last_edge, N5, N6, N7, N8, N9, N10, N11, n13, n14, n15, n16, n17, n18,
         n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n2, n3, n4, n20,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  assign test_so = n13;

  SDFFRX1M \P_DATA_reg[5]  ( .D(n27), .SI(n16), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[5]), .QN(n15) );
  SDFFRX1M \P_DATA_reg[4]  ( .D(n26), .SI(n17), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[4]), .QN(n16) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n22), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[0]) );
  SDFFRX1M \P_DATA_reg[3]  ( .D(n25), .SI(n18), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[3]), .QN(n17) );
  SDFFRX1M \P_DATA_reg[6]  ( .D(n28), .SI(n15), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[6]), .QN(n14) );
  SDFFRX1M \P_DATA_reg[2]  ( .D(n24), .SI(n19), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[2]), .QN(n18) );
  SDFFRX1M \P_DATA_reg[1]  ( .D(n23), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]), .QN(n19) );
  SDFFRX1M \P_DATA_reg[7]  ( .D(n29), .SI(n14), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[7]), .QN(n13) );
  INVX2M U6 ( .A(n21), .Y(n39) );
  NAND2X2M U13 ( .A(last_edge), .B(deser_en), .Y(n21) );
  OAI22X1M U14 ( .A0(n21), .A1(n18), .B0(n39), .B1(n19), .Y(n23) );
  OAI22X1M U15 ( .A0(n21), .A1(n17), .B0(n39), .B1(n18), .Y(n24) );
  OAI22X1M U16 ( .A0(n21), .A1(n16), .B0(n39), .B1(n17), .Y(n25) );
  OAI22X1M U17 ( .A0(n21), .A1(n15), .B0(n39), .B1(n16), .Y(n26) );
  OAI22X1M U18 ( .A0(n21), .A1(n14), .B0(n39), .B1(n15), .Y(n27) );
  OAI22X1M U19 ( .A0(n21), .A1(n13), .B0(n39), .B1(n14), .Y(n28) );
  OAI2BB2X1M U20 ( .B0(n21), .B1(n19), .A0N(P_DATA[0]), .A1N(n21), .Y(n22) );
  OAI2BB2X1M U21 ( .B0(n39), .B1(n13), .A0N(sampled_bit), .A1N(n39), .Y(n29)
         );
  OR2X2M U22 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  CLKINVX1M U23 ( .A(prescale[0]), .Y(N5) );
  OAI2BB1X1M U24 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N6) );
  OR2X1M U25 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U26 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N7) );
  OR2X1M U27 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U28 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N8) );
  OR2X1M U29 ( .A(n4), .B(prescale[4]), .Y(n20) );
  OAI2BB1X1M U30 ( .A0N(n4), .A1N(prescale[4]), .B0(n20), .Y(N9) );
  NOR2X1M U31 ( .A(n20), .B(prescale[5]), .Y(N11) );
  AO21XLM U32 ( .A0(n20), .A1(prescale[5]), .B0(N11), .Y(N10) );
  NOR2BX1M U33 ( .AN(N5), .B(edge_cnt[0]), .Y(n30) );
  OAI2B2X1M U34 ( .A1N(edge_cnt[1]), .A0(n30), .B0(N6), .B1(n30), .Y(n34) );
  XNOR2X1M U35 ( .A(N10), .B(edge_cnt[5]), .Y(n33) );
  NOR2BX1M U36 ( .AN(edge_cnt[0]), .B(N5), .Y(n31) );
  OAI2B2X1M U37 ( .A1N(N6), .A0(n31), .B0(edge_cnt[1]), .B1(n31), .Y(n32) );
  NAND4BX1M U38 ( .AN(N11), .B(n34), .C(n33), .D(n32), .Y(n38) );
  CLKXOR2X2M U39 ( .A(N9), .B(edge_cnt[4]), .Y(n37) );
  CLKXOR2X2M U40 ( .A(N7), .B(edge_cnt[2]), .Y(n36) );
  CLKXOR2X2M U41 ( .A(N8), .B(edge_cnt[3]), .Y(n35) );
  NOR4X1M U42 ( .A(n38), .B(n37), .C(n36), .D(n35), .Y(last_edge) );
endmodule


module edge_bit_counter_UART_DATA_WIDTH8_test_1 ( CLK, RST, prescale, enable, 
        edge_cnt, bit_cnt, test_si, test_se );
  input [5:0] prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable, test_si, test_se;
  wire   last_edge, N9, N10, N11, N12, N14, N15, N16, N17, N18, N19, N36, N37,
         N38, N39, N40, N41, N42, n18, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, \add_22/carry[5] , \add_22/carry[4] ,
         \add_22/carry[3] , \add_22/carry[2] , n1, n2, n3, n4, n15, n16, n17,
         n19, n20, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n44, n45;

  SDFFRQX2M \bit_cnt_reg[3]  ( .D(n28), .SI(n18), .SE(n45), .CK(CLK), .RN(RST), 
        .Q(bit_cnt[3]) );
  SDFFRQX2M \bit_cnt_reg[0]  ( .D(n31), .SI(test_si), .SE(n45), .CK(CLK), .RN(
        RST), .Q(bit_cnt[0]) );
  SDFFRX1M \bit_cnt_reg[2]  ( .D(n29), .SI(n40), .SE(n45), .CK(CLK), .RN(RST), 
        .Q(bit_cnt[2]), .QN(n18) );
  SDFFRQX2M \edge_cnt_reg[5]  ( .D(N19), .SI(edge_cnt[4]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[5]) );
  SDFFRQX2M \bit_cnt_reg[1]  ( .D(n30), .SI(n39), .SE(n45), .CK(CLK), .RN(RST), 
        .Q(bit_cnt[1]) );
  SDFFRQX2M \edge_cnt_reg[4]  ( .D(N18), .SI(edge_cnt[3]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[4]) );
  SDFFRQX2M \edge_cnt_reg[0]  ( .D(N14), .SI(n41), .SE(n45), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[3]  ( .D(N17), .SI(edge_cnt[2]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[2]  ( .D(N16), .SI(edge_cnt[1]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[2]) );
  SDFFRQX2M \edge_cnt_reg[1]  ( .D(N15), .SI(edge_cnt[0]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[1]) );
  NAND2BX2M U6 ( .AN(last_edge), .B(enable), .Y(n22) );
  NAND2X2M U7 ( .A(enable), .B(last_edge), .Y(n25) );
  NOR2BX2M U15 ( .AN(N9), .B(n22), .Y(N15) );
  NOR2BX2M U16 ( .AN(N10), .B(n22), .Y(N16) );
  NOR2BX2M U17 ( .AN(N11), .B(n22), .Y(N17) );
  NOR2BX2M U18 ( .AN(N12), .B(n22), .Y(N18) );
  OAI32X1M U19 ( .A0(n25), .A1(bit_cnt[1]), .A2(n39), .B0(n37), .B1(n40), .Y(
        n30) );
  INVX2M U20 ( .A(n27), .Y(n37) );
  OAI32X1M U21 ( .A0(n24), .A1(n40), .A2(n25), .B0(n26), .B1(n18), .Y(n29) );
  NAND2X2M U22 ( .A(bit_cnt[0]), .B(n18), .Y(n24) );
  AOI2BB1X2M U23 ( .A0N(n25), .A1N(bit_cnt[1]), .B0(n27), .Y(n26) );
  OAI21X2M U24 ( .A0(bit_cnt[0]), .A1(n25), .B0(n22), .Y(n27) );
  OR2X2M U25 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  OAI2B2X1M U26 ( .A1N(enable), .A0(n21), .B0(n41), .B1(n22), .Y(n28) );
  AOI32XLM U27 ( .A0(n23), .A1(n41), .A2(last_edge), .B0(bit_cnt[3]), .B1(n38), 
        .Y(n21) );
  INVX2M U28 ( .A(bit_cnt[3]), .Y(n41) );
  INVX2M U29 ( .A(n23), .Y(n38) );
  OAI22X1M U30 ( .A0(n39), .A1(n22), .B0(bit_cnt[0]), .B1(n25), .Y(n31) );
  NOR2X2M U31 ( .A(n1), .B(n22), .Y(N19) );
  XNOR2X2M U32 ( .A(\add_22/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U33 ( .A(edge_cnt[0]), .B(n22), .Y(N14) );
  NOR3X2M U34 ( .A(n40), .B(n39), .C(n18), .Y(n23) );
  INVX2M U35 ( .A(bit_cnt[0]), .Y(n39) );
  INVX2M U36 ( .A(bit_cnt[1]), .Y(n40) );
  ADDHX1M U37 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_22/carry[2] ), .S(
        N9) );
  ADDHX1M U38 ( .A(edge_cnt[2]), .B(\add_22/carry[2] ), .CO(\add_22/carry[3] ), 
        .S(N10) );
  ADDHX1M U39 ( .A(edge_cnt[3]), .B(\add_22/carry[3] ), .CO(\add_22/carry[4] ), 
        .S(N11) );
  ADDHX1M U40 ( .A(edge_cnt[4]), .B(\add_22/carry[4] ), .CO(\add_22/carry[5] ), 
        .S(N12) );
  CLKINVX1M U41 ( .A(prescale[0]), .Y(N36) );
  OAI2BB1X1M U42 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N37) );
  OR2X1M U43 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U44 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N38) );
  OR2X1M U45 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U46 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N39) );
  OR2X1M U47 ( .A(n4), .B(prescale[4]), .Y(n15) );
  OAI2BB1X1M U48 ( .A0N(n4), .A1N(prescale[4]), .B0(n15), .Y(N40) );
  NOR2X1M U49 ( .A(n15), .B(prescale[5]), .Y(N42) );
  AO21XLM U50 ( .A0(n15), .A1(prescale[5]), .B0(N42), .Y(N41) );
  NOR2BX1M U51 ( .AN(N36), .B(edge_cnt[0]), .Y(n16) );
  OAI2B2X1M U52 ( .A1N(edge_cnt[1]), .A0(n16), .B0(N37), .B1(n16), .Y(n32) );
  XNOR2X1M U53 ( .A(N41), .B(edge_cnt[5]), .Y(n20) );
  NOR2BX1M U54 ( .AN(edge_cnt[0]), .B(N36), .Y(n17) );
  OAI2B2X1M U55 ( .A1N(N37), .A0(n17), .B0(edge_cnt[1]), .B1(n17), .Y(n19) );
  NAND4BX1M U56 ( .AN(N42), .B(n32), .C(n20), .D(n19), .Y(n36) );
  CLKXOR2X2M U57 ( .A(N40), .B(edge_cnt[4]), .Y(n35) );
  CLKXOR2X2M U58 ( .A(N38), .B(edge_cnt[2]), .Y(n34) );
  CLKXOR2X2M U59 ( .A(N39), .B(edge_cnt[3]), .Y(n33) );
  NOR4X1M U60 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(last_edge) );
  INVXLM U61 ( .A(test_se), .Y(n44) );
  INVXLM U62 ( .A(n44), .Y(n45) );
endmodule


module FSM_RX_UART_DATA_WIDTH8_test_1 ( CLK, RST, PAR_EN, prescale, par_err, 
        edge_cnt, bit_cnt, start_glitch, stop_err, S_DATA, par_chk_en, 
        start_chk_en, enable, data_samp_en, stop_chk_en, deser_en, data_valid, 
        test_si, test_so, test_se );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input CLK, RST, PAR_EN, par_err, start_glitch, stop_err, S_DATA, test_si,
         test_se;
  output par_chk_en, start_chk_en, enable, data_samp_en, stop_chk_en, deser_en,
         data_valid, test_so;
  wire   \sub_172/carry[5] , \sub_172/carry[4] , \sub_172/carry[3] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [5:0] NEG_EDGE;
  wire   [5:0] NEG_EDGE_MINUS;
  assign test_so = current_state[2];
  assign NEG_EDGE_MINUS[0] = prescale[0];

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  OR2X2M U4 ( .A(prescale[1]), .B(NEG_EDGE_MINUS[0]), .Y(n1) );
  INVX2M U5 ( .A(prescale[3]), .Y(n5) );
  XNOR2X2M U6 ( .A(edge_cnt[1]), .B(prescale[1]), .Y(n34) );
  XNOR2X1M U9 ( .A(prescale[5]), .B(\sub_172/carry[5] ), .Y(NEG_EDGE_MINUS[5])
         );
  OR2X1M U10 ( .A(prescale[4]), .B(\sub_172/carry[4] ), .Y(\sub_172/carry[5] )
         );
  XNOR2X1M U11 ( .A(\sub_172/carry[4] ), .B(prescale[4]), .Y(NEG_EDGE_MINUS[4]) );
  OR2X1M U12 ( .A(prescale[3]), .B(\sub_172/carry[3] ), .Y(\sub_172/carry[4] )
         );
  XNOR2X1M U13 ( .A(\sub_172/carry[3] ), .B(prescale[3]), .Y(NEG_EDGE_MINUS[3]) );
  OR2X1M U14 ( .A(prescale[2]), .B(prescale[1]), .Y(\sub_172/carry[3] ) );
  XNOR2X1M U15 ( .A(prescale[1]), .B(prescale[2]), .Y(NEG_EDGE_MINUS[2]) );
  CLKINVX1M U16 ( .A(NEG_EDGE_MINUS[0]), .Y(NEG_EDGE[0]) );
  OAI2BB1X1M U17 ( .A0N(NEG_EDGE_MINUS[0]), .A1N(prescale[1]), .B0(n1), .Y(
        NEG_EDGE[1]) );
  NOR2X1M U18 ( .A(n1), .B(prescale[2]), .Y(n2) );
  AO21XLM U19 ( .A0(n1), .A1(prescale[2]), .B0(n2), .Y(NEG_EDGE[2]) );
  CLKNAND2X2M U20 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U21 ( .A0(n2), .A1(n5), .B0(n3), .Y(NEG_EDGE[3]) );
  XNOR2X1M U22 ( .A(prescale[4]), .B(n3), .Y(NEG_EDGE[4]) );
  NOR2X1M U23 ( .A(prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U24 ( .A(prescale[5]), .B(n4), .Y(NEG_EDGE[5]) );
  NOR2X1M U25 ( .A(n6), .B(n7), .Y(start_chk_en) );
  OAI221X1M U26 ( .A0(n8), .A1(n9), .B0(n13), .B1(n14), .C0(n15), .Y(
        next_state[2]) );
  CLKINVX1M U27 ( .A(deser_en), .Y(n9) );
  OAI21X1M U28 ( .A0(n16), .A1(n14), .B0(n17), .Y(next_state[1]) );
  AOI32X1M U29 ( .A0(n18), .A1(current_state[0]), .A2(n19), .B0(deser_en), 
        .B1(n8), .Y(n17) );
  NAND3BX1M U30 ( .AN(PAR_EN), .B(n18), .C(bit_cnt[3]), .Y(n8) );
  NOR3X1M U31 ( .A(n7), .B(start_glitch), .C(bit_cnt[3]), .Y(n19) );
  OAI221X1M U32 ( .A0(n20), .A1(n21), .B0(n16), .B1(n14), .C0(n22), .Y(
        next_state[0]) );
  MXI2X1M U33 ( .A(n23), .B(n24), .S0(n25), .Y(n22) );
  NOR2X1M U34 ( .A(S_DATA), .B(n7), .Y(n24) );
  OAI22X1M U35 ( .A0(S_DATA), .A1(n26), .B0(n27), .B1(n7), .Y(n23) );
  OR2X1M U36 ( .A(current_state[1]), .B(current_state[2]), .Y(n7) );
  AND2X1M U37 ( .A(n18), .B(n21), .Y(n27) );
  CLKINVX1M U38 ( .A(par_chk_en), .Y(n14) );
  NOR2X1M U39 ( .A(n25), .B(n28), .Y(par_chk_en) );
  CLKINVX1M U40 ( .A(n13), .Y(n16) );
  NAND3X1M U41 ( .A(bit_cnt[3]), .B(n29), .C(bit_cnt[0]), .Y(n13) );
  CLKINVX1M U42 ( .A(bit_cnt[3]), .Y(n21) );
  AOI31X1M U43 ( .A0(deser_en), .A1(n18), .A2(PAR_EN), .B0(n30), .Y(n20) );
  NOR4X1M U44 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U45 ( .A(edge_cnt[0]), .B(NEG_EDGE_MINUS[0]), .Y(n33) );
  NAND3BX1M U46 ( .AN(bit_cnt[2]), .B(stop_chk_en), .C(n35), .Y(n32) );
  XNOR2X1M U47 ( .A(edge_cnt[4]), .B(NEG_EDGE_MINUS[4]), .Y(n35) );
  NAND4X1M U48 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n31) );
  XNOR2X1M U49 ( .A(edge_cnt[5]), .B(NEG_EDGE_MINUS[5]), .Y(n39) );
  XNOR2X1M U50 ( .A(edge_cnt[2]), .B(NEG_EDGE_MINUS[2]), .Y(n38) );
  XNOR2X1M U51 ( .A(edge_cnt[3]), .B(NEG_EDGE_MINUS[3]), .Y(n37) );
  MXI2X1M U52 ( .A(n40), .B(n41), .S0(bit_cnt[0]), .Y(n36) );
  OR2X1M U53 ( .A(bit_cnt[1]), .B(PAR_EN), .Y(n41) );
  CLKNAND2X2M U54 ( .A(bit_cnt[1]), .B(PAR_EN), .Y(n40) );
  NOR2BX1M U55 ( .AN(n29), .B(bit_cnt[0]), .Y(n18) );
  AND2X1M U56 ( .A(n42), .B(n43), .Y(n29) );
  NOR4X1M U57 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .C(n44), .D(n45), .Y(n43) );
  CLKXOR2X2M U58 ( .A(edge_cnt[0]), .B(NEG_EDGE[0]), .Y(n45) );
  CLKXOR2X2M U59 ( .A(edge_cnt[4]), .B(NEG_EDGE[4]), .Y(n44) );
  NOR4X1M U60 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n42) );
  CLKXOR2X2M U61 ( .A(edge_cnt[3]), .B(NEG_EDGE[3]), .Y(n49) );
  CLKXOR2X2M U62 ( .A(edge_cnt[2]), .B(NEG_EDGE[2]), .Y(n48) );
  CLKXOR2X2M U63 ( .A(edge_cnt[5]), .B(NEG_EDGE[5]), .Y(n47) );
  CLKXOR2X2M U64 ( .A(edge_cnt[1]), .B(NEG_EDGE[1]), .Y(n46) );
  OAI211X1M U65 ( .A0(current_state[2]), .A1(n6), .B0(n28), .C0(n15), .Y(
        enable) );
  CLKINVX1M U66 ( .A(stop_chk_en), .Y(n15) );
  NOR2X1M U67 ( .A(n26), .B(current_state[0]), .Y(stop_chk_en) );
  NOR2X1M U68 ( .A(n28), .B(current_state[0]), .Y(deser_en) );
  NOR4X1M U69 ( .A(stop_err), .B(par_err), .C(n26), .D(n25), .Y(data_valid) );
  OAI211X1M U70 ( .A0(current_state[1]), .A1(n6), .B0(n28), .C0(n26), .Y(
        data_samp_en) );
  NAND2BX1M U71 ( .AN(current_state[1]), .B(current_state[2]), .Y(n26) );
  NAND2BX1M U72 ( .AN(current_state[2]), .B(current_state[1]), .Y(n28) );
  AND2X1M U73 ( .A(S_DATA), .B(n25), .Y(n6) );
  CLKINVX1M U74 ( .A(current_state[0]), .Y(n25) );
endmodule


module parity_check_UART_DATA_WIDTH8_test_1 ( CLK, RST, par_chk_en, 
        sampled_bit, PAR_TYPE, P_DATA, par_err, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, par_chk_en, sampled_bit, PAR_TYPE, test_si, test_se;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n9, n2;

  SDFFRQX2M par_err_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
  XOR3XLM U2 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n9) );
  INVX2M U5 ( .A(par_chk_en), .Y(n2) );
  XOR3XLM U6 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XNOR2X2M U7 ( .A(sampled_bit), .B(PAR_TYPE), .Y(n5) );
  XOR3XLM U8 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U9 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
endmodule


module start_check_test_1 ( CLK, RST, start_chk_en, sampled_bit, start_glitch, 
        test_si, test_se );
  input CLK, RST, start_chk_en, sampled_bit, test_si, test_se;
  output start_glitch;
  wire   n2;

  SDFFRQX2M start_glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(start_glitch) );
  AO2B2X2M U2 ( .B0(start_chk_en), .B1(sampled_bit), .A0(start_glitch), .A1N(
        start_chk_en), .Y(n2) );
endmodule


module stop_check_test_1 ( CLK, RST, stop_chk_en, sampled_bit, stop_err, 
        test_si, test_se );
  input CLK, RST, stop_chk_en, sampled_bit, test_si, test_se;
  output stop_err;
  wire   N1;

  SDFFRQX2M stop_err_reg ( .D(N1), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(stop_err) );
  NOR2BX2M U4 ( .AN(stop_chk_en), .B(sampled_bit), .Y(N1) );
endmodule


module UART_RX_UART_DATA_WIDTH8_test_1 ( CLK, RST, PAR_TYPE, PAR_EN, Prescale, 
        RX_IN, P_DATA, data_valid, Parity_Error, Stop_Error, test_si, test_se
 );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, PAR_TYPE, PAR_EN, RX_IN, test_si, test_se;
  output data_valid, Parity_Error, Stop_Error;
  wire   data_samp_en, sampled_bit, deser_en, enable, start_glitch, par_chk_en,
         start_chk_en, stop_chk_en, n1, n2, n3, n4, n5;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  data_sampling_UART_DATA_WIDTH8_test_1 data_sampling_UNIT ( .CLK(CLK), .RST(
        n1), .prescale(Prescale), .edge_cnt(edge_cnt), .RX_IN(RX_IN), 
        .data_samp_en(data_samp_en), .sampled_bit(sampled_bit), .test_si(n5), 
        .test_so(n4), .test_se(test_se) );
  deserializer_UART_DATA_WIDTH8_test_1 deserializer_UNIT ( .CLK(CLK), .RST(n1), 
        .deser_en(deser_en), .prescale(Prescale), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit), .P_DATA(P_DATA), .test_si(n4), .test_so(n3), 
        .test_se(test_se) );
  edge_bit_counter_UART_DATA_WIDTH8_test_1 edge_bit_counter_UNIT ( .CLK(CLK), 
        .RST(n1), .prescale(Prescale), .enable(enable), .edge_cnt(edge_cnt), 
        .bit_cnt(bit_cnt), .test_si(n3), .test_se(test_se) );
  FSM_RX_UART_DATA_WIDTH8_test_1 FSM_RX_UNIT ( .CLK(CLK), .RST(n1), .PAR_EN(
        PAR_EN), .prescale(Prescale), .par_err(1'b0), .edge_cnt(edge_cnt), 
        .bit_cnt(bit_cnt), .start_glitch(start_glitch), .stop_err(1'b0), 
        .S_DATA(RX_IN), .par_chk_en(par_chk_en), .start_chk_en(start_chk_en), 
        .enable(enable), .data_samp_en(data_samp_en), .stop_chk_en(stop_chk_en), .deser_en(deser_en), .data_valid(data_valid), .test_si(test_si), .test_so(n5), .test_se(test_se) );
  parity_check_UART_DATA_WIDTH8_test_1 parity_check_UNIT ( .CLK(CLK), .RST(n1), 
        .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), .PAR_TYPE(PAR_TYPE), .P_DATA(P_DATA), .par_err(Parity_Error), .test_si(edge_cnt[5]), .test_se(
        test_se) );
  start_check_test_1 start_check_UNIT ( .CLK(CLK), .RST(n1), .start_chk_en(
        start_chk_en), .sampled_bit(sampled_bit), .start_glitch(start_glitch), 
        .test_si(Parity_Error), .test_se(test_se) );
  stop_check_test_1 stop_check_UNIT ( .CLK(CLK), .RST(n1), .stop_chk_en(
        stop_chk_en), .sampled_bit(sampled_bit), .stop_err(Stop_Error), 
        .test_si(start_glitch), .test_se(test_se) );
endmodule


module UART_UART_DATA_WIDTH8_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, 
        RX_OUT_V, TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, 
        parity_enable, parity_type, parity_error, Stop_Error, test_si, test_se
 );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, Stop_Error;
  wire   n1, n2;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_UART_DATA_WIDTH8_test_1 UART_TX_UNIT ( .CLK(TX_CLK), .RST(n1), 
        .PAR_TYP(parity_type), .PAR_EN(parity_enable), .DATA_VALID(TX_IN_V), 
        .P_DATA(TX_IN_P), .TX_OUT(TX_OUT_S), .Busy(TX_OUT_V), .test_si(
        Stop_Error), .test_se(test_se) );
  UART_RX_UART_DATA_WIDTH8_test_1 UART_RX_UNIT ( .CLK(RX_CLK), .RST(n1), 
        .PAR_TYPE(parity_type), .PAR_EN(parity_enable), .Prescale(Prescale), 
        .RX_IN(RX_IN_S), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), 
        .Parity_Error(parity_error), .Stop_Error(Stop_Error), .test_si(test_si), .test_se(test_se) );
endmodule



    module SYS_CTRL_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_UART_DATA_WIDTH8_test_1 ( 
        CLK, RST, ALU_OUT, ALU_OUT_VALID, ALU_FUN, ALU_ENABLE, RdData, 
        RdData_Valid, Address, WrEn, RdEn, WrData, CLK_EN, RX_P_DATA, RX_D_VLD, 
        TX_P_DATA, TX_D_VLD, FIFO_FULL, clk_div_en, test_si, test_so, test_se
 );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] RdData;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_VALID, RdData_Valid, RX_D_VLD, FIFO_FULL, test_si,
         test_se;
  output ALU_ENABLE, WrEn, RdEn, CLK_EN, TX_D_VLD, clk_div_en, test_so;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  assign test_so = current_state[3];

  SDFFRX1M \ALU_OUTPUT_REG_reg[7]  ( .D(n114), .SI(n142), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n141), .QN(n37) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[6]  ( .D(n115), .SI(n143), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n142), .QN(n38) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[5]  ( .D(n116), .SI(n144), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n143), .QN(n39) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[4]  ( .D(n117), .SI(n145), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n144), .QN(n40) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[3]  ( .D(n118), .SI(n146), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n145), .QN(n41) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[2]  ( .D(n119), .SI(n147), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n146), .QN(n42) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[1]  ( .D(n120), .SI(n148), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n147), .QN(n43) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[0]  ( .D(n121), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n148), .QN(n44) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[14]  ( .D(n107), .SI(n135), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n134), .QN(n30) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[13]  ( .D(n108), .SI(n136), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n135), .QN(n31) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[12]  ( .D(n109), .SI(n137), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n136), .QN(n32) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[11]  ( .D(n110), .SI(n138), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n137), .QN(n33) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[10]  ( .D(n111), .SI(n139), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n138), .QN(n34) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[9]  ( .D(n112), .SI(n140), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n139), .QN(n35) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[8]  ( .D(n113), .SI(n141), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n140), .QN(n36) );
  SDFFRX1M \RF_ADDR_REG_reg[0]  ( .D(n125), .SI(n133), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n132), .QN(n28) );
  SDFFRX1M \RF_ADDR_REG_reg[3]  ( .D(n122), .SI(n130), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n129), .QN(n25) );
  SDFFRX1M \RF_ADDR_REG_reg[2]  ( .D(n123), .SI(n131), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n130), .QN(n26) );
  SDFFRX1M \RF_ADDR_REG_reg[1]  ( .D(n124), .SI(n132), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n131), .QN(n27) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n60), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .SI(n64), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[3]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(n129), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRX1M \ALU_OUTPUT_REG_reg[15]  ( .D(n106), .SI(n134), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n133), .QN(n29) );
  NOR2X2M U30 ( .A(n88), .B(n68), .Y(ALU_FUN[2]) );
  NOR2X2M U31 ( .A(n88), .B(n127), .Y(ALU_FUN[0]) );
  OAI22X2M U32 ( .A0(n76), .A1(n26), .B0(n86), .B1(n68), .Y(Address[2]) );
  INVX2M U33 ( .A(n69), .Y(n62) );
  INVX2M U34 ( .A(n98), .Y(n58) );
  INVX2M U35 ( .A(n82), .Y(n48) );
  OR2X2M U36 ( .A(ALU_ENABLE), .B(n69), .Y(next_state[3]) );
  AND3X2M U37 ( .A(n75), .B(n72), .C(n76), .Y(n99) );
  NOR2X2M U38 ( .A(n99), .B(n127), .Y(WrData[0]) );
  NOR2X2M U39 ( .A(n99), .B(n126), .Y(WrData[1]) );
  NOR2X2M U40 ( .A(n99), .B(n68), .Y(WrData[2]) );
  NOR2X2M U41 ( .A(n99), .B(n67), .Y(WrData[3]) );
  NOR2X2M U42 ( .A(n99), .B(n66), .Y(WrData[4]) );
  NOR2X2M U43 ( .A(n99), .B(n65), .Y(WrData[5]) );
  NOR2X2M U44 ( .A(n63), .B(n80), .Y(n69) );
  NOR2X2M U45 ( .A(n86), .B(n128), .Y(RdEn) );
  NAND3X2M U46 ( .A(n60), .B(n64), .C(n105), .Y(n76) );
  NOR2X2M U47 ( .A(n62), .B(n60), .Y(n79) );
  NAND2X2M U48 ( .A(n79), .B(n49), .Y(n101) );
  NAND2X2M U49 ( .A(n100), .B(n60), .Y(n73) );
  NAND2BX2M U50 ( .AN(n80), .B(n63), .Y(n94) );
  NAND3X2M U51 ( .A(n102), .B(n101), .C(n73), .Y(TX_D_VLD) );
  NOR2X2M U52 ( .A(n99), .B(n128), .Y(WrEn) );
  NOR3X2M U53 ( .A(n128), .B(n60), .C(n94), .Y(n98) );
  NOR2X2M U54 ( .A(n128), .B(n88), .Y(ALU_ENABLE) );
  NAND4X2M U55 ( .A(n90), .B(n91), .C(n127), .D(n66), .Y(n71) );
  OAI21X2M U56 ( .A0(n60), .A1(n94), .B0(n72), .Y(n85) );
  INVX2M U57 ( .A(n75), .Y(n59) );
  NOR2X2M U58 ( .A(n88), .B(n126), .Y(ALU_FUN[1]) );
  NOR2X2M U59 ( .A(n88), .B(n67), .Y(ALU_FUN[3]) );
  NAND2X2M U60 ( .A(n88), .B(n62), .Y(CLK_EN) );
  OAI22X4M U61 ( .A0(n76), .A1(n25), .B0(n86), .B1(n67), .Y(Address[3]) );
  NOR3X2M U62 ( .A(n128), .B(current_state[0]), .C(n94), .Y(n90) );
  NOR3X2M U63 ( .A(current_state[1]), .B(current_state[3]), .C(n64), .Y(n100)
         );
  NAND3BX2M U64 ( .AN(n73), .B(n49), .C(RdData_Valid), .Y(n103) );
  OAI211X2M U65 ( .A0(RX_D_VLD), .A1(n86), .B0(n87), .C0(n74), .Y(n81) );
  NAND4X2M U66 ( .A(n90), .B(RX_P_DATA[7]), .C(n92), .D(n93), .Y(n87) );
  NOR3X2M U67 ( .A(n67), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n92) );
  NOR4X1M U68 ( .A(n127), .B(n66), .C(n126), .D(n65), .Y(n93) );
  NAND3X2M U69 ( .A(current_state[0]), .B(n105), .C(current_state[2]), .Y(n88)
         );
  NAND4X2M U70 ( .A(current_state[1]), .B(current_state[3]), .C(n104), .D(n49), 
        .Y(n102) );
  NOR2X2M U71 ( .A(current_state[2]), .B(current_state[0]), .Y(n104) );
  NOR2BX2M U72 ( .AN(RX_P_DATA[6]), .B(n99), .Y(WrData[6]) );
  NOR2BX2M U73 ( .AN(RX_P_DATA[7]), .B(n99), .Y(WrData[7]) );
  OAI222X1M U74 ( .A0(n44), .A1(n101), .B0(n36), .B1(n102), .C0(n103), .C1(n57), .Y(TX_P_DATA[0]) );
  INVX2M U75 ( .A(RdData[0]), .Y(n57) );
  OAI222X1M U76 ( .A0(n43), .A1(n101), .B0(n35), .B1(n102), .C0(n103), .C1(n56), .Y(TX_P_DATA[1]) );
  INVX2M U77 ( .A(RdData[1]), .Y(n56) );
  OAI222X1M U78 ( .A0(n42), .A1(n101), .B0(n34), .B1(n102), .C0(n103), .C1(n55), .Y(TX_P_DATA[2]) );
  INVX2M U79 ( .A(RdData[2]), .Y(n55) );
  OAI222X1M U80 ( .A0(n41), .A1(n101), .B0(n33), .B1(n102), .C0(n103), .C1(n54), .Y(TX_P_DATA[3]) );
  INVX2M U81 ( .A(RdData[3]), .Y(n54) );
  OAI222X1M U82 ( .A0(n40), .A1(n101), .B0(n32), .B1(n102), .C0(n103), .C1(n53), .Y(TX_P_DATA[4]) );
  INVX2M U83 ( .A(RdData[4]), .Y(n53) );
  OAI222X1M U84 ( .A0(n39), .A1(n101), .B0(n31), .B1(n102), .C0(n103), .C1(n52), .Y(TX_P_DATA[5]) );
  INVX2M U85 ( .A(RdData[5]), .Y(n52) );
  OAI222X1M U86 ( .A0(n38), .A1(n101), .B0(n30), .B1(n102), .C0(n103), .C1(n51), .Y(TX_P_DATA[6]) );
  INVX2M U87 ( .A(RdData[6]), .Y(n51) );
  OAI222X1M U88 ( .A0(n37), .A1(n101), .B0(n29), .B1(n102), .C0(n103), .C1(n50), .Y(TX_P_DATA[7]) );
  INVX2M U89 ( .A(RdData[7]), .Y(n50) );
  NAND3X2M U90 ( .A(n105), .B(n64), .C(current_state[0]), .Y(n86) );
  INVX2M U91 ( .A(current_state[0]), .Y(n60) );
  NAND4BBX1M U92 ( .AN(n70), .BN(RdEn), .C(n71), .D(n72), .Y(next_state[2]) );
  OAI211X2M U93 ( .A0(n73), .A1(RdData_Valid), .B0(n74), .C0(n75), .Y(n70) );
  INVX2M U94 ( .A(RX_P_DATA[0]), .Y(n127) );
  NAND2X2M U95 ( .A(n100), .B(current_state[0]), .Y(n72) );
  NAND3X2M U96 ( .A(n105), .B(n60), .C(current_state[2]), .Y(n75) );
  INVX2M U97 ( .A(RX_D_VLD), .Y(n128) );
  INVX2M U98 ( .A(RX_P_DATA[1]), .Y(n126) );
  AND4X2M U99 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n97), 
        .Y(n91) );
  NOR3X2M U100 ( .A(n68), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n97) );
  INVX2M U101 ( .A(RX_P_DATA[2]), .Y(n68) );
  INVX2M U102 ( .A(current_state[2]), .Y(n64) );
  AND2X2M U103 ( .A(current_state[1]), .B(n63), .Y(n105) );
  NAND2BX2M U104 ( .AN(current_state[1]), .B(n64), .Y(n80) );
  INVX2M U105 ( .A(RX_P_DATA[3]), .Y(n67) );
  NAND4X2M U106 ( .A(n71), .B(n82), .C(n83), .D(n84), .Y(next_state[0]) );
  NAND4X2M U107 ( .A(RX_P_DATA[3]), .B(n127), .C(n95), .D(n96), .Y(n83) );
  AOI221XLM U108 ( .A0(n85), .A1(n128), .B0(n59), .B1(RX_D_VLD), .C0(n81), .Y(
        n84) );
  NOR3X2M U109 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n95)
         );
  AND4X2M U110 ( .A(RX_P_DATA[7]), .B(n90), .C(RX_P_DATA[1]), .D(RX_P_DATA[5]), 
        .Y(n96) );
  INVX2M U111 ( .A(current_state[3]), .Y(n63) );
  OA21X2M U112 ( .A0(RX_D_VLD), .A1(n88), .B0(n89), .Y(n74) );
  NAND4X2M U113 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n90), .D(n91), .Y(n89) );
  INVX2M U114 ( .A(FIFO_FULL), .Y(n49) );
  OAI211X2M U115 ( .A0(RX_D_VLD), .A1(n76), .B0(n61), .C0(n77), .Y(
        next_state[1]) );
  AOI211X2M U116 ( .A0(RX_D_VLD), .A1(n78), .B0(n59), .C0(n79), .Y(n77) );
  INVX2M U117 ( .A(n81), .Y(n61) );
  OAI21X2M U118 ( .A0(n80), .A1(n60), .B0(n72), .Y(n78) );
  OAI22X1M U119 ( .A0(n76), .A1(n27), .B0(n86), .B1(n126), .Y(Address[1]) );
  OAI221X1M U120 ( .A0(n86), .A1(n127), .B0(n76), .B1(n28), .C0(n75), .Y(
        Address[0]) );
  OAI22X1M U121 ( .A0(n127), .A1(n58), .B0(n98), .B1(n28), .Y(n125) );
  OAI22X1M U122 ( .A0(n126), .A1(n58), .B0(n98), .B1(n27), .Y(n124) );
  OAI22X1M U123 ( .A0(n68), .A1(n58), .B0(n98), .B1(n26), .Y(n123) );
  OAI22X1M U124 ( .A0(n67), .A1(n58), .B0(n98), .B1(n25), .Y(n122) );
  NAND3X2M U125 ( .A(n69), .B(n60), .C(ALU_OUT_VALID), .Y(n82) );
  OAI2BB2X1M U126 ( .B0(n48), .B1(n44), .A0N(ALU_OUT[0]), .A1N(n48), .Y(n121)
         );
  OAI2BB2X1M U127 ( .B0(n48), .B1(n43), .A0N(ALU_OUT[1]), .A1N(n48), .Y(n120)
         );
  OAI2BB2X1M U128 ( .B0(n48), .B1(n42), .A0N(ALU_OUT[2]), .A1N(n48), .Y(n119)
         );
  OAI2BB2X1M U129 ( .B0(n48), .B1(n41), .A0N(ALU_OUT[3]), .A1N(n48), .Y(n118)
         );
  OAI2BB2X1M U130 ( .B0(n48), .B1(n40), .A0N(ALU_OUT[4]), .A1N(n48), .Y(n117)
         );
  OAI2BB2X1M U131 ( .B0(n48), .B1(n39), .A0N(ALU_OUT[5]), .A1N(n48), .Y(n116)
         );
  OAI2BB2X1M U132 ( .B0(n48), .B1(n38), .A0N(ALU_OUT[6]), .A1N(n48), .Y(n115)
         );
  OAI2BB2X1M U133 ( .B0(n48), .B1(n37), .A0N(ALU_OUT[7]), .A1N(n48), .Y(n114)
         );
  OAI2BB2X1M U134 ( .B0(n48), .B1(n36), .A0N(ALU_OUT[8]), .A1N(n48), .Y(n113)
         );
  OAI2BB2X1M U135 ( .B0(n48), .B1(n35), .A0N(ALU_OUT[9]), .A1N(n48), .Y(n112)
         );
  OAI2BB2X1M U136 ( .B0(n48), .B1(n34), .A0N(ALU_OUT[10]), .A1N(n48), .Y(n111)
         );
  OAI2BB2X1M U137 ( .B0(n48), .B1(n33), .A0N(ALU_OUT[11]), .A1N(n48), .Y(n110)
         );
  OAI2BB2X1M U138 ( .B0(n48), .B1(n32), .A0N(ALU_OUT[12]), .A1N(n48), .Y(n109)
         );
  OAI2BB2X1M U139 ( .B0(n48), .B1(n31), .A0N(ALU_OUT[13]), .A1N(n48), .Y(n108)
         );
  OAI2BB2X1M U140 ( .B0(n48), .B1(n30), .A0N(ALU_OUT[14]), .A1N(n48), .Y(n107)
         );
  OAI2BB2X1M U141 ( .B0(n48), .B1(n29), .A0N(ALU_OUT[15]), .A1N(n48), .Y(n106)
         );
  INVX2M U142 ( .A(RX_P_DATA[4]), .Y(n66) );
  INVX2M U143 ( .A(RX_P_DATA[5]), .Y(n65) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module REG_FILE_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_test_1 ( WrEn, RdEn, CLK, 
        RST, Address, WrData, RdData, RdData_Valid, REG0, REG1, REG2, REG3, 
        test_si3, test_si2, test_si1, test_so2, test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST, test_si3, test_si2, test_si1, test_se;
  output RdData_Valid, test_so2, test_so1;
  wire   N11, N12, N13, N14, \mem[4][7] , \mem[4][6] , \mem[4][5] ,
         \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] ,
         \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] ,
         \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] ,
         \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] ,
         \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[8][7] ,
         \mem[8][6] , \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] ,
         \mem[8][1] , \mem[8][0] , \mem[9][7] , \mem[9][6] , \mem[9][5] ,
         \mem[9][4] , \mem[9][3] , \mem[9][2] , \mem[9][1] , \mem[9][0] ,
         \mem[10][7] , \mem[10][6] , \mem[10][5] , \mem[10][4] , \mem[10][3] ,
         \mem[10][2] , \mem[10][1] , \mem[10][0] , \mem[11][7] , \mem[11][6] ,
         \mem[11][5] , \mem[11][4] , \mem[11][3] , \mem[11][2] , \mem[11][1] ,
         \mem[11][0] , \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] ,
         \mem[12][3] , \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[13][7] ,
         \mem[13][6] , \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] ,
         \mem[13][1] , \mem[13][0] , \mem[14][7] , \mem[14][6] , \mem[14][5] ,
         \mem[14][4] , \mem[14][3] , \mem[14][2] , \mem[14][1] , \mem[14][0] ,
         \mem[15][7] , \mem[15][6] , \mem[15][5] , \mem[15][4] , \mem[15][3] ,
         \mem[15][2] , \mem[15][1] , \mem[15][0] , N36, N37, N38, N39, N40,
         N41, N42, N43, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n371, n372, n373, n374;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so1 = \mem[14][5] ;
  assign test_so2 = \mem[15][7] ;

  SDFFRQX2M \mem_reg[5][7]  ( .D(n275), .SI(\mem[5][6] ), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(\mem[5][7] ) );
  SDFFRQX2M \mem_reg[5][6]  ( .D(n274), .SI(\mem[5][5] ), .SE(n372), .CK(CLK), 
        .RN(n348), .Q(\mem[5][6] ) );
  SDFFRQX2M \mem_reg[5][5]  ( .D(n273), .SI(\mem[5][4] ), .SE(n371), .CK(CLK), 
        .RN(n348), .Q(\mem[5][5] ) );
  SDFFRQX2M \mem_reg[5][4]  ( .D(n272), .SI(\mem[5][3] ), .SE(n374), .CK(CLK), 
        .RN(n348), .Q(\mem[5][4] ) );
  SDFFRQX2M \mem_reg[5][3]  ( .D(n271), .SI(\mem[5][2] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\mem[5][3] ) );
  SDFFRQX2M \mem_reg[5][2]  ( .D(n270), .SI(\mem[5][1] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\mem[5][2] ) );
  SDFFRQX2M \mem_reg[5][1]  ( .D(n269), .SI(\mem[5][0] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\mem[5][1] ) );
  SDFFRQX2M \mem_reg[5][0]  ( .D(n268), .SI(\mem[4][7] ), .SE(n374), .CK(CLK), 
        .RN(n347), .Q(\mem[5][0] ) );
  SDFFRQX2M \mem_reg[9][7]  ( .D(n243), .SI(\mem[9][6] ), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\mem[9][7] ) );
  SDFFRQX2M \mem_reg[9][6]  ( .D(n242), .SI(\mem[9][5] ), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(\mem[9][6] ) );
  SDFFRQX2M \mem_reg[9][5]  ( .D(n241), .SI(\mem[9][4] ), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(\mem[9][5] ) );
  SDFFRQX2M \mem_reg[9][4]  ( .D(n240), .SI(\mem[9][3] ), .SE(n374), .CK(CLK), 
        .RN(n345), .Q(\mem[9][4] ) );
  SDFFRQX2M \mem_reg[9][3]  ( .D(n239), .SI(\mem[9][2] ), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\mem[9][3] ) );
  SDFFRQX2M \mem_reg[9][2]  ( .D(n238), .SI(\mem[9][1] ), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(\mem[9][2] ) );
  SDFFRQX2M \mem_reg[9][1]  ( .D(n237), .SI(\mem[9][0] ), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(\mem[9][1] ) );
  SDFFRQX2M \mem_reg[9][0]  ( .D(n236), .SI(\mem[8][7] ), .SE(n374), .CK(CLK), 
        .RN(n345), .Q(\mem[9][0] ) );
  SDFFRQX2M \mem_reg[13][7]  ( .D(n211), .SI(\mem[13][6] ), .SE(n373), .CK(CLK), .RN(n343), .Q(\mem[13][7] ) );
  SDFFRQX2M \mem_reg[13][6]  ( .D(n210), .SI(\mem[13][5] ), .SE(n372), .CK(CLK), .RN(n343), .Q(\mem[13][6] ) );
  SDFFRQX2M \mem_reg[13][5]  ( .D(n209), .SI(\mem[13][4] ), .SE(n371), .CK(CLK), .RN(n343), .Q(\mem[13][5] ) );
  SDFFRQX2M \mem_reg[13][4]  ( .D(n208), .SI(\mem[13][3] ), .SE(n374), .CK(CLK), .RN(n343), .Q(\mem[13][4] ) );
  SDFFRQX2M \mem_reg[13][3]  ( .D(n207), .SI(\mem[13][2] ), .SE(n373), .CK(CLK), .RN(n343), .Q(\mem[13][3] ) );
  SDFFRQX2M \mem_reg[13][2]  ( .D(n206), .SI(\mem[13][1] ), .SE(n372), .CK(CLK), .RN(n343), .Q(\mem[13][2] ) );
  SDFFRQX2M \mem_reg[13][1]  ( .D(n205), .SI(\mem[13][0] ), .SE(n371), .CK(CLK), .RN(n343), .Q(\mem[13][1] ) );
  SDFFRQX2M \mem_reg[13][0]  ( .D(n204), .SI(\mem[12][7] ), .SE(n374), .CK(CLK), .RN(n343), .Q(\mem[13][0] ) );
  SDFFRQX2M \mem_reg[7][7]  ( .D(n259), .SI(\mem[7][6] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\mem[7][7] ) );
  SDFFRQX2M \mem_reg[7][6]  ( .D(n258), .SI(\mem[7][5] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\mem[7][6] ) );
  SDFFRQX2M \mem_reg[7][5]  ( .D(n257), .SI(\mem[7][4] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\mem[7][5] ) );
  SDFFRQX2M \mem_reg[7][4]  ( .D(n256), .SI(\mem[7][3] ), .SE(n374), .CK(CLK), 
        .RN(n346), .Q(\mem[7][4] ) );
  SDFFRQX2M \mem_reg[7][3]  ( .D(n255), .SI(\mem[7][2] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\mem[7][3] ) );
  SDFFRQX2M \mem_reg[7][2]  ( .D(n254), .SI(\mem[7][1] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\mem[7][2] ) );
  SDFFRQX2M \mem_reg[7][1]  ( .D(n253), .SI(\mem[7][0] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\mem[7][1] ) );
  SDFFRQX2M \mem_reg[7][0]  ( .D(n252), .SI(\mem[6][7] ), .SE(n374), .CK(CLK), 
        .RN(n346), .Q(\mem[7][0] ) );
  SDFFRQX2M \mem_reg[11][7]  ( .D(n227), .SI(\mem[11][6] ), .SE(n373), .CK(CLK), .RN(n344), .Q(\mem[11][7] ) );
  SDFFRQX2M \mem_reg[11][6]  ( .D(n226), .SI(\mem[11][5] ), .SE(n372), .CK(CLK), .RN(n344), .Q(\mem[11][6] ) );
  SDFFRQX2M \mem_reg[11][5]  ( .D(n225), .SI(\mem[11][4] ), .SE(n371), .CK(CLK), .RN(n344), .Q(\mem[11][5] ) );
  SDFFRQX2M \mem_reg[11][4]  ( .D(n224), .SI(\mem[11][3] ), .SE(n374), .CK(CLK), .RN(n344), .Q(\mem[11][4] ) );
  SDFFRQX2M \mem_reg[11][3]  ( .D(n223), .SI(\mem[11][2] ), .SE(n373), .CK(CLK), .RN(n344), .Q(\mem[11][3] ) );
  SDFFRQX2M \mem_reg[11][2]  ( .D(n222), .SI(\mem[11][1] ), .SE(n372), .CK(CLK), .RN(n344), .Q(\mem[11][2] ) );
  SDFFRQX2M \mem_reg[11][1]  ( .D(n221), .SI(\mem[11][0] ), .SE(n371), .CK(CLK), .RN(n344), .Q(\mem[11][1] ) );
  SDFFRQX2M \mem_reg[11][0]  ( .D(n220), .SI(\mem[10][7] ), .SE(n374), .CK(CLK), .RN(n344), .Q(\mem[11][0] ) );
  SDFFRQX2M \mem_reg[15][7]  ( .D(n195), .SI(\mem[15][6] ), .SE(n373), .CK(CLK), .RN(n342), .Q(\mem[15][7] ) );
  SDFFRQX2M \mem_reg[15][6]  ( .D(n194), .SI(\mem[15][5] ), .SE(n372), .CK(CLK), .RN(n342), .Q(\mem[15][6] ) );
  SDFFRQX2M \mem_reg[15][5]  ( .D(n193), .SI(\mem[15][4] ), .SE(n371), .CK(CLK), .RN(n342), .Q(\mem[15][5] ) );
  SDFFRQX2M \mem_reg[15][4]  ( .D(n192), .SI(\mem[15][3] ), .SE(n374), .CK(CLK), .RN(n342), .Q(\mem[15][4] ) );
  SDFFRQX2M \mem_reg[15][3]  ( .D(n191), .SI(\mem[15][2] ), .SE(n373), .CK(CLK), .RN(n342), .Q(\mem[15][3] ) );
  SDFFRQX2M \mem_reg[15][2]  ( .D(n190), .SI(\mem[15][1] ), .SE(n372), .CK(CLK), .RN(n342), .Q(\mem[15][2] ) );
  SDFFRQX2M \mem_reg[15][1]  ( .D(n189), .SI(\mem[15][0] ), .SE(n371), .CK(CLK), .RN(n341), .Q(\mem[15][1] ) );
  SDFFRQX2M \mem_reg[15][0]  ( .D(n188), .SI(\mem[14][7] ), .SE(n374), .CK(CLK), .RN(n342), .Q(\mem[15][0] ) );
  SDFFRQX2M \mem_reg[6][7]  ( .D(n267), .SI(\mem[6][6] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\mem[6][7] ) );
  SDFFRQX2M \mem_reg[6][6]  ( .D(n266), .SI(\mem[6][5] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\mem[6][6] ) );
  SDFFRQX2M \mem_reg[6][5]  ( .D(n265), .SI(\mem[6][4] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\mem[6][5] ) );
  SDFFRQX2M \mem_reg[6][4]  ( .D(n264), .SI(\mem[6][3] ), .SE(n374), .CK(CLK), 
        .RN(n347), .Q(\mem[6][4] ) );
  SDFFRQX2M \mem_reg[6][3]  ( .D(n263), .SI(\mem[6][2] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\mem[6][3] ) );
  SDFFRQX2M \mem_reg[6][2]  ( .D(n262), .SI(\mem[6][1] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\mem[6][2] ) );
  SDFFRQX2M \mem_reg[6][1]  ( .D(n261), .SI(\mem[6][0] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\mem[6][1] ) );
  SDFFRQX2M \mem_reg[6][0]  ( .D(n260), .SI(\mem[5][7] ), .SE(n374), .CK(CLK), 
        .RN(n347), .Q(\mem[6][0] ) );
  SDFFRQX2M \mem_reg[10][7]  ( .D(n235), .SI(\mem[10][6] ), .SE(n373), .CK(CLK), .RN(n345), .Q(\mem[10][7] ) );
  SDFFRQX2M \mem_reg[10][6]  ( .D(n234), .SI(\mem[10][5] ), .SE(n372), .CK(CLK), .RN(n345), .Q(\mem[10][6] ) );
  SDFFRQX2M \mem_reg[10][5]  ( .D(n233), .SI(\mem[10][4] ), .SE(n371), .CK(CLK), .RN(n345), .Q(\mem[10][5] ) );
  SDFFRQX2M \mem_reg[10][4]  ( .D(n232), .SI(\mem[10][3] ), .SE(n374), .CK(CLK), .RN(n345), .Q(\mem[10][4] ) );
  SDFFRQX2M \mem_reg[10][3]  ( .D(n231), .SI(\mem[10][2] ), .SE(n373), .CK(CLK), .RN(n345), .Q(\mem[10][3] ) );
  SDFFRQX2M \mem_reg[10][2]  ( .D(n230), .SI(\mem[10][1] ), .SE(n372), .CK(CLK), .RN(n344), .Q(\mem[10][2] ) );
  SDFFRQX2M \mem_reg[10][1]  ( .D(n229), .SI(\mem[10][0] ), .SE(n371), .CK(CLK), .RN(n344), .Q(\mem[10][1] ) );
  SDFFRQX2M \mem_reg[10][0]  ( .D(n228), .SI(\mem[9][7] ), .SE(n374), .CK(CLK), 
        .RN(n344), .Q(\mem[10][0] ) );
  SDFFRQX2M \mem_reg[14][7]  ( .D(n203), .SI(\mem[14][6] ), .SE(n373), .CK(CLK), .RN(n343), .Q(\mem[14][7] ) );
  SDFFRQX2M \mem_reg[14][6]  ( .D(n202), .SI(test_si3), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(\mem[14][6] ) );
  SDFFRQX2M \mem_reg[14][5]  ( .D(n201), .SI(\mem[14][4] ), .SE(n371), .CK(CLK), .RN(n342), .Q(\mem[14][5] ) );
  SDFFRQX2M \mem_reg[14][4]  ( .D(n200), .SI(\mem[14][3] ), .SE(n374), .CK(CLK), .RN(n342), .Q(\mem[14][4] ) );
  SDFFRQX2M \mem_reg[14][3]  ( .D(n199), .SI(\mem[14][2] ), .SE(n373), .CK(CLK), .RN(n342), .Q(\mem[14][3] ) );
  SDFFRQX2M \mem_reg[14][2]  ( .D(n198), .SI(\mem[14][1] ), .SE(n372), .CK(CLK), .RN(n342), .Q(\mem[14][2] ) );
  SDFFRQX2M \mem_reg[14][1]  ( .D(n197), .SI(\mem[14][0] ), .SE(n371), .CK(CLK), .RN(n342), .Q(\mem[14][1] ) );
  SDFFRQX2M \mem_reg[14][0]  ( .D(n196), .SI(\mem[13][7] ), .SE(n374), .CK(CLK), .RN(n342), .Q(\mem[14][0] ) );
  SDFFRQX2M \mem_reg[4][7]  ( .D(n283), .SI(\mem[4][6] ), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(\mem[4][7] ) );
  SDFFRQX2M \mem_reg[4][6]  ( .D(n282), .SI(\mem[4][5] ), .SE(n372), .CK(CLK), 
        .RN(n348), .Q(\mem[4][6] ) );
  SDFFRQX2M \mem_reg[4][5]  ( .D(n281), .SI(\mem[4][4] ), .SE(n371), .CK(CLK), 
        .RN(n348), .Q(\mem[4][5] ) );
  SDFFRQX2M \mem_reg[4][4]  ( .D(n280), .SI(\mem[4][3] ), .SE(n374), .CK(CLK), 
        .RN(n348), .Q(\mem[4][4] ) );
  SDFFRQX2M \mem_reg[4][3]  ( .D(n279), .SI(\mem[4][2] ), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(\mem[4][3] ) );
  SDFFRQX2M \mem_reg[4][2]  ( .D(n278), .SI(\mem[4][1] ), .SE(n372), .CK(CLK), 
        .RN(n348), .Q(\mem[4][2] ) );
  SDFFRQX2M \mem_reg[4][1]  ( .D(n277), .SI(\mem[4][0] ), .SE(n371), .CK(CLK), 
        .RN(n348), .Q(\mem[4][1] ) );
  SDFFRQX2M \mem_reg[4][0]  ( .D(n276), .SI(REG3[7]), .SE(n374), .CK(CLK), 
        .RN(n348), .Q(\mem[4][0] ) );
  SDFFRQX2M \mem_reg[8][7]  ( .D(n251), .SI(\mem[8][6] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\mem[8][7] ) );
  SDFFRQX2M \mem_reg[8][6]  ( .D(n250), .SI(\mem[8][5] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\mem[8][6] ) );
  SDFFRQX2M \mem_reg[8][5]  ( .D(n249), .SI(\mem[8][4] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\mem[8][5] ) );
  SDFFRQX2M \mem_reg[8][4]  ( .D(n248), .SI(\mem[8][3] ), .SE(n374), .CK(CLK), 
        .RN(n346), .Q(\mem[8][4] ) );
  SDFFRQX2M \mem_reg[8][3]  ( .D(n247), .SI(\mem[8][2] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\mem[8][3] ) );
  SDFFRQX2M \mem_reg[8][2]  ( .D(n246), .SI(\mem[8][1] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\mem[8][2] ) );
  SDFFRQX2M \mem_reg[8][1]  ( .D(n245), .SI(\mem[8][0] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\mem[8][1] ) );
  SDFFRQX2M \mem_reg[8][0]  ( .D(n244), .SI(\mem[7][7] ), .SE(n374), .CK(CLK), 
        .RN(n345), .Q(\mem[8][0] ) );
  SDFFRQX2M \mem_reg[12][7]  ( .D(n219), .SI(\mem[12][6] ), .SE(n373), .CK(CLK), .RN(n344), .Q(\mem[12][7] ) );
  SDFFRQX2M \mem_reg[12][6]  ( .D(n218), .SI(\mem[12][5] ), .SE(n372), .CK(CLK), .RN(n344), .Q(\mem[12][6] ) );
  SDFFRQX2M \mem_reg[12][5]  ( .D(n217), .SI(\mem[12][4] ), .SE(n371), .CK(CLK), .RN(n344), .Q(\mem[12][5] ) );
  SDFFRQX2M \mem_reg[12][4]  ( .D(n216), .SI(\mem[12][3] ), .SE(n374), .CK(CLK), .RN(n343), .Q(\mem[12][4] ) );
  SDFFRQX2M \mem_reg[12][3]  ( .D(n215), .SI(\mem[12][2] ), .SE(n373), .CK(CLK), .RN(n343), .Q(\mem[12][3] ) );
  SDFFRQX2M \mem_reg[12][2]  ( .D(n214), .SI(\mem[12][1] ), .SE(n372), .CK(CLK), .RN(n343), .Q(\mem[12][2] ) );
  SDFFRQX2M \mem_reg[12][1]  ( .D(n213), .SI(\mem[12][0] ), .SE(n371), .CK(CLK), .RN(n343), .Q(\mem[12][1] ) );
  SDFFRQX2M \mem_reg[12][0]  ( .D(n212), .SI(\mem[11][7] ), .SE(n374), .CK(CLK), .RN(n343), .Q(\mem[12][0] ) );
  SDFFRQX2M \mem_reg[3][0]  ( .D(n284), .SI(REG2[7]), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(REG3[0]) );
  SDFFRQX2M \mem_reg[1][7]  ( .D(n307), .SI(REG1[6]), .SE(n372), .CK(CLK), 
        .RN(n350), .Q(REG1[7]) );
  SDFFRQX2M \mem_reg[1][6]  ( .D(n306), .SI(REG1[5]), .SE(n371), .CK(CLK), 
        .RN(n350), .Q(REG1[6]) );
  SDFFRQX2M \mem_reg[1][5]  ( .D(n305), .SI(REG1[4]), .SE(n374), .CK(CLK), 
        .RN(n350), .Q(REG1[5]) );
  SDFFRQX2M \mem_reg[0][7]  ( .D(n315), .SI(REG0[6]), .SE(n373), .CK(CLK), 
        .RN(n341), .Q(REG0[7]) );
  SDFFRQX2M \mem_reg[0][6]  ( .D(n314), .SI(REG0[5]), .SE(n372), .CK(CLK), 
        .RN(n350), .Q(REG0[6]) );
  SDFFRQX2M \mem_reg[0][5]  ( .D(n313), .SI(REG0[4]), .SE(n371), .CK(CLK), 
        .RN(n350), .Q(REG0[5]) );
  SDFFRQX2M \mem_reg[0][4]  ( .D(n312), .SI(REG0[3]), .SE(n374), .CK(CLK), 
        .RN(n350), .Q(REG0[4]) );
  SDFFRQX2M \mem_reg[0][3]  ( .D(n311), .SI(REG0[2]), .SE(n373), .CK(CLK), 
        .RN(n350), .Q(REG0[3]) );
  SDFFRQX2M \mem_reg[0][2]  ( .D(n310), .SI(REG0[1]), .SE(n372), .CK(CLK), 
        .RN(n350), .Q(REG0[2]) );
  SDFFRQX2M \mem_reg[0][1]  ( .D(n309), .SI(REG0[0]), .SE(n371), .CK(CLK), 
        .RN(n350), .Q(REG0[1]) );
  SDFFRQX2M \mem_reg[0][0]  ( .D(n308), .SI(RdData[7]), .SE(n374), .CK(CLK), 
        .RN(n350), .Q(REG0[0]) );
  SDFFRQX2M \mem_reg[2][1]  ( .D(n293), .SI(REG2[0]), .SE(n373), .CK(CLK), 
        .RN(n349), .Q(REG2[1]) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n187), .SI(RdData[6]), .SE(n372), .CK(CLK), 
        .RN(n341), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n186), .SI(RdData[5]), .SE(n371), .CK(CLK), 
        .RN(n341), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n185), .SI(RdData[4]), .SE(n374), .CK(CLK), 
        .RN(n341), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n184), .SI(RdData[3]), .SE(n373), .CK(CLK), 
        .RN(n341), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n183), .SI(RdData[2]), .SE(n372), .CK(CLK), 
        .RN(n341), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n182), .SI(RdData[1]), .SE(n371), .CK(CLK), 
        .RN(n341), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n181), .SI(RdData[0]), .SE(n374), .CK(CLK), 
        .RN(n341), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n180), .SI(RdData_Valid), .SE(n373), .CK(CLK), 
        .RN(n341), .Q(RdData[0]) );
  SDFFRQX2M RdData_Valid_reg ( .D(n179), .SI(test_si1), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(RdData_Valid) );
  SDFFSQX2M \mem_reg[2][0]  ( .D(n292), .SI(REG1[7]), .SE(test_se), .CK(CLK), 
        .SN(n341), .Q(REG2[0]) );
  SDFFRQX2M \mem_reg[1][4]  ( .D(n304), .SI(REG1[3]), .SE(n371), .CK(CLK), 
        .RN(n350), .Q(REG1[4]) );
  SDFFRQX2M \mem_reg[1][1]  ( .D(n301), .SI(REG1[0]), .SE(n374), .CK(CLK), 
        .RN(n349), .Q(REG1[1]) );
  SDFFRQX2M \mem_reg[1][3]  ( .D(n303), .SI(REG1[2]), .SE(n373), .CK(CLK), 
        .RN(n350), .Q(REG1[3]) );
  SDFFRQX2M \mem_reg[1][2]  ( .D(n302), .SI(REG1[1]), .SE(n372), .CK(CLK), 
        .RN(n349), .Q(REG1[2]) );
  SDFFRQX2M \mem_reg[3][7]  ( .D(n291), .SI(REG3[6]), .SE(n371), .CK(CLK), 
        .RN(n349), .Q(REG3[7]) );
  SDFFRQX2M \mem_reg[3][4]  ( .D(n288), .SI(REG3[3]), .SE(n374), .CK(CLK), 
        .RN(n349), .Q(REG3[4]) );
  SDFFRQX2M \mem_reg[3][6]  ( .D(n290), .SI(REG3[5]), .SE(n373), .CK(CLK), 
        .RN(n349), .Q(REG3[6]) );
  SDFFSQX2M \mem_reg[3][5]  ( .D(n289), .SI(REG3[4]), .SE(n371), .CK(CLK), 
        .SN(n341), .Q(REG3[5]) );
  SDFFRQX2M \mem_reg[3][2]  ( .D(n286), .SI(REG3[1]), .SE(n372), .CK(CLK), 
        .RN(n349), .Q(REG3[2]) );
  SDFFRQX2M \mem_reg[3][3]  ( .D(n287), .SI(test_si2), .SE(n371), .CK(CLK), 
        .RN(n349), .Q(REG3[3]) );
  SDFFRQX2M \mem_reg[3][1]  ( .D(n285), .SI(REG3[0]), .SE(n374), .CK(CLK), 
        .RN(n348), .Q(REG3[1]) );
  SDFFSQX2M \mem_reg[2][7]  ( .D(n299), .SI(REG2[6]), .SE(n374), .CK(CLK), 
        .SN(n341), .Q(REG2[7]) );
  SDFFRQX2M \mem_reg[2][4]  ( .D(n296), .SI(REG2[3]), .SE(n373), .CK(CLK), 
        .RN(n349), .Q(REG2[4]) );
  SDFFRQX2M \mem_reg[2][3]  ( .D(n295), .SI(REG2[2]), .SE(n372), .CK(CLK), 
        .RN(n349), .Q(REG2[3]) );
  SDFFRQX2M \mem_reg[2][2]  ( .D(n294), .SI(REG2[1]), .SE(n371), .CK(CLK), 
        .RN(n349), .Q(REG2[2]) );
  SDFFRQX2M \mem_reg[2][6]  ( .D(n298), .SI(REG2[5]), .SE(n374), .CK(CLK), 
        .RN(n349), .Q(REG2[6]) );
  SDFFRQX2M \mem_reg[2][5]  ( .D(n297), .SI(REG2[4]), .SE(n373), .CK(CLK), 
        .RN(n349), .Q(REG2[5]) );
  SDFFRQX2M \mem_reg[1][0]  ( .D(n300), .SI(REG0[7]), .SE(n372), .CK(CLK), 
        .RN(n349), .Q(REG1[0]) );
  NOR2X2M U140 ( .A(n340), .B(N13), .Y(n162) );
  NOR2X2M U141 ( .A(N12), .B(N13), .Y(n165) );
  NOR2X2M U142 ( .A(n366), .B(n340), .Y(n154) );
  INVX2M U143 ( .A(n339), .Y(n337) );
  INVX2M U144 ( .A(n335), .Y(n336) );
  NAND2X2M U145 ( .A(n159), .B(n155), .Y(n158) );
  NAND2X2M U146 ( .A(n169), .B(n159), .Y(n172) );
  INVX2M U147 ( .A(n152), .Y(n364) );
  BUFX2M U148 ( .A(n340), .Y(n335) );
  NOR2X2M U149 ( .A(n366), .B(N12), .Y(n159) );
  NAND2X2M U150 ( .A(n169), .B(n162), .Y(n174) );
  NAND2X2M U151 ( .A(n171), .B(n162), .Y(n175) );
  NAND2X2M U152 ( .A(n169), .B(n165), .Y(n176) );
  NAND2X2M U153 ( .A(n171), .B(n165), .Y(n178) );
  NAND2X2M U154 ( .A(n159), .B(n157), .Y(n160) );
  NAND2X2M U155 ( .A(n162), .B(n155), .Y(n161) );
  NAND2X2M U156 ( .A(n162), .B(n157), .Y(n163) );
  NAND2X2M U157 ( .A(n165), .B(n155), .Y(n164) );
  NAND2X2M U158 ( .A(n165), .B(n157), .Y(n167) );
  NAND2X2M U159 ( .A(n157), .B(n154), .Y(n156) );
  NAND2X2M U160 ( .A(n169), .B(n154), .Y(n168) );
  NAND2X2M U161 ( .A(n171), .B(n154), .Y(n170) );
  NAND2X2M U162 ( .A(n171), .B(n159), .Y(n173) );
  NAND2X2M U163 ( .A(n154), .B(n155), .Y(n153) );
  NAND2X2M U164 ( .A(RdEn), .B(n365), .Y(n152) );
  NOR2X2M U165 ( .A(n365), .B(RdEn), .Y(n151) );
  AND2X2M U166 ( .A(n166), .B(n338), .Y(n155) );
  AND2X2M U167 ( .A(n177), .B(n338), .Y(n169) );
  BUFX2M U168 ( .A(n355), .Y(n342) );
  BUFX2M U169 ( .A(n354), .Y(n343) );
  BUFX2M U170 ( .A(n354), .Y(n344) );
  BUFX2M U171 ( .A(n353), .Y(n345) );
  BUFX2M U172 ( .A(n353), .Y(n346) );
  BUFX2M U173 ( .A(n352), .Y(n347) );
  BUFX2M U174 ( .A(n352), .Y(n348) );
  BUFX2M U175 ( .A(n351), .Y(n349) );
  BUFX2M U176 ( .A(n355), .Y(n341) );
  BUFX2M U177 ( .A(n351), .Y(n350) );
  INVX2M U178 ( .A(WrData[0]), .Y(n356) );
  INVX2M U179 ( .A(WrData[1]), .Y(n357) );
  INVX2M U180 ( .A(WrData[2]), .Y(n358) );
  INVX2M U181 ( .A(WrData[3]), .Y(n359) );
  INVX2M U182 ( .A(WrData[4]), .Y(n360) );
  INVX2M U183 ( .A(WrData[5]), .Y(n361) );
  INVX2M U184 ( .A(N13), .Y(n366) );
  NOR2BX2M U185 ( .AN(n151), .B(N14), .Y(n177) );
  AND2X2M U186 ( .A(n166), .B(n339), .Y(n157) );
  AND2X2M U187 ( .A(n177), .B(n339), .Y(n171) );
  AND2X2M U188 ( .A(N14), .B(n151), .Y(n166) );
  INVX2M U189 ( .A(WrEn), .Y(n365) );
  INVX2M U190 ( .A(n339), .Y(n338) );
  BUFX2M U191 ( .A(RST), .Y(n354) );
  BUFX2M U192 ( .A(RST), .Y(n353) );
  BUFX2M U193 ( .A(RST), .Y(n352) );
  BUFX2M U194 ( .A(RST), .Y(n351) );
  BUFX2M U195 ( .A(RST), .Y(n355) );
  INVX2M U196 ( .A(WrData[6]), .Y(n362) );
  INVX2M U197 ( .A(WrData[7]), .Y(n363) );
  OAI2BB2X1M U198 ( .B0(n153), .B1(n356), .A0N(\mem[15][0] ), .A1N(n153), .Y(
        n188) );
  OAI2BB2X1M U199 ( .B0(n153), .B1(n357), .A0N(\mem[15][1] ), .A1N(n153), .Y(
        n189) );
  OAI2BB2X1M U200 ( .B0(n153), .B1(n358), .A0N(\mem[15][2] ), .A1N(n153), .Y(
        n190) );
  OAI2BB2X1M U201 ( .B0(n153), .B1(n359), .A0N(\mem[15][3] ), .A1N(n153), .Y(
        n191) );
  OAI2BB2X1M U202 ( .B0(n153), .B1(n360), .A0N(\mem[15][4] ), .A1N(n153), .Y(
        n192) );
  OAI2BB2X1M U203 ( .B0(n153), .B1(n361), .A0N(\mem[15][5] ), .A1N(n153), .Y(
        n193) );
  OAI2BB2X1M U204 ( .B0(n153), .B1(n362), .A0N(\mem[15][6] ), .A1N(n153), .Y(
        n194) );
  OAI2BB2X1M U205 ( .B0(n153), .B1(n363), .A0N(\mem[15][7] ), .A1N(n153), .Y(
        n195) );
  OAI2BB2X1M U206 ( .B0(n356), .B1(n161), .A0N(\mem[11][0] ), .A1N(n161), .Y(
        n220) );
  OAI2BB2X1M U207 ( .B0(n357), .B1(n161), .A0N(\mem[11][1] ), .A1N(n161), .Y(
        n221) );
  OAI2BB2X1M U208 ( .B0(n358), .B1(n161), .A0N(\mem[11][2] ), .A1N(n161), .Y(
        n222) );
  OAI2BB2X1M U209 ( .B0(n359), .B1(n161), .A0N(\mem[11][3] ), .A1N(n161), .Y(
        n223) );
  OAI2BB2X1M U210 ( .B0(n360), .B1(n161), .A0N(\mem[11][4] ), .A1N(n161), .Y(
        n224) );
  OAI2BB2X1M U211 ( .B0(n361), .B1(n161), .A0N(\mem[11][5] ), .A1N(n161), .Y(
        n225) );
  OAI2BB2X1M U212 ( .B0(n362), .B1(n161), .A0N(\mem[11][6] ), .A1N(n161), .Y(
        n226) );
  OAI2BB2X1M U213 ( .B0(n363), .B1(n161), .A0N(\mem[11][7] ), .A1N(n161), .Y(
        n227) );
  OAI2BB2X1M U214 ( .B0(n356), .B1(n163), .A0N(\mem[10][0] ), .A1N(n163), .Y(
        n228) );
  OAI2BB2X1M U215 ( .B0(n357), .B1(n163), .A0N(\mem[10][1] ), .A1N(n163), .Y(
        n229) );
  OAI2BB2X1M U216 ( .B0(n358), .B1(n163), .A0N(\mem[10][2] ), .A1N(n163), .Y(
        n230) );
  OAI2BB2X1M U217 ( .B0(n359), .B1(n163), .A0N(\mem[10][3] ), .A1N(n163), .Y(
        n231) );
  OAI2BB2X1M U218 ( .B0(n360), .B1(n163), .A0N(\mem[10][4] ), .A1N(n163), .Y(
        n232) );
  OAI2BB2X1M U219 ( .B0(n361), .B1(n163), .A0N(\mem[10][5] ), .A1N(n163), .Y(
        n233) );
  OAI2BB2X1M U220 ( .B0(n362), .B1(n163), .A0N(\mem[10][6] ), .A1N(n163), .Y(
        n234) );
  OAI2BB2X1M U221 ( .B0(n363), .B1(n163), .A0N(\mem[10][7] ), .A1N(n163), .Y(
        n235) );
  OAI2BB2X1M U222 ( .B0(n356), .B1(n164), .A0N(\mem[9][0] ), .A1N(n164), .Y(
        n236) );
  OAI2BB2X1M U223 ( .B0(n357), .B1(n164), .A0N(\mem[9][1] ), .A1N(n164), .Y(
        n237) );
  OAI2BB2X1M U224 ( .B0(n358), .B1(n164), .A0N(\mem[9][2] ), .A1N(n164), .Y(
        n238) );
  OAI2BB2X1M U225 ( .B0(n359), .B1(n164), .A0N(\mem[9][3] ), .A1N(n164), .Y(
        n239) );
  OAI2BB2X1M U226 ( .B0(n360), .B1(n164), .A0N(\mem[9][4] ), .A1N(n164), .Y(
        n240) );
  OAI2BB2X1M U227 ( .B0(n361), .B1(n164), .A0N(\mem[9][5] ), .A1N(n164), .Y(
        n241) );
  OAI2BB2X1M U228 ( .B0(n362), .B1(n164), .A0N(\mem[9][6] ), .A1N(n164), .Y(
        n242) );
  OAI2BB2X1M U229 ( .B0(n363), .B1(n164), .A0N(\mem[9][7] ), .A1N(n164), .Y(
        n243) );
  OAI2BB2X1M U230 ( .B0(n356), .B1(n167), .A0N(\mem[8][0] ), .A1N(n167), .Y(
        n244) );
  OAI2BB2X1M U231 ( .B0(n357), .B1(n167), .A0N(\mem[8][1] ), .A1N(n167), .Y(
        n245) );
  OAI2BB2X1M U232 ( .B0(n358), .B1(n167), .A0N(\mem[8][2] ), .A1N(n167), .Y(
        n246) );
  OAI2BB2X1M U233 ( .B0(n359), .B1(n167), .A0N(\mem[8][3] ), .A1N(n167), .Y(
        n247) );
  OAI2BB2X1M U234 ( .B0(n360), .B1(n167), .A0N(\mem[8][4] ), .A1N(n167), .Y(
        n248) );
  OAI2BB2X1M U235 ( .B0(n361), .B1(n167), .A0N(\mem[8][5] ), .A1N(n167), .Y(
        n249) );
  OAI2BB2X1M U236 ( .B0(n362), .B1(n167), .A0N(\mem[8][6] ), .A1N(n167), .Y(
        n250) );
  OAI2BB2X1M U237 ( .B0(n363), .B1(n167), .A0N(\mem[8][7] ), .A1N(n167), .Y(
        n251) );
  OAI2BB2X1M U238 ( .B0(n356), .B1(n158), .A0N(\mem[13][0] ), .A1N(n158), .Y(
        n204) );
  OAI2BB2X1M U239 ( .B0(n357), .B1(n158), .A0N(\mem[13][1] ), .A1N(n158), .Y(
        n205) );
  OAI2BB2X1M U240 ( .B0(n358), .B1(n158), .A0N(\mem[13][2] ), .A1N(n158), .Y(
        n206) );
  OAI2BB2X1M U241 ( .B0(n359), .B1(n158), .A0N(\mem[13][3] ), .A1N(n158), .Y(
        n207) );
  OAI2BB2X1M U242 ( .B0(n360), .B1(n158), .A0N(\mem[13][4] ), .A1N(n158), .Y(
        n208) );
  OAI2BB2X1M U243 ( .B0(n361), .B1(n158), .A0N(\mem[13][5] ), .A1N(n158), .Y(
        n209) );
  OAI2BB2X1M U244 ( .B0(n362), .B1(n158), .A0N(\mem[13][6] ), .A1N(n158), .Y(
        n210) );
  OAI2BB2X1M U245 ( .B0(n363), .B1(n158), .A0N(\mem[13][7] ), .A1N(n158), .Y(
        n211) );
  OAI2BB2X1M U246 ( .B0(n356), .B1(n160), .A0N(\mem[12][0] ), .A1N(n160), .Y(
        n212) );
  OAI2BB2X1M U247 ( .B0(n357), .B1(n160), .A0N(\mem[12][1] ), .A1N(n160), .Y(
        n213) );
  OAI2BB2X1M U248 ( .B0(n358), .B1(n160), .A0N(\mem[12][2] ), .A1N(n160), .Y(
        n214) );
  OAI2BB2X1M U249 ( .B0(n359), .B1(n160), .A0N(\mem[12][3] ), .A1N(n160), .Y(
        n215) );
  OAI2BB2X1M U250 ( .B0(n360), .B1(n160), .A0N(\mem[12][4] ), .A1N(n160), .Y(
        n216) );
  OAI2BB2X1M U251 ( .B0(n361), .B1(n160), .A0N(\mem[12][5] ), .A1N(n160), .Y(
        n217) );
  OAI2BB2X1M U252 ( .B0(n362), .B1(n160), .A0N(\mem[12][6] ), .A1N(n160), .Y(
        n218) );
  OAI2BB2X1M U253 ( .B0(n363), .B1(n160), .A0N(\mem[12][7] ), .A1N(n160), .Y(
        n219) );
  OAI2BB2X1M U254 ( .B0(n356), .B1(n174), .A0N(REG3[0]), .A1N(n174), .Y(n284)
         );
  OAI2BB2X1M U255 ( .B0(n357), .B1(n174), .A0N(REG3[1]), .A1N(n174), .Y(n285)
         );
  OAI2BB2X1M U256 ( .B0(n358), .B1(n174), .A0N(REG3[2]), .A1N(n174), .Y(n286)
         );
  OAI2BB2X1M U257 ( .B0(n359), .B1(n174), .A0N(REG3[3]), .A1N(n174), .Y(n287)
         );
  OAI2BB2X1M U258 ( .B0(n360), .B1(n174), .A0N(REG3[4]), .A1N(n174), .Y(n288)
         );
  OAI2BB2X1M U259 ( .B0(n362), .B1(n174), .A0N(REG3[6]), .A1N(n174), .Y(n290)
         );
  OAI2BB2X1M U260 ( .B0(n363), .B1(n174), .A0N(REG3[7]), .A1N(n174), .Y(n291)
         );
  OAI2BB2X1M U261 ( .B0(n357), .B1(n175), .A0N(REG2[1]), .A1N(n175), .Y(n293)
         );
  OAI2BB2X1M U262 ( .B0(n358), .B1(n175), .A0N(REG2[2]), .A1N(n175), .Y(n294)
         );
  OAI2BB2X1M U263 ( .B0(n359), .B1(n175), .A0N(REG2[3]), .A1N(n175), .Y(n295)
         );
  OAI2BB2X1M U264 ( .B0(n360), .B1(n175), .A0N(REG2[4]), .A1N(n175), .Y(n296)
         );
  OAI2BB2X1M U265 ( .B0(n361), .B1(n175), .A0N(REG2[5]), .A1N(n175), .Y(n297)
         );
  OAI2BB2X1M U266 ( .B0(n362), .B1(n175), .A0N(REG2[6]), .A1N(n175), .Y(n298)
         );
  OAI2BB2X1M U267 ( .B0(n356), .B1(n176), .A0N(REG1[0]), .A1N(n176), .Y(n300)
         );
  OAI2BB2X1M U268 ( .B0(n357), .B1(n176), .A0N(REG1[1]), .A1N(n176), .Y(n301)
         );
  OAI2BB2X1M U269 ( .B0(n358), .B1(n176), .A0N(REG1[2]), .A1N(n176), .Y(n302)
         );
  OAI2BB2X1M U270 ( .B0(n359), .B1(n176), .A0N(REG1[3]), .A1N(n176), .Y(n303)
         );
  OAI2BB2X1M U271 ( .B0(n360), .B1(n176), .A0N(REG1[4]), .A1N(n176), .Y(n304)
         );
  OAI2BB2X1M U272 ( .B0(n361), .B1(n176), .A0N(REG1[5]), .A1N(n176), .Y(n305)
         );
  OAI2BB2X1M U273 ( .B0(n362), .B1(n176), .A0N(REG1[6]), .A1N(n176), .Y(n306)
         );
  OAI2BB2X1M U274 ( .B0(n363), .B1(n176), .A0N(REG1[7]), .A1N(n176), .Y(n307)
         );
  OAI2BB2X1M U275 ( .B0(n356), .B1(n178), .A0N(REG0[0]), .A1N(n178), .Y(n308)
         );
  OAI2BB2X1M U276 ( .B0(n357), .B1(n178), .A0N(REG0[1]), .A1N(n178), .Y(n309)
         );
  OAI2BB2X1M U277 ( .B0(n358), .B1(n178), .A0N(REG0[2]), .A1N(n178), .Y(n310)
         );
  OAI2BB2X1M U278 ( .B0(n359), .B1(n178), .A0N(REG0[3]), .A1N(n178), .Y(n311)
         );
  OAI2BB2X1M U279 ( .B0(n360), .B1(n178), .A0N(REG0[4]), .A1N(n178), .Y(n312)
         );
  OAI2BB2X1M U280 ( .B0(n361), .B1(n178), .A0N(REG0[5]), .A1N(n178), .Y(n313)
         );
  OAI2BB2X1M U281 ( .B0(n362), .B1(n178), .A0N(REG0[6]), .A1N(n178), .Y(n314)
         );
  OAI2BB2X1M U282 ( .B0(n363), .B1(n178), .A0N(REG0[7]), .A1N(n178), .Y(n315)
         );
  OAI2BB2X1M U283 ( .B0(n356), .B1(n156), .A0N(\mem[14][0] ), .A1N(n156), .Y(
        n196) );
  OAI2BB2X1M U284 ( .B0(n357), .B1(n156), .A0N(\mem[14][1] ), .A1N(n156), .Y(
        n197) );
  OAI2BB2X1M U285 ( .B0(n358), .B1(n156), .A0N(\mem[14][2] ), .A1N(n156), .Y(
        n198) );
  OAI2BB2X1M U286 ( .B0(n359), .B1(n156), .A0N(\mem[14][3] ), .A1N(n156), .Y(
        n199) );
  OAI2BB2X1M U287 ( .B0(n360), .B1(n156), .A0N(\mem[14][4] ), .A1N(n156), .Y(
        n200) );
  OAI2BB2X1M U288 ( .B0(n361), .B1(n156), .A0N(\mem[14][5] ), .A1N(n156), .Y(
        n201) );
  OAI2BB2X1M U289 ( .B0(n362), .B1(n156), .A0N(\mem[14][6] ), .A1N(n156), .Y(
        n202) );
  OAI2BB2X1M U290 ( .B0(n363), .B1(n156), .A0N(\mem[14][7] ), .A1N(n156), .Y(
        n203) );
  OAI2BB2X1M U291 ( .B0(n356), .B1(n168), .A0N(\mem[7][0] ), .A1N(n168), .Y(
        n252) );
  OAI2BB2X1M U292 ( .B0(n357), .B1(n168), .A0N(\mem[7][1] ), .A1N(n168), .Y(
        n253) );
  OAI2BB2X1M U293 ( .B0(n358), .B1(n168), .A0N(\mem[7][2] ), .A1N(n168), .Y(
        n254) );
  OAI2BB2X1M U294 ( .B0(n359), .B1(n168), .A0N(\mem[7][3] ), .A1N(n168), .Y(
        n255) );
  OAI2BB2X1M U295 ( .B0(n360), .B1(n168), .A0N(\mem[7][4] ), .A1N(n168), .Y(
        n256) );
  OAI2BB2X1M U296 ( .B0(n361), .B1(n168), .A0N(\mem[7][5] ), .A1N(n168), .Y(
        n257) );
  OAI2BB2X1M U297 ( .B0(n362), .B1(n168), .A0N(\mem[7][6] ), .A1N(n168), .Y(
        n258) );
  OAI2BB2X1M U298 ( .B0(n363), .B1(n168), .A0N(\mem[7][7] ), .A1N(n168), .Y(
        n259) );
  OAI2BB2X1M U299 ( .B0(n356), .B1(n170), .A0N(\mem[6][0] ), .A1N(n170), .Y(
        n260) );
  OAI2BB2X1M U300 ( .B0(n357), .B1(n170), .A0N(\mem[6][1] ), .A1N(n170), .Y(
        n261) );
  OAI2BB2X1M U301 ( .B0(n358), .B1(n170), .A0N(\mem[6][2] ), .A1N(n170), .Y(
        n262) );
  OAI2BB2X1M U302 ( .B0(n359), .B1(n170), .A0N(\mem[6][3] ), .A1N(n170), .Y(
        n263) );
  OAI2BB2X1M U303 ( .B0(n360), .B1(n170), .A0N(\mem[6][4] ), .A1N(n170), .Y(
        n264) );
  OAI2BB2X1M U304 ( .B0(n361), .B1(n170), .A0N(\mem[6][5] ), .A1N(n170), .Y(
        n265) );
  OAI2BB2X1M U305 ( .B0(n362), .B1(n170), .A0N(\mem[6][6] ), .A1N(n170), .Y(
        n266) );
  OAI2BB2X1M U306 ( .B0(n363), .B1(n170), .A0N(\mem[6][7] ), .A1N(n170), .Y(
        n267) );
  OAI2BB2X1M U307 ( .B0(n356), .B1(n172), .A0N(\mem[5][0] ), .A1N(n172), .Y(
        n268) );
  OAI2BB2X1M U308 ( .B0(n357), .B1(n172), .A0N(\mem[5][1] ), .A1N(n172), .Y(
        n269) );
  OAI2BB2X1M U309 ( .B0(n358), .B1(n172), .A0N(\mem[5][2] ), .A1N(n172), .Y(
        n270) );
  OAI2BB2X1M U310 ( .B0(n359), .B1(n172), .A0N(\mem[5][3] ), .A1N(n172), .Y(
        n271) );
  OAI2BB2X1M U311 ( .B0(n360), .B1(n172), .A0N(\mem[5][4] ), .A1N(n172), .Y(
        n272) );
  OAI2BB2X1M U312 ( .B0(n361), .B1(n172), .A0N(\mem[5][5] ), .A1N(n172), .Y(
        n273) );
  OAI2BB2X1M U313 ( .B0(n362), .B1(n172), .A0N(\mem[5][6] ), .A1N(n172), .Y(
        n274) );
  OAI2BB2X1M U314 ( .B0(n363), .B1(n172), .A0N(\mem[5][7] ), .A1N(n172), .Y(
        n275) );
  OAI2BB2X1M U315 ( .B0(n356), .B1(n173), .A0N(\mem[4][0] ), .A1N(n173), .Y(
        n276) );
  OAI2BB2X1M U316 ( .B0(n357), .B1(n173), .A0N(\mem[4][1] ), .A1N(n173), .Y(
        n277) );
  OAI2BB2X1M U317 ( .B0(n358), .B1(n173), .A0N(\mem[4][2] ), .A1N(n173), .Y(
        n278) );
  OAI2BB2X1M U318 ( .B0(n359), .B1(n173), .A0N(\mem[4][3] ), .A1N(n173), .Y(
        n279) );
  OAI2BB2X1M U319 ( .B0(n360), .B1(n173), .A0N(\mem[4][4] ), .A1N(n173), .Y(
        n280) );
  OAI2BB2X1M U320 ( .B0(n361), .B1(n173), .A0N(\mem[4][5] ), .A1N(n173), .Y(
        n281) );
  OAI2BB2X1M U321 ( .B0(n362), .B1(n173), .A0N(\mem[4][6] ), .A1N(n173), .Y(
        n282) );
  OAI2BB2X1M U322 ( .B0(n363), .B1(n173), .A0N(\mem[4][7] ), .A1N(n173), .Y(
        n283) );
  OAI2BB2X1M U323 ( .B0(n361), .B1(n174), .A0N(REG3[5]), .A1N(n174), .Y(n289)
         );
  OAI2BB2X1M U324 ( .B0(n356), .B1(n175), .A0N(REG2[0]), .A1N(n175), .Y(n292)
         );
  OAI2BB2X1M U325 ( .B0(n363), .B1(n175), .A0N(REG2[7]), .A1N(n175), .Y(n299)
         );
  AO22X1M U326 ( .A0(N43), .A1(n364), .B0(RdData[0]), .B1(n152), .Y(n180) );
  MX4X1M U327 ( .A(n141), .B(n139), .C(n140), .D(n138), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U328 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n141) );
  MX4X1M U329 ( .A(\mem[8][0] ), .B(\mem[9][0] ), .C(\mem[10][0] ), .D(
        \mem[11][0] ), .S0(N11), .S1(N12), .Y(n139) );
  AO22X1M U330 ( .A0(N42), .A1(n364), .B0(RdData[1]), .B1(n152), .Y(n181) );
  MX4X1M U331 ( .A(n145), .B(n143), .C(n144), .D(n142), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U332 ( .A(\mem[8][1] ), .B(\mem[9][1] ), .C(\mem[10][1] ), .D(
        \mem[11][1] ), .S0(N11), .S1(N12), .Y(n143) );
  MX4X1M U333 ( .A(\mem[12][1] ), .B(\mem[13][1] ), .C(\mem[14][1] ), .D(
        \mem[15][1] ), .S0(n338), .S1(N12), .Y(n142) );
  AO22X1M U334 ( .A0(N41), .A1(n364), .B0(RdData[2]), .B1(n152), .Y(n182) );
  MX4X1M U335 ( .A(n149), .B(n147), .C(n148), .D(n146), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U336 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n337), 
        .S1(n336), .Y(n149) );
  MX4X1M U337 ( .A(\mem[8][2] ), .B(\mem[9][2] ), .C(\mem[10][2] ), .D(
        \mem[11][2] ), .S0(n337), .S1(n336), .Y(n147) );
  AO22X1M U338 ( .A0(N40), .A1(n364), .B0(RdData[3]), .B1(n152), .Y(n183) );
  MX4X1M U339 ( .A(n318), .B(n316), .C(n317), .D(n150), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U340 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n337), 
        .S1(n336), .Y(n318) );
  MX4X1M U341 ( .A(\mem[8][3] ), .B(\mem[9][3] ), .C(\mem[10][3] ), .D(
        \mem[11][3] ), .S0(n337), .S1(n336), .Y(n316) );
  AO22X1M U342 ( .A0(N39), .A1(n364), .B0(RdData[4]), .B1(n152), .Y(n184) );
  MX4X1M U343 ( .A(n322), .B(n320), .C(n321), .D(n319), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U344 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(N11), 
        .S1(n336), .Y(n322) );
  MX4X1M U345 ( .A(\mem[8][4] ), .B(\mem[9][4] ), .C(\mem[10][4] ), .D(
        \mem[11][4] ), .S0(n337), .S1(n336), .Y(n320) );
  AO22X1M U346 ( .A0(N38), .A1(n364), .B0(RdData[5]), .B1(n152), .Y(n185) );
  MX4X1M U347 ( .A(n326), .B(n324), .C(n325), .D(n323), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U348 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(N11), 
        .S1(N12), .Y(n326) );
  MX4X1M U349 ( .A(\mem[8][5] ), .B(\mem[9][5] ), .C(\mem[10][5] ), .D(
        \mem[11][5] ), .S0(N11), .S1(N12), .Y(n324) );
  AO22X1M U350 ( .A0(N37), .A1(n364), .B0(RdData[6]), .B1(n152), .Y(n186) );
  MX4X1M U351 ( .A(n330), .B(n328), .C(n329), .D(n327), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U352 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n338), 
        .S1(N12), .Y(n330) );
  MX4X1M U353 ( .A(\mem[8][6] ), .B(\mem[9][6] ), .C(\mem[10][6] ), .D(
        \mem[11][6] ), .S0(N11), .S1(N12), .Y(n328) );
  AO22X1M U354 ( .A0(N36), .A1(n364), .B0(RdData[7]), .B1(n152), .Y(n187) );
  MX4X1M U355 ( .A(n334), .B(n332), .C(n333), .D(n331), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U356 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n338), 
        .S1(N12), .Y(n334) );
  MX4X1M U357 ( .A(\mem[8][7] ), .B(\mem[9][7] ), .C(\mem[10][7] ), .D(
        \mem[11][7] ), .S0(N11), .S1(N12), .Y(n332) );
  MX4X1M U358 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n337), 
        .S1(N12), .Y(n145) );
  MX4X1M U359 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n338), .S1(N12), .Y(n140) );
  MX4X1M U360 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n337), .S1(N12), .Y(n144) );
  MX4X1M U361 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n337), .S1(n336), .Y(n148) );
  MX4X1M U362 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n337), .S1(n336), .Y(n317) );
  MX4X1M U363 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n337), .S1(n336), .Y(n321) );
  MX4X1M U364 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(N11), .S1(N12), .Y(n325) );
  MX4X1M U365 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(N11), .S1(N12), .Y(n329) );
  MX4X1M U366 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(N11), .S1(N12), .Y(n333) );
  MX4X1M U367 ( .A(\mem[12][0] ), .B(\mem[13][0] ), .C(\mem[14][0] ), .D(
        \mem[15][0] ), .S0(n337), .S1(n336), .Y(n138) );
  MX4X1M U368 ( .A(\mem[12][2] ), .B(\mem[13][2] ), .C(\mem[14][2] ), .D(
        \mem[15][2] ), .S0(n337), .S1(n336), .Y(n146) );
  MX4X1M U369 ( .A(\mem[12][3] ), .B(\mem[13][3] ), .C(\mem[14][3] ), .D(
        \mem[15][3] ), .S0(n337), .S1(n336), .Y(n150) );
  MX4X1M U370 ( .A(\mem[12][4] ), .B(\mem[13][4] ), .C(\mem[14][4] ), .D(
        \mem[15][4] ), .S0(n337), .S1(n336), .Y(n319) );
  MX4X1M U371 ( .A(\mem[12][5] ), .B(\mem[13][5] ), .C(\mem[14][5] ), .D(
        \mem[15][5] ), .S0(N11), .S1(N12), .Y(n323) );
  MX4X1M U372 ( .A(\mem[12][6] ), .B(\mem[13][6] ), .C(\mem[14][6] ), .D(
        \mem[15][6] ), .S0(N11), .S1(N12), .Y(n327) );
  MX4X1M U373 ( .A(\mem[12][7] ), .B(\mem[13][7] ), .C(\mem[14][7] ), .D(
        \mem[15][7] ), .S0(N11), .S1(N12), .Y(n331) );
  INVX2M U374 ( .A(N12), .Y(n340) );
  AO21XLM U375 ( .A0(RdData_Valid), .A1(n151), .B0(n364), .Y(n179) );
  INVX2M U376 ( .A(N11), .Y(n339) );
  DLY1X1M U377 ( .A(test_se), .Y(n371) );
  DLY1X1M U378 ( .A(test_se), .Y(n372) );
  DLY1X1M U379 ( .A(test_se), .Y(n373) );
  DLY1X1M U380 ( .A(test_se), .Y(n374) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW_div_uns_0 ( a, b, 
        quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U9 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n19), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n19), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n19), .Y(n6) );
  NAND2X2M U19 ( .A(n8), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  INVX2M U21 ( .A(n19), .Y(n8) );
  NAND2X2M U22 ( .A(n6), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U23 ( .A(a[1]), .Y(n10) );
  NAND2X2M U24 ( .A(n4), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U25 ( .A(a[0]), .Y(n11) );
  INVX2M U26 ( .A(b[5]), .Y(n14) );
  NAND2X2M U27 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U28 ( .A(a[6]), .Y(n1) );
  INVX2M U29 ( .A(b[6]), .Y(n13) );
  INVX2M U30 ( .A(b[7]), .Y(n12) );
  INVX2M U31 ( .A(b[1]), .Y(n18) );
  INVX2M U32 ( .A(b[2]), .Y(n17) );
  INVX2M U33 ( .A(b[3]), .Y(n16) );
  INVX2M U34 ( .A(b[4]), .Y(n15) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_sub_0 ( A, B, 
        CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[5]), .Y(n4) );
  INVX2M U3 ( .A(B[6]), .Y(n3) );
  INVX2M U4 ( .A(B[7]), .Y(n2) );
  INVX2M U5 ( .A(B[0]), .Y(n9) );
  INVX2M U6 ( .A(B[2]), .Y(n7) );
  INVX2M U7 ( .A(B[3]), .Y(n6) );
  INVX2M U8 ( .A(B[4]), .Y(n5) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(B[1]), .Y(n8) );
  INVX2M U11 ( .A(A[0]), .Y(n1) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_0 ( A, B, 
        CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_1 ( A, B, 
        CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW02_mult_0 ( A, B, 
        TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n7), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n4), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U12 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U13 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  AND2X2M U15 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n11) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U17 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX2M U21 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U22 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U24 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U25 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U26 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U27 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  AND2X2M U28 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n13) );
  AND2X2M U29 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U30 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U31 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n24) );
  INVX2M U38 ( .A(A[6]), .Y(n25) );
  INVX2M U39 ( .A(A[1]), .Y(n30) );
  INVX2M U40 ( .A(B[6]), .Y(n33) );
  INVX2M U41 ( .A(A[0]), .Y(n31) );
  INVX2M U42 ( .A(A[2]), .Y(n29) );
  INVX2M U43 ( .A(A[3]), .Y(n28) );
  INVX2M U44 ( .A(A[4]), .Y(n27) );
  INVX2M U45 ( .A(A[5]), .Y(n26) );
  INVX2M U46 ( .A(B[7]), .Y(n32) );
  INVX2M U47 ( .A(B[5]), .Y(n34) );
  INVX2M U48 ( .A(B[0]), .Y(n39) );
  INVX2M U49 ( .A(B[2]), .Y(n37) );
  INVX2M U50 ( .A(B[3]), .Y(n36) );
  INVX2M U51 ( .A(B[1]), .Y(n38) );
  INVX2M U52 ( .A(B[4]), .Y(n35) );
  NOR2X1M U54 ( .A(n24), .B(n32), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n24), .B(n33), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n24), .B(n34), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n24), .B(n35), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n24), .B(n36), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n24), .B(n37), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n24), .B(n38), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n24), .B(n39), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n32), .B(n25), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n33), .B(n25), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n34), .B(n25), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n35), .B(n25), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n36), .B(n25), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n37), .B(n25), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n38), .B(n25), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n39), .B(n25), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n32), .B(n26), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n33), .B(n26), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n34), .B(n26), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n35), .B(n26), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n36), .B(n26), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n37), .B(n26), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n38), .B(n26), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n39), .B(n26), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n32), .B(n27), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n33), .B(n27), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n34), .B(n27), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n35), .B(n27), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n36), .B(n27), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n37), .B(n27), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n38), .B(n27), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n39), .B(n27), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n32), .B(n28), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n33), .B(n28), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n34), .B(n28), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n35), .B(n28), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n36), .B(n28), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n37), .B(n28), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n38), .B(n28), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n39), .B(n28), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n32), .B(n29), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n33), .B(n29), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n34), .B(n29), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n35), .B(n29), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n36), .B(n29), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n37), .B(n29), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n38), .B(n29), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n39), .B(n29), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n32), .B(n30), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n33), .B(n30), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n34), .B(n30), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n35), .B(n30), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n36), .B(n30), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n37), .B(n30), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n38), .B(n30), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n39), .B(n30), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n32), .B(n31), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n33), .B(n31), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n34), .B(n31), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n35), .B(n31), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n36), .B(n31), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n37), .B(n31), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n38), .B(n31), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n39), .B(n31), .Y(PRODUCT[0]) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_1 FS_1 ( .A({
        1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , 
        \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, 
        n11, n16, n14, n15, n13, n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_test_1 ( CLK, RST, 
        A, B, ALU_FUN, ALU_ENABLE, ALU_OUT, ALU_OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_ENABLE, test_si, test_se;
  output ALU_OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N127,
         N128, N129, N130, N131, N132, N133, N134, N167, N168, N169, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n3, n4, n5, n6, n7, n8, n9, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(ALU_OUT_VALID), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M ALU_OUT_VALID_reg ( .D(ALU_ENABLE), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(ALU_OUT_VALID) );
  BUFX2M U8 ( .A(A[6]), .Y(n30) );
  BUFX2M U23 ( .A(A[7]), .Y(n31) );
  OAI2BB1X2M U24 ( .A0N(N120), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U25 ( .A0N(N121), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U26 ( .A0N(N122), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U27 ( .A0N(N123), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U28 ( .A0N(N124), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U29 ( .A0N(N125), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[15]) );
  OAI21X2M U30 ( .A0(n130), .A1(n115), .B0(n131), .Y(n68) );
  OAI21X2M U31 ( .A0(n132), .A1(n129), .B0(n131), .Y(n66) );
  NOR2BX2M U32 ( .AN(n133), .B(n132), .Y(n56) );
  NOR2BX2M U33 ( .AN(n133), .B(n130), .Y(n71) );
  NOR2BX2M U34 ( .AN(n55), .B(n164), .Y(n50) );
  INVX2M U35 ( .A(n69), .Y(n165) );
  OR2X2M U36 ( .A(n52), .B(n164), .Y(n51) );
  BUFX2M U37 ( .A(n60), .Y(n32) );
  NOR2X2M U38 ( .A(n115), .B(n132), .Y(n60) );
  BUFX2M U39 ( .A(n67), .Y(n33) );
  NOR2X2M U40 ( .A(n129), .B(n130), .Y(n67) );
  INVX2M U41 ( .A(n129), .Y(n167) );
  OAI2BB1X2M U42 ( .A0N(N119), .A1N(n50), .B0(n51), .Y(ALU_OUT_Comb[9]) );
  NAND3BX2M U43 ( .AN(n115), .B(n3), .C(n166), .Y(n69) );
  NOR3X2M U44 ( .A(n132), .B(ALU_FUN[2]), .C(n168), .Y(n55) );
  NOR3X2M U45 ( .A(n168), .B(ALU_FUN[2]), .C(n130), .Y(n70) );
  NOR3BX2M U46 ( .AN(n118), .B(n32), .C(n159), .Y(n52) );
  AOI21X2M U47 ( .A0(N109), .A1(n71), .B0(n68), .Y(n118) );
  NOR4X1M U48 ( .A(n126), .B(n168), .C(ALU_FUN[2]), .D(ALU_FUN[0]), .Y(n123)
         );
  NAND2X2M U49 ( .A(N167), .B(n3), .Y(n126) );
  OAI22X1M U50 ( .A0(n77), .A1(n153), .B0(n69), .B1(n156), .Y(n105) );
  OAI22X1M U51 ( .A0(n77), .A1(n152), .B0(n69), .B1(n154), .Y(n98) );
  OAI22X1M U52 ( .A0(n151), .A1(n77), .B0(n69), .B1(n153), .Y(n91) );
  OAI22X1M U53 ( .A0(n150), .A1(n77), .B0(n69), .B1(n152), .Y(n84) );
  OAI22X1M U54 ( .A0(n149), .A1(n77), .B0(n69), .B1(n151), .Y(n76) );
  NOR2X2M U55 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n133) );
  NAND3X2M U56 ( .A(n3), .B(ALU_FUN[0]), .C(n167), .Y(n77) );
  NAND2X2M U57 ( .A(ALU_FUN[2]), .B(n168), .Y(n129) );
  AND3X2M U58 ( .A(n133), .B(n166), .C(n3), .Y(n65) );
  NAND2X2M U59 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n115) );
  INVX2M U60 ( .A(ALU_FUN[1]), .Y(n168) );
  AND4X2M U61 ( .A(N169), .B(n167), .C(n3), .D(n166), .Y(n113) );
  OR2X2M U62 ( .A(n3), .B(n166), .Y(n130) );
  OR2X2M U63 ( .A(n3), .B(ALU_FUN[0]), .Y(n132) );
  INVX2M U64 ( .A(ALU_FUN[0]), .Y(n166) );
  NAND3X2M U65 ( .A(n133), .B(ALU_FUN[0]), .C(n3), .Y(n131) );
  INVX2M U66 ( .A(ALU_ENABLE), .Y(n164) );
  INVX2M U67 ( .A(n5), .Y(n146) );
  AOI221XLM U68 ( .A0(n156), .A1(n68), .B0(n65), .B1(n8), .C0(n32), .Y(n117)
         );
  OAI222X1M U69 ( .A0(n69), .A1(n157), .B0(n114), .B1(n163), .C0(n77), .C1(
        n154), .Y(n112) );
  AOI221XLM U70 ( .A0(n65), .A1(n156), .B0(n8), .B1(n66), .C0(n33), .Y(n114)
         );
  OAI221X1M U71 ( .A0(n6), .A1(n62), .B0(n63), .B1(n158), .C0(n64), .Y(n61) );
  INVX2M U72 ( .A(n6), .Y(n158) );
  AOI221XLM U73 ( .A0(n65), .A1(n31), .B0(n68), .B1(n149), .C0(n32), .Y(n62)
         );
  AOI221XLM U74 ( .A0(n65), .A1(n149), .B0(n31), .B1(n66), .C0(n33), .Y(n63)
         );
  OAI221X1M U75 ( .A0(n5), .A1(n78), .B0(n79), .B1(n146), .C0(n64), .Y(n75) );
  AOI221XLM U76 ( .A0(n30), .A1(n65), .B0(n68), .B1(n150), .C0(n32), .Y(n78)
         );
  AOI221XLM U77 ( .A0(n65), .A1(n150), .B0(n30), .B1(n66), .C0(n33), .Y(n79)
         );
  OAI221X1M U78 ( .A0(n4), .A1(n85), .B0(n86), .B1(n160), .C0(n64), .Y(n83) );
  INVX2M U79 ( .A(n4), .Y(n160) );
  AOI221XLM U80 ( .A0(n29), .A1(n65), .B0(n68), .B1(n151), .C0(n32), .Y(n85)
         );
  AOI221XLM U81 ( .A0(n65), .A1(n151), .B0(n29), .B1(n66), .C0(n33), .Y(n86)
         );
  AOI32X1M U82 ( .A0(N168), .A1(n3), .A2(n116), .B0(n155), .B1(n163), .Y(n111)
         );
  INVX2M U83 ( .A(n117), .Y(n155) );
  NOR3X2M U84 ( .A(n166), .B(ALU_FUN[2]), .C(n168), .Y(n116) );
  AOI31X2M U85 ( .A0(n119), .A1(n120), .A2(n121), .B0(n164), .Y(
        ALU_OUT_Comb[0]) );
  NOR4X1M U86 ( .A(n122), .B(n123), .C(n159), .D(n113), .Y(n121) );
  AOI222X1M U87 ( .A0(N127), .A1(n70), .B0(n32), .B1(n157), .C0(n7), .C1(n33), 
        .Y(n120) );
  AOI222X1M U88 ( .A0(N92), .A1(n56), .B0(N110), .B1(n55), .C0(N101), .C1(n71), 
        .Y(n119) );
  AOI31X2M U89 ( .A0(n52), .A1(n53), .A2(n54), .B0(n164), .Y(ALU_OUT_Comb[8])
         );
  NAND2X2M U90 ( .A(N100), .B(n56), .Y(n53) );
  AOI22X1M U91 ( .A0(n31), .A1(n165), .B0(N118), .B1(n55), .Y(n54) );
  AOI31X2M U92 ( .A0(n108), .A1(n109), .A2(n110), .B0(n164), .Y(
        ALU_OUT_Comb[1]) );
  NOR4BX1M U93 ( .AN(n111), .B(n112), .C(n159), .D(n113), .Y(n110) );
  AOI222X1M U94 ( .A0(N128), .A1(n70), .B0(n32), .B1(n156), .C0(n8), .C1(n33), 
        .Y(n109) );
  AOI222X1M U95 ( .A0(N93), .A1(n56), .B0(N111), .B1(n55), .C0(N102), .C1(n71), 
        .Y(n108) );
  AOI31X2M U96 ( .A0(n101), .A1(n102), .A2(n103), .B0(n164), .Y(
        ALU_OUT_Comb[2]) );
  AOI22X1M U97 ( .A0(N103), .A1(n71), .B0(N94), .B1(n56), .Y(n101) );
  AOI211X2M U98 ( .A0(n32), .A1(n154), .B0(n104), .C0(n105), .Y(n103) );
  AOI222X1M U99 ( .A0(N112), .A1(n55), .B0(n9), .B1(n33), .C0(N129), .C1(n70), 
        .Y(n102) );
  AOI31X2M U100 ( .A0(n94), .A1(n95), .A2(n96), .B0(n164), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U101 ( .A0(N104), .A1(n71), .B0(N95), .B1(n56), .Y(n94) );
  AOI211X2M U102 ( .A0(n32), .A1(n153), .B0(n97), .C0(n98), .Y(n96) );
  AOI222X1M U103 ( .A0(N113), .A1(n55), .B0(n27), .B1(n33), .C0(N130), .C1(n70), .Y(n95) );
  AOI31X2M U104 ( .A0(n87), .A1(n88), .A2(n89), .B0(n164), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U105 ( .A0(N105), .A1(n71), .B0(N96), .B1(n56), .Y(n87) );
  AOI211X2M U106 ( .A0(n32), .A1(n152), .B0(n90), .C0(n91), .Y(n89) );
  AOI222X1M U107 ( .A0(N114), .A1(n55), .B0(n28), .B1(n33), .C0(N131), .C1(n70), .Y(n88) );
  AOI31X2M U108 ( .A0(n80), .A1(n81), .A2(n82), .B0(n164), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U109 ( .A0(N106), .A1(n71), .B0(N97), .B1(n56), .Y(n80) );
  AOI211X2M U110 ( .A0(n32), .A1(n151), .B0(n83), .C0(n84), .Y(n82) );
  AOI222X1M U111 ( .A0(N115), .A1(n55), .B0(n29), .B1(n33), .C0(N132), .C1(n70), .Y(n81) );
  AOI31X2M U112 ( .A0(n72), .A1(n73), .A2(n74), .B0(n164), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U113 ( .A0(N107), .A1(n71), .B0(N98), .B1(n56), .Y(n72) );
  AOI211X2M U114 ( .A0(n32), .A1(n150), .B0(n75), .C0(n76), .Y(n74) );
  AOI222X1M U115 ( .A0(N116), .A1(n55), .B0(n33), .B1(n30), .C0(N133), .C1(n70), .Y(n73) );
  AOI31X2M U116 ( .A0(n57), .A1(n58), .A2(n59), .B0(n164), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U117 ( .A0(N108), .A1(n71), .B0(N99), .B1(n56), .Y(n57) );
  AOI221XLM U118 ( .A0(n30), .A1(n165), .B0(n32), .B1(n149), .C0(n61), .Y(n59)
         );
  AOI222X1M U119 ( .A0(N117), .A1(n55), .B0(n33), .B1(n31), .C0(N134), .C1(n70), .Y(n58) );
  INVX2M U120 ( .A(n64), .Y(n159) );
  BUFX2M U121 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U122 ( .A(n29), .Y(n151) );
  INVX2M U123 ( .A(n27), .Y(n153) );
  INVX2M U124 ( .A(n28), .Y(n152) );
  INVX2M U125 ( .A(n8), .Y(n156) );
  INVX2M U126 ( .A(n9), .Y(n154) );
  INVX2M U127 ( .A(n30), .Y(n150) );
  INVX2M U128 ( .A(n31), .Y(n149) );
  INVX2M U129 ( .A(n7), .Y(n157) );
  OAI222X1M U130 ( .A0(n127), .A1(n144), .B0(B[0]), .B1(n128), .C0(n77), .C1(
        n156), .Y(n122) );
  AOI221XLM U131 ( .A0(n7), .A1(n65), .B0(n68), .B1(n157), .C0(n32), .Y(n128)
         );
  AOI221XLM U132 ( .A0(n65), .A1(n157), .B0(n7), .B1(n66), .C0(n33), .Y(n127)
         );
  OAI221X1M U133 ( .A0(B[2]), .A1(n106), .B0(n107), .B1(n145), .C0(n64), .Y(
        n104) );
  AOI221XLM U134 ( .A0(n9), .A1(n65), .B0(n68), .B1(n154), .C0(n32), .Y(n106)
         );
  AOI221XLM U135 ( .A0(n65), .A1(n154), .B0(n9), .B1(n66), .C0(n33), .Y(n107)
         );
  OAI221X1M U136 ( .A0(B[3]), .A1(n99), .B0(n100), .B1(n162), .C0(n64), .Y(n97) );
  AOI221XLM U137 ( .A0(n27), .A1(n65), .B0(n68), .B1(n153), .C0(n32), .Y(n99)
         );
  AOI221XLM U138 ( .A0(n65), .A1(n153), .B0(n27), .B1(n66), .C0(n33), .Y(n100)
         );
  OAI221X1M U139 ( .A0(B[4]), .A1(n92), .B0(n93), .B1(n161), .C0(n64), .Y(n90)
         );
  AOI221XLM U140 ( .A0(n28), .A1(n65), .B0(n68), .B1(n152), .C0(n32), .Y(n92)
         );
  AOI221XLM U141 ( .A0(n65), .A1(n152), .B0(n28), .B1(n66), .C0(n33), .Y(n93)
         );
  INVX2M U142 ( .A(n34), .Y(n147) );
  NAND4X2M U143 ( .A(n162), .B(n161), .C(n124), .D(n125), .Y(n64) );
  NOR3X2M U144 ( .A(n4), .B(n6), .C(n5), .Y(n124) );
  NOR4BX1M U145 ( .AN(n70), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n125) );
  INVX2M U146 ( .A(n45), .Y(n148) );
  BUFX2M U147 ( .A(A[1]), .Y(n8) );
  BUFX2M U148 ( .A(A[0]), .Y(n7) );
  BUFX2M U149 ( .A(B[6]), .Y(n5) );
  BUFX2M U150 ( .A(A[2]), .Y(n9) );
  BUFX2M U151 ( .A(A[3]), .Y(n27) );
  BUFX2M U152 ( .A(A[4]), .Y(n28) );
  BUFX2M U153 ( .A(A[5]), .Y(n29) );
  INVX2M U154 ( .A(B[3]), .Y(n162) );
  BUFX2M U155 ( .A(B[7]), .Y(n6) );
  BUFX2M U156 ( .A(B[5]), .Y(n4) );
  INVX2M U157 ( .A(B[4]), .Y(n161) );
  INVX2M U158 ( .A(B[1]), .Y(n163) );
  INVX2M U159 ( .A(B[0]), .Y(n144) );
  INVX2M U160 ( .A(B[2]), .Y(n145) );
  NOR2X1M U161 ( .A(n149), .B(n6), .Y(n140) );
  NAND2BX1M U162 ( .AN(B[4]), .B(n28), .Y(n49) );
  NAND2BX1M U163 ( .AN(n28), .B(B[4]), .Y(n38) );
  CLKNAND2X2M U164 ( .A(n49), .B(n38), .Y(n135) );
  NOR2X1M U165 ( .A(n162), .B(n27), .Y(n46) );
  NOR2X1M U166 ( .A(n145), .B(n9), .Y(n37) );
  NOR2X1M U167 ( .A(n144), .B(n7), .Y(n34) );
  CLKNAND2X2M U168 ( .A(n9), .B(n145), .Y(n48) );
  NAND2BX1M U169 ( .AN(n37), .B(n48), .Y(n43) );
  AOI21X1M U170 ( .A0(n34), .A1(n156), .B0(B[1]), .Y(n35) );
  AOI211X1M U171 ( .A0(n8), .A1(n147), .B0(n43), .C0(n35), .Y(n36) );
  CLKNAND2X2M U172 ( .A(n27), .B(n162), .Y(n47) );
  OAI31X1M U173 ( .A0(n46), .A1(n37), .A2(n36), .B0(n47), .Y(n39) );
  NAND2BX1M U174 ( .AN(n29), .B(n4), .Y(n138) );
  OAI211X1M U175 ( .A0(n135), .A1(n39), .B0(n38), .C0(n138), .Y(n40) );
  NAND2BX1M U176 ( .AN(n4), .B(n29), .Y(n134) );
  XNOR2X1M U177 ( .A(n30), .B(n5), .Y(n137) );
  AOI32X1M U178 ( .A0(n40), .A1(n134), .A2(n137), .B0(n5), .B1(n150), .Y(n41)
         );
  CLKNAND2X2M U179 ( .A(n6), .B(n149), .Y(n141) );
  OAI21X1M U180 ( .A0(n140), .A1(n41), .B0(n141), .Y(N169) );
  CLKNAND2X2M U181 ( .A(n7), .B(n144), .Y(n44) );
  OA21X1M U182 ( .A0(n44), .A1(n156), .B0(B[1]), .Y(n42) );
  AOI211X1M U183 ( .A0(n44), .A1(n156), .B0(n43), .C0(n42), .Y(n45) );
  AOI31X1M U184 ( .A0(n148), .A1(n48), .A2(n47), .B0(n46), .Y(n136) );
  OAI2B11X1M U185 ( .A1N(n136), .A0(n135), .B0(n134), .C0(n49), .Y(n139) );
  AOI32X1M U186 ( .A0(n139), .A1(n138), .A2(n137), .B0(n30), .B1(n146), .Y(
        n142) );
  AOI2B1X1M U187 ( .A1N(n142), .A0(n141), .B0(n140), .Y(n143) );
  CLKINVX1M U188 ( .A(n143), .Y(N168) );
  NOR2X1M U189 ( .A(N169), .B(N168), .Y(N167) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW_div_uns_0 div_46 ( 
        .a({n31, n30, n29, n28, n27, n9, n8, n7}), .b({n6, n5, n4, B[4:0]}), 
        .quotient({N134, N133, N132, N131, N130, N129, N128, N127}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_sub_0 sub_35 ( .A({
        1'b0, n31, n30, n29, n28, n27, n9, n8, n7}), .B({1'b0, n6, n5, n4, 
        B[4:0]}), .CI(1'b0), .DIFF({N109, N108, N107, N106, N105, N104, N103, 
        N102, N101}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_0 add_32 ( .A({
        1'b0, n31, n30, n29, n28, n27, n9, n8, n7}), .B({1'b0, n6, n5, n4, 
        B[4:0]}), .CI(1'b0), .SUM({N100, N99, N98, N97, N96, N95, N94, N93, 
        N92}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW02_mult_0 mult_38 ( 
        .A({n31, n30, n29, n28, n27, n9, n8, n7}), .B({n6, n5, n4, B[4:0]}), 
        .TC(1'b0), .PRODUCT({N125, N124, N123, N122, N121, N120, N119, N118, 
        N117, N116, N115, N114, N113, N112, N111, N110}) );
endmodule


module SYS_TOP_dft ( scan_clk, scan_rst, test_mode, SE, SI, SO, REF_CLK, 
        UART_CLK, RST, RX_IN, TX_OUT, parity_error, Stop_Error );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, parity_error, Stop_Error;
  wire   REF_SCAN_CLK, UART_SCAN_CLK, UART_RX_CLK, UART_RX_SCAN_CLK,
         UART_TX_CLK, UART_TX_SCAN_CLK, RST_SCAN_RST, SYNC_REF_RST,
         SYNC_REF_SCAN_RST, SYNC_UART_RST, SYNC_UART_SCAN_RST, RX_OUT_V,
         RX_OUT_V_SYNC, TX_IN_V, TX_BUSY_PULSE, FIFO_FULL, TX_OUT_V, TX_BUSY,
         ALU_OUT_VALID, ALU_ENABLE, RdData_Valid, WrEn, RdEn, GATE_EN, _1_net_,
         ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n15, n16, n19, n20,
         n21, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [7:0] RX_OUT_P;
  wire   [7:0] RX_OUT_P_SYNC;
  wire   [7:0] TX_IN_P;
  wire   [7:0] TX_OUT_S;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] DIV_RATIO_RX;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [7:0] RdData;
  wire   [3:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign SO[2] = DIV_RATIO[2];

  INVX2M U3 ( .A(n6), .Y(n5) );
  OR2X2M U4 ( .A(GATE_EN), .B(n2), .Y(_1_net_) );
  BUFX2M U5 ( .A(Address[1]), .Y(n4) );
  BUFX2M U6 ( .A(Address[0]), .Y(n3) );
  INVX2M U7 ( .A(TX_OUT_V), .Y(n1) );
  INVX4M U8 ( .A(n8), .Y(n7) );
  INVX2M U9 ( .A(SYNC_REF_SCAN_RST), .Y(n8) );
  INVX2M U10 ( .A(SYNC_UART_SCAN_RST), .Y(n6) );
  BUFX2M U11 ( .A(test_mode), .Y(n2) );
  DLY1X1M U18 ( .A(n26), .Y(n24) );
  INVXLM U19 ( .A(n33), .Y(n25) );
  INVXLM U20 ( .A(n25), .Y(n26) );
  INVXLM U21 ( .A(n25), .Y(n27) );
  DLY1X1M U22 ( .A(n30), .Y(n28) );
  INVXLM U23 ( .A(n34), .Y(n29) );
  INVXLM U24 ( .A(n29), .Y(n30) );
  INVXLM U25 ( .A(n29), .Y(n31) );
  INVXLM U26 ( .A(SE), .Y(n32) );
  INVXLM U27 ( .A(n32), .Y(n33) );
  INVXLM U28 ( .A(n32), .Y(n34) );
  mux2X1_0 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        REF_SCAN_CLK) );
  mux2X1_6 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_SCAN_CLK) );
  mux2X1_5 U2_mux2X1 ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_RX_SCAN_CLK) );
  mux2X1_4 U3_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_TX_SCAN_CLK) );
  mux2X1_3 U4_mux2X1 ( .IN_0(RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        RST_SCAN_RST) );
  mux2X1_2 U5_mux2X1 ( .IN_0(SYNC_REF_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        SYNC_REF_SCAN_RST) );
  mux2X1_1 U6_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        SYNC_UART_SCAN_RST) );
  RST_SYNC_NUM_STAGES2_test_1 RST_SYNC_UART_UNIT ( .CLK(UART_SCAN_CLK), .RST(
        RST_SCAN_RST), .SYNC_RST(SYNC_UART_RST), .test_si(SYNC_REF_RST), 
        .test_se(n27) );
  RST_SYNC_NUM_STAGES2_test_0 RST_SYNC_REF_UNIT ( .CLK(REF_SCAN_CLK), .RST(
        RST_SCAN_RST), .SYNC_RST(SYNC_REF_RST), .test_si(n11), .test_se(n27)
         );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 DATA_SYNC_UNIT ( .CLK(REF_SCAN_CLK), 
        .RST(n7), .BUS_ENABLE(RX_OUT_V), .Unsync_bus(RX_OUT_P), .SYNC_BUS(
        RX_OUT_P_SYNC), .ENABLE_PULSE(RX_OUT_V_SYNC), .test_si(n20), .test_so(
        n19), .test_se(n34) );
  FIFO_DATASIZE8_MEMDEPTH8_test_1 FIFO_UNIT ( .wclk(REF_SCAN_CLK), .wrst_n(n7), 
        .rclk(UART_TX_SCAN_CLK), .rrst_n(n5), .winc(TX_IN_V), .rinc(
        TX_BUSY_PULSE), .wdata(TX_IN_P), .rdata(TX_OUT_S), .wfull(FIFO_FULL), 
        .rempty(TX_OUT_V), .test_si2(SI[2]), .test_si1(n19), .test_so2(n16), 
        .test_so1(SO[3]), .test_se(SE) );
  PULSE_GEN_test_1 PULSE_GEN_UNIT ( .CLK(UART_TX_SCAN_CLK), .RST(n5), 
        .LVL_SIG(TX_BUSY), .PULSE_SIG(TX_BUSY_PULSE), .test_si(n16), .test_so(
        n15), .test_se(n27) );
  CLK_DIV_DIV_RATIO8_test_1 CLK_DIV_TX_UNIT ( .I_ref_clk(UART_SCAN_CLK), 
        .I_rst_n(n5), .I_clk_en(1'b1), .I_div_ratio(DIV_RATIO), .O_div_clk(
        UART_TX_CLK), .test_si(n21), .test_so(n20), .test_se(n33) );
  PRESCALE_MUX_MEM_WIDTH8 PRESCALE_MUX_UNIT ( .PRESCALE(UART_CONFIG[7:2]), 
        .DIV_RATIO_MUX({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  CLK_DIV_DIV_RATIO8_test_0 CLK_DIV_RX_UNIT ( .I_ref_clk(UART_SCAN_CLK), 
        .I_rst_n(n5), .I_clk_en(1'b1), .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .O_div_clk(UART_RX_CLK), .test_si(ALU_OUT[15]), 
        .test_so(n21), .test_se(n27) );
  UART_UART_DATA_WIDTH8_test_1 UART_UNIT ( .RST(n5), .TX_CLK(UART_TX_SCAN_CLK), 
        .RX_CLK(UART_RX_SCAN_CLK), .RX_IN_S(RX_IN), .RX_OUT_P(RX_OUT_P), 
        .RX_OUT_V(RX_OUT_V), .TX_IN_P(TX_OUT_S), .TX_IN_V(n1), .TX_OUT_S(SO[0]), .TX_OUT_V(TX_BUSY), .Prescale(UART_CONFIG[7:2]), .parity_enable(
        UART_CONFIG[0]), .parity_type(UART_CONFIG[1]), .parity_error(
        parity_error), .Stop_Error(Stop_Error), .test_si(n10), .test_se(n28)
         );
  SYS_CTRL_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_UART_DATA_WIDTH8_test_1 SYS_CTRL_UNIT ( 
        .CLK(REF_SCAN_CLK), .RST(n7), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(
        ALU_OUT_VALID), .ALU_FUN(ALU_FUN), .ALU_ENABLE(ALU_ENABLE), .RdData(
        RdData), .RdData_Valid(RdData_Valid), .Address(Address), .WrEn(WrEn), 
        .RdEn(RdEn), .WrData(WrData), .CLK_EN(GATE_EN), .RX_P_DATA(
        RX_OUT_P_SYNC), .RX_D_VLD(RX_OUT_V_SYNC), .TX_P_DATA(TX_IN_P), 
        .TX_D_VLD(TX_IN_V), .FIFO_FULL(FIFO_FULL), .test_si(SYNC_UART_RST), 
        .test_so(n10), .test_se(n24) );
  REG_FILE_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_test_1 REG_FILE_UNIT ( .WrEn(
        WrEn), .RdEn(RdEn), .CLK(REF_SCAN_CLK), .RST(n7), .Address({
        Address[3:2], n4, n3}), .WrData(WrData), .RdData(RdData), 
        .RdData_Valid(RdData_Valid), .REG0(OP_A), .REG1(OP_B), .REG2(
        UART_CONFIG), .REG3(DIV_RATIO), .test_si3(SI[0]), .test_si2(SI[1]), 
        .test_si1(n15), .test_so2(n11), .test_so1(SO[1]), .test_se(SE) );
  CLK_GATE CLOCK_GATE_UNIT ( .CLK_EN(_1_net_), .CLK(REF_SCAN_CLK), .GATED_CLK(
        ALU_CLK) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_test_1 ALU_UNIT ( .CLK(
        ALU_CLK), .RST(n7), .A(OP_A), .B(OP_B), .ALU_FUN(ALU_FUN), 
        .ALU_ENABLE(ALU_ENABLE), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(
        ALU_OUT_VALID), .test_si(SI[3]), .test_se(n31) );
  BUFX2M U17 ( .A(SO[0]), .Y(TX_OUT) );
endmodule

