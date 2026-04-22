/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct  1 16:03:56 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, BUS_ENABLE, Unsync_bus, 
        SYNC_BUS, ENABLE_PULSE );
  input [7:0] Unsync_bus;
  output [7:0] SYNC_BUS;
  input CLK, RST, BUS_ENABLE;
  output ENABLE_PULSE;
  wire   pulse_gen_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M pulse_gen_d_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        pulse_gen_d) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M \SYNC_BUS_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(SYNC_BUS[7]) );
  DFFRQX2M \SYNC_BUS_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(SYNC_BUS[5]) );
  DFFRQX2M \SYNC_BUS_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(SYNC_BUS[6]) );
  DFFRQX2M \SYNC_BUS_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(SYNC_BUS[4]) );
  DFFRQX2M \SYNC_BUS_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0]) );
  DFFRQX2M \SYNC_BUS_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(SYNC_BUS[3]) );
  DFFRQX2M \SYNC_BUS_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(SYNC_BUS[1]) );
  DFFRQX2M ENABLE_PULSE_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(ENABLE_PULSE) );
  DFFRQX2M \SYNC_BUS_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(SYNC_BUS[2]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(BUS_ENABLE), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_gen_d), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n10), .B0(SYNC_BUS[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n10), .B0(SYNC_BUS[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n10), .B0(SYNC_BUS[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n10), .B0(SYNC_BUS[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n10), .B0(SYNC_BUS[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n10), .B0(SYNC_BUS[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n10), .B0(SYNC_BUS[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n10), .B0(SYNC_BUS[7]), .B1(n1), .Y(n9) );
endmodule


module memory_ADDRSIZE3_DATASIZE8_MEMDEPTH8 ( wdata, waddr, raddr, wclk, winc, 
        wfull, wrst_n, rdata );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclk, winc, wfull, wrst_n;
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
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \mem_reg[5][7]  ( .D(n69), .CK(wclk), .RN(n100), .Q(\mem[5][7] ) );
  DFFRQX2M \mem_reg[5][6]  ( .D(n68), .CK(wclk), .RN(n100), .Q(\mem[5][6] ) );
  DFFRQX2M \mem_reg[5][5]  ( .D(n67), .CK(wclk), .RN(n100), .Q(\mem[5][5] ) );
  DFFRQX2M \mem_reg[5][4]  ( .D(n66), .CK(wclk), .RN(n100), .Q(\mem[5][4] ) );
  DFFRQX2M \mem_reg[5][3]  ( .D(n65), .CK(wclk), .RN(n100), .Q(\mem[5][3] ) );
  DFFRQX2M \mem_reg[5][2]  ( .D(n64), .CK(wclk), .RN(n100), .Q(\mem[5][2] ) );
  DFFRQX2M \mem_reg[5][1]  ( .D(n63), .CK(wclk), .RN(n100), .Q(\mem[5][1] ) );
  DFFRQX2M \mem_reg[5][0]  ( .D(n62), .CK(wclk), .RN(n100), .Q(\mem[5][0] ) );
  DFFRQX2M \mem_reg[1][7]  ( .D(n37), .CK(wclk), .RN(n102), .Q(\mem[1][7] ) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n36), .CK(wclk), .RN(n102), .Q(\mem[1][6] ) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n35), .CK(wclk), .RN(n102), .Q(\mem[1][5] ) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n34), .CK(wclk), .RN(n102), .Q(\mem[1][4] ) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n33), .CK(wclk), .RN(n103), .Q(\mem[1][3] ) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n32), .CK(wclk), .RN(n103), .Q(\mem[1][2] ) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n31), .CK(wclk), .RN(n103), .Q(\mem[1][1] ) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n30), .CK(wclk), .RN(n103), .Q(\mem[1][0] ) );
  DFFRQX2M \mem_reg[7][7]  ( .D(n85), .CK(wclk), .RN(n99), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n84), .CK(wclk), .RN(n99), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n83), .CK(wclk), .RN(n99), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n82), .CK(wclk), .RN(n99), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n81), .CK(wclk), .RN(n99), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n80), .CK(wclk), .RN(n99), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n79), .CK(wclk), .RN(n99), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n78), .CK(wclk), .RN(n99), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n53), .CK(wclk), .RN(n101), .Q(\mem[3][7] ) );
  DFFRQX2M \mem_reg[3][6]  ( .D(n52), .CK(wclk), .RN(n101), .Q(\mem[3][6] ) );
  DFFRQX2M \mem_reg[3][5]  ( .D(n51), .CK(wclk), .RN(n101), .Q(\mem[3][5] ) );
  DFFRQX2M \mem_reg[3][4]  ( .D(n50), .CK(wclk), .RN(n101), .Q(\mem[3][4] ) );
  DFFRQX2M \mem_reg[3][3]  ( .D(n49), .CK(wclk), .RN(n101), .Q(\mem[3][3] ) );
  DFFRQX2M \mem_reg[3][2]  ( .D(n48), .CK(wclk), .RN(n101), .Q(\mem[3][2] ) );
  DFFRQX2M \mem_reg[3][1]  ( .D(n47), .CK(wclk), .RN(n101), .Q(\mem[3][1] ) );
  DFFRQX2M \mem_reg[3][0]  ( .D(n46), .CK(wclk), .RN(n102), .Q(\mem[3][0] ) );
  DFFRQX2M \mem_reg[6][7]  ( .D(n77), .CK(wclk), .RN(n99), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n76), .CK(wclk), .RN(n99), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n75), .CK(wclk), .RN(n99), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n74), .CK(wclk), .RN(n99), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n73), .CK(wclk), .RN(n99), .Q(\mem[6][3] ) );
  DFFRQX2M \mem_reg[6][2]  ( .D(n72), .CK(wclk), .RN(n100), .Q(\mem[6][2] ) );
  DFFRQX2M \mem_reg[6][1]  ( .D(n71), .CK(wclk), .RN(n100), .Q(\mem[6][1] ) );
  DFFRQX2M \mem_reg[6][0]  ( .D(n70), .CK(wclk), .RN(n100), .Q(\mem[6][0] ) );
  DFFRQX2M \mem_reg[2][7]  ( .D(n45), .CK(wclk), .RN(n102), .Q(\mem[2][7] ) );
  DFFRQX2M \mem_reg[2][6]  ( .D(n44), .CK(wclk), .RN(n102), .Q(\mem[2][6] ) );
  DFFRQX2M \mem_reg[2][5]  ( .D(n43), .CK(wclk), .RN(n102), .Q(\mem[2][5] ) );
  DFFRQX2M \mem_reg[2][4]  ( .D(n42), .CK(wclk), .RN(n102), .Q(\mem[2][4] ) );
  DFFRQX2M \mem_reg[2][3]  ( .D(n41), .CK(wclk), .RN(n102), .Q(\mem[2][3] ) );
  DFFRQX2M \mem_reg[2][2]  ( .D(n40), .CK(wclk), .RN(n102), .Q(\mem[2][2] ) );
  DFFRQX2M \mem_reg[2][1]  ( .D(n39), .CK(wclk), .RN(n102), .Q(\mem[2][1] ) );
  DFFRQX2M \mem_reg[2][0]  ( .D(n38), .CK(wclk), .RN(n102), .Q(\mem[2][0] ) );
  DFFRQX2M \mem_reg[4][7]  ( .D(n61), .CK(wclk), .RN(n100), .Q(\mem[4][7] ) );
  DFFRQX2M \mem_reg[4][6]  ( .D(n60), .CK(wclk), .RN(n100), .Q(\mem[4][6] ) );
  DFFRQX2M \mem_reg[4][5]  ( .D(n59), .CK(wclk), .RN(n101), .Q(\mem[4][5] ) );
  DFFRQX2M \mem_reg[4][4]  ( .D(n58), .CK(wclk), .RN(n101), .Q(\mem[4][4] ) );
  DFFRQX2M \mem_reg[4][3]  ( .D(n57), .CK(wclk), .RN(n101), .Q(\mem[4][3] ) );
  DFFRQX2M \mem_reg[4][2]  ( .D(n56), .CK(wclk), .RN(n101), .Q(\mem[4][2] ) );
  DFFRQX2M \mem_reg[4][1]  ( .D(n55), .CK(wclk), .RN(n101), .Q(\mem[4][1] ) );
  DFFRQX2M \mem_reg[4][0]  ( .D(n54), .CK(wclk), .RN(n101), .Q(\mem[4][0] ) );
  DFFRQX2M \mem_reg[0][7]  ( .D(n29), .CK(wclk), .RN(n103), .Q(\mem[0][7] ) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n28), .CK(wclk), .RN(n103), .Q(\mem[0][6] ) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n27), .CK(wclk), .RN(n103), .Q(\mem[0][5] ) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n26), .CK(wclk), .RN(n103), .Q(\mem[0][4] ) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n25), .CK(wclk), .RN(n103), .Q(\mem[0][3] ) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n24), .CK(wclk), .RN(n103), .Q(\mem[0][2] ) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n23), .CK(wclk), .RN(n103), .Q(\mem[0][1] ) );
  DFFRQX2M \mem_reg[0][0]  ( .D(n22), .CK(wclk), .RN(n103), .Q(\mem[0][0] ) );
  NOR2BX2M U2 ( .AN(n16), .B(waddr[2]), .Y(n12) );
  BUFX2M U3 ( .A(n19), .Y(n96) );
  BUFX2M U4 ( .A(n20), .Y(n95) );
  BUFX2M U5 ( .A(n21), .Y(n94) );
  BUFX2M U6 ( .A(n97), .Y(n101) );
  BUFX2M U7 ( .A(n97), .Y(n100) );
  BUFX2M U8 ( .A(n97), .Y(n99) );
  BUFX2M U9 ( .A(n98), .Y(n102) );
  BUFX2M U10 ( .A(n98), .Y(n103) );
  BUFX2M U11 ( .A(wrst_n), .Y(n97) );
  BUFX2M U12 ( .A(wrst_n), .Y(n98) );
  NAND3X2M U13 ( .A(n104), .B(n113), .C(n18), .Y(n17) );
  NAND3X2M U14 ( .A(n104), .B(n113), .C(n12), .Y(n11) );
  NAND3X2M U15 ( .A(n12), .B(n104), .C(waddr[1]), .Y(n14) );
  NAND3X2M U16 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n15) );
  NAND3X2M U17 ( .A(n12), .B(n113), .C(waddr[0]), .Y(n13) );
  INVX2M U18 ( .A(wdata[0]), .Y(n105) );
  INVX2M U19 ( .A(wdata[1]), .Y(n106) );
  INVX2M U20 ( .A(wdata[2]), .Y(n107) );
  INVX2M U21 ( .A(wdata[3]), .Y(n108) );
  INVX2M U22 ( .A(wdata[4]), .Y(n109) );
  INVX2M U23 ( .A(wdata[5]), .Y(n110) );
  INVX2M U24 ( .A(wdata[6]), .Y(n111) );
  INVX2M U25 ( .A(wdata[7]), .Y(n112) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n105), .A0N(\mem[0][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U27 ( .B0(n11), .B1(n106), .A0N(\mem[0][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n107), .A0N(\mem[0][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U29 ( .B0(n11), .B1(n108), .A0N(\mem[0][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U30 ( .B0(n11), .B1(n109), .A0N(\mem[0][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n110), .A0N(\mem[0][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U32 ( .B0(n11), .B1(n111), .A0N(\mem[0][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U33 ( .B0(n11), .B1(n112), .A0N(\mem[0][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U34 ( .B0(n105), .B1(n14), .A0N(\mem[2][0] ), .A1N(n14), .Y(n38)
         );
  OAI2BB2X1M U35 ( .B0(n106), .B1(n14), .A0N(\mem[2][1] ), .A1N(n14), .Y(n39)
         );
  OAI2BB2X1M U36 ( .B0(n107), .B1(n14), .A0N(\mem[2][2] ), .A1N(n14), .Y(n40)
         );
  OAI2BB2X1M U37 ( .B0(n108), .B1(n14), .A0N(\mem[2][3] ), .A1N(n14), .Y(n41)
         );
  OAI2BB2X1M U38 ( .B0(n109), .B1(n14), .A0N(\mem[2][4] ), .A1N(n14), .Y(n42)
         );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n14), .A0N(\mem[2][5] ), .A1N(n14), .Y(n43)
         );
  OAI2BB2X1M U40 ( .B0(n111), .B1(n14), .A0N(\mem[2][6] ), .A1N(n14), .Y(n44)
         );
  OAI2BB2X1M U41 ( .B0(n112), .B1(n14), .A0N(\mem[2][7] ), .A1N(n14), .Y(n45)
         );
  OAI2BB2X1M U42 ( .B0(n105), .B1(n15), .A0N(\mem[3][0] ), .A1N(n15), .Y(n46)
         );
  OAI2BB2X1M U43 ( .B0(n106), .B1(n15), .A0N(\mem[3][1] ), .A1N(n15), .Y(n47)
         );
  OAI2BB2X1M U44 ( .B0(n107), .B1(n15), .A0N(\mem[3][2] ), .A1N(n15), .Y(n48)
         );
  OAI2BB2X1M U45 ( .B0(n108), .B1(n15), .A0N(\mem[3][3] ), .A1N(n15), .Y(n49)
         );
  OAI2BB2X1M U46 ( .B0(n109), .B1(n15), .A0N(\mem[3][4] ), .A1N(n15), .Y(n50)
         );
  OAI2BB2X1M U47 ( .B0(n110), .B1(n15), .A0N(\mem[3][5] ), .A1N(n15), .Y(n51)
         );
  OAI2BB2X1M U48 ( .B0(n111), .B1(n15), .A0N(\mem[3][6] ), .A1N(n15), .Y(n52)
         );
  OAI2BB2X1M U49 ( .B0(n112), .B1(n15), .A0N(\mem[3][7] ), .A1N(n15), .Y(n53)
         );
  OAI2BB2X1M U50 ( .B0(n105), .B1(n13), .A0N(\mem[1][0] ), .A1N(n13), .Y(n30)
         );
  OAI2BB2X1M U51 ( .B0(n106), .B1(n13), .A0N(\mem[1][1] ), .A1N(n13), .Y(n31)
         );
  OAI2BB2X1M U52 ( .B0(n107), .B1(n13), .A0N(\mem[1][2] ), .A1N(n13), .Y(n32)
         );
  OAI2BB2X1M U53 ( .B0(n108), .B1(n13), .A0N(\mem[1][3] ), .A1N(n13), .Y(n33)
         );
  OAI2BB2X1M U54 ( .B0(n109), .B1(n13), .A0N(\mem[1][4] ), .A1N(n13), .Y(n34)
         );
  OAI2BB2X1M U55 ( .B0(n110), .B1(n13), .A0N(\mem[1][5] ), .A1N(n13), .Y(n35)
         );
  OAI2BB2X1M U56 ( .B0(n111), .B1(n13), .A0N(\mem[1][6] ), .A1N(n13), .Y(n36)
         );
  OAI2BB2X1M U57 ( .B0(n112), .B1(n13), .A0N(\mem[1][7] ), .A1N(n13), .Y(n37)
         );
  OAI2BB2X1M U58 ( .B0(n105), .B1(n17), .A0N(\mem[4][0] ), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U59 ( .B0(n106), .B1(n17), .A0N(\mem[4][1] ), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U60 ( .B0(n107), .B1(n17), .A0N(\mem[4][2] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U61 ( .B0(n108), .B1(n17), .A0N(\mem[4][3] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U62 ( .B0(n109), .B1(n17), .A0N(\mem[4][4] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U63 ( .B0(n110), .B1(n17), .A0N(\mem[4][5] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U64 ( .B0(n111), .B1(n17), .A0N(\mem[4][6] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U65 ( .B0(n112), .B1(n17), .A0N(\mem[4][7] ), .A1N(n17), .Y(n61)
         );
  OAI2BB2X1M U66 ( .B0(n105), .B1(n96), .A0N(\mem[5][0] ), .A1N(n96), .Y(n62)
         );
  OAI2BB2X1M U67 ( .B0(n106), .B1(n96), .A0N(\mem[5][1] ), .A1N(n96), .Y(n63)
         );
  OAI2BB2X1M U68 ( .B0(n107), .B1(n96), .A0N(\mem[5][2] ), .A1N(n96), .Y(n64)
         );
  OAI2BB2X1M U69 ( .B0(n108), .B1(n96), .A0N(\mem[5][3] ), .A1N(n96), .Y(n65)
         );
  OAI2BB2X1M U70 ( .B0(n109), .B1(n96), .A0N(\mem[5][4] ), .A1N(n96), .Y(n66)
         );
  OAI2BB2X1M U71 ( .B0(n110), .B1(n96), .A0N(\mem[5][5] ), .A1N(n96), .Y(n67)
         );
  OAI2BB2X1M U72 ( .B0(n111), .B1(n96), .A0N(\mem[5][6] ), .A1N(n96), .Y(n68)
         );
  OAI2BB2X1M U73 ( .B0(n112), .B1(n96), .A0N(\mem[5][7] ), .A1N(n96), .Y(n69)
         );
  OAI2BB2X1M U74 ( .B0(n105), .B1(n95), .A0N(\mem[6][0] ), .A1N(n95), .Y(n70)
         );
  OAI2BB2X1M U75 ( .B0(n106), .B1(n95), .A0N(\mem[6][1] ), .A1N(n95), .Y(n71)
         );
  OAI2BB2X1M U76 ( .B0(n107), .B1(n95), .A0N(\mem[6][2] ), .A1N(n95), .Y(n72)
         );
  OAI2BB2X1M U77 ( .B0(n108), .B1(n95), .A0N(\mem[6][3] ), .A1N(n95), .Y(n73)
         );
  OAI2BB2X1M U78 ( .B0(n109), .B1(n95), .A0N(\mem[6][4] ), .A1N(n95), .Y(n74)
         );
  OAI2BB2X1M U79 ( .B0(n110), .B1(n95), .A0N(\mem[6][5] ), .A1N(n95), .Y(n75)
         );
  OAI2BB2X1M U80 ( .B0(n111), .B1(n95), .A0N(\mem[6][6] ), .A1N(n95), .Y(n76)
         );
  OAI2BB2X1M U81 ( .B0(n112), .B1(n95), .A0N(\mem[6][7] ), .A1N(n95), .Y(n77)
         );
  OAI2BB2X1M U82 ( .B0(n105), .B1(n94), .A0N(\mem[7][0] ), .A1N(n94), .Y(n78)
         );
  OAI2BB2X1M U83 ( .B0(n106), .B1(n94), .A0N(\mem[7][1] ), .A1N(n94), .Y(n79)
         );
  OAI2BB2X1M U84 ( .B0(n107), .B1(n94), .A0N(\mem[7][2] ), .A1N(n94), .Y(n80)
         );
  OAI2BB2X1M U85 ( .B0(n108), .B1(n94), .A0N(\mem[7][3] ), .A1N(n94), .Y(n81)
         );
  OAI2BB2X1M U86 ( .B0(n109), .B1(n94), .A0N(\mem[7][4] ), .A1N(n94), .Y(n82)
         );
  OAI2BB2X1M U87 ( .B0(n110), .B1(n94), .A0N(\mem[7][5] ), .A1N(n94), .Y(n83)
         );
  OAI2BB2X1M U88 ( .B0(n111), .B1(n94), .A0N(\mem[7][6] ), .A1N(n94), .Y(n84)
         );
  OAI2BB2X1M U89 ( .B0(n112), .B1(n94), .A0N(\mem[7][7] ), .A1N(n94), .Y(n85)
         );
  NOR2BX2M U90 ( .AN(winc), .B(wfull), .Y(n16) );
  AND2X2M U91 ( .A(waddr[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(waddr[0]), .B(n113), .C(n18), .Y(n19) );
  NAND3X2M U93 ( .A(waddr[1]), .B(n104), .C(n18), .Y(n20) );
  NAND3X2M U94 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n21) );
  INVX2M U95 ( .A(waddr[1]), .Y(n113) );
  INVX2M U96 ( .A(waddr[0]), .Y(n104) );
  MX2X2M U97 ( .A(n2), .B(n1), .S0(N12), .Y(rdata[0]) );
  MX4X1M U98 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n92), .S1(N11), .Y(n1) );
  MX4X1M U99 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n93), .S1(N11), .Y(n2) );
  MX2X2M U100 ( .A(n4), .B(n3), .S0(N12), .Y(rdata[1]) );
  MX4X1M U101 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n92), .S1(N11), .Y(n3) );
  MX4X1M U102 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n93), .S1(N11), .Y(n4) );
  MX2X2M U103 ( .A(n6), .B(n5), .S0(N12), .Y(rdata[2]) );
  MX4X1M U104 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n92), .S1(N11), .Y(n5) );
  MX4X1M U105 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n93), .S1(N11), .Y(n6) );
  MX2X2M U106 ( .A(n8), .B(n7), .S0(N12), .Y(rdata[3]) );
  MX4X1M U107 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n92), .S1(N11), .Y(n7) );
  MX4X1M U108 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n93), .S1(N11), .Y(n8) );
  MX2X2M U109 ( .A(n10), .B(n9), .S0(N12), .Y(rdata[4]) );
  MX4X1M U110 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n92), .S1(N11), .Y(n9) );
  MX4X1M U111 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n93), .S1(N11), .Y(n10) );
  MX2X2M U112 ( .A(n87), .B(n86), .S0(N12), .Y(rdata[5]) );
  MX4X1M U113 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n92), .S1(N11), .Y(n86) );
  MX4X1M U114 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n93), .S1(N11), .Y(n87) );
  MX2X2M U115 ( .A(n89), .B(n88), .S0(N12), .Y(rdata[6]) );
  MX4X1M U116 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n92), .S1(N11), .Y(n88) );
  MX4X1M U117 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n93), .S1(N11), .Y(n89) );
  MX2X2M U118 ( .A(n91), .B(n90), .S0(N12), .Y(rdata[7]) );
  MX4X1M U119 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n92), .S1(N11), .Y(n90) );
  MX4X1M U120 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n93), .S1(N11), .Y(n91) );
  BUFX2M U121 ( .A(N10), .Y(n93) );
  BUFX2M U122 ( .A(N10), .Y(n92) );
endmodule


module sync_r2w_ADDRSIZE3 ( wclk, wrst_n, rptr, wq2_rptr );
  input [3:0] rptr;
  output [3:0] wq2_rptr;
  input wclk, wrst_n;

  wire   [3:0] wq1_rptr;

  DFFRQX2M \wq2_rptr_reg[2]  ( .D(wq1_rptr[2]), .CK(wclk), .RN(wrst_n), .Q(
        wq2_rptr[2]) );
  DFFRQX2M \wq2_rptr_reg[3]  ( .D(wq1_rptr[3]), .CK(wclk), .RN(wrst_n), .Q(
        wq2_rptr[3]) );
  DFFRQX2M \wq2_rptr_reg[1]  ( .D(wq1_rptr[1]), .CK(wclk), .RN(wrst_n), .Q(
        wq2_rptr[1]) );
  DFFRQX2M \wq2_rptr_reg[0]  ( .D(wq1_rptr[0]), .CK(wclk), .RN(wrst_n), .Q(
        wq2_rptr[0]) );
  DFFRQX2M \wq1_rptr_reg[3]  ( .D(rptr[3]), .CK(wclk), .RN(wrst_n), .Q(
        wq1_rptr[3]) );
  DFFRQX2M \wq1_rptr_reg[2]  ( .D(rptr[2]), .CK(wclk), .RN(wrst_n), .Q(
        wq1_rptr[2]) );
  DFFRQX2M \wq1_rptr_reg[1]  ( .D(rptr[1]), .CK(wclk), .RN(wrst_n), .Q(
        wq1_rptr[1]) );
  DFFRQX2M \wq1_rptr_reg[0]  ( .D(rptr[0]), .CK(wclk), .RN(wrst_n), .Q(
        wq1_rptr[0]) );
endmodule


module sync_w2r_ADDRSIZE3 ( rclk, rrst_n, wptr, rq2_wptr );
  input [3:0] wptr;
  output [3:0] rq2_wptr;
  input rclk, rrst_n;

  wire   [3:0] rq1_wptr;

  DFFRQX2M \rq2_wptr_reg[3]  ( .D(rq1_wptr[3]), .CK(rclk), .RN(rrst_n), .Q(
        rq2_wptr[3]) );
  DFFRQX2M \rq2_wptr_reg[2]  ( .D(rq1_wptr[2]), .CK(rclk), .RN(rrst_n), .Q(
        rq2_wptr[2]) );
  DFFRQX2M \rq2_wptr_reg[1]  ( .D(rq1_wptr[1]), .CK(rclk), .RN(rrst_n), .Q(
        rq2_wptr[1]) );
  DFFRQX2M \rq2_wptr_reg[0]  ( .D(rq1_wptr[0]), .CK(rclk), .RN(rrst_n), .Q(
        rq2_wptr[0]) );
  DFFRQX2M \rq1_wptr_reg[3]  ( .D(wptr[3]), .CK(rclk), .RN(rrst_n), .Q(
        rq1_wptr[3]) );
  DFFRQX2M \rq1_wptr_reg[2]  ( .D(wptr[2]), .CK(rclk), .RN(rrst_n), .Q(
        rq1_wptr[2]) );
  DFFRQX2M \rq1_wptr_reg[1]  ( .D(wptr[1]), .CK(rclk), .RN(rrst_n), .Q(
        rq1_wptr[1]) );
  DFFRQX2M \rq1_wptr_reg[0]  ( .D(wptr[0]), .CK(rclk), .RN(rrst_n), .Q(
        rq1_wptr[0]) );
endmodule


module wptr_full_ADDRSIZE3 ( wfull, waddr, wptr, wq2_rptr, winc, wclk, wrst_n
 );
  output [2:0] waddr;
  output [3:0] wptr;
  input [3:0] wq2_rptr;
  input winc, wclk, wrst_n;
  output wfull;
  wire   \wbin[3] , wfull_next, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] wbin_next;
  wire   [2:0] wgray_next;

  DFFRQX2M \wbin_reg[3]  ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(
        \wbin[3] ) );
  DFFRQX2M \wbin_reg[2]  ( .D(wbin_next[2]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[2]) );
  DFFRQX2M \wbin_reg[1]  ( .D(wbin_next[1]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[1]) );
  DFFRQX2M wfull_reg ( .D(wfull_next), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  DFFRQX2M \wbin_reg[0]  ( .D(wbin_next[0]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[0]) );
  DFFRQX2M \wptr_reg[3]  ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[3]) );
  DFFRQX2M \wptr_reg[0]  ( .D(wgray_next[0]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[0]) );
  DFFRQX2M \wptr_reg[2]  ( .D(wgray_next[2]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[2]) );
  DFFRQX2M \wptr_reg[1]  ( .D(wgray_next[1]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[1]) );
  CLKXOR2X2M U3 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(wgray_next[1]) );
  CLKXOR2X2M U4 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(wgray_next[0]) );
  CLKXOR2X2M U5 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(wgray_next[2]) );
  XNOR2X2M U6 ( .A(n7), .B(waddr[2]), .Y(wbin_next[2]) );
  NAND2X2M U7 ( .A(waddr[1]), .B(n6), .Y(n7) );
  XNOR2X2M U8 ( .A(n5), .B(\wbin[3] ), .Y(wbin_next[3]) );
  NAND3X2M U9 ( .A(waddr[1]), .B(n6), .C(waddr[2]), .Y(n5) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(wfull_next) );
  XNOR2X2M U11 ( .A(wbin_next[3]), .B(wq2_rptr[3]), .Y(n2) );
  XNOR2X2M U12 ( .A(wgray_next[2]), .B(wq2_rptr[2]), .Y(n1) );
  CLKXOR2X2M U13 ( .A(wq2_rptr[0]), .B(wgray_next[0]), .Y(n3) );
  NOR2BX2M U14 ( .AN(winc), .B(wfull), .Y(n8) );
  AND2X2M U15 ( .A(waddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U16 ( .A(n6), .B(waddr[1]), .Y(wbin_next[1]) );
  CLKXOR2X2M U17 ( .A(wq2_rptr[1]), .B(wgray_next[1]), .Y(n4) );
  CLKXOR2X2M U18 ( .A(n8), .B(waddr[0]), .Y(wbin_next[0]) );
endmodule


module rptr_empty_ADDRSIZE3 ( rempty, raddr, rptr, rq2_wptr, rinc, rclk, 
        rrst_n );
  output [2:0] raddr;
  output [3:0] rptr;
  input [3:0] rq2_wptr;
  input rinc, rclk, rrst_n;
  output rempty;
  wire   \rbin[3] , rempty_next, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] rbin_next;
  wire   [2:0] rgray_next;

  DFFRQX2M \rbin_reg[3]  ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(
        \rbin[3] ) );
  DFFSQX2M rempty_reg ( .D(rempty_next), .CK(rclk), .SN(rrst_n), .Q(rempty) );
  DFFRQX2M \rbin_reg[0]  ( .D(rbin_next[0]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[0]) );
  DFFRQX2M \rbin_reg[2]  ( .D(rbin_next[2]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[2]) );
  DFFRQX2M \rbin_reg[1]  ( .D(rbin_next[1]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[1]) );
  DFFRQX2M \rptr_reg[0]  ( .D(rgray_next[0]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[0]) );
  DFFRQX2M \rptr_reg[3]  ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[3]) );
  DFFRQX2M \rptr_reg[2]  ( .D(rgray_next[2]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[2]) );
  DFFRQX2M \rptr_reg[1]  ( .D(rgray_next[1]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[1]) );
  CLKXOR2X2M U3 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(rgray_next[2]) );
  CLKXOR2X2M U4 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(rgray_next[1]) );
  CLKXOR2X2M U5 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(rgray_next[0]) );
  XNOR2X2M U6 ( .A(n5), .B(\rbin[3] ), .Y(rbin_next[3]) );
  NAND3X2M U7 ( .A(raddr[1]), .B(n6), .C(raddr[2]), .Y(n5) );
  XNOR2X2M U8 ( .A(n7), .B(raddr[2]), .Y(rbin_next[2]) );
  NAND2X2M U9 ( .A(raddr[1]), .B(n6), .Y(n7) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(rempty_next) );
  CLKXOR2X2M U11 ( .A(rq2_wptr[3]), .B(rbin_next[3]), .Y(n2) );
  CLKXOR2X2M U12 ( .A(rq2_wptr[2]), .B(rgray_next[2]), .Y(n1) );
  CLKXOR2X2M U13 ( .A(rq2_wptr[1]), .B(rgray_next[1]), .Y(n4) );
  NOR2BX2M U14 ( .AN(rinc), .B(rempty), .Y(n8) );
  AND2X2M U15 ( .A(raddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U16 ( .A(rq2_wptr[0]), .B(rgray_next[0]), .Y(n3) );
  CLKXOR2X2M U17 ( .A(n6), .B(raddr[1]), .Y(rbin_next[1]) );
  CLKXOR2X2M U18 ( .A(n8), .B(raddr[0]), .Y(rbin_next[0]) );
endmodule


module FIFO_DATASIZE8_MEMDEPTH8 ( wclk, wrst_n, rclk, rrst_n, winc, rinc, 
        wdata, rdata, wfull, rempty );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wrst_n, rclk, rrst_n, winc, rinc;
  output wfull, rempty;
  wire   n1, n2;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;

  memory_ADDRSIZE3_DATASIZE8_MEMDEPTH8 mem_UNIT ( .wdata(wdata), .waddr(waddr), 
        .raddr(raddr), .wclk(wclk), .winc(winc), .wfull(wfull), .wrst_n(n1), 
        .rdata(rdata) );
  sync_r2w_ADDRSIZE3 sync_r2w_UNIT ( .wclk(wclk), .wrst_n(n1), .rptr(rptr), 
        .wq2_rptr(wq2_rptr) );
  sync_w2r_ADDRSIZE3 sync_w2r_UNIT ( .rclk(rclk), .rrst_n(rrst_n), .wptr(wptr), 
        .rq2_wptr(rq2_wptr) );
  wptr_full_ADDRSIZE3 wptr_full_UNIT ( .wfull(wfull), .waddr(waddr), .wptr(
        wptr), .wq2_rptr(wq2_rptr), .winc(winc), .wclk(wclk), .wrst_n(n1) );
  rptr_empty_ADDRSIZE3 rptr_empty_UNIT ( .rempty(rempty), .raddr(raddr), 
        .rptr(rptr), .rq2_wptr(rq2_wptr), .rinc(rinc), .rclk(rclk), .rrst_n(
        rrst_n) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(wrst_n), .Y(n2) );
endmodule


module PULSE_GEN ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   PULSE_GEN_REG1, PULSE_GEN_REG0;

  DFFRQX2M PULSE_GEN_REG0_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(
        PULSE_GEN_REG0) );
  DFFRQX2M PULSE_GEN_REG1_reg ( .D(PULSE_GEN_REG0), .CK(CLK), .RN(RST), .Q(
        PULSE_GEN_REG1) );
  NOR2BX2M U3 ( .AN(PULSE_GEN_REG0), .B(PULSE_GEN_REG1), .Y(PULSE_SIG) );
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

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_DIV_RATIO8_0 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output O_div_clk;
  wire   N3, DIV_CLK_reg, ODD_EDGE_FLAG, N16, N17, N18, N19, N20, N21, N22,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] counter;
  wire   [6:0] half_toggle;
  wire   [6:0] half_toggle_plus;

  CLK_DIV_DIV_RATIO8_0_DW01_inc_0 add_37 ( .A(counter), .SUM({N22, N21, N20, 
        N19, N18, N17, N16}) );
  CLK_DIV_DIV_RATIO8_0_DW01_inc_1 add_48 ( .A(half_toggle), .SUM(
        half_toggle_plus) );
  DFFRQX2M DIV_CLK_reg_reg ( .D(n15), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        DIV_CLK_reg) );
  DFFSQX2M ODD_EDGE_FLAG_reg ( .D(n16), .CK(I_ref_clk), .SN(I_rst_n), .Q(
        ODD_EDGE_FLAG) );
  DFFRQX2M \counter_reg[5]  ( .D(n18), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n19), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(n20), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[6]  ( .D(n17), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[0]  ( .D(n23), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[2]  ( .D(n21), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n22), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(DIV_CLK_reg), .B(I_ref_clk), .S0(N3), .Y(O_div_clk) );
  OAI2BB1X2M U4 ( .A0N(n41), .A1N(n42), .B0(I_clk_en), .Y(N3) );
  OR2X2M U5 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n1) );
  INVX2M U6 ( .A(I_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U8 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n1), .Y(
        half_toggle[1]) );
  OR2X1M U9 ( .A(n1), .B(I_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(I_div_ratio[3]), .B0(n2), .Y(half_toggle[2])
         );
  NOR2X1M U11 ( .A(n2), .B(I_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(I_div_ratio[4]), .B0(n3), .Y(half_toggle[3]) );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(half_toggle[4]) );
  XNOR2X1M U15 ( .A(I_div_ratio[6]), .B(n4), .Y(half_toggle[5]) );
  NOR2X1M U16 ( .A(I_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(I_div_ratio[7]), .B(n5), .Y(half_toggle[6]) );
  AO22X1M U18 ( .A0(N3), .A1(counter[0]), .B0(N16), .B1(n7), .Y(n23) );
  AO22X1M U19 ( .A0(N3), .A1(counter[1]), .B0(N17), .B1(n7), .Y(n22) );
  AO22X1M U20 ( .A0(N3), .A1(counter[2]), .B0(N18), .B1(n7), .Y(n21) );
  AO22X1M U21 ( .A0(N3), .A1(counter[3]), .B0(N19), .B1(n7), .Y(n20) );
  AO22X1M U22 ( .A0(N3), .A1(counter[4]), .B0(N20), .B1(n7), .Y(n19) );
  AO22X1M U23 ( .A0(N3), .A1(counter[5]), .B0(N21), .B1(n7), .Y(n18) );
  AO22X1M U24 ( .A0(N3), .A1(counter[6]), .B0(N22), .B1(n7), .Y(n17) );
  AND3X1M U25 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  XNOR2X1M U26 ( .A(ODD_EDGE_FLAG), .B(n11), .Y(n16) );
  NAND2BX1M U27 ( .AN(n9), .B(n8), .Y(n11) );
  CLKINVX1M U28 ( .A(N3), .Y(n8) );
  CLKXOR2X2M U29 ( .A(DIV_CLK_reg), .B(n12), .Y(n15) );
  AOI21X1M U30 ( .A0(n9), .A1(n10), .B0(N3), .Y(n12) );
  OR2X1M U31 ( .A(n13), .B(I_div_ratio[0]), .Y(n10) );
  CLKNAND2X2M U32 ( .A(n14), .B(I_div_ratio[0]), .Y(n9) );
  MXI2X1M U33 ( .A(n24), .B(n13), .S0(ODD_EDGE_FLAG), .Y(n14) );
  NAND4X1M U34 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n13) );
  NOR4X1M U35 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U36 ( .A(half_toggle[2]), .B(counter[2]), .Y(n32) );
  CLKXOR2X2M U37 ( .A(half_toggle[1]), .B(counter[1]), .Y(n31) );
  CLKXOR2X2M U38 ( .A(half_toggle[0]), .B(counter[0]), .Y(n30) );
  CLKXOR2X2M U39 ( .A(half_toggle[6]), .B(counter[6]), .Y(n29) );
  XNOR2X1M U40 ( .A(counter[4]), .B(half_toggle[4]), .Y(n27) );
  XNOR2X1M U41 ( .A(counter[5]), .B(half_toggle[5]), .Y(n26) );
  XNOR2X1M U42 ( .A(counter[3]), .B(half_toggle[3]), .Y(n25) );
  NAND4X1M U43 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n24) );
  NOR4X1M U44 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U45 ( .A(half_toggle_plus[2]), .B(counter[2]), .Y(n40) );
  CLKXOR2X2M U46 ( .A(half_toggle_plus[1]), .B(counter[1]), .Y(n39) );
  CLKXOR2X2M U47 ( .A(half_toggle_plus[0]), .B(counter[0]), .Y(n38) );
  CLKXOR2X2M U48 ( .A(half_toggle_plus[6]), .B(counter[6]), .Y(n37) );
  XNOR2X1M U49 ( .A(counter[4]), .B(half_toggle_plus[4]), .Y(n35) );
  XNOR2X1M U50 ( .A(counter[5]), .B(half_toggle_plus[5]), .Y(n34) );
  XNOR2X1M U51 ( .A(counter[3]), .B(half_toggle_plus[3]), .Y(n33) );
  NOR4X1M U52 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n42) );
  NOR3X1M U53 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), 
        .Y(n41) );
endmodule


module PRESCALE_MUX_MEM_WIDTH8 ( PRESCALE, DIV_RATIO_MUX );
  input [5:0] PRESCALE;
  output [7:0] DIV_RATIO_MUX;
  wire   n2, n3, n4, n12;

  INVX2M U3 ( .A(1'b1), .Y(DIV_RATIO_MUX[4]) );
  INVX2M U5 ( .A(1'b1), .Y(DIV_RATIO_MUX[5]) );
  INVX2M U7 ( .A(1'b1), .Y(DIV_RATIO_MUX[6]) );
  INVX2M U9 ( .A(1'b1), .Y(DIV_RATIO_MUX[7]) );
  NOR4BX1M U11 ( .AN(PRESCALE[4]), .B(n4), .C(PRESCALE[2]), .D(PRESCALE[3]), 
        .Y(DIV_RATIO_MUX[1]) );
  NOR4BX1M U12 ( .AN(PRESCALE[3]), .B(n4), .C(PRESCALE[2]), .D(PRESCALE[4]), 
        .Y(DIV_RATIO_MUX[2]) );
  NOR4X1M U13 ( .A(n2), .B(PRESCALE[3]), .C(PRESCALE[5]), .D(PRESCALE[4]), .Y(
        DIV_RATIO_MUX[3]) );
  OR3X2M U14 ( .A(PRESCALE[0]), .B(PRESCALE[1]), .C(n12), .Y(n2) );
  NOR3X2M U15 ( .A(n3), .B(DIV_RATIO_MUX[2]), .C(DIV_RATIO_MUX[1]), .Y(
        DIV_RATIO_MUX[0]) );
  NOR4X1M U16 ( .A(PRESCALE[4]), .B(PRESCALE[3]), .C(n12), .D(n4), .Y(n3) );
  OR3X2M U17 ( .A(PRESCALE[1]), .B(PRESCALE[5]), .C(PRESCALE[0]), .Y(n4) );
  INVX2M U18 ( .A(PRESCALE[2]), .Y(n12) );
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


module CLK_DIV_DIV_RATIO8_1 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output O_div_clk;
  wire   N3, DIV_CLK_reg, ODD_EDGE_FLAG, N16, N17, N18, N19, N20, N21, N22, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] counter;
  wire   [6:0] half_toggle;
  wire   [6:0] half_toggle_plus;

  CLK_DIV_DIV_RATIO8_1_DW01_inc_0 add_37 ( .A(counter), .SUM({N22, N21, N20, 
        N19, N18, N17, N16}) );
  CLK_DIV_DIV_RATIO8_1_DW01_inc_1 add_48 ( .A(half_toggle), .SUM(
        half_toggle_plus) );
  DFFRQX2M DIV_CLK_reg_reg ( .D(n51), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        DIV_CLK_reg) );
  DFFSQX2M ODD_EDGE_FLAG_reg ( .D(n50), .CK(I_ref_clk), .SN(I_rst_n), .Q(
        ODD_EDGE_FLAG) );
  DFFRQX2M \counter_reg[5]  ( .D(n48), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n47), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(n46), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[6]  ( .D(n49), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[0]  ( .D(n43), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[2]  ( .D(n45), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n44), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]) );
  OR2X2M U3 ( .A(I_div_ratio[2]), .B(I_div_ratio[1]), .Y(n1) );
  MX2X2M U4 ( .A(DIV_CLK_reg), .B(I_ref_clk), .S0(N3), .Y(O_div_clk) );
  OAI2BB1X2M U5 ( .A0N(n41), .A1N(n42), .B0(I_clk_en), .Y(N3) );
  INVX2M U6 ( .A(I_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(I_div_ratio[1]), .Y(half_toggle[0]) );
  OAI2BB1X1M U8 ( .A0N(I_div_ratio[1]), .A1N(I_div_ratio[2]), .B0(n1), .Y(
        half_toggle[1]) );
  OR2X1M U9 ( .A(n1), .B(I_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(I_div_ratio[3]), .B0(n2), .Y(half_toggle[2])
         );
  NOR2X1M U11 ( .A(n2), .B(I_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(I_div_ratio[4]), .B0(n3), .Y(half_toggle[3]) );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(half_toggle[4]) );
  XNOR2X1M U15 ( .A(I_div_ratio[6]), .B(n4), .Y(half_toggle[5]) );
  NOR2X1M U16 ( .A(I_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(I_div_ratio[7]), .B(n5), .Y(half_toggle[6]) );
  AO22X1M U18 ( .A0(N3), .A1(counter[0]), .B0(N16), .B1(n7), .Y(n43) );
  AO22X1M U19 ( .A0(N3), .A1(counter[1]), .B0(N17), .B1(n7), .Y(n44) );
  AO22X1M U20 ( .A0(N3), .A1(counter[2]), .B0(N18), .B1(n7), .Y(n45) );
  AO22X1M U21 ( .A0(N3), .A1(counter[3]), .B0(N19), .B1(n7), .Y(n46) );
  AO22X1M U22 ( .A0(N3), .A1(counter[4]), .B0(N20), .B1(n7), .Y(n47) );
  AO22X1M U23 ( .A0(N3), .A1(counter[5]), .B0(N21), .B1(n7), .Y(n48) );
  AO22X1M U24 ( .A0(N3), .A1(counter[6]), .B0(N22), .B1(n7), .Y(n49) );
  AND3X1M U25 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  XNOR2X1M U26 ( .A(ODD_EDGE_FLAG), .B(n11), .Y(n50) );
  NAND2BX1M U27 ( .AN(n9), .B(n8), .Y(n11) );
  CLKINVX1M U28 ( .A(N3), .Y(n8) );
  CLKXOR2X2M U29 ( .A(DIV_CLK_reg), .B(n12), .Y(n51) );
  AOI21X1M U30 ( .A0(n9), .A1(n10), .B0(N3), .Y(n12) );
  OR2X1M U31 ( .A(n13), .B(I_div_ratio[0]), .Y(n10) );
  CLKNAND2X2M U32 ( .A(n14), .B(I_div_ratio[0]), .Y(n9) );
  MXI2X1M U33 ( .A(n24), .B(n13), .S0(ODD_EDGE_FLAG), .Y(n14) );
  NAND4X1M U34 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n13) );
  NOR4X1M U35 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U36 ( .A(half_toggle[2]), .B(counter[2]), .Y(n32) );
  CLKXOR2X2M U37 ( .A(half_toggle[1]), .B(counter[1]), .Y(n31) );
  CLKXOR2X2M U38 ( .A(half_toggle[0]), .B(counter[0]), .Y(n30) );
  CLKXOR2X2M U39 ( .A(half_toggle[6]), .B(counter[6]), .Y(n29) );
  XNOR2X1M U40 ( .A(counter[4]), .B(half_toggle[4]), .Y(n27) );
  XNOR2X1M U41 ( .A(counter[5]), .B(half_toggle[5]), .Y(n26) );
  XNOR2X1M U42 ( .A(counter[3]), .B(half_toggle[3]), .Y(n25) );
  NAND4X1M U43 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n24) );
  NOR4X1M U44 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U45 ( .A(half_toggle_plus[2]), .B(counter[2]), .Y(n40) );
  CLKXOR2X2M U46 ( .A(half_toggle_plus[1]), .B(counter[1]), .Y(n39) );
  CLKXOR2X2M U47 ( .A(half_toggle_plus[0]), .B(counter[0]), .Y(n38) );
  CLKXOR2X2M U48 ( .A(half_toggle_plus[6]), .B(counter[6]), .Y(n37) );
  XNOR2X1M U49 ( .A(counter[4]), .B(half_toggle_plus[4]), .Y(n35) );
  XNOR2X1M U50 ( .A(counter[5]), .B(half_toggle_plus[5]), .Y(n34) );
  XNOR2X1M U51 ( .A(counter[3]), .B(half_toggle_plus[3]), .Y(n33) );
  NOR4X1M U52 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n42) );
  NOR3X1M U53 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), 
        .Y(n41) );
endmodule


module serializer_UART_DATA_WIDTH8 ( CLK, RST, P_DATA, DATA_VALID, Busy, 
        SER_EN, SER_DONE, SER_DATA );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, Busy, SER_EN;
  output SER_DONE, SER_DATA;
  wire   N23, N24, N25, N27, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n1, n2, n3, n24;
  wire   [7:1] P_DATA_REG;
  wire   [2:0] SER_COUNTER;
  assign SER_DONE = N27;

  DFFRQX2M \P_DATA_REG_reg[0]  ( .D(n16), .CK(CLK), .RN(RST), .Q(SER_DATA) );
  DFFRQX2M \P_DATA_REG_reg[6]  ( .D(n18), .CK(CLK), .RN(RST), .Q(P_DATA_REG[6]) );
  DFFRQX2M \P_DATA_REG_reg[5]  ( .D(n19), .CK(CLK), .RN(RST), .Q(P_DATA_REG[5]) );
  DFFRQX2M \P_DATA_REG_reg[4]  ( .D(n20), .CK(CLK), .RN(RST), .Q(P_DATA_REG[4]) );
  DFFRQX2M \P_DATA_REG_reg[3]  ( .D(n21), .CK(CLK), .RN(RST), .Q(P_DATA_REG[3]) );
  DFFRQX2M \P_DATA_REG_reg[2]  ( .D(n22), .CK(CLK), .RN(RST), .Q(P_DATA_REG[2]) );
  DFFRQX2M \P_DATA_REG_reg[1]  ( .D(n23), .CK(CLK), .RN(RST), .Q(P_DATA_REG[1]) );
  DFFRQX2M \P_DATA_REG_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA_REG[7]) );
  DFFRQX2M \SER_COUNTER_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(
        SER_COUNTER[1]) );
  DFFRQX2M \SER_COUNTER_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .Q(
        SER_COUNTER[2]) );
  DFFRQX2M \SER_COUNTER_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(
        SER_COUNTER[0]) );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  INVX2M U5 ( .A(SER_EN), .Y(n2) );
  OAI2BB1X2M U6 ( .A0N(SER_DATA), .A1N(n4), .B0(n5), .Y(n16) );
  AOI22X1M U7 ( .A0(P_DATA_REG[1]), .A1(n6), .B0(P_DATA[0]), .B1(n1), .Y(n5)
         );
  OAI2BB1X2M U8 ( .A0N(P_DATA_REG[1]), .A1N(n4), .B0(n13), .Y(n23) );
  AOI22X1M U9 ( .A0(P_DATA_REG[2]), .A1(n6), .B0(P_DATA[1]), .B1(n1), .Y(n13)
         );
  OAI2BB1X2M U10 ( .A0N(n4), .A1N(P_DATA_REG[2]), .B0(n12), .Y(n22) );
  AOI22X1M U11 ( .A0(P_DATA_REG[3]), .A1(n6), .B0(P_DATA[2]), .B1(n1), .Y(n12)
         );
  OAI2BB1X2M U12 ( .A0N(n4), .A1N(P_DATA_REG[3]), .B0(n11), .Y(n21) );
  AOI22X1M U13 ( .A0(P_DATA_REG[4]), .A1(n6), .B0(P_DATA[3]), .B1(n1), .Y(n11)
         );
  OAI2BB1X2M U14 ( .A0N(n4), .A1N(P_DATA_REG[4]), .B0(n10), .Y(n20) );
  AOI22X1M U15 ( .A0(P_DATA_REG[5]), .A1(n6), .B0(P_DATA[4]), .B1(n1), .Y(n10)
         );
  OAI2BB1X2M U16 ( .A0N(n4), .A1N(P_DATA_REG[5]), .B0(n9), .Y(n19) );
  AOI22X1M U17 ( .A0(P_DATA_REG[6]), .A1(n6), .B0(P_DATA[5]), .B1(n1), .Y(n9)
         );
  OAI2BB1X2M U18 ( .A0N(n4), .A1N(P_DATA_REG[6]), .B0(n8), .Y(n18) );
  AOI22X1M U19 ( .A0(P_DATA_REG[7]), .A1(n6), .B0(P_DATA[6]), .B1(n1), .Y(n8)
         );
  AO22X1M U20 ( .A0(n4), .A1(P_DATA_REG[7]), .B0(P_DATA[7]), .B1(n1), .Y(n17)
         );
  AND3X2M U21 ( .A(SER_COUNTER[0]), .B(SER_COUNTER[2]), .C(SER_COUNTER[1]), 
        .Y(N27) );
  OAI2BB2X1M U22 ( .B0(n14), .B1(n2), .A0N(SER_COUNTER[2]), .A1N(N23), .Y(N25)
         );
  AOI32X1M U23 ( .A0(SER_COUNTER[0]), .A1(n24), .A2(SER_COUNTER[1]), .B0(
        SER_COUNTER[2]), .B1(n3), .Y(n14) );
  INVX2M U24 ( .A(SER_COUNTER[2]), .Y(n24) );
  NOR2X2M U25 ( .A(n2), .B(SER_COUNTER[0]), .Y(N23) );
  BUFX2M U26 ( .A(n7), .Y(n1) );
  NOR2BX2M U27 ( .AN(DATA_VALID), .B(Busy), .Y(n7) );
  NOR2X2M U28 ( .A(n15), .B(n2), .Y(N24) );
  CLKXOR2X2M U29 ( .A(SER_COUNTER[0]), .B(n3), .Y(n15) );
  INVX2M U30 ( .A(SER_COUNTER[1]), .Y(n3) );
endmodule


module MUX ( CLK, RST, mux_sel, IN0, IN1, IN2, IN3, MUX_OUT );
  input [1:0] mux_sel;
  input CLK, RST, IN0, IN1, IN2, IN3;
  output MUX_OUT;
  wire   mux_comb, n2, n3, n1;

  DFFRQX2M MUX_OUT_reg ( .D(mux_comb), .CK(CLK), .RN(RST), .Q(MUX_OUT) );
  INVX2M U3 ( .A(mux_sel[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(
        mux_comb) );
  AOI22X1M U5 ( .A0(IN0), .A1(n1), .B0(mux_sel[0]), .B1(IN1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN2), .A1(n1), .B0(IN3), .B1(mux_sel[0]), .Y(n2) );
endmodule


module FSM_TX_UART_DATA_WIDTH8 ( CLK, RST, DATA_VALID, PAR_EN, SER_DONE, 
        SER_EN, Busy, mux_sel );
  output [1:0] mux_sel;
  input CLK, RST, DATA_VALID, PAR_EN, SER_DONE;
  output SER_EN, Busy;
  wire   Busy_REG, n7, n8, n9, n10, n11, n1, n2, n3, n4, n5, n6;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M Busy_reg ( .D(Busy_REG), .CK(CLK), .RN(RST), .Q(Busy) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  OAI31X1M U3 ( .A0(n6), .A1(n5), .A2(n3), .B0(n10), .Y(next_state[0]) );
  NAND3X2M U4 ( .A(n11), .B(n4), .C(DATA_VALID), .Y(n10) );
  INVX2M U5 ( .A(n11), .Y(n2) );
  INVX2M U6 ( .A(SER_EN), .Y(n3) );
  INVX2M U7 ( .A(SER_DONE), .Y(n5) );
  NOR2X2M U8 ( .A(n8), .B(current_state[0]), .Y(SER_EN) );
  NAND2X2M U9 ( .A(current_state[1]), .B(n4), .Y(n8) );
  INVX2M U10 ( .A(current_state[2]), .Y(n4) );
  OAI32X1M U11 ( .A0(n1), .A1(current_state[2]), .A2(current_state[1]), .B0(n9), .B1(n3), .Y(next_state[1]) );
  NOR2X2M U12 ( .A(PAR_EN), .B(n5), .Y(n9) );
  OAI21X2M U13 ( .A0(n8), .A1(n1), .B0(n2), .Y(mux_sel[1]) );
  OAI21X2M U14 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n2), .Y(
        mux_sel[0]) );
  OAI221X1M U15 ( .A0(n2), .A1(n4), .B0(current_state[2]), .B1(n1), .C0(n8), 
        .Y(Busy_REG) );
  NOR2X2M U16 ( .A(current_state[0]), .B(current_state[1]), .Y(n11) );
  INVX2M U17 ( .A(current_state[0]), .Y(n1) );
  NOR2X2M U18 ( .A(n7), .B(n8), .Y(next_state[2]) );
  AOI21X2M U19 ( .A0(SER_DONE), .A1(n6), .B0(current_state[0]), .Y(n7) );
  INVX2M U20 ( .A(PAR_EN), .Y(n6) );
endmodule


module parity_calc_UART_DATA_WIDTH8 ( P_DATA, Busy, DATA_VALID, PAR_TYPE, 
        PAR_EN, CLK, RST, par_bit );
  input [7:0] P_DATA;
  input Busy, DATA_VALID, PAR_TYPE, PAR_EN, CLK, RST;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] P_DATA_REG;

  DFFRQX2M \P_DATA_REG_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA_REG[1]) );
  DFFRQX2M \P_DATA_REG_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(P_DATA_REG[0])
         );
  DFFRQX2M \P_DATA_REG_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA_REG[2]) );
  DFFRQX2M par_bit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_bit) );
  DFFRQX2M \P_DATA_REG_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA_REG[3]) );
  DFFRQX2M \P_DATA_REG_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA_REG[5]) );
  DFFRQX2M \P_DATA_REG_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA_REG[4]) );
  DFFRQX2M \P_DATA_REG_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA_REG[6]) );
  DFFRQX2M \P_DATA_REG_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA_REG[7]) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  INVX2M U3 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U4 ( .A(n3), .B(PAR_TYPE), .C(n4), .Y(n1) );
  XOR3XLM U5 ( .A(P_DATA_REG[1]), .B(P_DATA_REG[0]), .C(n5), .Y(n4) );
  XOR3XLM U6 ( .A(P_DATA_REG[5]), .B(P_DATA_REG[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U7 ( .A(P_DATA_REG[7]), .B(P_DATA_REG[6]), .Y(n6) );
  AO2B2X2M U8 ( .B0(P_DATA[0]), .B1(n7), .A0(P_DATA_REG[0]), .A1N(n7), .Y(n9)
         );
  AO2B2X2M U9 ( .B0(P_DATA[1]), .B1(n7), .A0(P_DATA_REG[1]), .A1N(n7), .Y(n10)
         );
  AO2B2X2M U10 ( .B0(P_DATA[2]), .B1(n7), .A0(P_DATA_REG[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U11 ( .B0(P_DATA[3]), .B1(n7), .A0(P_DATA_REG[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U12 ( .B0(P_DATA[4]), .B1(n7), .A0(P_DATA_REG[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U13 ( .B0(P_DATA[5]), .B1(n7), .A0(P_DATA_REG[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U14 ( .B0(P_DATA[6]), .B1(n7), .A0(P_DATA_REG[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U15 ( .B0(P_DATA[7]), .B1(n7), .A0(P_DATA_REG[7]), .A1N(n7), .Y(n16) );
  NOR2BX2M U16 ( .AN(DATA_VALID), .B(Busy), .Y(n7) );
  XNOR2X2M U17 ( .A(P_DATA_REG[2]), .B(P_DATA_REG[3]), .Y(n5) );
endmodule


module UART_TX_UART_DATA_WIDTH8 ( CLK, RST, PAR_TYP, PAR_EN, DATA_VALID, 
        P_DATA, TX_OUT, Busy );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, DATA_VALID;
  output TX_OUT, Busy;
  wire   ser_en, ser_done, ser_data, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  serializer_UART_DATA_WIDTH8 serializer_unit ( .CLK(CLK), .RST(n1), .P_DATA(
        P_DATA), .DATA_VALID(DATA_VALID), .Busy(Busy), .SER_EN(ser_en), 
        .SER_DONE(ser_done), .SER_DATA(ser_data) );
  MUX MUX_unit ( .CLK(CLK), .RST(n1), .mux_sel(mux_sel), .IN0(1'b0), .IN1(
        ser_data), .IN2(par_bit), .IN3(1'b1), .MUX_OUT(TX_OUT) );
  FSM_TX_UART_DATA_WIDTH8 FSM_TX_unit ( .CLK(CLK), .RST(n1), .DATA_VALID(
        DATA_VALID), .PAR_EN(PAR_EN), .SER_DONE(ser_done), .SER_EN(ser_en), 
        .Busy(Busy), .mux_sel(mux_sel) );
  parity_calc_UART_DATA_WIDTH8 parity_calc_unit ( .P_DATA(P_DATA), .Busy(Busy), 
        .DATA_VALID(DATA_VALID), .PAR_TYPE(PAR_TYP), .PAR_EN(PAR_EN), .CLK(CLK), .RST(n1), .par_bit(par_bit) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module data_sampling_UART_DATA_WIDTH8 ( CLK, RST, prescale, edge_cnt, RX_IN, 
        data_samp_en, sampled_bit );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, data_samp_en;
  output sampled_bit;
  wire   n19, n20, n21, n22, \add_65/carry[4] , \add_65/carry[3] ,
         \add_65/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [2:0] samples;
  wire   [4:0] NEG_EDGE_MINUS;
  wire   [4:0] NEG_EDGE;
  wire   [4:0] NEG_EDGE_PLUS;

  DFFRQX2M \samples_reg[2]  ( .D(n22), .CK(CLK), .RN(RST), .Q(samples[2]) );
  DFFRQX2M \samples_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(samples[0]) );
  DFFRQX2M \samples_reg[1]  ( .D(n21), .CK(CLK), .RN(RST), .Q(samples[1]) );
  DFFRQX2M sampled_bit_reg ( .D(n19), .CK(CLK), .RN(RST), .Q(sampled_bit) );
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
  CLKXOR2X2M U22 ( .A(NEG_EDGE[4]), .B(n7), .Y(NEG_EDGE_MINUS[4]) );
  CLKXOR2X2M U23 ( .A(\add_65/carry[4] ), .B(NEG_EDGE[4]), .Y(NEG_EDGE_PLUS[4]) );
  MXI2X1M U24 ( .A(n9), .B(n10), .S0(n11), .Y(n22) );
  NOR4X1M U25 ( .A(n12), .B(n13), .C(edge_cnt[5]), .D(n14), .Y(n11) );
  OAI31X1M U26 ( .A0(n15), .A1(n16), .A2(n17), .B0(n18), .Y(n13) );
  XNOR2X1M U27 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n18) );
  OR2X1M U28 ( .A(n23), .B(n24), .Y(n15) );
  NAND4X1M U29 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n12) );
  XNOR2X1M U30 ( .A(edge_cnt[1]), .B(NEG_EDGE_PLUS[1]), .Y(n28) );
  XNOR2X1M U31 ( .A(edge_cnt[2]), .B(NEG_EDGE_PLUS[2]), .Y(n27) );
  XNOR2X1M U32 ( .A(edge_cnt[3]), .B(NEG_EDGE_PLUS[3]), .Y(n26) );
  XNOR2X1M U33 ( .A(edge_cnt[4]), .B(NEG_EDGE_PLUS[4]), .Y(n25) );
  CLKNAND2X2M U34 ( .A(samples[2]), .B(data_samp_en), .Y(n9) );
  MXI2X1M U35 ( .A(n29), .B(n10), .S0(n30), .Y(n21) );
  NOR4X1M U36 ( .A(n31), .B(n23), .C(n14), .D(n24), .Y(n30) );
  CLKXOR2X2M U37 ( .A(edge_cnt[4]), .B(NEG_EDGE[4]), .Y(n24) );
  CLKXOR2X2M U38 ( .A(edge_cnt[3]), .B(NEG_EDGE[3]), .Y(n23) );
  OR2X1M U39 ( .A(n17), .B(n16), .Y(n31) );
  NAND3BX1M U40 ( .AN(edge_cnt[5]), .B(n32), .C(n33), .Y(n16) );
  XNOR2X1M U41 ( .A(edge_cnt[0]), .B(NEG_EDGE[0]), .Y(n33) );
  XNOR2X1M U42 ( .A(edge_cnt[1]), .B(NEG_EDGE[1]), .Y(n32) );
  CLKXOR2X2M U43 ( .A(edge_cnt[2]), .B(NEG_EDGE[2]), .Y(n17) );
  CLKNAND2X2M U44 ( .A(samples[1]), .B(data_samp_en), .Y(n29) );
  MXI2X1M U45 ( .A(n34), .B(n10), .S0(n14), .Y(n20) );
  AND4X1M U46 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n14) );
  NOR3X1M U47 ( .A(n39), .B(edge_cnt[5]), .C(n40), .Y(n38) );
  CLKXOR2X2M U48 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n40) );
  CLKXOR2X2M U49 ( .A(edge_cnt[4]), .B(NEG_EDGE_MINUS[4]), .Y(n39) );
  XNOR2X1M U50 ( .A(edge_cnt[2]), .B(NEG_EDGE_MINUS[2]), .Y(n37) );
  XNOR2X1M U51 ( .A(edge_cnt[3]), .B(NEG_EDGE_MINUS[3]), .Y(n36) );
  XNOR2X1M U52 ( .A(edge_cnt[1]), .B(NEG_EDGE_MINUS[1]), .Y(n35) );
  CLKNAND2X2M U53 ( .A(data_samp_en), .B(RX_IN), .Y(n10) );
  CLKNAND2X2M U54 ( .A(samples[0]), .B(data_samp_en), .Y(n34) );
  CLKMX2X2M U55 ( .A(sampled_bit), .B(n41), .S0(data_samp_en), .Y(n19) );
  OAI2BB1X1M U56 ( .A0N(samples[1]), .A1N(samples[0]), .B0(n42), .Y(n41) );
  OAI21X1M U57 ( .A0(samples[0]), .A1(samples[1]), .B0(samples[2]), .Y(n42) );
endmodule


module deserializer_UART_DATA_WIDTH8 ( CLK, RST, deser_en, prescale, edge_cnt, 
        sampled_bit, P_DATA );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sampled_bit;
  wire   last_edge, N5, N6, N7, N8, N9, N10, N11, n5, n6, n7, n8, n9, n10, n11,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n1, n2, n3, n4, n12, n22,
         n23, n24, n25, n26, n27, n28, n29, n30;

  DFFRX1M \P_DATA_reg[5]  ( .D(n19), .CK(CLK), .RN(RST), .Q(P_DATA[5]), .QN(n7) );
  DFFRX1M \P_DATA_reg[1]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[1]), .QN(
        n11) );
  DFFRX1M \P_DATA_reg[4]  ( .D(n18), .CK(CLK), .RN(RST), .Q(P_DATA[4]), .QN(n8) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRX1M \P_DATA_reg[7]  ( .D(n21), .CK(CLK), .RN(RST), .Q(P_DATA[7]), .QN(n5) );
  DFFRX1M \P_DATA_reg[3]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[3]), .QN(n9) );
  DFFRX1M \P_DATA_reg[6]  ( .D(n20), .CK(CLK), .RN(RST), .Q(P_DATA[6]), .QN(n6) );
  DFFRX1M \P_DATA_reg[2]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[2]), .QN(
        n10) );
  INVX2M U3 ( .A(n13), .Y(n30) );
  NAND2X2M U4 ( .A(last_edge), .B(deser_en), .Y(n13) );
  OAI22X1M U5 ( .A0(n13), .A1(n10), .B0(n30), .B1(n11), .Y(n15) );
  OAI22X1M U6 ( .A0(n13), .A1(n9), .B0(n30), .B1(n10), .Y(n16) );
  OAI22X1M U7 ( .A0(n13), .A1(n8), .B0(n30), .B1(n9), .Y(n17) );
  OAI22X1M U8 ( .A0(n13), .A1(n7), .B0(n30), .B1(n8), .Y(n18) );
  OAI22X1M U9 ( .A0(n13), .A1(n6), .B0(n30), .B1(n7), .Y(n19) );
  OAI22X1M U10 ( .A0(n13), .A1(n5), .B0(n30), .B1(n6), .Y(n20) );
  OAI2BB2X1M U11 ( .B0(n13), .B1(n11), .A0N(P_DATA[0]), .A1N(n13), .Y(n14) );
  OAI2BB2X1M U12 ( .B0(n30), .B1(n5), .A0N(sampled_bit), .A1N(n30), .Y(n21) );
  OR2X2M U13 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U14 ( .A(prescale[0]), .Y(N5) );
  OAI2BB1X1M U15 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N6) );
  OR2X1M U16 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U17 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N7) );
  OR2X1M U18 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U19 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N8) );
  OR2X1M U20 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U21 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N9) );
  NOR2X1M U22 ( .A(n4), .B(prescale[5]), .Y(N11) );
  AO21XLM U23 ( .A0(n4), .A1(prescale[5]), .B0(N11), .Y(N10) );
  NOR2BX1M U24 ( .AN(N5), .B(edge_cnt[0]), .Y(n12) );
  OAI2B2X1M U25 ( .A1N(edge_cnt[1]), .A0(n12), .B0(N6), .B1(n12), .Y(n25) );
  XNOR2X1M U26 ( .A(N10), .B(edge_cnt[5]), .Y(n24) );
  NOR2BX1M U27 ( .AN(edge_cnt[0]), .B(N5), .Y(n22) );
  OAI2B2X1M U28 ( .A1N(N6), .A0(n22), .B0(edge_cnt[1]), .B1(n22), .Y(n23) );
  NAND4BX1M U29 ( .AN(N11), .B(n25), .C(n24), .D(n23), .Y(n29) );
  CLKXOR2X2M U30 ( .A(N9), .B(edge_cnt[4]), .Y(n28) );
  CLKXOR2X2M U31 ( .A(N7), .B(edge_cnt[2]), .Y(n27) );
  CLKXOR2X2M U32 ( .A(N8), .B(edge_cnt[3]), .Y(n26) );
  NOR4X1M U33 ( .A(n29), .B(n28), .C(n27), .D(n26), .Y(last_edge) );
endmodule


module edge_bit_counter_UART_DATA_WIDTH8 ( CLK, RST, prescale, enable, 
        edge_cnt, bit_cnt );
  input [5:0] prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable;
  wire   last_edge, N9, N10, N11, N12, N14, N15, N16, N17, N18, N19, N36, N37,
         N38, N39, N40, N41, N42, n8, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, \add_22/carry[5] , \add_22/carry[4] ,
         \add_22/carry[3] , \add_22/carry[2] , n1, n2, n3, n4, n5, n6, n7, n9,
         n10, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;

  DFFRX1M \bit_cnt_reg[2]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_cnt[2]), .QN(
        n8) );
  DFFRQX2M \bit_cnt_reg[3]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N19), .CK(CLK), .RN(RST), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N14), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N17), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N16), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N18), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N15), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  NAND2BX2M U3 ( .AN(last_edge), .B(enable), .Y(n12) );
  NAND2X2M U4 ( .A(enable), .B(last_edge), .Y(n15) );
  NOR2BX2M U5 ( .AN(N9), .B(n12), .Y(N15) );
  NOR2BX2M U6 ( .AN(N10), .B(n12), .Y(N16) );
  NOR2BX2M U7 ( .AN(N11), .B(n12), .Y(N17) );
  NOR2BX2M U8 ( .AN(N12), .B(n12), .Y(N18) );
  OAI32X1M U9 ( .A0(n15), .A1(bit_cnt[1]), .A2(n29), .B0(n27), .B1(n30), .Y(
        n20) );
  INVX2M U10 ( .A(n17), .Y(n27) );
  OAI21X2M U11 ( .A0(bit_cnt[0]), .A1(n15), .B0(n12), .Y(n17) );
  OAI2B2X1M U12 ( .A1N(enable), .A0(n11), .B0(n31), .B1(n12), .Y(n18) );
  AOI32XLM U13 ( .A0(n13), .A1(n31), .A2(last_edge), .B0(bit_cnt[3]), .B1(n28), 
        .Y(n11) );
  INVX2M U14 ( .A(bit_cnt[3]), .Y(n31) );
  INVX2M U15 ( .A(n13), .Y(n28) );
  OAI22X1M U16 ( .A0(n29), .A1(n12), .B0(bit_cnt[0]), .B1(n15), .Y(n21) );
  NOR2X2M U17 ( .A(n1), .B(n12), .Y(N19) );
  XNOR2X2M U18 ( .A(\add_22/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U19 ( .A(edge_cnt[0]), .B(n12), .Y(N14) );
  OAI32X1M U20 ( .A0(n14), .A1(n30), .A2(n15), .B0(n16), .B1(n8), .Y(n19) );
  NAND2X2M U21 ( .A(bit_cnt[0]), .B(n8), .Y(n14) );
  AOI2BB1X2M U22 ( .A0N(n15), .A1N(bit_cnt[1]), .B0(n17), .Y(n16) );
  NOR3X2M U23 ( .A(n30), .B(n29), .C(n8), .Y(n13) );
  INVX2M U24 ( .A(bit_cnt[0]), .Y(n29) );
  INVX2M U25 ( .A(bit_cnt[1]), .Y(n30) );
  ADDHX1M U26 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_22/carry[2] ), .S(
        N9) );
  ADDHX1M U27 ( .A(edge_cnt[2]), .B(\add_22/carry[2] ), .CO(\add_22/carry[3] ), 
        .S(N10) );
  ADDHX1M U28 ( .A(edge_cnt[3]), .B(\add_22/carry[3] ), .CO(\add_22/carry[4] ), 
        .S(N11) );
  ADDHX1M U29 ( .A(edge_cnt[4]), .B(\add_22/carry[4] ), .CO(\add_22/carry[5] ), 
        .S(N12) );
  OR2X2M U30 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  CLKINVX1M U31 ( .A(prescale[0]), .Y(N36) );
  OAI2BB1X1M U32 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N37) );
  OR2X1M U33 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U34 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N38) );
  OR2X1M U35 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U36 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N39) );
  OR2X1M U37 ( .A(n4), .B(prescale[4]), .Y(n5) );
  OAI2BB1X1M U38 ( .A0N(n4), .A1N(prescale[4]), .B0(n5), .Y(N40) );
  NOR2X1M U39 ( .A(n5), .B(prescale[5]), .Y(N42) );
  AO21XLM U40 ( .A0(n5), .A1(prescale[5]), .B0(N42), .Y(N41) );
  NOR2BX1M U41 ( .AN(N36), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U42 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N37), .B1(n6), .Y(n22) );
  XNOR2X1M U43 ( .A(N41), .B(edge_cnt[5]), .Y(n10) );
  NOR2BX1M U44 ( .AN(edge_cnt[0]), .B(N36), .Y(n7) );
  OAI2B2X1M U45 ( .A1N(N37), .A0(n7), .B0(edge_cnt[1]), .B1(n7), .Y(n9) );
  NAND4BX1M U46 ( .AN(N42), .B(n22), .C(n10), .D(n9), .Y(n26) );
  CLKXOR2X2M U47 ( .A(N40), .B(edge_cnt[4]), .Y(n25) );
  CLKXOR2X2M U48 ( .A(N38), .B(edge_cnt[2]), .Y(n24) );
  CLKXOR2X2M U49 ( .A(N39), .B(edge_cnt[3]), .Y(n23) );
  NOR4X1M U50 ( .A(n26), .B(n25), .C(n24), .D(n23), .Y(last_edge) );
endmodule


module FSM_RX_UART_DATA_WIDTH8 ( CLK, RST, PAR_EN, prescale, par_err, edge_cnt, 
        bit_cnt, start_glitch, stop_err, S_DATA, par_chk_en, start_chk_en, 
        enable, data_samp_en, stop_chk_en, deser_en, data_valid );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input CLK, RST, PAR_EN, par_err, start_glitch, stop_err, S_DATA;
  output par_chk_en, start_chk_en, enable, data_samp_en, stop_chk_en, deser_en,
         data_valid;
  wire   \sub_172/carry[5] , \sub_172/carry[4] , \sub_172/carry[3] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [5:0] NEG_EDGE;
  wire   [5:0] NEG_EDGE_MINUS;
  assign NEG_EDGE_MINUS[0] = prescale[0];

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  XNOR2X2M U3 ( .A(edge_cnt[1]), .B(prescale[1]), .Y(n31) );
  OR2X2M U4 ( .A(prescale[1]), .B(NEG_EDGE_MINUS[0]), .Y(n1) );
  INVX2M U5 ( .A(prescale[3]), .Y(n5) );
  XNOR2X1M U6 ( .A(prescale[5]), .B(\sub_172/carry[5] ), .Y(NEG_EDGE_MINUS[5])
         );
  OR2X1M U7 ( .A(prescale[4]), .B(\sub_172/carry[4] ), .Y(\sub_172/carry[5] )
         );
  XNOR2X1M U8 ( .A(\sub_172/carry[4] ), .B(prescale[4]), .Y(NEG_EDGE_MINUS[4])
         );
  OR2X1M U9 ( .A(prescale[3]), .B(\sub_172/carry[3] ), .Y(\sub_172/carry[4] )
         );
  XNOR2X1M U10 ( .A(\sub_172/carry[3] ), .B(prescale[3]), .Y(NEG_EDGE_MINUS[3]) );
  OR2X1M U11 ( .A(prescale[2]), .B(prescale[1]), .Y(\sub_172/carry[3] ) );
  XNOR2X1M U12 ( .A(prescale[1]), .B(prescale[2]), .Y(NEG_EDGE_MINUS[2]) );
  CLKINVX1M U13 ( .A(NEG_EDGE_MINUS[0]), .Y(NEG_EDGE[0]) );
  OAI2BB1X1M U14 ( .A0N(NEG_EDGE_MINUS[0]), .A1N(prescale[1]), .B0(n1), .Y(
        NEG_EDGE[1]) );
  NOR2X1M U15 ( .A(n1), .B(prescale[2]), .Y(n2) );
  AO21XLM U16 ( .A0(n1), .A1(prescale[2]), .B0(n2), .Y(NEG_EDGE[2]) );
  CLKNAND2X2M U17 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U18 ( .A0(n2), .A1(n5), .B0(n3), .Y(NEG_EDGE[3]) );
  XNOR2X1M U19 ( .A(prescale[4]), .B(n3), .Y(NEG_EDGE[4]) );
  NOR2X1M U20 ( .A(prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U21 ( .A(prescale[5]), .B(n4), .Y(NEG_EDGE[5]) );
  NOR2X1M U22 ( .A(n6), .B(n7), .Y(start_chk_en) );
  OAI221X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .B1(n11), .C0(n12), .Y(
        next_state[2]) );
  CLKINVX1M U24 ( .A(deser_en), .Y(n9) );
  OAI21X1M U25 ( .A0(n13), .A1(n11), .B0(n14), .Y(next_state[1]) );
  AOI32X1M U26 ( .A0(n15), .A1(current_state[0]), .A2(n16), .B0(deser_en), 
        .B1(n8), .Y(n14) );
  NAND3BX1M U27 ( .AN(PAR_EN), .B(n15), .C(bit_cnt[3]), .Y(n8) );
  NOR3X1M U28 ( .A(n7), .B(start_glitch), .C(bit_cnt[3]), .Y(n16) );
  OAI221X1M U29 ( .A0(n17), .A1(n18), .B0(n13), .B1(n11), .C0(n19), .Y(
        next_state[0]) );
  MXI2X1M U30 ( .A(n20), .B(n21), .S0(n22), .Y(n19) );
  NOR2X1M U31 ( .A(S_DATA), .B(n7), .Y(n21) );
  OAI22X1M U32 ( .A0(S_DATA), .A1(n23), .B0(n24), .B1(n7), .Y(n20) );
  OR2X1M U33 ( .A(current_state[1]), .B(current_state[2]), .Y(n7) );
  AND2X1M U34 ( .A(n15), .B(n18), .Y(n24) );
  CLKINVX1M U35 ( .A(par_chk_en), .Y(n11) );
  NOR2X1M U36 ( .A(n22), .B(n25), .Y(par_chk_en) );
  CLKINVX1M U37 ( .A(n10), .Y(n13) );
  NAND3X1M U38 ( .A(bit_cnt[3]), .B(n26), .C(bit_cnt[0]), .Y(n10) );
  CLKINVX1M U39 ( .A(bit_cnt[3]), .Y(n18) );
  AOI31X1M U40 ( .A0(deser_en), .A1(n15), .A2(PAR_EN), .B0(n27), .Y(n17) );
  NOR4X1M U41 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n27) );
  CLKXOR2X2M U42 ( .A(edge_cnt[0]), .B(NEG_EDGE_MINUS[0]), .Y(n30) );
  NAND3BX1M U43 ( .AN(bit_cnt[2]), .B(stop_chk_en), .C(n32), .Y(n29) );
  XNOR2X1M U44 ( .A(edge_cnt[4]), .B(NEG_EDGE_MINUS[4]), .Y(n32) );
  NAND4X1M U45 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n28) );
  XNOR2X1M U46 ( .A(edge_cnt[5]), .B(NEG_EDGE_MINUS[5]), .Y(n36) );
  XNOR2X1M U47 ( .A(edge_cnt[2]), .B(NEG_EDGE_MINUS[2]), .Y(n35) );
  XNOR2X1M U48 ( .A(edge_cnt[3]), .B(NEG_EDGE_MINUS[3]), .Y(n34) );
  MXI2X1M U49 ( .A(n37), .B(n38), .S0(bit_cnt[0]), .Y(n33) );
  OR2X1M U50 ( .A(bit_cnt[1]), .B(PAR_EN), .Y(n38) );
  CLKNAND2X2M U51 ( .A(bit_cnt[1]), .B(PAR_EN), .Y(n37) );
  NOR2BX1M U52 ( .AN(n26), .B(bit_cnt[0]), .Y(n15) );
  AND2X1M U53 ( .A(n39), .B(n40), .Y(n26) );
  NOR4X1M U54 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .C(n41), .D(n42), .Y(n40) );
  CLKXOR2X2M U55 ( .A(edge_cnt[0]), .B(NEG_EDGE[0]), .Y(n42) );
  CLKXOR2X2M U56 ( .A(edge_cnt[4]), .B(NEG_EDGE[4]), .Y(n41) );
  NOR4X1M U57 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n39) );
  CLKXOR2X2M U58 ( .A(edge_cnt[3]), .B(NEG_EDGE[3]), .Y(n46) );
  CLKXOR2X2M U59 ( .A(edge_cnt[2]), .B(NEG_EDGE[2]), .Y(n45) );
  CLKXOR2X2M U60 ( .A(edge_cnt[5]), .B(NEG_EDGE[5]), .Y(n44) );
  CLKXOR2X2M U61 ( .A(edge_cnt[1]), .B(NEG_EDGE[1]), .Y(n43) );
  OAI211X1M U62 ( .A0(current_state[2]), .A1(n6), .B0(n25), .C0(n12), .Y(
        enable) );
  CLKINVX1M U63 ( .A(stop_chk_en), .Y(n12) );
  NOR2X1M U64 ( .A(n23), .B(current_state[0]), .Y(stop_chk_en) );
  NOR2X1M U65 ( .A(n25), .B(current_state[0]), .Y(deser_en) );
  NOR4X1M U66 ( .A(stop_err), .B(par_err), .C(n23), .D(n22), .Y(data_valid) );
  OAI211X1M U67 ( .A0(current_state[1]), .A1(n6), .B0(n25), .C0(n23), .Y(
        data_samp_en) );
  NAND2BX1M U68 ( .AN(current_state[1]), .B(current_state[2]), .Y(n23) );
  NAND2BX1M U69 ( .AN(current_state[2]), .B(current_state[1]), .Y(n25) );
  AND2X1M U70 ( .A(S_DATA), .B(n22), .Y(n6) );
  CLKINVX1M U71 ( .A(current_state[0]), .Y(n22) );
endmodule


module parity_check_UART_DATA_WIDTH8 ( CLK, RST, par_chk_en, sampled_bit, 
        PAR_TYPE, P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, par_chk_en, sampled_bit, PAR_TYPE;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  XOR3XLM U2 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U4 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U5 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U7 ( .A(par_chk_en), .Y(n2) );
  XOR3XLM U8 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XNOR2X2M U9 ( .A(sampled_bit), .B(PAR_TYPE), .Y(n5) );
endmodule


module start_check ( CLK, RST, start_chk_en, sampled_bit, start_glitch );
  input CLK, RST, start_chk_en, sampled_bit;
  output start_glitch;
  wire   n1;

  DFFRQX2M start_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(start_glitch) );
  AO2B2X2M U2 ( .B0(start_chk_en), .B1(sampled_bit), .A0(start_glitch), .A1N(
        start_chk_en), .Y(n1) );
endmodule


module stop_check ( CLK, RST, stop_chk_en, sampled_bit, stop_err );
  input CLK, RST, stop_chk_en, sampled_bit;
  output stop_err;
  wire   N1;

  DFFRQX2M stop_err_reg ( .D(N1), .CK(CLK), .RN(RST), .Q(stop_err) );
  NOR2BX2M U3 ( .AN(stop_chk_en), .B(sampled_bit), .Y(N1) );
endmodule


module UART_RX_UART_DATA_WIDTH8 ( CLK, RST, PAR_TYPE, PAR_EN, Prescale, RX_IN, 
        P_DATA, data_valid, Parity_Error, Stop_Error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, PAR_TYPE, PAR_EN, RX_IN;
  output data_valid, Parity_Error, Stop_Error;
  wire   data_samp_en, sampled_bit, deser_en, enable, start_glitch, par_chk_en,
         start_chk_en, stop_chk_en, n1, n2;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  data_sampling_UART_DATA_WIDTH8 data_sampling_UNIT ( .CLK(CLK), .RST(n1), 
        .prescale(Prescale), .edge_cnt(edge_cnt), .RX_IN(RX_IN), 
        .data_samp_en(data_samp_en), .sampled_bit(sampled_bit) );
  deserializer_UART_DATA_WIDTH8 deserializer_UNIT ( .CLK(CLK), .RST(n1), 
        .deser_en(deser_en), .prescale(Prescale), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit), .P_DATA(P_DATA) );
  edge_bit_counter_UART_DATA_WIDTH8 edge_bit_counter_UNIT ( .CLK(CLK), .RST(n1), .prescale(Prescale), .enable(enable), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt)
         );
  FSM_RX_UART_DATA_WIDTH8 FSM_RX_UNIT ( .CLK(CLK), .RST(n1), .PAR_EN(PAR_EN), 
        .prescale(Prescale), .par_err(1'b0), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt), .start_glitch(start_glitch), .stop_err(1'b0), .S_DATA(RX_IN), 
        .par_chk_en(par_chk_en), .start_chk_en(start_chk_en), .enable(enable), 
        .data_samp_en(data_samp_en), .stop_chk_en(stop_chk_en), .deser_en(
        deser_en), .data_valid(data_valid) );
  parity_check_UART_DATA_WIDTH8 parity_check_UNIT ( .CLK(CLK), .RST(n1), 
        .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), .PAR_TYPE(PAR_TYPE), .P_DATA(P_DATA), .par_err(Parity_Error) );
  start_check start_check_UNIT ( .CLK(CLK), .RST(n1), .start_chk_en(
        start_chk_en), .sampled_bit(sampled_bit), .start_glitch(start_glitch)
         );
  stop_check stop_check_UNIT ( .CLK(CLK), .RST(n1), .stop_chk_en(stop_chk_en), 
        .sampled_bit(sampled_bit), .stop_err(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_UART_DATA_WIDTH8 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, 
        RX_OUT_V, TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, 
        parity_enable, parity_type, parity_error, Stop_Error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, Stop_Error;
  wire   n1, n2;

  UART_TX_UART_DATA_WIDTH8 UART_TX_UNIT ( .CLK(TX_CLK), .RST(n1), .PAR_TYP(
        parity_type), .PAR_EN(parity_enable), .DATA_VALID(TX_IN_V), .P_DATA(
        TX_IN_P), .TX_OUT(TX_OUT_S), .Busy(TX_OUT_V) );
  UART_RX_UART_DATA_WIDTH8 UART_RX_UNIT ( .CLK(RX_CLK), .RST(n1), .PAR_TYPE(
        parity_type), .PAR_EN(parity_enable), .Prescale(Prescale), .RX_IN(
        RX_IN_S), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .Parity_Error(
        parity_error), .Stop_Error(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule



    module SYS_CTRL_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_UART_DATA_WIDTH8 ( 
        CLK, RST, ALU_OUT, ALU_OUT_VALID, ALU_FUN, ALU_ENABLE, RdData, 
        RdData_Valid, Address, WrEn, RdEn, WrData, CLK_EN, RX_P_DATA, RX_D_VLD, 
        TX_P_DATA, TX_D_VLD, FIFO_FULL, clk_div_en );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] RdData;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_VALID, RdData_Valid, RX_D_VLD, FIFO_FULL;
  output ALU_ENABLE, WrEn, RdEn, CLK_EN, TX_D_VLD, clk_div_en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n102, n103;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFRX1M \ALU_OUTPUT_REG_reg[7]  ( .D(n90), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \ALU_OUTPUT_REG_reg[6]  ( .D(n91), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M \ALU_OUTPUT_REG_reg[5]  ( .D(n92), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \ALU_OUTPUT_REG_reg[4]  ( .D(n93), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \ALU_OUTPUT_REG_reg[3]  ( .D(n94), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRX1M \ALU_OUTPUT_REG_reg[2]  ( .D(n95), .CK(CLK), .RN(RST), .QN(n18) );
  DFFRX1M \ALU_OUTPUT_REG_reg[1]  ( .D(n96), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \ALU_OUTPUT_REG_reg[0]  ( .D(n97), .CK(CLK), .RN(RST), .QN(n20) );
  DFFRX1M \ALU_OUTPUT_REG_reg[15]  ( .D(n82), .CK(CLK), .RN(RST), .QN(n5) );
  DFFRX1M \ALU_OUTPUT_REG_reg[14]  ( .D(n83), .CK(CLK), .RN(RST), .QN(n6) );
  DFFRX1M \ALU_OUTPUT_REG_reg[13]  ( .D(n84), .CK(CLK), .RN(RST), .QN(n7) );
  DFFRX1M \ALU_OUTPUT_REG_reg[12]  ( .D(n85), .CK(CLK), .RN(RST), .QN(n8) );
  DFFRX1M \ALU_OUTPUT_REG_reg[11]  ( .D(n86), .CK(CLK), .RN(RST), .QN(n9) );
  DFFRX1M \ALU_OUTPUT_REG_reg[10]  ( .D(n87), .CK(CLK), .RN(RST), .QN(n10) );
  DFFRX1M \ALU_OUTPUT_REG_reg[9]  ( .D(n88), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRX1M \ALU_OUTPUT_REG_reg[8]  ( .D(n89), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \RF_ADDR_REG_reg[0]  ( .D(n101), .CK(CLK), .RN(RST), .QN(n4) );
  DFFRX1M \RF_ADDR_REG_reg[3]  ( .D(n98), .CK(CLK), .RN(RST), .QN(n1) );
  DFFRX1M \RF_ADDR_REG_reg[2]  ( .D(n99), .CK(CLK), .RN(RST), .QN(n2) );
  DFFRX1M \RF_ADDR_REG_reg[1]  ( .D(n100), .CK(CLK), .RN(RST), .QN(n3) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NOR2X2M U5 ( .A(n64), .B(n43), .Y(ALU_FUN[2]) );
  NOR2X2M U6 ( .A(n64), .B(n102), .Y(ALU_FUN[0]) );
  OAI22X2M U7 ( .A0(n52), .A1(n2), .B0(n62), .B1(n43), .Y(Address[2]) );
  INVX2M U8 ( .A(n45), .Y(n37) );
  INVX2M U9 ( .A(n74), .Y(n33) );
  INVX2M U10 ( .A(n58), .Y(n23) );
  OR2X2M U11 ( .A(ALU_ENABLE), .B(n45), .Y(next_state[3]) );
  AND3X2M U12 ( .A(n51), .B(n48), .C(n52), .Y(n75) );
  NOR2X2M U13 ( .A(n75), .B(n102), .Y(WrData[0]) );
  NOR2X2M U14 ( .A(n75), .B(n44), .Y(WrData[1]) );
  NOR2X2M U15 ( .A(n75), .B(n43), .Y(WrData[2]) );
  NOR2X2M U16 ( .A(n75), .B(n42), .Y(WrData[3]) );
  NOR2X2M U17 ( .A(n75), .B(n41), .Y(WrData[4]) );
  NOR2X2M U18 ( .A(n75), .B(n40), .Y(WrData[5]) );
  NOR2X2M U19 ( .A(n64), .B(n44), .Y(ALU_FUN[1]) );
  NOR2X2M U20 ( .A(n38), .B(n56), .Y(n45) );
  NOR2X2M U21 ( .A(n62), .B(n103), .Y(RdEn) );
  NAND3X2M U22 ( .A(n35), .B(n39), .C(n81), .Y(n52) );
  NOR2X2M U23 ( .A(n37), .B(n35), .Y(n55) );
  NAND2X2M U24 ( .A(n55), .B(n24), .Y(n77) );
  NAND2X2M U25 ( .A(n76), .B(n35), .Y(n49) );
  NAND2BX2M U26 ( .AN(n56), .B(n38), .Y(n70) );
  NAND3X2M U27 ( .A(n78), .B(n77), .C(n49), .Y(TX_D_VLD) );
  NOR2X2M U28 ( .A(n64), .B(n42), .Y(ALU_FUN[3]) );
  NOR2X2M U29 ( .A(n75), .B(n103), .Y(WrEn) );
  NOR3X2M U30 ( .A(n103), .B(n35), .C(n70), .Y(n74) );
  NOR2X2M U31 ( .A(n103), .B(n64), .Y(ALU_ENABLE) );
  NAND4X2M U32 ( .A(n66), .B(n67), .C(n102), .D(n41), .Y(n47) );
  OAI21X2M U33 ( .A0(n35), .A1(n70), .B0(n48), .Y(n61) );
  NAND2X2M U34 ( .A(n64), .B(n37), .Y(CLK_EN) );
  INVX2M U35 ( .A(n51), .Y(n34) );
  NAND3X2M U36 ( .A(current_state[0]), .B(n81), .C(current_state[2]), .Y(n64)
         );
  AND2X2M U37 ( .A(current_state[1]), .B(n38), .Y(n81) );
  INVX2M U38 ( .A(current_state[3]), .Y(n38) );
  OAI22X4M U39 ( .A0(n52), .A1(n1), .B0(n62), .B1(n42), .Y(Address[3]) );
  NOR3X2M U40 ( .A(n103), .B(current_state[0]), .C(n70), .Y(n66) );
  NOR3X2M U41 ( .A(current_state[1]), .B(current_state[3]), .C(n39), .Y(n76)
         );
  NAND3BX2M U42 ( .AN(n49), .B(n24), .C(RdData_Valid), .Y(n79) );
  OAI211X2M U43 ( .A0(RX_D_VLD), .A1(n62), .B0(n63), .C0(n50), .Y(n57) );
  NAND4X2M U44 ( .A(n66), .B(RX_P_DATA[7]), .C(n68), .D(n69), .Y(n63) );
  NOR3X2M U45 ( .A(n42), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n68) );
  NOR4X1M U46 ( .A(n102), .B(n41), .C(n44), .D(n40), .Y(n69) );
  OAI22X1M U47 ( .A0(n52), .A1(n3), .B0(n62), .B1(n44), .Y(Address[1]) );
  OAI222X1M U48 ( .A0(n20), .A1(n77), .B0(n12), .B1(n78), .C0(n79), .C1(n32), 
        .Y(TX_P_DATA[0]) );
  INVX2M U49 ( .A(RdData[0]), .Y(n32) );
  OAI222X1M U50 ( .A0(n19), .A1(n77), .B0(n11), .B1(n78), .C0(n79), .C1(n31), 
        .Y(TX_P_DATA[1]) );
  INVX2M U51 ( .A(RdData[1]), .Y(n31) );
  OAI222X1M U52 ( .A0(n18), .A1(n77), .B0(n10), .B1(n78), .C0(n79), .C1(n30), 
        .Y(TX_P_DATA[2]) );
  INVX2M U53 ( .A(RdData[2]), .Y(n30) );
  OAI222X1M U54 ( .A0(n17), .A1(n77), .B0(n9), .B1(n78), .C0(n79), .C1(n29), 
        .Y(TX_P_DATA[3]) );
  INVX2M U55 ( .A(RdData[3]), .Y(n29) );
  OAI222X1M U56 ( .A0(n16), .A1(n77), .B0(n8), .B1(n78), .C0(n79), .C1(n28), 
        .Y(TX_P_DATA[4]) );
  INVX2M U57 ( .A(RdData[4]), .Y(n28) );
  OAI222X1M U58 ( .A0(n15), .A1(n77), .B0(n7), .B1(n78), .C0(n79), .C1(n27), 
        .Y(TX_P_DATA[5]) );
  INVX2M U59 ( .A(RdData[5]), .Y(n27) );
  OAI222X1M U60 ( .A0(n14), .A1(n77), .B0(n6), .B1(n78), .C0(n79), .C1(n26), 
        .Y(TX_P_DATA[6]) );
  INVX2M U61 ( .A(RdData[6]), .Y(n26) );
  OAI222X1M U62 ( .A0(n13), .A1(n77), .B0(n5), .B1(n78), .C0(n79), .C1(n25), 
        .Y(TX_P_DATA[7]) );
  INVX2M U63 ( .A(RdData[7]), .Y(n25) );
  NAND3X2M U64 ( .A(n81), .B(n39), .C(current_state[0]), .Y(n62) );
  INVX2M U65 ( .A(current_state[0]), .Y(n35) );
  NOR2BX2M U66 ( .AN(RX_P_DATA[6]), .B(n75), .Y(WrData[6]) );
  NOR2BX2M U67 ( .AN(RX_P_DATA[7]), .B(n75), .Y(WrData[7]) );
  OAI211X2M U68 ( .A0(RX_D_VLD), .A1(n52), .B0(n36), .C0(n53), .Y(
        next_state[1]) );
  AOI211X2M U69 ( .A0(RX_D_VLD), .A1(n54), .B0(n34), .C0(n55), .Y(n53) );
  INVX2M U70 ( .A(n57), .Y(n36) );
  OAI21X2M U71 ( .A0(n56), .A1(n35), .B0(n48), .Y(n54) );
  INVX2M U72 ( .A(RX_P_DATA[0]), .Y(n102) );
  NAND2X2M U73 ( .A(n76), .B(current_state[0]), .Y(n48) );
  NAND3X2M U74 ( .A(n81), .B(n35), .C(current_state[2]), .Y(n51) );
  INVX2M U75 ( .A(RX_D_VLD), .Y(n103) );
  INVX2M U76 ( .A(RX_P_DATA[1]), .Y(n44) );
  AND4X2M U77 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n73), 
        .Y(n67) );
  NOR3X2M U78 ( .A(n43), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n73) );
  NAND4X2M U79 ( .A(current_state[1]), .B(current_state[3]), .C(n80), .D(n24), 
        .Y(n78) );
  NOR2X2M U80 ( .A(current_state[2]), .B(current_state[0]), .Y(n80) );
  INVX2M U81 ( .A(RX_P_DATA[2]), .Y(n43) );
  INVX2M U82 ( .A(current_state[2]), .Y(n39) );
  NAND2BX2M U83 ( .AN(current_state[1]), .B(n39), .Y(n56) );
  INVX2M U84 ( .A(RX_P_DATA[3]), .Y(n42) );
  NAND4BBX1M U85 ( .AN(n46), .BN(RdEn), .C(n47), .D(n48), .Y(next_state[2]) );
  OAI211X2M U86 ( .A0(n49), .A1(RdData_Valid), .B0(n50), .C0(n51), .Y(n46) );
  NAND4X2M U87 ( .A(n47), .B(n58), .C(n59), .D(n60), .Y(next_state[0]) );
  NAND4X2M U88 ( .A(RX_P_DATA[3]), .B(n102), .C(n71), .D(n72), .Y(n59) );
  AOI221XLM U89 ( .A0(n61), .A1(n103), .B0(n34), .B1(RX_D_VLD), .C0(n57), .Y(
        n60) );
  NOR3X2M U90 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n71)
         );
  AND4X2M U91 ( .A(RX_P_DATA[7]), .B(n66), .C(RX_P_DATA[1]), .D(RX_P_DATA[5]), 
        .Y(n72) );
  OA21X2M U92 ( .A0(RX_D_VLD), .A1(n64), .B0(n65), .Y(n50) );
  NAND4X2M U93 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n66), .D(n67), .Y(n65)
         );
  INVX2M U94 ( .A(FIFO_FULL), .Y(n24) );
  OAI221X1M U95 ( .A0(n62), .A1(n102), .B0(n52), .B1(n4), .C0(n51), .Y(
        Address[0]) );
  OAI22X1M U96 ( .A0(n102), .A1(n33), .B0(n74), .B1(n4), .Y(n101) );
  OAI22X1M U97 ( .A0(n44), .A1(n33), .B0(n74), .B1(n3), .Y(n100) );
  OAI22X1M U98 ( .A0(n43), .A1(n33), .B0(n74), .B1(n2), .Y(n99) );
  OAI22X1M U99 ( .A0(n42), .A1(n33), .B0(n74), .B1(n1), .Y(n98) );
  NAND3X2M U100 ( .A(n45), .B(n35), .C(ALU_OUT_VALID), .Y(n58) );
  OAI2BB2X1M U101 ( .B0(n23), .B1(n20), .A0N(ALU_OUT[0]), .A1N(n23), .Y(n97)
         );
  OAI2BB2X1M U102 ( .B0(n23), .B1(n19), .A0N(ALU_OUT[1]), .A1N(n23), .Y(n96)
         );
  OAI2BB2X1M U103 ( .B0(n23), .B1(n18), .A0N(ALU_OUT[2]), .A1N(n23), .Y(n95)
         );
  OAI2BB2X1M U104 ( .B0(n23), .B1(n17), .A0N(ALU_OUT[3]), .A1N(n23), .Y(n94)
         );
  OAI2BB2X1M U105 ( .B0(n23), .B1(n16), .A0N(ALU_OUT[4]), .A1N(n23), .Y(n93)
         );
  OAI2BB2X1M U106 ( .B0(n23), .B1(n15), .A0N(ALU_OUT[5]), .A1N(n23), .Y(n92)
         );
  OAI2BB2X1M U107 ( .B0(n23), .B1(n14), .A0N(ALU_OUT[6]), .A1N(n23), .Y(n91)
         );
  OAI2BB2X1M U108 ( .B0(n23), .B1(n13), .A0N(ALU_OUT[7]), .A1N(n23), .Y(n90)
         );
  OAI2BB2X1M U109 ( .B0(n23), .B1(n12), .A0N(ALU_OUT[8]), .A1N(n23), .Y(n89)
         );
  OAI2BB2X1M U110 ( .B0(n23), .B1(n11), .A0N(ALU_OUT[9]), .A1N(n23), .Y(n88)
         );
  OAI2BB2X1M U111 ( .B0(n23), .B1(n10), .A0N(ALU_OUT[10]), .A1N(n23), .Y(n87)
         );
  OAI2BB2X1M U112 ( .B0(n23), .B1(n9), .A0N(ALU_OUT[11]), .A1N(n23), .Y(n86)
         );
  OAI2BB2X1M U113 ( .B0(n23), .B1(n8), .A0N(ALU_OUT[12]), .A1N(n23), .Y(n85)
         );
  OAI2BB2X1M U114 ( .B0(n23), .B1(n7), .A0N(ALU_OUT[13]), .A1N(n23), .Y(n84)
         );
  OAI2BB2X1M U115 ( .B0(n23), .B1(n6), .A0N(ALU_OUT[14]), .A1N(n23), .Y(n83)
         );
  OAI2BB2X1M U116 ( .B0(n23), .B1(n5), .A0N(ALU_OUT[15]), .A1N(n23), .Y(n82)
         );
  INVX2M U117 ( .A(RX_P_DATA[4]), .Y(n41) );
  INVX2M U118 ( .A(RX_P_DATA[5]), .Y(n40) );
endmodule


module REG_FILE_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4 ( WrEn, RdEn, CLK, RST, 
        Address, WrData, RdData, RdData_Valid, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdData_Valid;
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
         N41, N42, N43, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \mem_reg[5][7]  ( .D(n138), .CK(CLK), .RN(n211), .Q(\mem[5][7] ) );
  DFFRQX2M \mem_reg[5][6]  ( .D(n137), .CK(CLK), .RN(n211), .Q(\mem[5][6] ) );
  DFFRQX2M \mem_reg[5][5]  ( .D(n136), .CK(CLK), .RN(n211), .Q(\mem[5][5] ) );
  DFFRQX2M \mem_reg[5][4]  ( .D(n135), .CK(CLK), .RN(n211), .Q(\mem[5][4] ) );
  DFFRQX2M \mem_reg[5][3]  ( .D(n134), .CK(CLK), .RN(n211), .Q(\mem[5][3] ) );
  DFFRQX2M \mem_reg[5][2]  ( .D(n133), .CK(CLK), .RN(n211), .Q(\mem[5][2] ) );
  DFFRQX2M \mem_reg[5][1]  ( .D(n132), .CK(CLK), .RN(n211), .Q(\mem[5][1] ) );
  DFFRQX2M \mem_reg[5][0]  ( .D(n131), .CK(CLK), .RN(n211), .Q(\mem[5][0] ) );
  DFFRQX2M \mem_reg[9][7]  ( .D(n106), .CK(CLK), .RN(n209), .Q(\mem[9][7] ) );
  DFFRQX2M \mem_reg[9][6]  ( .D(n105), .CK(CLK), .RN(n209), .Q(\mem[9][6] ) );
  DFFRQX2M \mem_reg[9][5]  ( .D(n104), .CK(CLK), .RN(n209), .Q(\mem[9][5] ) );
  DFFRQX2M \mem_reg[9][4]  ( .D(n103), .CK(CLK), .RN(n209), .Q(\mem[9][4] ) );
  DFFRQX2M \mem_reg[9][3]  ( .D(n102), .CK(CLK), .RN(n209), .Q(\mem[9][3] ) );
  DFFRQX2M \mem_reg[9][2]  ( .D(n101), .CK(CLK), .RN(n209), .Q(\mem[9][2] ) );
  DFFRQX2M \mem_reg[9][1]  ( .D(n100), .CK(CLK), .RN(n209), .Q(\mem[9][1] ) );
  DFFRQX2M \mem_reg[9][0]  ( .D(n99), .CK(CLK), .RN(n209), .Q(\mem[9][0] ) );
  DFFRQX2M \mem_reg[13][7]  ( .D(n74), .CK(CLK), .RN(n207), .Q(\mem[13][7] )
         );
  DFFRQX2M \mem_reg[13][6]  ( .D(n73), .CK(CLK), .RN(n207), .Q(\mem[13][6] )
         );
  DFFRQX2M \mem_reg[13][5]  ( .D(n72), .CK(CLK), .RN(n207), .Q(\mem[13][5] )
         );
  DFFRQX2M \mem_reg[13][4]  ( .D(n71), .CK(CLK), .RN(n207), .Q(\mem[13][4] )
         );
  DFFRQX2M \mem_reg[13][3]  ( .D(n70), .CK(CLK), .RN(n207), .Q(\mem[13][3] )
         );
  DFFRQX2M \mem_reg[13][2]  ( .D(n69), .CK(CLK), .RN(n207), .Q(\mem[13][2] )
         );
  DFFRQX2M \mem_reg[13][1]  ( .D(n68), .CK(CLK), .RN(n206), .Q(\mem[13][1] )
         );
  DFFRQX2M \mem_reg[13][0]  ( .D(n67), .CK(CLK), .RN(n206), .Q(\mem[13][0] )
         );
  DFFRQX2M \mem_reg[7][7]  ( .D(n122), .CK(CLK), .RN(n210), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n121), .CK(CLK), .RN(n210), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n120), .CK(CLK), .RN(n210), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n119), .CK(CLK), .RN(n210), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n118), .CK(CLK), .RN(n210), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n117), .CK(CLK), .RN(n210), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n116), .CK(CLK), .RN(n210), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n115), .CK(CLK), .RN(n210), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[11][7]  ( .D(n90), .CK(CLK), .RN(n208), .Q(\mem[11][7] )
         );
  DFFRQX2M \mem_reg[11][6]  ( .D(n89), .CK(CLK), .RN(n208), .Q(\mem[11][6] )
         );
  DFFRQX2M \mem_reg[11][5]  ( .D(n88), .CK(CLK), .RN(n208), .Q(\mem[11][5] )
         );
  DFFRQX2M \mem_reg[11][4]  ( .D(n87), .CK(CLK), .RN(n208), .Q(\mem[11][4] )
         );
  DFFRQX2M \mem_reg[11][3]  ( .D(n86), .CK(CLK), .RN(n208), .Q(\mem[11][3] )
         );
  DFFRQX2M \mem_reg[11][2]  ( .D(n85), .CK(CLK), .RN(n208), .Q(\mem[11][2] )
         );
  DFFRQX2M \mem_reg[11][1]  ( .D(n84), .CK(CLK), .RN(n208), .Q(\mem[11][1] )
         );
  DFFRQX2M \mem_reg[11][0]  ( .D(n83), .CK(CLK), .RN(n207), .Q(\mem[11][0] )
         );
  DFFRQX2M \mem_reg[15][7]  ( .D(n58), .CK(CLK), .RN(n206), .Q(\mem[15][7] )
         );
  DFFRQX2M \mem_reg[15][6]  ( .D(n57), .CK(CLK), .RN(n206), .Q(\mem[15][6] )
         );
  DFFRQX2M \mem_reg[15][5]  ( .D(n56), .CK(CLK), .RN(n206), .Q(\mem[15][5] )
         );
  DFFRQX2M \mem_reg[15][4]  ( .D(n55), .CK(CLK), .RN(n206), .Q(\mem[15][4] )
         );
  DFFRQX2M \mem_reg[15][3]  ( .D(n54), .CK(CLK), .RN(n205), .Q(\mem[15][3] )
         );
  DFFRQX2M \mem_reg[15][2]  ( .D(n53), .CK(CLK), .RN(n206), .Q(\mem[15][2] )
         );
  DFFRQX2M \mem_reg[15][1]  ( .D(n52), .CK(CLK), .RN(n205), .Q(\mem[15][1] )
         );
  DFFRQX2M \mem_reg[15][0]  ( .D(n51), .CK(CLK), .RN(n205), .Q(\mem[15][0] )
         );
  DFFRQX2M \mem_reg[6][7]  ( .D(n130), .CK(CLK), .RN(n211), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n129), .CK(CLK), .RN(n211), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n128), .CK(CLK), .RN(n211), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n127), .CK(CLK), .RN(n210), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n126), .CK(CLK), .RN(n210), .Q(\mem[6][3] ) );
  DFFRQX2M \mem_reg[6][2]  ( .D(n125), .CK(CLK), .RN(n210), .Q(\mem[6][2] ) );
  DFFRQX2M \mem_reg[6][1]  ( .D(n124), .CK(CLK), .RN(n210), .Q(\mem[6][1] ) );
  DFFRQX2M \mem_reg[6][0]  ( .D(n123), .CK(CLK), .RN(n210), .Q(\mem[6][0] ) );
  DFFRQX2M \mem_reg[10][7]  ( .D(n98), .CK(CLK), .RN(n208), .Q(\mem[10][7] )
         );
  DFFRQX2M \mem_reg[10][6]  ( .D(n97), .CK(CLK), .RN(n208), .Q(\mem[10][6] )
         );
  DFFRQX2M \mem_reg[10][5]  ( .D(n96), .CK(CLK), .RN(n208), .Q(\mem[10][5] )
         );
  DFFRQX2M \mem_reg[10][4]  ( .D(n95), .CK(CLK), .RN(n208), .Q(\mem[10][4] )
         );
  DFFRQX2M \mem_reg[10][3]  ( .D(n94), .CK(CLK), .RN(n208), .Q(\mem[10][3] )
         );
  DFFRQX2M \mem_reg[10][2]  ( .D(n93), .CK(CLK), .RN(n208), .Q(\mem[10][2] )
         );
  DFFRQX2M \mem_reg[10][1]  ( .D(n92), .CK(CLK), .RN(n208), .Q(\mem[10][1] )
         );
  DFFRQX2M \mem_reg[10][0]  ( .D(n91), .CK(CLK), .RN(n208), .Q(\mem[10][0] )
         );
  DFFRQX2M \mem_reg[14][7]  ( .D(n66), .CK(CLK), .RN(n206), .Q(\mem[14][7] )
         );
  DFFRQX2M \mem_reg[14][6]  ( .D(n65), .CK(CLK), .RN(n206), .Q(\mem[14][6] )
         );
  DFFRQX2M \mem_reg[14][5]  ( .D(n64), .CK(CLK), .RN(n206), .Q(\mem[14][5] )
         );
  DFFRQX2M \mem_reg[14][4]  ( .D(n63), .CK(CLK), .RN(n206), .Q(\mem[14][4] )
         );
  DFFRQX2M \mem_reg[14][3]  ( .D(n62), .CK(CLK), .RN(n206), .Q(\mem[14][3] )
         );
  DFFRQX2M \mem_reg[14][2]  ( .D(n61), .CK(CLK), .RN(n206), .Q(\mem[14][2] )
         );
  DFFRQX2M \mem_reg[14][1]  ( .D(n60), .CK(CLK), .RN(n206), .Q(\mem[14][1] )
         );
  DFFRQX2M \mem_reg[14][0]  ( .D(n59), .CK(CLK), .RN(n206), .Q(\mem[14][0] )
         );
  DFFRQX2M \mem_reg[4][7]  ( .D(n146), .CK(CLK), .RN(n212), .Q(\mem[4][7] ) );
  DFFRQX2M \mem_reg[4][6]  ( .D(n145), .CK(CLK), .RN(n212), .Q(\mem[4][6] ) );
  DFFRQX2M \mem_reg[4][5]  ( .D(n144), .CK(CLK), .RN(n212), .Q(\mem[4][5] ) );
  DFFRQX2M \mem_reg[4][4]  ( .D(n143), .CK(CLK), .RN(n212), .Q(\mem[4][4] ) );
  DFFRQX2M \mem_reg[4][3]  ( .D(n142), .CK(CLK), .RN(n211), .Q(\mem[4][3] ) );
  DFFRQX2M \mem_reg[4][2]  ( .D(n141), .CK(CLK), .RN(n211), .Q(\mem[4][2] ) );
  DFFRQX2M \mem_reg[4][1]  ( .D(n140), .CK(CLK), .RN(n211), .Q(\mem[4][1] ) );
  DFFRQX2M \mem_reg[4][0]  ( .D(n139), .CK(CLK), .RN(n211), .Q(\mem[4][0] ) );
  DFFRQX2M \mem_reg[8][7]  ( .D(n114), .CK(CLK), .RN(n210), .Q(\mem[8][7] ) );
  DFFRQX2M \mem_reg[8][6]  ( .D(n113), .CK(CLK), .RN(n210), .Q(\mem[8][6] ) );
  DFFRQX2M \mem_reg[8][5]  ( .D(n112), .CK(CLK), .RN(n209), .Q(\mem[8][5] ) );
  DFFRQX2M \mem_reg[8][4]  ( .D(n111), .CK(CLK), .RN(n209), .Q(\mem[8][4] ) );
  DFFRQX2M \mem_reg[8][3]  ( .D(n110), .CK(CLK), .RN(n209), .Q(\mem[8][3] ) );
  DFFRQX2M \mem_reg[8][2]  ( .D(n109), .CK(CLK), .RN(n209), .Q(\mem[8][2] ) );
  DFFRQX2M \mem_reg[8][1]  ( .D(n108), .CK(CLK), .RN(n209), .Q(\mem[8][1] ) );
  DFFRQX2M \mem_reg[8][0]  ( .D(n107), .CK(CLK), .RN(n209), .Q(\mem[8][0] ) );
  DFFRQX2M \mem_reg[12][7]  ( .D(n82), .CK(CLK), .RN(n207), .Q(\mem[12][7] )
         );
  DFFRQX2M \mem_reg[12][6]  ( .D(n81), .CK(CLK), .RN(n207), .Q(\mem[12][6] )
         );
  DFFRQX2M \mem_reg[12][5]  ( .D(n80), .CK(CLK), .RN(n207), .Q(\mem[12][5] )
         );
  DFFRQX2M \mem_reg[12][4]  ( .D(n79), .CK(CLK), .RN(n207), .Q(\mem[12][4] )
         );
  DFFRQX2M \mem_reg[12][3]  ( .D(n78), .CK(CLK), .RN(n207), .Q(\mem[12][3] )
         );
  DFFRQX2M \mem_reg[12][2]  ( .D(n77), .CK(CLK), .RN(n207), .Q(\mem[12][2] )
         );
  DFFRQX2M \mem_reg[12][1]  ( .D(n76), .CK(CLK), .RN(n207), .Q(\mem[12][1] )
         );
  DFFRQX2M \mem_reg[12][0]  ( .D(n75), .CK(CLK), .RN(n207), .Q(\mem[12][0] )
         );
  DFFRQX2M \mem_reg[3][0]  ( .D(n147), .CK(CLK), .RN(n212), .Q(REG3[0]) );
  DFFRQX2M \mem_reg[3][2]  ( .D(n149), .CK(CLK), .RN(n212), .Q(REG3[2]) );
  DFFRQX2M \mem_reg[3][3]  ( .D(n150), .CK(CLK), .RN(n212), .Q(REG3[3]) );
  DFFRQX2M \mem_reg[3][4]  ( .D(n151), .CK(CLK), .RN(n212), .Q(REG3[4]) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n154), .CK(CLK), .RN(n212), .Q(REG3[7]) );
  DFFRQX2M \mem_reg[3][6]  ( .D(n153), .CK(CLK), .RN(n212), .Q(REG3[6]) );
  DFFSQX2M \mem_reg[3][5]  ( .D(n152), .CK(CLK), .SN(n205), .Q(REG3[5]) );
  DFFRQX2M \mem_reg[2][1]  ( .D(n156), .CK(CLK), .RN(n212), .Q(REG2[1]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n50), .CK(CLK), .RN(n205), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n49), .CK(CLK), .RN(n205), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n48), .CK(CLK), .RN(n205), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n47), .CK(CLK), .RN(n205), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n46), .CK(CLK), .RN(n205), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n45), .CK(CLK), .RN(n205), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n44), .CK(CLK), .RN(n205), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n43), .CK(CLK), .RN(n205), .Q(RdData[0]) );
  DFFRQX2M RdData_Valid_reg ( .D(n42), .CK(CLK), .RN(n209), .Q(RdData_Valid)
         );
  DFFRQX2M \mem_reg[3][1]  ( .D(n148), .CK(CLK), .RN(n212), .Q(REG3[1]) );
  DFFSQX2M \mem_reg[2][7]  ( .D(n162), .CK(CLK), .SN(n205), .Q(REG2[7]) );
  DFFSQX2M \mem_reg[2][0]  ( .D(n155), .CK(CLK), .SN(n205), .Q(REG2[0]) );
  DFFRQX2M \mem_reg[2][4]  ( .D(n159), .CK(CLK), .RN(n212), .Q(REG2[4]) );
  DFFRQX2M \mem_reg[2][3]  ( .D(n158), .CK(CLK), .RN(n212), .Q(REG2[3]) );
  DFFRQX2M \mem_reg[2][2]  ( .D(n157), .CK(CLK), .RN(n212), .Q(REG2[2]) );
  DFFRQX2M \mem_reg[2][6]  ( .D(n161), .CK(CLK), .RN(n213), .Q(REG2[6]) );
  DFFRQX2M \mem_reg[2][5]  ( .D(n160), .CK(CLK), .RN(n213), .Q(REG2[5]) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n172), .CK(CLK), .RN(n213), .Q(REG0[1]) );
  DFFRQX2M \mem_reg[0][0]  ( .D(n171), .CK(CLK), .RN(n213), .Q(REG0[0]) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n173), .CK(CLK), .RN(n213), .Q(REG0[2]) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n174), .CK(CLK), .RN(n213), .Q(REG0[3]) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n175), .CK(CLK), .RN(n213), .Q(REG0[4]) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n176), .CK(CLK), .RN(n214), .Q(REG0[5]) );
  DFFRQX2M \mem_reg[0][7]  ( .D(n178), .CK(CLK), .RN(n205), .Q(REG0[7]) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n177), .CK(CLK), .RN(n214), .Q(REG0[6]) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n164), .CK(CLK), .RN(n213), .Q(REG1[1]) );
  DFFRQX2M \mem_reg[1][7]  ( .D(n170), .CK(CLK), .RN(n213), .Q(REG1[7]) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n169), .CK(CLK), .RN(n213), .Q(REG1[6]) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n168), .CK(CLK), .RN(n213), .Q(REG1[5]) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n167), .CK(CLK), .RN(n213), .Q(REG1[4]) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n166), .CK(CLK), .RN(n213), .Q(REG1[3]) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n165), .CK(CLK), .RN(n213), .Q(REG1[2]) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n163), .CK(CLK), .RN(n213), .Q(REG1[0]) );
  NOR2X2M U3 ( .A(n204), .B(N13), .Y(n25) );
  NOR2X2M U4 ( .A(N12), .B(N13), .Y(n28) );
  NOR2X2M U5 ( .A(n230), .B(n204), .Y(n17) );
  INVX2M U6 ( .A(n200), .Y(n201) );
  INVX2M U7 ( .A(n198), .Y(n199) );
  NAND2X2M U8 ( .A(n22), .B(n18), .Y(n21) );
  NAND2X2M U9 ( .A(n32), .B(n22), .Y(n35) );
  INVX2M U10 ( .A(n15), .Y(n228) );
  INVX2M U11 ( .A(n200), .Y(n202) );
  BUFX2M U12 ( .A(n203), .Y(n200) );
  BUFX2M U13 ( .A(n204), .Y(n198) );
  NOR2X2M U14 ( .A(n230), .B(N12), .Y(n22) );
  NAND2X2M U15 ( .A(n32), .B(n25), .Y(n37) );
  NAND2X2M U16 ( .A(n34), .B(n25), .Y(n38) );
  NAND2X2M U17 ( .A(n32), .B(n28), .Y(n39) );
  NAND2X2M U18 ( .A(n34), .B(n28), .Y(n41) );
  NAND2X2M U19 ( .A(n22), .B(n20), .Y(n23) );
  NAND2X2M U20 ( .A(n25), .B(n18), .Y(n24) );
  NAND2X2M U21 ( .A(n25), .B(n20), .Y(n26) );
  NAND2X2M U22 ( .A(n28), .B(n18), .Y(n27) );
  NAND2X2M U23 ( .A(n28), .B(n20), .Y(n30) );
  NAND2X2M U24 ( .A(n20), .B(n17), .Y(n19) );
  NAND2X2M U25 ( .A(n32), .B(n17), .Y(n31) );
  NAND2X2M U26 ( .A(n34), .B(n17), .Y(n33) );
  NAND2X2M U27 ( .A(n34), .B(n22), .Y(n36) );
  NAND2X2M U28 ( .A(n17), .B(n18), .Y(n16) );
  NAND2X2M U29 ( .A(RdEn), .B(n229), .Y(n15) );
  NOR2X2M U30 ( .A(n229), .B(RdEn), .Y(n14) );
  AND2X2M U31 ( .A(n29), .B(N11), .Y(n18) );
  AND2X2M U32 ( .A(n40), .B(N11), .Y(n32) );
  BUFX2M U33 ( .A(n219), .Y(n205) );
  BUFX2M U34 ( .A(n219), .Y(n206) );
  BUFX2M U35 ( .A(n218), .Y(n207) );
  BUFX2M U36 ( .A(n218), .Y(n208) );
  BUFX2M U37 ( .A(n217), .Y(n209) );
  BUFX2M U38 ( .A(n217), .Y(n210) );
  BUFX2M U39 ( .A(n216), .Y(n211) );
  BUFX2M U40 ( .A(n216), .Y(n212) );
  BUFX2M U41 ( .A(n215), .Y(n213) );
  BUFX2M U42 ( .A(n215), .Y(n214) );
  INVX2M U43 ( .A(WrData[0]), .Y(n220) );
  INVX2M U44 ( .A(WrData[1]), .Y(n221) );
  INVX2M U45 ( .A(WrData[2]), .Y(n222) );
  INVX2M U46 ( .A(WrData[3]), .Y(n223) );
  INVX2M U47 ( .A(WrData[4]), .Y(n224) );
  INVX2M U48 ( .A(WrData[5]), .Y(n225) );
  INVX2M U49 ( .A(N13), .Y(n230) );
  NOR2BX2M U50 ( .AN(n14), .B(N14), .Y(n40) );
  AND2X2M U51 ( .A(n29), .B(n203), .Y(n20) );
  AND2X2M U52 ( .A(n40), .B(n203), .Y(n34) );
  AND2X2M U53 ( .A(N14), .B(n14), .Y(n29) );
  INVX2M U54 ( .A(WrEn), .Y(n229) );
  BUFX2M U55 ( .A(RST), .Y(n218) );
  BUFX2M U56 ( .A(RST), .Y(n217) );
  BUFX2M U57 ( .A(RST), .Y(n216) );
  BUFX2M U58 ( .A(RST), .Y(n215) );
  BUFX2M U59 ( .A(RST), .Y(n219) );
  INVX2M U60 ( .A(N12), .Y(n204) );
  INVX2M U61 ( .A(WrData[6]), .Y(n226) );
  INVX2M U62 ( .A(WrData[7]), .Y(n227) );
  OAI2BB2X1M U63 ( .B0(n16), .B1(n220), .A0N(\mem[15][0] ), .A1N(n16), .Y(n51)
         );
  OAI2BB2X1M U64 ( .B0(n16), .B1(n221), .A0N(\mem[15][1] ), .A1N(n16), .Y(n52)
         );
  OAI2BB2X1M U65 ( .B0(n16), .B1(n222), .A0N(\mem[15][2] ), .A1N(n16), .Y(n53)
         );
  OAI2BB2X1M U66 ( .B0(n16), .B1(n223), .A0N(\mem[15][3] ), .A1N(n16), .Y(n54)
         );
  OAI2BB2X1M U67 ( .B0(n16), .B1(n224), .A0N(\mem[15][4] ), .A1N(n16), .Y(n55)
         );
  OAI2BB2X1M U68 ( .B0(n16), .B1(n225), .A0N(\mem[15][5] ), .A1N(n16), .Y(n56)
         );
  OAI2BB2X1M U69 ( .B0(n16), .B1(n226), .A0N(\mem[15][6] ), .A1N(n16), .Y(n57)
         );
  OAI2BB2X1M U70 ( .B0(n16), .B1(n227), .A0N(\mem[15][7] ), .A1N(n16), .Y(n58)
         );
  OAI2BB2X1M U71 ( .B0(n220), .B1(n24), .A0N(\mem[11][0] ), .A1N(n24), .Y(n83)
         );
  OAI2BB2X1M U72 ( .B0(n221), .B1(n24), .A0N(\mem[11][1] ), .A1N(n24), .Y(n84)
         );
  OAI2BB2X1M U73 ( .B0(n222), .B1(n24), .A0N(\mem[11][2] ), .A1N(n24), .Y(n85)
         );
  OAI2BB2X1M U74 ( .B0(n223), .B1(n24), .A0N(\mem[11][3] ), .A1N(n24), .Y(n86)
         );
  OAI2BB2X1M U75 ( .B0(n224), .B1(n24), .A0N(\mem[11][4] ), .A1N(n24), .Y(n87)
         );
  OAI2BB2X1M U76 ( .B0(n225), .B1(n24), .A0N(\mem[11][5] ), .A1N(n24), .Y(n88)
         );
  OAI2BB2X1M U77 ( .B0(n226), .B1(n24), .A0N(\mem[11][6] ), .A1N(n24), .Y(n89)
         );
  OAI2BB2X1M U78 ( .B0(n227), .B1(n24), .A0N(\mem[11][7] ), .A1N(n24), .Y(n90)
         );
  OAI2BB2X1M U79 ( .B0(n220), .B1(n26), .A0N(\mem[10][0] ), .A1N(n26), .Y(n91)
         );
  OAI2BB2X1M U80 ( .B0(n221), .B1(n26), .A0N(\mem[10][1] ), .A1N(n26), .Y(n92)
         );
  OAI2BB2X1M U81 ( .B0(n222), .B1(n26), .A0N(\mem[10][2] ), .A1N(n26), .Y(n93)
         );
  OAI2BB2X1M U82 ( .B0(n223), .B1(n26), .A0N(\mem[10][3] ), .A1N(n26), .Y(n94)
         );
  OAI2BB2X1M U83 ( .B0(n224), .B1(n26), .A0N(\mem[10][4] ), .A1N(n26), .Y(n95)
         );
  OAI2BB2X1M U84 ( .B0(n225), .B1(n26), .A0N(\mem[10][5] ), .A1N(n26), .Y(n96)
         );
  OAI2BB2X1M U85 ( .B0(n226), .B1(n26), .A0N(\mem[10][6] ), .A1N(n26), .Y(n97)
         );
  OAI2BB2X1M U86 ( .B0(n227), .B1(n26), .A0N(\mem[10][7] ), .A1N(n26), .Y(n98)
         );
  OAI2BB2X1M U87 ( .B0(n220), .B1(n27), .A0N(\mem[9][0] ), .A1N(n27), .Y(n99)
         );
  OAI2BB2X1M U88 ( .B0(n221), .B1(n27), .A0N(\mem[9][1] ), .A1N(n27), .Y(n100)
         );
  OAI2BB2X1M U89 ( .B0(n222), .B1(n27), .A0N(\mem[9][2] ), .A1N(n27), .Y(n101)
         );
  OAI2BB2X1M U90 ( .B0(n223), .B1(n27), .A0N(\mem[9][3] ), .A1N(n27), .Y(n102)
         );
  OAI2BB2X1M U91 ( .B0(n224), .B1(n27), .A0N(\mem[9][4] ), .A1N(n27), .Y(n103)
         );
  OAI2BB2X1M U92 ( .B0(n225), .B1(n27), .A0N(\mem[9][5] ), .A1N(n27), .Y(n104)
         );
  OAI2BB2X1M U93 ( .B0(n226), .B1(n27), .A0N(\mem[9][6] ), .A1N(n27), .Y(n105)
         );
  OAI2BB2X1M U94 ( .B0(n227), .B1(n27), .A0N(\mem[9][7] ), .A1N(n27), .Y(n106)
         );
  OAI2BB2X1M U95 ( .B0(n220), .B1(n30), .A0N(\mem[8][0] ), .A1N(n30), .Y(n107)
         );
  OAI2BB2X1M U96 ( .B0(n221), .B1(n30), .A0N(\mem[8][1] ), .A1N(n30), .Y(n108)
         );
  OAI2BB2X1M U97 ( .B0(n222), .B1(n30), .A0N(\mem[8][2] ), .A1N(n30), .Y(n109)
         );
  OAI2BB2X1M U98 ( .B0(n223), .B1(n30), .A0N(\mem[8][3] ), .A1N(n30), .Y(n110)
         );
  OAI2BB2X1M U99 ( .B0(n224), .B1(n30), .A0N(\mem[8][4] ), .A1N(n30), .Y(n111)
         );
  OAI2BB2X1M U100 ( .B0(n225), .B1(n30), .A0N(\mem[8][5] ), .A1N(n30), .Y(n112) );
  OAI2BB2X1M U101 ( .B0(n226), .B1(n30), .A0N(\mem[8][6] ), .A1N(n30), .Y(n113) );
  OAI2BB2X1M U102 ( .B0(n227), .B1(n30), .A0N(\mem[8][7] ), .A1N(n30), .Y(n114) );
  OAI2BB2X1M U103 ( .B0(n220), .B1(n21), .A0N(\mem[13][0] ), .A1N(n21), .Y(n67) );
  OAI2BB2X1M U104 ( .B0(n221), .B1(n21), .A0N(\mem[13][1] ), .A1N(n21), .Y(n68) );
  OAI2BB2X1M U105 ( .B0(n222), .B1(n21), .A0N(\mem[13][2] ), .A1N(n21), .Y(n69) );
  OAI2BB2X1M U106 ( .B0(n223), .B1(n21), .A0N(\mem[13][3] ), .A1N(n21), .Y(n70) );
  OAI2BB2X1M U107 ( .B0(n224), .B1(n21), .A0N(\mem[13][4] ), .A1N(n21), .Y(n71) );
  OAI2BB2X1M U108 ( .B0(n225), .B1(n21), .A0N(\mem[13][5] ), .A1N(n21), .Y(n72) );
  OAI2BB2X1M U109 ( .B0(n226), .B1(n21), .A0N(\mem[13][6] ), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U110 ( .B0(n227), .B1(n21), .A0N(\mem[13][7] ), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U111 ( .B0(n220), .B1(n23), .A0N(\mem[12][0] ), .A1N(n23), .Y(n75) );
  OAI2BB2X1M U112 ( .B0(n221), .B1(n23), .A0N(\mem[12][1] ), .A1N(n23), .Y(n76) );
  OAI2BB2X1M U113 ( .B0(n222), .B1(n23), .A0N(\mem[12][2] ), .A1N(n23), .Y(n77) );
  OAI2BB2X1M U114 ( .B0(n223), .B1(n23), .A0N(\mem[12][3] ), .A1N(n23), .Y(n78) );
  OAI2BB2X1M U115 ( .B0(n224), .B1(n23), .A0N(\mem[12][4] ), .A1N(n23), .Y(n79) );
  OAI2BB2X1M U116 ( .B0(n225), .B1(n23), .A0N(\mem[12][5] ), .A1N(n23), .Y(n80) );
  OAI2BB2X1M U117 ( .B0(n226), .B1(n23), .A0N(\mem[12][6] ), .A1N(n23), .Y(n81) );
  OAI2BB2X1M U118 ( .B0(n227), .B1(n23), .A0N(\mem[12][7] ), .A1N(n23), .Y(n82) );
  OAI2BB2X1M U119 ( .B0(n220), .B1(n37), .A0N(REG3[0]), .A1N(n37), .Y(n147) );
  OAI2BB2X1M U120 ( .B0(n221), .B1(n37), .A0N(REG3[1]), .A1N(n37), .Y(n148) );
  OAI2BB2X1M U121 ( .B0(n222), .B1(n37), .A0N(REG3[2]), .A1N(n37), .Y(n149) );
  OAI2BB2X1M U122 ( .B0(n223), .B1(n37), .A0N(REG3[3]), .A1N(n37), .Y(n150) );
  OAI2BB2X1M U123 ( .B0(n224), .B1(n37), .A0N(REG3[4]), .A1N(n37), .Y(n151) );
  OAI2BB2X1M U124 ( .B0(n226), .B1(n37), .A0N(REG3[6]), .A1N(n37), .Y(n153) );
  OAI2BB2X1M U125 ( .B0(n227), .B1(n37), .A0N(REG3[7]), .A1N(n37), .Y(n154) );
  OAI2BB2X1M U126 ( .B0(n221), .B1(n38), .A0N(REG2[1]), .A1N(n38), .Y(n156) );
  OAI2BB2X1M U127 ( .B0(n222), .B1(n38), .A0N(REG2[2]), .A1N(n38), .Y(n157) );
  OAI2BB2X1M U128 ( .B0(n223), .B1(n38), .A0N(REG2[3]), .A1N(n38), .Y(n158) );
  OAI2BB2X1M U129 ( .B0(n224), .B1(n38), .A0N(REG2[4]), .A1N(n38), .Y(n159) );
  OAI2BB2X1M U130 ( .B0(n225), .B1(n38), .A0N(REG2[5]), .A1N(n38), .Y(n160) );
  OAI2BB2X1M U131 ( .B0(n226), .B1(n38), .A0N(REG2[6]), .A1N(n38), .Y(n161) );
  OAI2BB2X1M U132 ( .B0(n220), .B1(n39), .A0N(REG1[0]), .A1N(n39), .Y(n163) );
  OAI2BB2X1M U133 ( .B0(n221), .B1(n39), .A0N(REG1[1]), .A1N(n39), .Y(n164) );
  OAI2BB2X1M U134 ( .B0(n222), .B1(n39), .A0N(REG1[2]), .A1N(n39), .Y(n165) );
  OAI2BB2X1M U135 ( .B0(n223), .B1(n39), .A0N(REG1[3]), .A1N(n39), .Y(n166) );
  OAI2BB2X1M U136 ( .B0(n224), .B1(n39), .A0N(REG1[4]), .A1N(n39), .Y(n167) );
  OAI2BB2X1M U137 ( .B0(n225), .B1(n39), .A0N(REG1[5]), .A1N(n39), .Y(n168) );
  OAI2BB2X1M U138 ( .B0(n226), .B1(n39), .A0N(REG1[6]), .A1N(n39), .Y(n169) );
  OAI2BB2X1M U139 ( .B0(n227), .B1(n39), .A0N(REG1[7]), .A1N(n39), .Y(n170) );
  OAI2BB2X1M U140 ( .B0(n220), .B1(n41), .A0N(REG0[0]), .A1N(n41), .Y(n171) );
  OAI2BB2X1M U141 ( .B0(n221), .B1(n41), .A0N(REG0[1]), .A1N(n41), .Y(n172) );
  OAI2BB2X1M U142 ( .B0(n222), .B1(n41), .A0N(REG0[2]), .A1N(n41), .Y(n173) );
  OAI2BB2X1M U143 ( .B0(n223), .B1(n41), .A0N(REG0[3]), .A1N(n41), .Y(n174) );
  OAI2BB2X1M U144 ( .B0(n224), .B1(n41), .A0N(REG0[4]), .A1N(n41), .Y(n175) );
  OAI2BB2X1M U145 ( .B0(n225), .B1(n41), .A0N(REG0[5]), .A1N(n41), .Y(n176) );
  OAI2BB2X1M U146 ( .B0(n226), .B1(n41), .A0N(REG0[6]), .A1N(n41), .Y(n177) );
  OAI2BB2X1M U147 ( .B0(n227), .B1(n41), .A0N(REG0[7]), .A1N(n41), .Y(n178) );
  OAI2BB2X1M U148 ( .B0(n220), .B1(n19), .A0N(\mem[14][0] ), .A1N(n19), .Y(n59) );
  OAI2BB2X1M U149 ( .B0(n221), .B1(n19), .A0N(\mem[14][1] ), .A1N(n19), .Y(n60) );
  OAI2BB2X1M U150 ( .B0(n222), .B1(n19), .A0N(\mem[14][2] ), .A1N(n19), .Y(n61) );
  OAI2BB2X1M U151 ( .B0(n223), .B1(n19), .A0N(\mem[14][3] ), .A1N(n19), .Y(n62) );
  OAI2BB2X1M U152 ( .B0(n224), .B1(n19), .A0N(\mem[14][4] ), .A1N(n19), .Y(n63) );
  OAI2BB2X1M U153 ( .B0(n225), .B1(n19), .A0N(\mem[14][5] ), .A1N(n19), .Y(n64) );
  OAI2BB2X1M U154 ( .B0(n226), .B1(n19), .A0N(\mem[14][6] ), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U155 ( .B0(n227), .B1(n19), .A0N(\mem[14][7] ), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U156 ( .B0(n220), .B1(n31), .A0N(\mem[7][0] ), .A1N(n31), .Y(n115) );
  OAI2BB2X1M U157 ( .B0(n221), .B1(n31), .A0N(\mem[7][1] ), .A1N(n31), .Y(n116) );
  OAI2BB2X1M U158 ( .B0(n222), .B1(n31), .A0N(\mem[7][2] ), .A1N(n31), .Y(n117) );
  OAI2BB2X1M U159 ( .B0(n223), .B1(n31), .A0N(\mem[7][3] ), .A1N(n31), .Y(n118) );
  OAI2BB2X1M U160 ( .B0(n224), .B1(n31), .A0N(\mem[7][4] ), .A1N(n31), .Y(n119) );
  OAI2BB2X1M U161 ( .B0(n225), .B1(n31), .A0N(\mem[7][5] ), .A1N(n31), .Y(n120) );
  OAI2BB2X1M U162 ( .B0(n226), .B1(n31), .A0N(\mem[7][6] ), .A1N(n31), .Y(n121) );
  OAI2BB2X1M U163 ( .B0(n227), .B1(n31), .A0N(\mem[7][7] ), .A1N(n31), .Y(n122) );
  OAI2BB2X1M U164 ( .B0(n220), .B1(n33), .A0N(\mem[6][0] ), .A1N(n33), .Y(n123) );
  OAI2BB2X1M U165 ( .B0(n221), .B1(n33), .A0N(\mem[6][1] ), .A1N(n33), .Y(n124) );
  OAI2BB2X1M U166 ( .B0(n222), .B1(n33), .A0N(\mem[6][2] ), .A1N(n33), .Y(n125) );
  OAI2BB2X1M U167 ( .B0(n223), .B1(n33), .A0N(\mem[6][3] ), .A1N(n33), .Y(n126) );
  OAI2BB2X1M U168 ( .B0(n224), .B1(n33), .A0N(\mem[6][4] ), .A1N(n33), .Y(n127) );
  OAI2BB2X1M U169 ( .B0(n225), .B1(n33), .A0N(\mem[6][5] ), .A1N(n33), .Y(n128) );
  OAI2BB2X1M U170 ( .B0(n226), .B1(n33), .A0N(\mem[6][6] ), .A1N(n33), .Y(n129) );
  OAI2BB2X1M U171 ( .B0(n227), .B1(n33), .A0N(\mem[6][7] ), .A1N(n33), .Y(n130) );
  OAI2BB2X1M U172 ( .B0(n220), .B1(n35), .A0N(\mem[5][0] ), .A1N(n35), .Y(n131) );
  OAI2BB2X1M U173 ( .B0(n221), .B1(n35), .A0N(\mem[5][1] ), .A1N(n35), .Y(n132) );
  OAI2BB2X1M U174 ( .B0(n222), .B1(n35), .A0N(\mem[5][2] ), .A1N(n35), .Y(n133) );
  OAI2BB2X1M U175 ( .B0(n223), .B1(n35), .A0N(\mem[5][3] ), .A1N(n35), .Y(n134) );
  OAI2BB2X1M U176 ( .B0(n224), .B1(n35), .A0N(\mem[5][4] ), .A1N(n35), .Y(n135) );
  OAI2BB2X1M U177 ( .B0(n225), .B1(n35), .A0N(\mem[5][5] ), .A1N(n35), .Y(n136) );
  OAI2BB2X1M U178 ( .B0(n226), .B1(n35), .A0N(\mem[5][6] ), .A1N(n35), .Y(n137) );
  OAI2BB2X1M U179 ( .B0(n227), .B1(n35), .A0N(\mem[5][7] ), .A1N(n35), .Y(n138) );
  OAI2BB2X1M U180 ( .B0(n220), .B1(n36), .A0N(\mem[4][0] ), .A1N(n36), .Y(n139) );
  OAI2BB2X1M U181 ( .B0(n221), .B1(n36), .A0N(\mem[4][1] ), .A1N(n36), .Y(n140) );
  OAI2BB2X1M U182 ( .B0(n222), .B1(n36), .A0N(\mem[4][2] ), .A1N(n36), .Y(n141) );
  OAI2BB2X1M U183 ( .B0(n223), .B1(n36), .A0N(\mem[4][3] ), .A1N(n36), .Y(n142) );
  OAI2BB2X1M U184 ( .B0(n224), .B1(n36), .A0N(\mem[4][4] ), .A1N(n36), .Y(n143) );
  OAI2BB2X1M U185 ( .B0(n225), .B1(n36), .A0N(\mem[4][5] ), .A1N(n36), .Y(n144) );
  OAI2BB2X1M U186 ( .B0(n226), .B1(n36), .A0N(\mem[4][6] ), .A1N(n36), .Y(n145) );
  OAI2BB2X1M U187 ( .B0(n227), .B1(n36), .A0N(\mem[4][7] ), .A1N(n36), .Y(n146) );
  OAI2BB2X1M U188 ( .B0(n225), .B1(n37), .A0N(REG3[5]), .A1N(n37), .Y(n152) );
  OAI2BB2X1M U189 ( .B0(n220), .B1(n38), .A0N(REG2[0]), .A1N(n38), .Y(n155) );
  OAI2BB2X1M U190 ( .B0(n227), .B1(n38), .A0N(REG2[7]), .A1N(n38), .Y(n162) );
  AO22X1M U191 ( .A0(N43), .A1(n228), .B0(RdData[0]), .B1(n15), .Y(n43) );
  MX4X1M U192 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U193 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n4) );
  MX4X1M U194 ( .A(\mem[8][0] ), .B(\mem[9][0] ), .C(\mem[10][0] ), .D(
        \mem[11][0] ), .S0(N11), .S1(N12), .Y(n2) );
  AO22X1M U195 ( .A0(N42), .A1(n228), .B0(RdData[1]), .B1(n15), .Y(n44) );
  MX4X1M U196 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U197 ( .A(\mem[8][1] ), .B(\mem[9][1] ), .C(\mem[10][1] ), .D(
        \mem[11][1] ), .S0(N11), .S1(N12), .Y(n6) );
  MX4X1M U198 ( .A(\mem[12][1] ), .B(\mem[13][1] ), .C(\mem[14][1] ), .D(
        \mem[15][1] ), .S0(n201), .S1(N12), .Y(n5) );
  AO22X1M U199 ( .A0(N41), .A1(n228), .B0(RdData[2]), .B1(n15), .Y(n45) );
  MX4X1M U200 ( .A(n12), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41)
         );
  MX4X1M U201 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(n199), .Y(n12) );
  MX4X1M U202 ( .A(\mem[8][2] ), .B(\mem[9][2] ), .C(\mem[10][2] ), .D(
        \mem[11][2] ), .S0(n201), .S1(n199), .Y(n10) );
  AO22X1M U203 ( .A0(N40), .A1(n228), .B0(RdData[3]), .B1(n15), .Y(n46) );
  MX4X1M U204 ( .A(n181), .B(n179), .C(n180), .D(n13), .S0(N14), .S1(N13), .Y(
        N40) );
  MX4X1M U205 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(n199), .Y(n181) );
  MX4X1M U206 ( .A(\mem[8][3] ), .B(\mem[9][3] ), .C(\mem[10][3] ), .D(
        \mem[11][3] ), .S0(n201), .S1(n199), .Y(n179) );
  AO22X1M U207 ( .A0(N39), .A1(n228), .B0(RdData[4]), .B1(n15), .Y(n47) );
  MX4X1M U208 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U209 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(n199), .Y(n185) );
  MX4X1M U210 ( .A(\mem[8][4] ), .B(\mem[9][4] ), .C(\mem[10][4] ), .D(
        \mem[11][4] ), .S0(n201), .S1(n199), .Y(n183) );
  AO22X1M U211 ( .A0(N38), .A1(n228), .B0(RdData[5]), .B1(n15), .Y(n48) );
  MX4X1M U212 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U213 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U214 ( .A(\mem[8][5] ), .B(\mem[9][5] ), .C(\mem[10][5] ), .D(
        \mem[11][5] ), .S0(n202), .S1(N12), .Y(n187) );
  AO22X1M U215 ( .A0(N37), .A1(n228), .B0(RdData[6]), .B1(n15), .Y(n49) );
  MX4X1M U216 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U217 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U218 ( .A(\mem[8][6] ), .B(\mem[9][6] ), .C(\mem[10][6] ), .D(
        \mem[11][6] ), .S0(n202), .S1(N12), .Y(n191) );
  AO22X1M U219 ( .A0(N36), .A1(n228), .B0(RdData[7]), .B1(n15), .Y(n50) );
  MX4X1M U220 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U221 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U222 ( .A(\mem[8][7] ), .B(\mem[9][7] ), .C(\mem[10][7] ), .D(
        \mem[11][7] ), .S0(n202), .S1(N12), .Y(n195) );
  MX4X1M U223 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(N12), .Y(n8) );
  MX4X1M U224 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(N11), .S1(N12), .Y(n3) );
  MX4X1M U225 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n201), .S1(N12), .Y(n7) );
  MX4X1M U226 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n201), .S1(n199), .Y(n11) );
  MX4X1M U227 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n201), .S1(n199), .Y(n180) );
  MX4X1M U228 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n201), .S1(n199), .Y(n184) );
  MX4X1M U229 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n202), .S1(n199), .Y(n188) );
  MX4X1M U230 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U231 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n202), .S1(N12), .Y(n196) );
  MX4X1M U232 ( .A(\mem[12][0] ), .B(\mem[13][0] ), .C(\mem[14][0] ), .D(
        \mem[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U233 ( .A(\mem[12][2] ), .B(\mem[13][2] ), .C(\mem[14][2] ), .D(
        \mem[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U234 ( .A(\mem[12][3] ), .B(\mem[13][3] ), .C(\mem[14][3] ), .D(
        \mem[15][3] ), .S0(n201), .S1(n199), .Y(n13) );
  MX4X1M U235 ( .A(\mem[12][4] ), .B(\mem[13][4] ), .C(\mem[14][4] ), .D(
        \mem[15][4] ), .S0(n201), .S1(n199), .Y(n182) );
  MX4X1M U236 ( .A(\mem[12][5] ), .B(\mem[13][5] ), .C(\mem[14][5] ), .D(
        \mem[15][5] ), .S0(n202), .S1(N12), .Y(n186) );
  MX4X1M U237 ( .A(\mem[12][6] ), .B(\mem[13][6] ), .C(\mem[14][6] ), .D(
        \mem[15][6] ), .S0(n202), .S1(N12), .Y(n190) );
  MX4X1M U238 ( .A(\mem[12][7] ), .B(\mem[13][7] ), .C(\mem[14][7] ), .D(
        \mem[15][7] ), .S0(n202), .S1(N12), .Y(n194) );
  AO21XLM U239 ( .A0(RdData_Valid), .A1(n14), .B0(n228), .Y(n42) );
  INVX2M U240 ( .A(N11), .Y(n203) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
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
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n19), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n19), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n8) );
  INVX2M U17 ( .A(n19), .Y(n7) );
  NAND2X2M U18 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n9) );
  NAND2X2M U20 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U21 ( .A(a[1]), .Y(n10) );
  NAND2X2M U22 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U23 ( .A(a[0]), .Y(n11) );
  INVX2M U24 ( .A(b[5]), .Y(n14) );
  NAND2X2M U25 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n2) );
  INVX2M U27 ( .A(n19), .Y(n1) );
  INVX2M U28 ( .A(b[6]), .Y(n13) );
  XNOR2X2M U29 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U30 ( .A(b[7]), .Y(n12) );
  INVX2M U31 ( .A(b[2]), .Y(n17) );
  INVX2M U32 ( .A(b[3]), .Y(n16) );
  INVX2M U33 ( .A(b[4]), .Y(n15) );
  INVX2M U34 ( .A(b[1]), .Y(n18) );
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
  INVX2M U1 ( .A(B[5]), .Y(n4) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U4 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U5 ( .A(B[0]), .Y(n9) );
  INVX2M U6 ( .A(B[2]), .Y(n7) );
  INVX2M U7 ( .A(B[3]), .Y(n6) );
  INVX2M U8 ( .A(B[4]), .Y(n5) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  NAND2X2M U10 ( .A(B[0]), .B(n1), .Y(carry[1]) );
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
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
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

  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_1 FS_1 ( .A({
        1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , 
        \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, 
        n11, n15, n16, n14, n12, n13, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n8), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U11 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U12 ( .A(\ab[0][5] ), .Y(n21) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U15 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n11) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U18 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U19 ( .A(\ab[0][3] ), .Y(n19) );
  XNOR2X2M U20 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  AND2X2M U21 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U22 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n13) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  INVX2M U24 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U26 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U28 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n16) );
  XNOR2X2M U29 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U30 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n30) );
  INVX2M U37 ( .A(B[6]), .Y(n33) );
  INVX2M U38 ( .A(A[0]), .Y(n31) );
  INVX2M U39 ( .A(B[7]), .Y(n32) );
  INVX2M U40 ( .A(B[5]), .Y(n34) );
  XNOR2X2M U41 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U42 ( .A(A[2]), .Y(n29) );
  INVX2M U43 ( .A(A[3]), .Y(n28) );
  INVX2M U44 ( .A(A[4]), .Y(n27) );
  INVX2M U45 ( .A(A[7]), .Y(n24) );
  INVX2M U46 ( .A(A[6]), .Y(n25) );
  INVX2M U47 ( .A(A[5]), .Y(n26) );
  INVX2M U48 ( .A(B[3]), .Y(n36) );
  INVX2M U49 ( .A(B[4]), .Y(n35) );
  INVX2M U50 ( .A(B[0]), .Y(n39) );
  INVX2M U51 ( .A(B[2]), .Y(n37) );
  INVX2M U52 ( .A(B[1]), .Y(n38) );
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
endmodule


module ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16 ( CLK, RST, A, B, 
        ALU_FUN, ALU_ENABLE, ALU_OUT, ALU_OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_ENABLE;
  output ALU_OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N127,
         N128, N129, N130, N131, N132, N133, N134, N167, N168, N169, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151;
  wire   [15:0] ALU_OUT_Comb;

  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW_div_uns_0 div_46 ( 
        .a({n14, n13, n12, n11, n10, n9, n8, n7}), .b({n6, n5, n4, B[4:0]}), 
        .quotient({N134, N133, N132, N131, N130, N129, N128, N127}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_sub_0 sub_35 ( .A({
        1'b0, n14, n13, n12, n11, n10, n9, n8, n7}), .B({1'b0, n6, n5, n4, 
        B[4:0]}), .CI(1'b0), .DIFF({N109, N108, N107, N106, N105, N104, N103, 
        N102, N101}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW01_add_0 add_32 ( .A({
        1'b0, n14, n13, n12, n11, n10, n9, n8, n7}), .B({1'b0, n6, n5, n4, 
        B[4:0]}), .CI(1'b0), .SUM({N100, N99, N98, N97, N96, N95, N94, N93, 
        N92}) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_DW02_mult_0 mult_38 ( 
        .A({n14, n13, n12, n11, n10, n9, n8, n7}), .B({n6, n5, n4, B[4:0]}), 
        .TC(1'b0), .PRODUCT({N125, N124, N123, N122, N121, N120, N119, N118, 
        N117, N116, N115, N114, N113, N112, N111, N110}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M ALU_OUT_VALID_reg ( .D(ALU_ENABLE), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_VALID) );
  BUFX2M U3 ( .A(A[7]), .Y(n14) );
  BUFX2M U4 ( .A(A[6]), .Y(n13) );
  OAI2BB1X2M U5 ( .A0N(N125), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U8 ( .A0N(N124), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U10 ( .A0N(N123), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U11 ( .A0N(N120), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U12 ( .A0N(N121), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U13 ( .A0N(N119), .A1N(n33), .B0(n34), .Y(ALU_OUT_Comb[9]) );
  OAI21X2M U14 ( .A0(n113), .A1(n98), .B0(n114), .Y(n51) );
  OAI21X2M U15 ( .A0(n115), .A1(n112), .B0(n114), .Y(n49) );
  OR2X2M U16 ( .A(n35), .B(n147), .Y(n34) );
  NOR2BX2M U17 ( .AN(n116), .B(n115), .Y(n39) );
  NOR2BX2M U18 ( .AN(n116), .B(n113), .Y(n54) );
  NOR2BX2M U19 ( .AN(n38), .B(n147), .Y(n33) );
  INVX2M U20 ( .A(n52), .Y(n148) );
  BUFX2M U21 ( .A(n43), .Y(n15) );
  NOR2X2M U22 ( .A(n98), .B(n115), .Y(n43) );
  BUFX2M U23 ( .A(n50), .Y(n16) );
  NOR2X2M U24 ( .A(n112), .B(n113), .Y(n50) );
  INVX2M U25 ( .A(n112), .Y(n150) );
  NOR4X1M U26 ( .A(n109), .B(n151), .C(ALU_FUN[2]), .D(ALU_FUN[0]), .Y(n106)
         );
  NAND2X2M U27 ( .A(N167), .B(n3), .Y(n109) );
  NAND3BX2M U28 ( .AN(n98), .B(n3), .C(n149), .Y(n52) );
  NOR3X2M U29 ( .A(n151), .B(ALU_FUN[2]), .C(n113), .Y(n53) );
  NOR3BX2M U30 ( .AN(n101), .B(n15), .C(n143), .Y(n35) );
  AOI21X2M U31 ( .A0(N109), .A1(n54), .B0(n51), .Y(n101) );
  NOR2X2M U32 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n116) );
  NAND2X2M U33 ( .A(ALU_FUN[2]), .B(n151), .Y(n112) );
  AND3X2M U34 ( .A(n116), .B(n149), .C(n3), .Y(n48) );
  NAND2X2M U35 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n98) );
  AND4X2M U36 ( .A(N169), .B(n150), .C(n3), .D(n149), .Y(n96) );
  OR2X2M U37 ( .A(n3), .B(n149), .Y(n113) );
  INVX2M U38 ( .A(ALU_FUN[0]), .Y(n149) );
  NAND3X2M U39 ( .A(n116), .B(ALU_FUN[0]), .C(n3), .Y(n114) );
  NOR3X2M U40 ( .A(n115), .B(ALU_FUN[2]), .C(n151), .Y(n38) );
  OAI22X1M U41 ( .A0(n60), .A1(n137), .B0(n52), .B1(n140), .Y(n88) );
  OAI22X1M U42 ( .A0(n60), .A1(n136), .B0(n52), .B1(n138), .Y(n81) );
  OAI22X1M U43 ( .A0(n135), .A1(n60), .B0(n52), .B1(n137), .Y(n74) );
  OAI22X1M U44 ( .A0(n134), .A1(n60), .B0(n52), .B1(n136), .Y(n67) );
  OAI22X1M U45 ( .A0(n133), .A1(n60), .B0(n52), .B1(n135), .Y(n59) );
  NAND3X2M U46 ( .A(n3), .B(ALU_FUN[0]), .C(n150), .Y(n60) );
  INVX2M U47 ( .A(ALU_FUN[1]), .Y(n151) );
  OR2X2M U48 ( .A(n3), .B(ALU_FUN[0]), .Y(n115) );
  INVX2M U49 ( .A(ALU_ENABLE), .Y(n147) );
  AOI31X2M U50 ( .A0(n102), .A1(n103), .A2(n104), .B0(n147), .Y(
        ALU_OUT_Comb[0]) );
  AOI222X1M U51 ( .A0(N92), .A1(n39), .B0(N110), .B1(n38), .C0(N101), .C1(n54), 
        .Y(n102) );
  NOR4X1M U52 ( .A(n105), .B(n106), .C(n143), .D(n96), .Y(n104) );
  AOI222X1M U53 ( .A0(N127), .A1(n53), .B0(n15), .B1(n141), .C0(n7), .C1(n16), 
        .Y(n103) );
  AOI31X2M U54 ( .A0(n91), .A1(n92), .A2(n93), .B0(n147), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U55 ( .A0(N93), .A1(n39), .B0(N111), .B1(n38), .C0(N102), .C1(n54), 
        .Y(n91) );
  NOR4BX1M U56 ( .AN(n94), .B(n95), .C(n143), .D(n96), .Y(n93) );
  AOI222X1M U57 ( .A0(N128), .A1(n53), .B0(n15), .B1(n140), .C0(n8), .C1(n16), 
        .Y(n92) );
  AOI31X2M U58 ( .A0(n84), .A1(n85), .A2(n86), .B0(n147), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U59 ( .A0(N103), .A1(n54), .B0(N94), .B1(n39), .Y(n84) );
  AOI211X2M U60 ( .A0(n15), .A1(n138), .B0(n87), .C0(n88), .Y(n86) );
  AOI222X1M U61 ( .A0(N112), .A1(n38), .B0(n9), .B1(n16), .C0(N129), .C1(n53), 
        .Y(n85) );
  AOI31X2M U62 ( .A0(n77), .A1(n78), .A2(n79), .B0(n147), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U63 ( .A0(N104), .A1(n54), .B0(N95), .B1(n39), .Y(n77) );
  AOI211X2M U64 ( .A0(n15), .A1(n137), .B0(n80), .C0(n81), .Y(n79) );
  AOI222X1M U65 ( .A0(N113), .A1(n38), .B0(n10), .B1(n16), .C0(N130), .C1(n53), 
        .Y(n78) );
  AOI31X2M U66 ( .A0(n70), .A1(n71), .A2(n72), .B0(n147), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U67 ( .A0(N105), .A1(n54), .B0(N96), .B1(n39), .Y(n70) );
  AOI211X2M U68 ( .A0(n15), .A1(n136), .B0(n73), .C0(n74), .Y(n72) );
  AOI222X1M U69 ( .A0(N114), .A1(n38), .B0(n11), .B1(n16), .C0(N131), .C1(n53), 
        .Y(n71) );
  AOI31X2M U70 ( .A0(n63), .A1(n64), .A2(n65), .B0(n147), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U71 ( .A0(N106), .A1(n54), .B0(N97), .B1(n39), .Y(n63) );
  AOI211X2M U72 ( .A0(n15), .A1(n135), .B0(n66), .C0(n67), .Y(n65) );
  AOI222X1M U73 ( .A0(N115), .A1(n38), .B0(n12), .B1(n16), .C0(N132), .C1(n53), 
        .Y(n64) );
  AOI31X2M U74 ( .A0(n55), .A1(n56), .A2(n57), .B0(n147), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U75 ( .A0(N107), .A1(n54), .B0(N98), .B1(n39), .Y(n55) );
  AOI211X2M U76 ( .A0(n15), .A1(n134), .B0(n58), .C0(n59), .Y(n57) );
  AOI222X1M U77 ( .A0(N116), .A1(n38), .B0(n16), .B1(n13), .C0(N133), .C1(n53), 
        .Y(n56) );
  AOI31X2M U78 ( .A0(n40), .A1(n41), .A2(n42), .B0(n147), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U79 ( .A0(N108), .A1(n54), .B0(N99), .B1(n39), .Y(n40) );
  AOI221XLM U80 ( .A0(n13), .A1(n148), .B0(n15), .B1(n133), .C0(n44), .Y(n42)
         );
  AOI222X1M U81 ( .A0(N117), .A1(n38), .B0(n16), .B1(n14), .C0(N134), .C1(n53), 
        .Y(n41) );
  AOI31X2M U82 ( .A0(n35), .A1(n36), .A2(n37), .B0(n147), .Y(ALU_OUT_Comb[8])
         );
  NAND2X2M U83 ( .A(N100), .B(n39), .Y(n36) );
  AOI22X1M U84 ( .A0(n14), .A1(n148), .B0(N118), .B1(n38), .Y(n37) );
  INVX2M U85 ( .A(n5), .Y(n130) );
  AOI221XLM U86 ( .A0(n140), .A1(n51), .B0(n48), .B1(n8), .C0(n15), .Y(n100)
         );
  OAI222X1M U87 ( .A0(n52), .A1(n141), .B0(n97), .B1(n146), .C0(n60), .C1(n138), .Y(n95) );
  AOI221XLM U88 ( .A0(n48), .A1(n140), .B0(n8), .B1(n49), .C0(n16), .Y(n97) );
  OAI221X1M U89 ( .A0(n6), .A1(n45), .B0(n46), .B1(n142), .C0(n47), .Y(n44) );
  INVX2M U90 ( .A(n6), .Y(n142) );
  AOI221XLM U91 ( .A0(n48), .A1(n14), .B0(n51), .B1(n133), .C0(n15), .Y(n45)
         );
  AOI221XLM U92 ( .A0(n48), .A1(n133), .B0(n14), .B1(n49), .C0(n16), .Y(n46)
         );
  OAI221X1M U93 ( .A0(n4), .A1(n68), .B0(n69), .B1(n144), .C0(n47), .Y(n66) );
  INVX2M U94 ( .A(n4), .Y(n144) );
  AOI221XLM U95 ( .A0(n12), .A1(n48), .B0(n51), .B1(n135), .C0(n15), .Y(n68)
         );
  AOI221XLM U96 ( .A0(n48), .A1(n135), .B0(n12), .B1(n49), .C0(n16), .Y(n69)
         );
  OAI221X1M U97 ( .A0(n5), .A1(n61), .B0(n62), .B1(n130), .C0(n47), .Y(n58) );
  AOI221XLM U98 ( .A0(n13), .A1(n48), .B0(n51), .B1(n134), .C0(n15), .Y(n61)
         );
  AOI221XLM U99 ( .A0(n48), .A1(n134), .B0(n13), .B1(n49), .C0(n16), .Y(n62)
         );
  AOI32X1M U100 ( .A0(N168), .A1(n3), .A2(n99), .B0(n139), .B1(n146), .Y(n94)
         );
  NOR3X2M U101 ( .A(n149), .B(ALU_FUN[2]), .C(n151), .Y(n99) );
  INVX2M U102 ( .A(n100), .Y(n139) );
  INVX2M U103 ( .A(n47), .Y(n143) );
  BUFX2M U104 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U105 ( .A(n12), .Y(n135) );
  INVX2M U106 ( .A(n10), .Y(n137) );
  INVX2M U107 ( .A(n11), .Y(n136) );
  INVX2M U108 ( .A(n8), .Y(n140) );
  INVX2M U109 ( .A(n9), .Y(n138) );
  INVX2M U110 ( .A(n13), .Y(n134) );
  INVX2M U111 ( .A(n14), .Y(n133) );
  INVX2M U112 ( .A(n7), .Y(n141) );
  BUFX2M U113 ( .A(B[6]), .Y(n5) );
  BUFX2M U114 ( .A(B[7]), .Y(n6) );
  BUFX2M U115 ( .A(B[5]), .Y(n4) );
  BUFX2M U116 ( .A(A[5]), .Y(n12) );
  BUFX2M U117 ( .A(A[4]), .Y(n11) );
  BUFX2M U118 ( .A(A[3]), .Y(n10) );
  BUFX2M U119 ( .A(A[2]), .Y(n9) );
  BUFX2M U120 ( .A(A[1]), .Y(n8) );
  BUFX2M U121 ( .A(A[0]), .Y(n7) );
  OAI222X1M U122 ( .A0(n110), .A1(n127), .B0(B[0]), .B1(n111), .C0(n60), .C1(
        n140), .Y(n105) );
  AOI221XLM U123 ( .A0(n48), .A1(n141), .B0(n7), .B1(n49), .C0(n16), .Y(n110)
         );
  AOI221XLM U124 ( .A0(n7), .A1(n48), .B0(n51), .B1(n141), .C0(n15), .Y(n111)
         );
  OAI221X1M U125 ( .A0(B[2]), .A1(n89), .B0(n90), .B1(n128), .C0(n47), .Y(n87)
         );
  AOI221XLM U126 ( .A0(n9), .A1(n48), .B0(n51), .B1(n138), .C0(n15), .Y(n89)
         );
  AOI221XLM U127 ( .A0(n48), .A1(n138), .B0(n9), .B1(n49), .C0(n16), .Y(n90)
         );
  OAI221X1M U128 ( .A0(B[3]), .A1(n82), .B0(n83), .B1(n129), .C0(n47), .Y(n80)
         );
  AOI221XLM U129 ( .A0(n10), .A1(n48), .B0(n51), .B1(n137), .C0(n15), .Y(n82)
         );
  AOI221XLM U130 ( .A0(n48), .A1(n137), .B0(n10), .B1(n49), .C0(n16), .Y(n83)
         );
  OAI221X1M U131 ( .A0(B[4]), .A1(n75), .B0(n76), .B1(n145), .C0(n47), .Y(n73)
         );
  AOI221XLM U132 ( .A0(n11), .A1(n48), .B0(n51), .B1(n136), .C0(n15), .Y(n75)
         );
  AOI221XLM U133 ( .A0(n48), .A1(n136), .B0(n11), .B1(n49), .C0(n16), .Y(n76)
         );
  INVX2M U134 ( .A(n17), .Y(n131) );
  NAND4X2M U135 ( .A(n129), .B(n145), .C(n107), .D(n108), .Y(n47) );
  NOR3X2M U136 ( .A(n4), .B(n6), .C(n5), .Y(n107) );
  NOR4BX1M U137 ( .AN(n53), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n108) );
  INVX2M U138 ( .A(n28), .Y(n132) );
  INVX2M U139 ( .A(B[0]), .Y(n127) );
  INVX2M U140 ( .A(B[2]), .Y(n128) );
  INVX2M U141 ( .A(B[3]), .Y(n129) );
  INVX2M U142 ( .A(B[4]), .Y(n145) );
  INVX2M U143 ( .A(B[1]), .Y(n146) );
  NOR2X1M U144 ( .A(n133), .B(n6), .Y(n123) );
  NAND2BX1M U145 ( .AN(B[4]), .B(n11), .Y(n32) );
  NAND2BX1M U146 ( .AN(n11), .B(B[4]), .Y(n21) );
  CLKNAND2X2M U147 ( .A(n32), .B(n21), .Y(n118) );
  NOR2X1M U148 ( .A(n129), .B(n10), .Y(n29) );
  NOR2X1M U149 ( .A(n128), .B(n9), .Y(n20) );
  NOR2X1M U150 ( .A(n127), .B(n7), .Y(n17) );
  CLKNAND2X2M U151 ( .A(n9), .B(n128), .Y(n31) );
  NAND2BX1M U152 ( .AN(n20), .B(n31), .Y(n26) );
  AOI21X1M U153 ( .A0(n17), .A1(n140), .B0(B[1]), .Y(n18) );
  AOI211X1M U154 ( .A0(n8), .A1(n131), .B0(n26), .C0(n18), .Y(n19) );
  CLKNAND2X2M U155 ( .A(n10), .B(n129), .Y(n30) );
  OAI31X1M U156 ( .A0(n29), .A1(n20), .A2(n19), .B0(n30), .Y(n22) );
  NAND2BX1M U157 ( .AN(n12), .B(n4), .Y(n121) );
  OAI211X1M U158 ( .A0(n118), .A1(n22), .B0(n21), .C0(n121), .Y(n23) );
  NAND2BX1M U159 ( .AN(n4), .B(n12), .Y(n117) );
  XNOR2X1M U160 ( .A(n13), .B(n5), .Y(n120) );
  AOI32X1M U161 ( .A0(n23), .A1(n117), .A2(n120), .B0(n5), .B1(n134), .Y(n24)
         );
  CLKNAND2X2M U162 ( .A(n6), .B(n133), .Y(n124) );
  OAI21X1M U163 ( .A0(n123), .A1(n24), .B0(n124), .Y(N169) );
  CLKNAND2X2M U164 ( .A(n7), .B(n127), .Y(n27) );
  OA21X1M U165 ( .A0(n27), .A1(n140), .B0(B[1]), .Y(n25) );
  AOI211X1M U166 ( .A0(n27), .A1(n140), .B0(n26), .C0(n25), .Y(n28) );
  AOI31X1M U167 ( .A0(n132), .A1(n31), .A2(n30), .B0(n29), .Y(n119) );
  OAI2B11X1M U168 ( .A1N(n119), .A0(n118), .B0(n117), .C0(n32), .Y(n122) );
  AOI32X1M U169 ( .A0(n122), .A1(n121), .A2(n120), .B0(n13), .B1(n130), .Y(
        n125) );
  AOI2B1X1M U170 ( .A1N(n125), .A0(n124), .B0(n123), .Y(n126) );
  CLKINVX1M U171 ( .A(n126), .Y(N168) );
  NOR2X1M U172 ( .A(N169), .B(N168), .Y(N167) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST, RX_IN, TX_OUT, parity_error, 
        Stop_Error );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, parity_error, Stop_Error;
  wire   SYNC_UART_RST, SYNC_REF_RST, RX_OUT_V, RX_OUT_V_SYNC, TX_IN_V,
         UART_TX_CLK, TX_BUSY_PULSE, FIFO_FULL, TX_OUT_V, TX_BUSY, UART_RX_CLK,
         ALU_OUT_VALID, ALU_ENABLE, RdData_Valid, WrEn, RdEn, GATE_EN, ALU_CLK,
         n1, n2, n3, n4, n5, n6, n7;
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

  RST_SYNC_NUM_STAGES2_0 RST_SYNC_UART_UNIT ( .CLK(UART_CLK), .RST(RST), 
        .SYNC_RST(SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 RST_SYNC_REF_UNIT ( .CLK(REF_CLK), .RST(RST), 
        .SYNC_RST(SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 DATA_SYNC_UNIT ( .CLK(REF_CLK), .RST(n4), 
        .BUS_ENABLE(RX_OUT_V), .Unsync_bus(RX_OUT_P), .SYNC_BUS(RX_OUT_P_SYNC), 
        .ENABLE_PULSE(RX_OUT_V_SYNC) );
  FIFO_DATASIZE8_MEMDEPTH8 FIFO_UNIT ( .wclk(REF_CLK), .wrst_n(n4), .rclk(
        UART_TX_CLK), .rrst_n(n6), .winc(TX_IN_V), .rinc(TX_BUSY_PULSE), 
        .wdata(TX_IN_P), .rdata(TX_OUT_S), .wfull(FIFO_FULL), .rempty(TX_OUT_V) );
  PULSE_GEN PULSE_GEN_UNIT ( .CLK(UART_TX_CLK), .RST(n6), .LVL_SIG(TX_BUSY), 
        .PULSE_SIG(TX_BUSY_PULSE) );
  CLK_DIV_DIV_RATIO8_0 CLK_DIV_TX_UNIT ( .I_ref_clk(UART_CLK), .I_rst_n(n6), 
        .I_clk_en(1'b1), .I_div_ratio(DIV_RATIO), .O_div_clk(UART_TX_CLK) );
  PRESCALE_MUX_MEM_WIDTH8 PRESCALE_MUX_UNIT ( .PRESCALE(UART_CONFIG[7:2]), 
        .DIV_RATIO_MUX({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  CLK_DIV_DIV_RATIO8_1 CLK_DIV_RX_UNIT ( .I_ref_clk(UART_CLK), .I_rst_n(n6), 
        .I_clk_en(1'b1), .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .O_div_clk(UART_RX_CLK) );
  UART_UART_DATA_WIDTH8 UART_UNIT ( .RST(n6), .TX_CLK(UART_TX_CLK), .RX_CLK(
        UART_RX_CLK), .RX_IN_S(RX_IN), .RX_OUT_P(RX_OUT_P), .RX_OUT_V(RX_OUT_V), .TX_IN_P(TX_OUT_S), .TX_IN_V(n1), .TX_OUT_S(TX_OUT), .TX_OUT_V(TX_BUSY), 
        .Prescale(UART_CONFIG[7:2]), .parity_enable(UART_CONFIG[0]), 
        .parity_type(UART_CONFIG[1]), .parity_error(parity_error), 
        .Stop_Error(Stop_Error) );
  SYS_CTRL_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4_UART_DATA_WIDTH8 SYS_CTRL_UNIT ( 
        .CLK(REF_CLK), .RST(n4), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(
        ALU_OUT_VALID), .ALU_FUN(ALU_FUN), .ALU_ENABLE(ALU_ENABLE), .RdData(
        RdData), .RdData_Valid(RdData_Valid), .Address(Address), .WrEn(WrEn), 
        .RdEn(RdEn), .WrData(WrData), .CLK_EN(GATE_EN), .RX_P_DATA(
        RX_OUT_P_SYNC), .RX_D_VLD(RX_OUT_V_SYNC), .TX_P_DATA(TX_IN_P), 
        .TX_D_VLD(TX_IN_V), .FIFO_FULL(FIFO_FULL) );
  REG_FILE_MEM_DEPTH16_MEM_WIDTH8_ADDR_WIDTH4 REG_FILE_UNIT ( .WrEn(WrEn), 
        .RdEn(RdEn), .CLK(REF_CLK), .RST(n4), .Address({Address[3:2], n3, n2}), 
        .WrData(WrData), .RdData(RdData), .RdData_Valid(RdData_Valid), .REG0(
        OP_A), .REG1(OP_B), .REG2(UART_CONFIG), .REG3(DIV_RATIO) );
  CLK_GATE CLOCK_GATE_UNIT ( .CLK_EN(GATE_EN), .CLK(REF_CLK), .GATED_CLK(
        ALU_CLK) );
  ALU_N8_OPERAND_WIDTH8_FUN_WIDTH4_ALU_OUTPUT_WIDTH16 ALU_UNIT ( .CLK(ALU_CLK), 
        .RST(n4), .A(OP_A), .B(OP_B), .ALU_FUN(ALU_FUN), .ALU_ENABLE(
        ALU_ENABLE), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID) );
  BUFX2M U2 ( .A(Address[1]), .Y(n3) );
  BUFX2M U3 ( .A(Address[0]), .Y(n2) );
  INVX2M U4 ( .A(TX_OUT_V), .Y(n1) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(SYNC_REF_RST), .Y(n5) );
  INVX4M U7 ( .A(n7), .Y(n6) );
  INVX2M U8 ( .A(SYNC_UART_RST), .Y(n7) );
endmodule

