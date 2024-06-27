// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.2 (lin64) Build 2768091 Fri Jan 31 21:52:39 MST 2020
// Date        : Thu Nov  2 21:51:24 2023
// Host        : 8ee88c6ed9a2 running 64-bit unknown
// Command     : write_verilog -mode funcsim logicnet_post_synth.v
// Design      : logicnet
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module layer0
   (M0_45_sp_1,
    \M0[45]_0 ,
    M0_7_sp_1,
    \M0[7]_0 ,
    M0_87_sp_1,
    M0_73_sp_1,
    \M0[73]_0 ,
    \M0[87]_0 ,
    \M0[87]_1 ,
    \M0[87]_2 ,
    \M0[87]_3 ,
    \M0[87]_4 ,
    \M0[87]_5 ,
    \M0[87]_6 ,
    M2,
    M0_28_sp_1,
    \M0[28]_0 ,
    M0_42_sp_1,
    \M0[42]_0 ,
    M0_33_sp_1,
    \M0[33]_0 ,
    M0_37_sp_1,
    \M0[37]_0 ,
    M0_67_sp_1,
    M0_66_sp_1,
    sel,
    M0_58_sp_1,
    \M0[58]_0 ,
    M0_17_sp_1,
    M0_16_sp_1,
    \M0[120] ,
    M0_1_sp_1,
    M0_11_sp_1,
    \M0[11]_0 ,
    M0_0_sp_1,
    \M0[0]_0 ,
    M0_85_sp_1,
    \M0[85]_0 ,
    \M0[118] ,
    M0_97_sp_1,
    M0_49_sp_1,
    \M0[49]_0 ,
    M0_29_sp_1,
    \M0[28]_1 ,
    \M0[109] ,
    \M0[120]_0 ,
    \M0[67]_0 ,
    M0_69_sp_1,
    M0_60_sp_1,
    \M0[60]_0 ,
    \M0[107] ,
    \M0[42]_1 ,
    M0_53_sp_1,
    \M0[67]_1 ,
    M0,
    \M2[10]_INST_0_i_2 ,
    \M2[10]_INST_0_i_2_0 ,
    \M2[10]_INST_0_i_2_1 ,
    \M2[10]_INST_0_i_2_2 ,
    \M2[25]_INST_0_i_2 ,
    \M2[25]_INST_0_i_2_0 ,
    \M2[25]_INST_0_i_2_1 ,
    \M2[25]_INST_0_i_2_2 ,
    \M2[23]_INST_0_i_4 ,
    \M2[23]_INST_0_i_4_0 ,
    \M2[23]_INST_0_i_4_1 ,
    \M2[23]_INST_0_i_4_2 ,
    \M2[23]_INST_0_i_2 ,
    \M2[23]_INST_0_i_2_0 ,
    \M2[23]_INST_0_i_2_1 ,
    \M2[23]_INST_0_i_2_2 );
  output M0_45_sp_1;
  output \M0[45]_0 ;
  output M0_7_sp_1;
  output \M0[7]_0 ;
  output M0_87_sp_1;
  output M0_73_sp_1;
  output \M0[73]_0 ;
  output \M0[87]_0 ;
  output \M0[87]_1 ;
  output \M0[87]_2 ;
  output \M0[87]_3 ;
  output \M0[87]_4 ;
  output \M0[87]_5 ;
  output \M0[87]_6 ;
  output [0:0]M2;
  output M0_28_sp_1;
  output \M0[28]_0 ;
  output M0_42_sp_1;
  output \M0[42]_0 ;
  output M0_33_sp_1;
  output \M0[33]_0 ;
  output M0_37_sp_1;
  output \M0[37]_0 ;
  output M0_67_sp_1;
  output M0_66_sp_1;
  output [7:0]sel;
  output M0_58_sp_1;
  output \M0[58]_0 ;
  output M0_17_sp_1;
  output M0_16_sp_1;
  output \M0[120] ;
  output M0_1_sp_1;
  output M0_11_sp_1;
  output \M0[11]_0 ;
  output M0_0_sp_1;
  output \M0[0]_0 ;
  output M0_85_sp_1;
  output \M0[85]_0 ;
  output \M0[118] ;
  output M0_97_sp_1;
  output M0_49_sp_1;
  output \M0[49]_0 ;
  output M0_29_sp_1;
  output \M0[28]_1 ;
  output \M0[109] ;
  output \M0[120]_0 ;
  output \M0[67]_0 ;
  output M0_69_sp_1;
  output M0_60_sp_1;
  output \M0[60]_0 ;
  output \M0[107] ;
  output \M0[42]_1 ;
  output M0_53_sp_1;
  output \M0[67]_1 ;
  input [101:0]M0;
  input \M2[10]_INST_0_i_2 ;
  input \M2[10]_INST_0_i_2_0 ;
  input \M2[10]_INST_0_i_2_1 ;
  input \M2[10]_INST_0_i_2_2 ;
  input \M2[25]_INST_0_i_2 ;
  input \M2[25]_INST_0_i_2_0 ;
  input \M2[25]_INST_0_i_2_1 ;
  input \M2[25]_INST_0_i_2_2 ;
  input \M2[23]_INST_0_i_4 ;
  input \M2[23]_INST_0_i_4_0 ;
  input \M2[23]_INST_0_i_4_1 ;
  input \M2[23]_INST_0_i_4_2 ;
  input \M2[23]_INST_0_i_2 ;
  input \M2[23]_INST_0_i_2_0 ;
  input \M2[23]_INST_0_i_2_1 ;
  input \M2[23]_INST_0_i_2_2 ;

  wire [101:0]M0;
  wire \M0[0]_0 ;
  wire \M0[107] ;
  wire \M0[109] ;
  wire \M0[118] ;
  wire \M0[11]_0 ;
  wire \M0[120] ;
  wire \M0[120]_0 ;
  wire \M0[28]_0 ;
  wire \M0[28]_1 ;
  wire \M0[33]_0 ;
  wire \M0[37]_0 ;
  wire \M0[42]_0 ;
  wire \M0[42]_1 ;
  wire \M0[45]_0 ;
  wire \M0[49]_0 ;
  wire \M0[58]_0 ;
  wire \M0[60]_0 ;
  wire \M0[67]_0 ;
  wire \M0[67]_1 ;
  wire \M0[73]_0 ;
  wire \M0[7]_0 ;
  wire \M0[85]_0 ;
  wire \M0[87]_0 ;
  wire \M0[87]_1 ;
  wire \M0[87]_2 ;
  wire \M0[87]_3 ;
  wire \M0[87]_4 ;
  wire \M0[87]_5 ;
  wire \M0[87]_6 ;
  wire M0_0_sn_1;
  wire M0_11_sn_1;
  wire M0_16_sn_1;
  wire M0_17_sn_1;
  wire M0_1_sn_1;
  wire M0_28_sn_1;
  wire M0_29_sn_1;
  wire M0_33_sn_1;
  wire M0_37_sn_1;
  wire M0_42_sn_1;
  wire M0_45_sn_1;
  wire M0_49_sn_1;
  wire M0_53_sn_1;
  wire M0_58_sn_1;
  wire M0_60_sn_1;
  wire M0_66_sn_1;
  wire M0_67_sn_1;
  wire M0_69_sn_1;
  wire M0_73_sn_1;
  wire M0_7_sn_1;
  wire M0_85_sn_1;
  wire M0_87_sn_1;
  wire M0_97_sn_1;
  wire [0:0]M2;
  wire \M2[10]_INST_0_i_2 ;
  wire \M2[10]_INST_0_i_2_0 ;
  wire \M2[10]_INST_0_i_2_1 ;
  wire \M2[10]_INST_0_i_2_2 ;
  wire \M2[23]_INST_0_i_2 ;
  wire \M2[23]_INST_0_i_2_0 ;
  wire \M2[23]_INST_0_i_2_1 ;
  wire \M2[23]_INST_0_i_2_2 ;
  wire \M2[23]_INST_0_i_4 ;
  wire \M2[23]_INST_0_i_4_0 ;
  wire \M2[23]_INST_0_i_4_1 ;
  wire \M2[23]_INST_0_i_4_2 ;
  wire \M2[25]_INST_0_i_2 ;
  wire \M2[25]_INST_0_i_2_0 ;
  wire \M2[25]_INST_0_i_2_1 ;
  wire \M2[25]_INST_0_i_2_2 ;
  wire [7:0]sel;

  assign M0_0_sp_1 = M0_0_sn_1;
  assign M0_11_sp_1 = M0_11_sn_1;
  assign M0_16_sp_1 = M0_16_sn_1;
  assign M0_17_sp_1 = M0_17_sn_1;
  assign M0_1_sp_1 = M0_1_sn_1;
  assign M0_28_sp_1 = M0_28_sn_1;
  assign M0_29_sp_1 = M0_29_sn_1;
  assign M0_33_sp_1 = M0_33_sn_1;
  assign M0_37_sp_1 = M0_37_sn_1;
  assign M0_42_sp_1 = M0_42_sn_1;
  assign M0_45_sp_1 = M0_45_sn_1;
  assign M0_49_sp_1 = M0_49_sn_1;
  assign M0_53_sp_1 = M0_53_sn_1;
  assign M0_58_sp_1 = M0_58_sn_1;
  assign M0_60_sp_1 = M0_60_sn_1;
  assign M0_66_sp_1 = M0_66_sn_1;
  assign M0_67_sp_1 = M0_67_sn_1;
  assign M0_69_sp_1 = M0_69_sn_1;
  assign M0_73_sp_1 = M0_73_sn_1;
  assign M0_7_sp_1 = M0_7_sn_1;
  assign M0_85_sp_1 = M0_85_sn_1;
  assign M0_87_sp_1 = M0_87_sn_1;
  assign M0_97_sp_1 = M0_97_sn_1;
  layer0_N10 layer0_N10_inst
       (.M0({M0[63:62],M0[57:56],M0[29:28],M0[19:18]}),
        .sel(sel[5:4]));
  layer0_N12 layer0_N12_inst
       (.M0({M0[51:50],M0[31:30],M0[21:20],M0[5:4]}),
        .\M0[58] (M0_58_sn_1),
        .\M0[58]_0 (\M0[58]_0 ));
  layer0_N13 layer0_N13_inst
       (.M0({M0[57:56],M0[51:48],M0[37:36]}),
        .sel(sel[3:2]));
  layer0_N14 layer0_N14_inst
       (.M0({M0[75:74],M0[69:66],M0[31:30]}),
        .\M0[37] (M0_37_sn_1),
        .\M0[37]_0 (\M0[37]_0 ));
  layer0_N15 layer0_N15_inst
       (.M0({M0[69:68],M0[59:58],M0[49:48],M0[27:26]}),
        .\M0[33] (M0_33_sn_1),
        .\M0[33]_0 (\M0[33]_0 ));
  layer0_N16 layer0_N16_inst
       (.M0({M0[95:94],M0[79:78],M0[71:70],M0[11]}),
        .\M0[118] (\M0[118] ),
        .\M0[97] (M0_97_sn_1));
  layer0_N17 layer0_N17_inst
       (.M0({M0[89:88],M0[57:56],M0[37:36],M0[17:16]}),
        .\M0[42] (M0_42_sn_1),
        .\M0[42]_0 (\M0[42]_0 ));
  layer0_N19 layer0_N19_inst
       (.M0({M0[83:82],M0[55:54],M0[47:44]}),
        .\M0[53] (M0_53_sn_1),
        .\M0[67] (\M0[67]_1 ));
  layer0_N1 layer0_N1_inst
       (.M0(M0[7:6]),
        .\M0[7] (M0_7_sn_1),
        .\M0[7]_0 (\M0[7]_0 ),
        .\M2[23]_INST_0_i_2_0 (\M2[23]_INST_0_i_2 ),
        .\M2[23]_INST_0_i_2_1 (\M2[23]_INST_0_i_2_0 ),
        .\M2[23]_INST_0_i_2_2 (\M2[23]_INST_0_i_2_1 ),
        .\M2[23]_INST_0_i_2_3 (\M2[23]_INST_0_i_2_2 ),
        .\M2[23]_INST_0_i_4_0 (\M2[23]_INST_0_i_4 ),
        .\M2[23]_INST_0_i_4_1 (\M2[23]_INST_0_i_4_0 ),
        .\M2[23]_INST_0_i_4_2 (\M2[23]_INST_0_i_4_1 ),
        .\M2[23]_INST_0_i_4_3 (\M2[23]_INST_0_i_4_2 ));
  layer0_N20 layer0_N20_inst
       (.M0({M0[87:86],M0[73:72],M0[43:42],M0[37:36]}),
        .\M0[107] (\M0[107] ),
        .\M0[42] (\M0[42]_1 ));
  layer0_N21 layer0_N21_inst
       (.M0({M0[51:50],M0[25:24],M0[19:18],M0[3:2]}),
        .\M0[28] (\M0[28]_1 ),
        .\M0[29] (M0_29_sn_1));
  layer0_N22 layer0_N22_inst
       (.M0({M0[93:90],M0[63:62],M0[43:42]}),
        .\M0[49] (M0_49_sn_1),
        .\M0[49]_0 (\M0[49]_0 ));
  layer0_N23 layer0_N23_inst
       (.M0({M0[69:68],M0[57:56],M0[9:8],M0[1:0]}),
        .\M0[0]_0 (\M0[0]_0 ),
        .M0_0_sp_1(M0_0_sn_1));
  layer0_N24 layer0_N24_inst
       (.M0({M0[83:82],M0[77:76],M0[61:60],M0[39:38]}),
        .\M0[73] (\M0[73]_0 ),
        .\M0[73]_0 (M0_73_sn_1),
        .M2(M2),
        .\M2[17] (M0_28_sn_1),
        .\M2[17]_0 (\M0[28]_0 ));
  layer0_N25 layer0_N25_inst
       (.M0({M0[53:52],M0[41:40],M0[23:22],M0[1:0]}),
        .\M0[60] (M0_60_sn_1),
        .\M0[60]_0 (\M0[60]_0 ));
  layer0_N26 layer0_N26_inst
       (.M0({M0[81:80],M0[37:36],M0[33:32],M0[25:24]}),
        .\M0[28] (\M0[28]_0 ),
        .\M0[28]_0 (M0_28_sn_1));
  layer0_N28 layer0_N28_inst
       (.M0({M0[67:66],M0[61:60],M0[45:44],M0[11:10]}),
        .\M0[11] (M0_11_sn_1),
        .\M0[11]_0 (\M0[11]_0 ));
  layer0_N29 layer0_N29_inst
       (.M0({M0[71:70],M0[47:46],M0[15:14]}),
        .\M0[87] (M0_87_sn_1),
        .\M0[87]_0 (\M0[87]_0 ),
        .\M0[87]_1 (\M0[87]_1 ),
        .\M0[87]_2 (\M0[87]_2 ),
        .\M0[87]_3 (\M0[87]_3 ),
        .\M0[87]_4 (\M0[87]_4 ),
        .\M0[87]_5 (\M0[87]_5 ),
        .\M0[87]_6 (\M0[87]_6 ),
        .\M2[5]_INST_0_i_3 (M0_73_sn_1),
        .\M2[5]_INST_0_i_3_0 (\M0[73]_0 ));
  layer0_N2 layer0_N2_inst
       (.M0({M0[57:54],M0[27:26],M0[7:6]}),
        .\M0[66] (M0_66_sn_1),
        .\M0[67] (M0_67_sn_1));
  layer0_N30 layer0_N30_inst
       (.M0({M0[73:72],M0[51:50],M0[45:44],M0[39:38]}),
        .sel(sel[1:0]));
  layer0_N31 layer0_N31_inst
       (.M0({M0[101:100],M0[75:74],M0[69:68],M0[9:8]}),
        .\M0[85] (M0_85_sn_1),
        .\M0[85]_0 (\M0[85]_0 ));
  layer0_N3 layer0_N3_inst
       (.M0(M0[39:38]),
        .\M0[45] (M0_45_sn_1),
        .\M0[45]_0 (\M0[45]_0 ),
        .\M2[10]_INST_0_i_2_0 (\M2[10]_INST_0_i_2 ),
        .\M2[10]_INST_0_i_2_1 (\M2[10]_INST_0_i_2_0 ),
        .\M2[10]_INST_0_i_2_2 (\M2[10]_INST_0_i_2_1 ),
        .\M2[10]_INST_0_i_2_3 (\M2[10]_INST_0_i_2_2 ),
        .\M2[25]_INST_0_i_2_0 (\M2[25]_INST_0_i_2 ),
        .\M2[25]_INST_0_i_2_1 (\M2[25]_INST_0_i_2_0 ),
        .\M2[25]_INST_0_i_2_2 (\M2[25]_INST_0_i_2_1 ),
        .\M2[25]_INST_0_i_2_3 (\M2[25]_INST_0_i_2_2 ));
  layer0_N5 layer0_N5_inst
       (.M0({M0[97:96],M0[35:34],M0[13:12],M0[1:0]}),
        .\M0[120] (\M0[120] ),
        .M0_1_sp_1(M0_1_sn_1));
  layer0_N6 layer0_N6_inst
       (.M0({M0[89:88],M0[17:16],M0[9:8],M0[5:4]}),
        .sel(sel[7:6]));
  layer0_N7 layer0_N7_inst
       (.M0({M0[95:94],M0[65:64],M0[15:14],M0[11:10]}),
        .\M0[16] (M0_16_sn_1),
        .\M0[17] (M0_17_sn_1));
  layer0_N8 layer0_N8_inst
       (.M0({M0[99:98],M0[57:54],M0[29:28]}),
        .\M0[67] (\M0[67]_0 ),
        .\M0[69] (M0_69_sn_1));
  layer0_N9 layer0_N9_inst
       (.M0({M0[97:96],M0[89:88],M0[85:84],M0[47:46]}),
        .\M0[109] (\M0[109] ),
        .\M0[120] (\M0[120]_0 ));
endmodule

module layer0_N1
   (\M0[7] ,
    \M0[7]_0 ,
    M0,
    \M2[23]_INST_0_i_4_0 ,
    \M2[23]_INST_0_i_4_1 ,
    \M2[23]_INST_0_i_4_2 ,
    \M2[23]_INST_0_i_4_3 ,
    \M2[23]_INST_0_i_2_0 ,
    \M2[23]_INST_0_i_2_1 ,
    \M2[23]_INST_0_i_2_2 ,
    \M2[23]_INST_0_i_2_3 );
  output \M0[7] ;
  output \M0[7]_0 ;
  input [1:0]M0;
  input \M2[23]_INST_0_i_4_0 ;
  input \M2[23]_INST_0_i_4_1 ;
  input \M2[23]_INST_0_i_4_2 ;
  input \M2[23]_INST_0_i_4_3 ;
  input \M2[23]_INST_0_i_2_0 ;
  input \M2[23]_INST_0_i_2_1 ;
  input \M2[23]_INST_0_i_2_2 ;
  input \M2[23]_INST_0_i_2_3 ;

  wire [1:0]M0;
  wire \M0[7] ;
  wire \M0[7]_0 ;
  wire \M2[23]_INST_0_i_11_n_0 ;
  wire \M2[23]_INST_0_i_12_n_0 ;
  wire \M2[23]_INST_0_i_2_0 ;
  wire \M2[23]_INST_0_i_2_1 ;
  wire \M2[23]_INST_0_i_2_2 ;
  wire \M2[23]_INST_0_i_2_3 ;
  wire \M2[23]_INST_0_i_4_0 ;
  wire \M2[23]_INST_0_i_4_1 ;
  wire \M2[23]_INST_0_i_4_2 ;
  wire \M2[23]_INST_0_i_4_3 ;
  wire \M2[23]_INST_0_i_6_n_0 ;
  wire \M2[23]_INST_0_i_7_n_0 ;

  MUXF7 \M2[23]_INST_0_i_11 
       (.I0(\M2[23]_INST_0_i_4_0 ),
        .I1(\M2[23]_INST_0_i_4_1 ),
        .O(\M2[23]_INST_0_i_11_n_0 ),
        .S(M0[0]));
  MUXF7 \M2[23]_INST_0_i_12 
       (.I0(\M2[23]_INST_0_i_4_2 ),
        .I1(\M2[23]_INST_0_i_4_3 ),
        .O(\M2[23]_INST_0_i_12_n_0 ),
        .S(M0[0]));
  MUXF8 \M2[23]_INST_0_i_2 
       (.I0(\M2[23]_INST_0_i_6_n_0 ),
        .I1(\M2[23]_INST_0_i_7_n_0 ),
        .O(\M0[7]_0 ),
        .S(M0[1]));
  MUXF8 \M2[23]_INST_0_i_4 
       (.I0(\M2[23]_INST_0_i_11_n_0 ),
        .I1(\M2[23]_INST_0_i_12_n_0 ),
        .O(\M0[7] ),
        .S(M0[1]));
  MUXF7 \M2[23]_INST_0_i_6 
       (.I0(\M2[23]_INST_0_i_2_0 ),
        .I1(\M2[23]_INST_0_i_2_1 ),
        .O(\M2[23]_INST_0_i_6_n_0 ),
        .S(M0[0]));
  MUXF7 \M2[23]_INST_0_i_7 
       (.I0(\M2[23]_INST_0_i_2_2 ),
        .I1(\M2[23]_INST_0_i_2_3 ),
        .O(\M2[23]_INST_0_i_7_n_0 ),
        .S(M0[0]));
endmodule

module layer0_N10
   (sel,
    M0);
  output [1:0]sel;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M2[31]_INST_0_i_10_n_0 ;
  wire \M2[31]_INST_0_i_11_n_0 ;
  wire \M2[31]_INST_0_i_12_n_0 ;
  wire \M2[31]_INST_0_i_13_n_0 ;
  wire \M2[31]_INST_0_i_14_n_0 ;
  wire \M2[31]_INST_0_i_15_n_0 ;
  wire \M2[31]_INST_0_i_16_n_0 ;
  wire [1:0]sel;

  LUT4 #(
    .INIT(16'h1777)) 
    \M2[31]_INST_0_i_10 
       (.I0(M0[7]),
        .I1(M0[3]),
        .I2(M0[2]),
        .I3(M0[6]),
        .O(\M2[31]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F0F7F7FFFFFFF)) 
    \M2[31]_INST_0_i_11 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[3]),
        .I3(M0[2]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[31]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h050F0F5F1FFFFFFF)) 
    \M2[31]_INST_0_i_12 
       (.I0(M0[4]),
        .I1(M0[0]),
        .I2(M0[3]),
        .I3(M0[2]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[31]_INST_0_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h57FF)) 
    \M2[31]_INST_0_i_13 
       (.I0(M0[3]),
        .I1(M0[2]),
        .I2(M0[6]),
        .I3(M0[7]),
        .O(\M2[31]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h001F0FFF0FFF0FFF)) 
    \M2[31]_INST_0_i_14 
       (.I0(M0[4]),
        .I1(M0[0]),
        .I2(M0[7]),
        .I3(M0[3]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[31]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h070F0FFFFFFFFFFF)) 
    \M2[31]_INST_0_i_15 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[3]),
        .I3(M0[2]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[31]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h030F0F3F5FFFFFFF)) 
    \M2[31]_INST_0_i_16 
       (.I0(M0[4]),
        .I1(M0[0]),
        .I2(M0[3]),
        .I3(M0[2]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[31]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \M2[31]_INST_0_i_2 
       (.I0(\M2[31]_INST_0_i_10_n_0 ),
        .I1(\M2[31]_INST_0_i_11_n_0 ),
        .I2(M0[1]),
        .I3(\M2[31]_INST_0_i_12_n_0 ),
        .I4(M0[5]),
        .I5(\M2[31]_INST_0_i_13_n_0 ),
        .O(sel[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \M2[31]_INST_0_i_4 
       (.I0(\M2[31]_INST_0_i_14_n_0 ),
        .I1(\M2[31]_INST_0_i_15_n_0 ),
        .I2(M0[1]),
        .I3(\M2[31]_INST_0_i_16_n_0 ),
        .I4(M0[5]),
        .I5(\M2[31]_INST_0_i_13_n_0 ),
        .O(sel[0]));
endmodule

module layer0_N12
   (\M0[58] ,
    \M0[58]_0 ,
    M0);
  output \M0[58] ;
  output \M0[58]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[58] ;
  wire \M0[58]_0 ;
  wire \M2[21]_INST_0_i_14_n_0 ;
  wire \M2[21]_INST_0_i_15_n_0 ;
  wire \M2[21]_INST_0_i_16_n_0 ;
  wire \M2[21]_INST_0_i_24_n_0 ;
  wire \M2[21]_INST_0_i_25_n_0 ;
  wire \M2[21]_INST_0_i_26_n_0 ;

  LUT6 #(
    .INIT(64'h000055771557FFFF)) 
    \M2[21]_INST_0_i_14 
       (.I0(M0[0]),
        .I1(M0[3]),
        .I2(M0[2]),
        .I3(M0[4]),
        .I4(M0[7]),
        .I5(M0[5]),
        .O(\M2[21]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h5F7FFFFFFFFFFFFF)) 
    \M2[21]_INST_0_i_15 
       (.I0(M0[4]),
        .I1(M0[3]),
        .I2(M0[7]),
        .I3(M0[2]),
        .I4(M0[5]),
        .I5(M0[0]),
        .O(\M2[21]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h017F15FF77FFFFFF)) 
    \M2[21]_INST_0_i_16 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[3]),
        .I5(M0[5]),
        .O(\M2[21]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h0017017F17FF17FF)) 
    \M2[21]_INST_0_i_24 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[3]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[5]),
        .O(\M2[21]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7FFFFFFFFFFF)) 
    \M2[21]_INST_0_i_25 
       (.I0(M0[5]),
        .I1(M0[3]),
        .I2(M0[7]),
        .I3(M0[2]),
        .I4(M0[4]),
        .I5(M0[0]),
        .O(\M2[21]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h001F3FFF0FFFFFFF)) 
    \M2[21]_INST_0_i_26 
       (.I0(M0[2]),
        .I1(M0[3]),
        .I2(M0[0]),
        .I3(M0[5]),
        .I4(M0[7]),
        .I5(M0[4]),
        .O(\M2[21]_INST_0_i_26_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \M2[21]_INST_0_i_4 
       (.I0(\M2[21]_INST_0_i_14_n_0 ),
        .I1(\M2[21]_INST_0_i_15_n_0 ),
        .I2(M0[6]),
        .I3(\M2[21]_INST_0_i_16_n_0 ),
        .I4(M0[1]),
        .O(\M0[58]_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \M2[21]_INST_0_i_9 
       (.I0(\M2[21]_INST_0_i_24_n_0 ),
        .I1(\M2[21]_INST_0_i_25_n_0 ),
        .I2(M0[6]),
        .I3(\M2[21]_INST_0_i_26_n_0 ),
        .I4(M0[1]),
        .O(\M0[58] ));
endmodule

module layer0_N13
   (sel,
    M0);
  output [1:0]sel;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M2[31]_INST_0_i_22_n_0 ;
  wire \M2[31]_INST_0_i_23_n_0 ;
  wire [1:0]sel;

  LUT6 #(
    .INIT(64'h077F1FFF1FFF7FFF)) 
    \M2[31]_INST_0_i_22 
       (.I0(M0[4]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[5]),
        .I4(M0[6]),
        .I5(M0[3]),
        .O(\M2[31]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h003C113D013D3D3D)) 
    \M2[31]_INST_0_i_23 
       (.I0(M0[4]),
        .I1(M0[1]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[6]),
        .I5(M0[3]),
        .O(\M2[31]_INST_0_i_23_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \M2[31]_INST_0_i_8 
       (.I0(\M2[31]_INST_0_i_22_n_0 ),
        .I1(\M2[31]_INST_0_i_23_n_0 ),
        .O(sel[0]));
  LUT6 #(
    .INIT(64'hAAABAAABAAABABAB)) 
    \M2[31]_INST_0_i_9 
       (.I0(\M2[31]_INST_0_i_22_n_0 ),
        .I1(M0[1]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[6]),
        .I5(M0[3]),
        .O(sel[1]));
endmodule

module layer0_N14
   (\M0[37] ,
    \M0[37]_0 ,
    M0);
  output \M0[37] ;
  output \M0[37]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[37] ;
  wire \M0[37]_0 ;
  wire \M2[13]_INST_0_i_7_n_0 ;
  wire \M2[13]_INST_0_i_8_n_0 ;
  wire \M2[3]_INST_0_i_8_n_0 ;

  LUT4 #(
    .INIT(16'hB8F3)) 
    \M2[13]_INST_0_i_3 
       (.I0(\M2[13]_INST_0_i_7_n_0 ),
        .I1(M0[1]),
        .I2(\M2[13]_INST_0_i_8_n_0 ),
        .I3(M0[3]),
        .O(\M0[37]_0 ));
  LUT6 #(
    .INIT(64'h0011011311371377)) 
    \M2[13]_INST_0_i_7 
       (.I0(M0[2]),
        .I1(M0[0]),
        .I2(M0[4]),
        .I3(M0[5]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[13]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h5F7FFFFFFFFFFFFF)) 
    \M2[13]_INST_0_i_8 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(M0[7]),
        .I5(M0[2]),
        .O(\M2[13]_INST_0_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hB8F3)) 
    \M2[3]_INST_0_i_3 
       (.I0(\M2[3]_INST_0_i_8_n_0 ),
        .I1(M0[1]),
        .I2(\M2[13]_INST_0_i_8_n_0 ),
        .I3(M0[3]),
        .O(\M0[37] ));
  LUT6 #(
    .INIT(64'h0011011511571577)) 
    \M2[3]_INST_0_i_8 
       (.I0(M0[2]),
        .I1(M0[0]),
        .I2(M0[4]),
        .I3(M0[5]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[3]_INST_0_i_8_n_0 ));
endmodule

module layer0_N15
   (\M0[33] ,
    \M0[33]_0 ,
    M0);
  output \M0[33] ;
  output \M0[33]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[33] ;
  wire \M0[33]_0 ;
  wire \M2[1]_INST_0_i_5_n_0 ;
  wire \M2[1]_INST_0_i_6_n_0 ;
  wire \M2[23]_INST_0_i_10_n_0 ;
  wire \M2[23]_INST_0_i_8_n_0 ;
  wire \M2[23]_INST_0_i_9_n_0 ;

  LUT4 #(
    .INIT(16'hE2FF)) 
    \M2[1]_INST_0_i_3 
       (.I0(\M2[1]_INST_0_i_5_n_0 ),
        .I1(M0[1]),
        .I2(\M2[1]_INST_0_i_6_n_0 ),
        .I3(M0[5]),
        .O(\M0[33]_0 ));
  LUT6 #(
    .INIT(64'h000000003200FFFF)) 
    \M2[1]_INST_0_i_5 
       (.I0(M0[2]),
        .I1(M0[6]),
        .I2(M0[3]),
        .I3(M0[0]),
        .I4(M0[4]),
        .I5(M0[7]),
        .O(\M2[1]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000EA00FFFFFF)) 
    \M2[1]_INST_0_i_6 
       (.I0(M0[0]),
        .I1(M0[3]),
        .I2(M0[2]),
        .I3(M0[4]),
        .I4(M0[6]),
        .I5(M0[7]),
        .O(\M2[1]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFBFFF)) 
    \M2[23]_INST_0_i_10 
       (.I0(M0[0]),
        .I1(M0[6]),
        .I2(M0[4]),
        .I3(M0[7]),
        .I4(M0[3]),
        .I5(M0[1]),
        .O(\M2[23]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \M2[23]_INST_0_i_3 
       (.I0(\M2[23]_INST_0_i_8_n_0 ),
        .I1(M0[1]),
        .I2(\M2[23]_INST_0_i_9_n_0 ),
        .I3(M0[5]),
        .I4(\M2[23]_INST_0_i_10_n_0 ),
        .O(\M0[33] ));
  LUT6 #(
    .INIT(64'h00000B040F0EFFFF)) 
    \M2[23]_INST_0_i_8 
       (.I0(M0[0]),
        .I1(M0[2]),
        .I2(M0[6]),
        .I3(M0[3]),
        .I4(M0[4]),
        .I5(M0[7]),
        .O(\M2[23]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h000008000B04FFFF)) 
    \M2[23]_INST_0_i_9 
       (.I0(M0[2]),
        .I1(M0[0]),
        .I2(M0[6]),
        .I3(M0[3]),
        .I4(M0[4]),
        .I5(M0[7]),
        .O(\M2[23]_INST_0_i_9_n_0 ));
endmodule

module layer0_N16
   (\M0[118] ,
    \M0[97] ,
    M0);
  output \M0[118] ;
  output \M0[97] ;
  input [6:0]M0;

  wire [6:0]M0;
  wire \M0[118] ;
  wire \M0[97] ;
  wire \M2[19]_INST_0_i_9_n_0 ;

  LUT4 #(
    .INIT(16'h8880)) 
    \M2[19]_INST_0_i_1 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[3]),
        .I3(M0[5]),
        .O(\M0[97] ));
  LUT5 #(
    .INIT(32'hFFFFE000)) 
    \M2[19]_INST_0_i_5 
       (.I0(M0[5]),
        .I1(M0[3]),
        .I2(M0[6]),
        .I3(M0[4]),
        .I4(\M2[19]_INST_0_i_9_n_0 ),
        .O(\M0[118] ));
  LUT6 #(
    .INIT(64'h2000200000002000)) 
    \M2[19]_INST_0_i_9 
       (.I0(M0[4]),
        .I1(M0[2]),
        .I2(M0[5]),
        .I3(M0[3]),
        .I4(M0[1]),
        .I5(M0[0]),
        .O(\M2[19]_INST_0_i_9_n_0 ));
endmodule

module layer0_N17
   (\M0[42] ,
    \M0[42]_0 ,
    M0);
  output \M0[42] ;
  output \M0[42]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[42] ;
  wire \M0[42]_0 ;
  wire \M2[13]_INST_0_i_6_n_0 ;
  wire \M2[13]_INST_0_i_9_n_0 ;

  LUT3 #(
    .INIT(8'h4F)) 
    \M2[13]_INST_0_i_2 
       (.I0(M0[2]),
        .I1(\M2[13]_INST_0_i_6_n_0 ),
        .I2(M0[3]),
        .O(\M0[42] ));
  LUT3 #(
    .INIT(8'h4F)) 
    \M2[13]_INST_0_i_5 
       (.I0(M0[2]),
        .I1(\M2[13]_INST_0_i_9_n_0 ),
        .I2(M0[3]),
        .O(\M0[42]_0 ));
  LUT6 #(
    .INIT(64'hE080E080F0C0F8C0)) 
    \M2[13]_INST_0_i_6 
       (.I0(M0[6]),
        .I1(M0[7]),
        .I2(M0[1]),
        .I3(M0[0]),
        .I4(M0[4]),
        .I5(M0[5]),
        .O(\M2[13]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hDCCD484C40484040)) 
    \M2[13]_INST_0_i_9 
       (.I0(M0[5]),
        .I1(M0[1]),
        .I2(M0[6]),
        .I3(M0[4]),
        .I4(M0[0]),
        .I5(M0[7]),
        .O(\M2[13]_INST_0_i_9_n_0 ));
endmodule

module layer0_N19
   (\M0[53] ,
    \M0[67] ,
    M0);
  output \M0[53] ;
  output \M0[67] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[53] ;
  wire \M0[67] ;
  wire \M2[28]_INST_0_i_5_n_0 ;
  wire \M2[28]_INST_0_i_6_n_0 ;
  wire \M2[28]_INST_0_i_7_n_0 ;
  wire \M2[29]_INST_0_i_14_n_0 ;
  wire \M2[29]_INST_0_i_15_n_0 ;
  wire \M2[29]_INST_0_i_16_n_0 ;

  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \M2[28]_INST_0_i_1 
       (.I0(\M2[28]_INST_0_i_5_n_0 ),
        .I1(M0[5]),
        .I2(\M2[28]_INST_0_i_6_n_0 ),
        .I3(M0[1]),
        .I4(\M2[28]_INST_0_i_7_n_0 ),
        .O(\M0[67] ));
  LUT6 #(
    .INIT(64'h00170177017713FF)) 
    \M2[28]_INST_0_i_5 
       (.I0(M0[3]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[6]),
        .O(\M2[28]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1F7F7FFFFFFFFFFF)) 
    \M2[28]_INST_0_i_6 
       (.I0(M0[3]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[0]),
        .I4(M0[6]),
        .I5(M0[4]),
        .O(\M2[28]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h377F7FFFFFFFFFFF)) 
    \M2[28]_INST_0_i_7 
       (.I0(M0[4]),
        .I1(M0[7]),
        .I2(M0[0]),
        .I3(M0[6]),
        .I4(M0[3]),
        .I5(M0[5]),
        .O(\M2[28]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00110177017F15FF)) 
    \M2[29]_INST_0_i_14 
       (.I0(M0[3]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[6]),
        .O(\M2[29]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h377F7FFFFFFFFFFF)) 
    \M2[29]_INST_0_i_15 
       (.I0(M0[2]),
        .I1(M0[7]),
        .I2(M0[0]),
        .I3(M0[6]),
        .I4(M0[4]),
        .I5(M0[3]),
        .O(\M2[29]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h175F5F7F7FFFFFFF)) 
    \M2[29]_INST_0_i_16 
       (.I0(M0[3]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[0]),
        .I4(M0[6]),
        .I5(M0[4]),
        .O(\M2[29]_INST_0_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \M2[29]_INST_0_i_7 
       (.I0(\M2[29]_INST_0_i_14_n_0 ),
        .I1(\M2[29]_INST_0_i_15_n_0 ),
        .I2(M0[1]),
        .I3(\M2[29]_INST_0_i_16_n_0 ),
        .I4(M0[5]),
        .O(\M0[53] ));
endmodule

module layer0_N2
   (\M0[67] ,
    \M0[66] ,
    M0);
  output \M0[67] ;
  output \M0[66] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[66] ;
  wire \M0[67] ;
  wire \M2[9]_INST_0_i_4_n_0 ;
  wire \M2[9]_INST_0_i_5_n_0 ;
  wire \M2[9]_INST_0_i_6_n_0 ;
  wire \M2[9]_INST_0_i_7_n_0 ;
  wire \M2[9]_INST_0_i_8_n_0 ;
  wire \M2[9]_INST_0_i_9_n_0 ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \M2[9]_INST_0_i_2 
       (.I0(\M2[9]_INST_0_i_4_n_0 ),
        .I1(\M2[9]_INST_0_i_5_n_0 ),
        .I2(M0[5]),
        .I3(\M2[9]_INST_0_i_6_n_0 ),
        .I4(M0[4]),
        .I5(\M2[9]_INST_0_i_7_n_0 ),
        .O(\M0[67] ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \M2[9]_INST_0_i_3 
       (.I0(\M2[9]_INST_0_i_8_n_0 ),
        .I1(M0[4]),
        .I2(\M2[9]_INST_0_i_6_n_0 ),
        .I3(M0[5]),
        .I4(\M2[9]_INST_0_i_9_n_0 ),
        .O(\M0[66] ));
  LUT6 #(
    .INIT(64'h3333BFFF03333FBF)) 
    \M2[9]_INST_0_i_4 
       (.I0(M0[0]),
        .I1(M0[3]),
        .I2(M0[6]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[9]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h405555FF55FDDDFF)) 
    \M2[9]_INST_0_i_5 
       (.I0(M0[3]),
        .I1(M0[1]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[9]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h333BBFFF03333FFF)) 
    \M2[9]_INST_0_i_6 
       (.I0(M0[0]),
        .I1(M0[3]),
        .I2(M0[6]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[9]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h5D5F5FDF4D5F5F5F)) 
    \M2[9]_INST_0_i_7 
       (.I0(M0[3]),
        .I1(M0[1]),
        .I2(M0[7]),
        .I3(M0[2]),
        .I4(M0[6]),
        .I5(M0[0]),
        .O(\M2[9]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h405555FF55FDD5FF)) 
    \M2[9]_INST_0_i_8 
       (.I0(M0[3]),
        .I1(M0[1]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[9]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h333FBFFF03333FFF)) 
    \M2[9]_INST_0_i_9 
       (.I0(M0[0]),
        .I1(M0[3]),
        .I2(M0[6]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[9]_INST_0_i_9_n_0 ));
endmodule

module layer0_N20
   (\M0[107] ,
    \M0[42] ,
    M0);
  output \M0[107] ;
  output \M0[42] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[107] ;
  wire \M0[42] ;
  wire \M2[25]_INST_0_i_10_n_0 ;
  wire \M2[25]_INST_0_i_9_n_0 ;

  LUT3 #(
    .INIT(8'h8C)) 
    \M2[24]_INST_0_i_2 
       (.I0(M0[0]),
        .I1(M0[1]),
        .I2(M0[5]),
        .O(\M0[42] ));
  LUT6 #(
    .INIT(64'h3F000000FFBF0000)) 
    \M2[25]_INST_0_i_10 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[2]),
        .I3(M0[0]),
        .I4(M0[1]),
        .I5(M0[5]),
        .O(\M2[25]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \M2[25]_INST_0_i_5 
       (.I0(\M2[25]_INST_0_i_9_n_0 ),
        .I1(M0[7]),
        .I2(\M2[25]_INST_0_i_10_n_0 ),
        .I3(M0[4]),
        .I4(\M0[42] ),
        .O(\M0[107] ));
  LUT6 #(
    .INIT(64'hFFFF03FF000B0000)) 
    \M2[25]_INST_0_i_9 
       (.I0(M0[6]),
        .I1(M0[2]),
        .I2(M0[3]),
        .I3(M0[5]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[25]_INST_0_i_9_n_0 ));
endmodule

module layer0_N21
   (\M0[29] ,
    \M0[28] ,
    M0);
  output \M0[29] ;
  output \M0[28] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[28] ;
  wire \M0[29] ;
  wire \M2[15]_INST_0_i_7_n_0 ;
  wire \M2[15]_INST_0_i_8_n_0 ;
  wire \M2[23]_INST_0_i_13_n_0 ;
  wire \M2[23]_INST_0_i_14_n_0 ;

  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \M2[15]_INST_0_i_3 
       (.I0(M0[4]),
        .I1(\M2[15]_INST_0_i_7_n_0 ),
        .I2(M0[0]),
        .I3(\M2[15]_INST_0_i_8_n_0 ),
        .I4(M0[7]),
        .I5(M0[5]),
        .O(\M0[28] ));
  LUT6 #(
    .INIT(64'h00017F7F00000000)) 
    \M2[15]_INST_0_i_7 
       (.I0(M0[3]),
        .I1(M0[6]),
        .I2(M0[1]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[5]),
        .O(\M2[15]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \M2[15]_INST_0_i_8 
       (.I0(M0[1]),
        .I1(M0[5]),
        .I2(M0[6]),
        .O(\M2[15]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0A0F0F6F00000000)) 
    \M2[23]_INST_0_i_13 
       (.I0(M0[3]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[1]),
        .I4(M0[6]),
        .I5(M0[5]),
        .O(\M2[23]_INST_0_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h017F0000)) 
    \M2[23]_INST_0_i_14 
       (.I0(M0[3]),
        .I1(M0[1]),
        .I2(M0[6]),
        .I3(M0[7]),
        .I4(M0[5]),
        .O(\M2[23]_INST_0_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \M2[23]_INST_0_i_5 
       (.I0(M0[5]),
        .I1(M0[4]),
        .I2(\M2[23]_INST_0_i_13_n_0 ),
        .I3(M0[0]),
        .I4(\M2[23]_INST_0_i_14_n_0 ),
        .O(\M0[29] ));
endmodule

module layer0_N22
   (\M0[49] ,
    \M0[49]_0 ,
    M0);
  output \M0[49] ;
  output \M0[49]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[49] ;
  wire \M0[49]_0 ;
  wire \M2[21]_INST_0_i_17_n_0 ;
  wire \M2[21]_INST_0_i_18_n_0 ;
  wire \M2[21]_INST_0_i_19_n_0 ;
  wire \M2[21]_INST_0_i_20_n_0 ;
  wire \M2[21]_INST_0_i_21_n_0 ;

  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \M2[21]_INST_0_i_17 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[3]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[5]),
        .O(\M2[21]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hF777700070000000)) 
    \M2[21]_INST_0_i_18 
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[6]),
        .I3(M0[2]),
        .I4(M0[3]),
        .I5(M0[7]),
        .O(\M2[21]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFEEFEEEFFFFFFFF)) 
    \M2[21]_INST_0_i_19 
       (.I0(M0[7]),
        .I1(M0[3]),
        .I2(M0[2]),
        .I3(M0[6]),
        .I4(M0[4]),
        .I5(M0[5]),
        .O(\M2[21]_INST_0_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFF5511051100000)) 
    \M2[21]_INST_0_i_20 
       (.I0(M0[5]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[6]),
        .I4(M0[3]),
        .I5(M0[7]),
        .O(\M2[21]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFF4FFFFFFFD)) 
    \M2[21]_INST_0_i_21 
       (.I0(M0[5]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[3]),
        .I4(M0[6]),
        .I5(M0[4]),
        .O(\M2[21]_INST_0_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \M2[21]_INST_0_i_6 
       (.I0(\M2[21]_INST_0_i_17_n_0 ),
        .I1(\M2[21]_INST_0_i_18_n_0 ),
        .I2(M0[1]),
        .I3(\M2[21]_INST_0_i_19_n_0 ),
        .I4(M0[0]),
        .O(\M0[49] ));
  LUT4 #(
    .INIT(16'h30BB)) 
    \M2[21]_INST_0_i_7 
       (.I0(\M2[21]_INST_0_i_20_n_0 ),
        .I1(M0[1]),
        .I2(\M2[21]_INST_0_i_21_n_0 ),
        .I3(M0[0]),
        .O(\M0[49]_0 ));
endmodule

module layer0_N23
   (M0_0_sp_1,
    \M0[0]_0 ,
    M0);
  output M0_0_sp_1;
  output \M0[0]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[0]_0 ;
  wire M0_0_sn_1;
  wire \M2[25]_INST_0_i_8_n_0 ;
  wire \M2[7]_INST_0_i_10_n_0 ;

  assign M0_0_sp_1 = M0_0_sn_1;
  LUT3 #(
    .INIT(8'h4F)) 
    \M2[25]_INST_0_i_4 
       (.I0(M0[0]),
        .I1(\M2[25]_INST_0_i_8_n_0 ),
        .I2(M0[1]),
        .O(\M0[0]_0 ));
  LUT6 #(
    .INIT(64'hD4D0FDCCC040FCC4)) 
    \M2[25]_INST_0_i_8 
       (.I0(M0[5]),
        .I1(M0[3]),
        .I2(M0[7]),
        .I3(M0[2]),
        .I4(M0[4]),
        .I5(M0[6]),
        .O(\M2[25]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hEEFFAAEE88AA0008)) 
    \M2[7]_INST_0_i_10 
       (.I0(M0[7]),
        .I1(M0[6]),
        .I2(M0[4]),
        .I3(M0[5]),
        .I4(M0[2]),
        .I5(M0[3]),
        .O(\M2[7]_INST_0_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \M2[7]_INST_0_i_4 
       (.I0(M0[0]),
        .I1(\M2[7]_INST_0_i_10_n_0 ),
        .I2(M0[1]),
        .O(M0_0_sn_1));
endmodule

module layer0_N24
   (M2,
    \M0[73] ,
    \M0[73]_0 ,
    \M2[17] ,
    \M2[17]_0 ,
    M0);
  output [0:0]M2;
  output \M0[73] ;
  output \M0[73]_0 ;
  input \M2[17] ;
  input \M2[17]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[73] ;
  wire \M0[73]_0 ;
  wire [0:0]M2;
  wire \M2[17] ;
  wire \M2[17]_0 ;
  wire \M2[17]_INST_0_i_11_n_0 ;
  wire \M2[17]_INST_0_i_12_n_0 ;
  wire \M2[17]_INST_0_i_13_n_0 ;
  wire \M2[17]_INST_0_i_5_n_0 ;
  wire \M2[17]_INST_0_i_6_n_0 ;
  wire \M2[17]_INST_0_i_7_n_0 ;

  LUT4 #(
    .INIT(16'h0111)) 
    \M2[17]_INST_0 
       (.I0(\M0[73] ),
        .I1(\M2[17] ),
        .I2(\M0[73]_0 ),
        .I3(\M2[17]_0 ),
        .O(M2));
  LUT5 #(
    .INIT(32'hFEAACC00)) 
    \M2[17]_INST_0_i_1 
       (.I0(\M2[17]_INST_0_i_5_n_0 ),
        .I1(\M2[17]_INST_0_i_6_n_0 ),
        .I2(\M2[17]_INST_0_i_7_n_0 ),
        .I3(M0[3]),
        .I4(M0[1]),
        .O(\M0[73] ));
  LUT6 #(
    .INIT(64'h20F0000000000000)) 
    \M2[17]_INST_0_i_11 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[5]),
        .I5(M0[2]),
        .O(\M2[17]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h30000000F0202000)) 
    \M2[17]_INST_0_i_12 
       (.I0(M0[4]),
        .I1(M0[7]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[17]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFBAFBB0FFFBFBB2)) 
    \M2[17]_INST_0_i_13 
       (.I0(M0[0]),
        .I1(M0[7]),
        .I2(M0[2]),
        .I3(M0[5]),
        .I4(M0[4]),
        .I5(M0[6]),
        .O(\M2[17]_INST_0_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFEAACC00)) 
    \M2[17]_INST_0_i_3 
       (.I0(\M2[17]_INST_0_i_11_n_0 ),
        .I1(\M2[17]_INST_0_i_12_n_0 ),
        .I2(\M2[17]_INST_0_i_13_n_0 ),
        .I3(M0[3]),
        .I4(M0[1]),
        .O(\M0[73]_0 ));
  LUT6 #(
    .INIT(64'h2B00000000000000)) 
    \M2[17]_INST_0_i_5 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[7]),
        .I3(M0[0]),
        .I4(M0[2]),
        .I5(M0[5]),
        .O(\M2[17]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hC0000000F0404000)) 
    \M2[17]_INST_0_i_6 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[0]),
        .I4(M0[5]),
        .I5(M0[7]),
        .O(\M2[17]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFFFF4C0FFF0)) 
    \M2[17]_INST_0_i_7 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[5]),
        .I4(M0[7]),
        .I5(M0[0]),
        .O(\M2[17]_INST_0_i_7_n_0 ));
endmodule

module layer0_N25
   (\M0[60] ,
    \M0[60]_0 ,
    M0);
  output \M0[60] ;
  output \M0[60]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[60] ;
  wire \M0[60]_0 ;
  wire \M2[21]_INST_0_i_11_n_0 ;
  wire \M2[21]_INST_0_i_12_n_0 ;
  wire \M2[21]_INST_0_i_13_n_0 ;
  wire \M2[21]_INST_0_i_27_n_0 ;
  wire \M2[21]_INST_0_i_28_n_0 ;

  LUT6 #(
    .INIT(64'hFF08000800000000)) 
    \M2[21]_INST_0_i_10 
       (.I0(M0[6]),
        .I1(\M2[21]_INST_0_i_27_n_0 ),
        .I2(M0[1]),
        .I3(M0[5]),
        .I4(\M2[21]_INST_0_i_28_n_0 ),
        .I5(M0[7]),
        .O(\M0[60] ));
  LUT6 #(
    .INIT(64'hFFCFCF4C4C040400)) 
    \M2[21]_INST_0_i_11 
       (.I0(M0[0]),
        .I1(M0[6]),
        .I2(M0[1]),
        .I3(M0[2]),
        .I4(M0[4]),
        .I5(M0[3]),
        .O(\M2[21]_INST_0_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h40D40000)) 
    \M2[21]_INST_0_i_12 
       (.I0(M0[1]),
        .I1(M0[2]),
        .I2(M0[4]),
        .I3(M0[0]),
        .I4(M0[3]),
        .O(\M2[21]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    \M2[21]_INST_0_i_13 
       (.I0(M0[1]),
        .I1(M0[0]),
        .I2(M0[4]),
        .I3(M0[2]),
        .I4(M0[3]),
        .I5(M0[6]),
        .O(\M2[21]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAFFAA00C000C000)) 
    \M2[21]_INST_0_i_2 
       (.I0(\M2[21]_INST_0_i_11_n_0 ),
        .I1(\M2[21]_INST_0_i_12_n_0 ),
        .I2(M0[6]),
        .I3(M0[7]),
        .I4(\M2[21]_INST_0_i_13_n_0 ),
        .I5(M0[5]),
        .O(\M0[60]_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \M2[21]_INST_0_i_27 
       (.I0(M0[2]),
        .I1(M0[4]),
        .I2(M0[3]),
        .O(\M2[21]_INST_0_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hBAA2FBB220002200)) 
    \M2[21]_INST_0_i_28 
       (.I0(M0[6]),
        .I1(M0[1]),
        .I2(M0[2]),
        .I3(M0[4]),
        .I4(M0[0]),
        .I5(M0[3]),
        .O(\M2[21]_INST_0_i_28_n_0 ));
endmodule

module layer0_N26
   (\M0[28] ,
    \M0[28]_0 ,
    M0);
  output \M0[28] ;
  output \M0[28]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[28] ;
  wire \M0[28]_0 ;
  wire \M2[17]_INST_0_i_10_n_0 ;
  wire \M2[17]_INST_0_i_14_n_0 ;
  wire \M2[17]_INST_0_i_15_n_0 ;
  wire \M2[17]_INST_0_i_16_n_0 ;
  wire \M2[17]_INST_0_i_8_n_0 ;
  wire \M2[17]_INST_0_i_9_n_0 ;

  LUT6 #(
    .INIT(64'h4000F44000004000)) 
    \M2[17]_INST_0_i_10 
       (.I0(M0[6]),
        .I1(M0[2]),
        .I2(M0[3]),
        .I3(M0[5]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[17]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hB0FB20B200B00000)) 
    \M2[17]_INST_0_i_14 
       (.I0(M0[2]),
        .I1(M0[6]),
        .I2(M0[1]),
        .I3(M0[7]),
        .I4(M0[5]),
        .I5(M0[3]),
        .O(\M2[17]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hB0FB00B200B00000)) 
    \M2[17]_INST_0_i_15 
       (.I0(M0[2]),
        .I1(M0[6]),
        .I2(M0[1]),
        .I3(M0[7]),
        .I4(M0[5]),
        .I5(M0[3]),
        .O(\M2[17]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h08EF000800080000)) 
    \M2[17]_INST_0_i_16 
       (.I0(M0[2]),
        .I1(M0[5]),
        .I2(M0[6]),
        .I3(M0[7]),
        .I4(M0[3]),
        .I5(M0[1]),
        .O(\M2[17]_INST_0_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hB8F3B8C0)) 
    \M2[17]_INST_0_i_2 
       (.I0(\M2[17]_INST_0_i_8_n_0 ),
        .I1(M0[0]),
        .I2(\M2[17]_INST_0_i_9_n_0 ),
        .I3(M0[4]),
        .I4(\M2[17]_INST_0_i_10_n_0 ),
        .O(\M0[28]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \M2[17]_INST_0_i_4 
       (.I0(\M2[17]_INST_0_i_8_n_0 ),
        .I1(\M2[17]_INST_0_i_14_n_0 ),
        .I2(M0[0]),
        .I3(\M2[17]_INST_0_i_15_n_0 ),
        .I4(M0[4]),
        .I5(\M2[17]_INST_0_i_16_n_0 ),
        .O(\M0[28] ));
  LUT6 #(
    .INIT(64'hF4FF40F440F40040)) 
    \M2[17]_INST_0_i_8 
       (.I0(M0[6]),
        .I1(M0[2]),
        .I2(M0[1]),
        .I3(M0[7]),
        .I4(M0[5]),
        .I5(M0[3]),
        .O(\M2[17]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hB0FB00B000B00000)) 
    \M2[17]_INST_0_i_9 
       (.I0(M0[2]),
        .I1(M0[6]),
        .I2(M0[1]),
        .I3(M0[7]),
        .I4(M0[5]),
        .I5(M0[3]),
        .O(\M2[17]_INST_0_i_9_n_0 ));
endmodule

module layer0_N28
   (\M0[11] ,
    \M0[11]_0 ,
    M0);
  output \M0[11] ;
  output \M0[11]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[11] ;
  wire \M0[11]_0 ;
  wire \M2[21]_INST_0_i_22_n_0 ;
  wire \M2[21]_INST_0_i_23_n_0 ;
  wire \M2[7]_INST_0_i_7_n_0 ;
  wire \M2[7]_INST_0_i_8_n_0 ;
  wire \M2[7]_INST_0_i_9_n_0 ;

  LUT6 #(
    .INIT(64'h0000000F0F7F7FFF)) 
    \M2[21]_INST_0_i_22 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[5]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[3]),
        .O(\M2[21]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h0F5F5FFF1F7F5FFF)) 
    \M2[21]_INST_0_i_23 
       (.I0(M0[5]),
        .I1(M0[4]),
        .I2(M0[3]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[21]_INST_0_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFAFA0AFCFCFCFCF)) 
    \M2[21]_INST_0_i_8 
       (.I0(\M2[21]_INST_0_i_22_n_0 ),
        .I1(\M2[21]_INST_0_i_23_n_0 ),
        .I2(M0[1]),
        .I3(M0[5]),
        .I4(\M2[7]_INST_0_i_9_n_0 ),
        .I5(M0[0]),
        .O(\M0[11] ));
  LUT6 #(
    .INIT(64'hAFCFA0CFCFFFCF0F)) 
    \M2[7]_INST_0_i_2 
       (.I0(\M2[7]_INST_0_i_7_n_0 ),
        .I1(\M2[7]_INST_0_i_8_n_0 ),
        .I2(M0[1]),
        .I3(M0[5]),
        .I4(\M2[7]_INST_0_i_9_n_0 ),
        .I5(M0[0]),
        .O(\M0[11]_0 ));
  LUT5 #(
    .INIT(32'h0000077F)) 
    \M2[7]_INST_0_i_7 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[3]),
        .O(\M2[7]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h01177FFF)) 
    \M2[7]_INST_0_i_8 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[3]),
        .O(\M2[7]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h3FFF7FFF)) 
    \M2[7]_INST_0_i_9 
       (.I0(M0[4]),
        .I1(M0[3]),
        .I2(M0[7]),
        .I3(M0[2]),
        .I4(M0[6]),
        .O(\M2[7]_INST_0_i_9_n_0 ));
endmodule

module layer0_N29
   (\M0[87] ,
    \M0[87]_0 ,
    \M0[87]_1 ,
    \M0[87]_2 ,
    \M0[87]_3 ,
    \M0[87]_4 ,
    \M0[87]_5 ,
    \M0[87]_6 ,
    M0,
    \M2[5]_INST_0_i_3 ,
    \M2[5]_INST_0_i_3_0 );
  output \M0[87] ;
  output \M0[87]_0 ;
  output \M0[87]_1 ;
  output \M0[87]_2 ;
  output \M0[87]_3 ;
  output \M0[87]_4 ;
  output \M0[87]_5 ;
  output \M0[87]_6 ;
  input [5:0]M0;
  input \M2[5]_INST_0_i_3 ;
  input \M2[5]_INST_0_i_3_0 ;

  wire [5:0]M0;
  wire \M0[87] ;
  wire \M0[87]_0 ;
  wire \M0[87]_1 ;
  wire \M0[87]_2 ;
  wire \M0[87]_3 ;
  wire \M0[87]_4 ;
  wire \M0[87]_5 ;
  wire \M0[87]_6 ;
  wire \M1r/i__n_0 ;
  wire \M2[5]_INST_0_i_3 ;
  wire \M2[5]_INST_0_i_3_0 ;

  LUT6 #(
    .INIT(64'hE888888080000000)) 
    \M1r/i_ 
       (.I0(M0[5]),
        .I1(M0[1]),
        .I2(M0[2]),
        .I3(M0[0]),
        .I4(M0[4]),
        .I5(M0[3]),
        .O(\M1r/i__n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    g0_b0
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h54)) 
    g0_b1
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h74)) 
    g1_b0
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_1 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hD5)) 
    g1_b1
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_2 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT2 #(
    .INIT(4'hD)) 
    g2_b0
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .O(\M0[87]_3 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT2 #(
    .INIT(4'hD)) 
    g2_b1
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_4 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    g3_b0
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_5 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    g3_b1
       (.I0(\M1r/i__n_0 ),
        .I1(\M2[5]_INST_0_i_3 ),
        .I2(\M2[5]_INST_0_i_3_0 ),
        .O(\M0[87]_6 ));
endmodule

module layer0_N3
   (\M0[45] ,
    \M0[45]_0 ,
    M0,
    \M2[10]_INST_0_i_2_0 ,
    \M2[10]_INST_0_i_2_1 ,
    \M2[10]_INST_0_i_2_2 ,
    \M2[10]_INST_0_i_2_3 ,
    \M2[25]_INST_0_i_2_0 ,
    \M2[25]_INST_0_i_2_1 ,
    \M2[25]_INST_0_i_2_2 ,
    \M2[25]_INST_0_i_2_3 );
  output \M0[45] ;
  output \M0[45]_0 ;
  input [1:0]M0;
  input \M2[10]_INST_0_i_2_0 ;
  input \M2[10]_INST_0_i_2_1 ;
  input \M2[10]_INST_0_i_2_2 ;
  input \M2[10]_INST_0_i_2_3 ;
  input \M2[25]_INST_0_i_2_0 ;
  input \M2[25]_INST_0_i_2_1 ;
  input \M2[25]_INST_0_i_2_2 ;
  input \M2[25]_INST_0_i_2_3 ;

  wire [1:0]M0;
  wire \M0[45] ;
  wire \M0[45]_0 ;
  wire \M2[10]_INST_0_i_2_0 ;
  wire \M2[10]_INST_0_i_2_1 ;
  wire \M2[10]_INST_0_i_2_2 ;
  wire \M2[10]_INST_0_i_2_3 ;
  wire \M2[10]_INST_0_i_5_n_0 ;
  wire \M2[10]_INST_0_i_6_n_0 ;
  wire \M2[25]_INST_0_i_2_0 ;
  wire \M2[25]_INST_0_i_2_1 ;
  wire \M2[25]_INST_0_i_2_2 ;
  wire \M2[25]_INST_0_i_2_3 ;
  wire \M2[25]_INST_0_i_6_n_0 ;
  wire \M2[25]_INST_0_i_7_n_0 ;

  MUXF8 \M2[10]_INST_0_i_2 
       (.I0(\M2[10]_INST_0_i_5_n_0 ),
        .I1(\M2[10]_INST_0_i_6_n_0 ),
        .O(\M0[45] ),
        .S(M0[1]));
  MUXF7 \M2[10]_INST_0_i_5 
       (.I0(\M2[10]_INST_0_i_2_0 ),
        .I1(\M2[10]_INST_0_i_2_1 ),
        .O(\M2[10]_INST_0_i_5_n_0 ),
        .S(M0[0]));
  MUXF7 \M2[10]_INST_0_i_6 
       (.I0(\M2[10]_INST_0_i_2_2 ),
        .I1(\M2[10]_INST_0_i_2_3 ),
        .O(\M2[10]_INST_0_i_6_n_0 ),
        .S(M0[0]));
  MUXF8 \M2[25]_INST_0_i_2 
       (.I0(\M2[25]_INST_0_i_6_n_0 ),
        .I1(\M2[25]_INST_0_i_7_n_0 ),
        .O(\M0[45]_0 ),
        .S(M0[1]));
  MUXF7 \M2[25]_INST_0_i_6 
       (.I0(\M2[25]_INST_0_i_2_0 ),
        .I1(\M2[25]_INST_0_i_2_1 ),
        .O(\M2[25]_INST_0_i_6_n_0 ),
        .S(M0[0]));
  MUXF7 \M2[25]_INST_0_i_7 
       (.I0(\M2[25]_INST_0_i_2_2 ),
        .I1(\M2[25]_INST_0_i_2_3 ),
        .O(\M2[25]_INST_0_i_7_n_0 ),
        .S(M0[0]));
endmodule

module layer0_N30
   (sel,
    M0);
  output [1:0]sel;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M2[3]_INST_0_i_5_n_0 ;
  wire \M2[3]_INST_0_i_6_n_0 ;
  wire \M2[3]_INST_0_i_7_n_0 ;
  wire \M2[7]_INST_0_i_11_n_0 ;
  wire \M2[7]_INST_0_i_12_n_0 ;
  wire \M2[7]_INST_0_i_13_n_0 ;
  wire [1:0]sel;

  LUT5 #(
    .INIT(32'hFECCAA00)) 
    \M2[3]_INST_0_i_1 
       (.I0(\M2[3]_INST_0_i_5_n_0 ),
        .I1(\M2[3]_INST_0_i_6_n_0 ),
        .I2(\M2[3]_INST_0_i_7_n_0 ),
        .I3(M0[5]),
        .I4(M0[3]),
        .O(sel[0]));
  LUT6 #(
    .INIT(64'h00C000D400C000F4)) 
    \M2[3]_INST_0_i_5 
       (.I0(M0[0]),
        .I1(M0[4]),
        .I2(M0[2]),
        .I3(M0[7]),
        .I4(M0[6]),
        .I5(M0[1]),
        .O(\M2[3]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h040400004DCF040C)) 
    \M2[3]_INST_0_i_6 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[1]),
        .I3(M0[0]),
        .I4(M0[2]),
        .I5(M0[7]),
        .O(\M2[3]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFF0CCFDFFF)) 
    \M2[3]_INST_0_i_7 
       (.I0(M0[0]),
        .I1(M0[2]),
        .I2(M0[1]),
        .I3(M0[6]),
        .I4(M0[7]),
        .I5(M0[4]),
        .O(\M2[3]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0400440045044D04)) 
    \M2[7]_INST_0_i_11 
       (.I0(M0[7]),
        .I1(M0[4]),
        .I2(M0[6]),
        .I3(M0[2]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[7]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h20A0AABA20A2BABA)) 
    \M2[7]_INST_0_i_12 
       (.I0(M0[5]),
        .I1(M0[6]),
        .I2(M0[4]),
        .I3(M0[1]),
        .I4(M0[7]),
        .I5(M0[0]),
        .O(\M2[7]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFF01FFFF7F007F15)) 
    \M2[7]_INST_0_i_13 
       (.I0(M0[6]),
        .I1(M0[0]),
        .I2(M0[1]),
        .I3(M0[5]),
        .I4(M0[7]),
        .I5(M0[4]),
        .O(\M2[7]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFF88888F8F88888)) 
    \M2[7]_INST_0_i_5 
       (.I0(M0[5]),
        .I1(\M2[7]_INST_0_i_11_n_0 ),
        .I2(\M2[7]_INST_0_i_12_n_0 ),
        .I3(\M2[7]_INST_0_i_13_n_0 ),
        .I4(M0[3]),
        .I5(M0[2]),
        .O(sel[1]));
endmodule

module layer0_N31
   (\M0[85] ,
    \M0[85]_0 ,
    M0);
  output \M0[85] ;
  output \M0[85]_0 ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[85] ;
  wire \M0[85]_0 ;
  wire \M2[27]_INST_0_i_10_n_0 ;
  wire \M2[27]_INST_0_i_11_n_0 ;
  wire \M2[27]_INST_0_i_12_n_0 ;
  wire \M2[27]_INST_0_i_13_n_0 ;
  wire \M2[27]_INST_0_i_14_n_0 ;
  wire \M2[27]_INST_0_i_9_n_0 ;

  LUT6 #(
    .INIT(64'h44004000DC404000)) 
    \M2[27]_INST_0_i_10 
       (.I0(M0[5]),
        .I1(M0[2]),
        .I2(M0[6]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[4]),
        .O(\M2[27]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFB2B3FBFBA0B2)) 
    \M2[27]_INST_0_i_11 
       (.I0(M0[7]),
        .I1(M0[5]),
        .I2(M0[0]),
        .I3(M0[4]),
        .I4(M0[2]),
        .I5(M0[6]),
        .O(\M2[27]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h008C000000000000)) 
    \M2[27]_INST_0_i_12 
       (.I0(M0[6]),
        .I1(M0[0]),
        .I2(M0[4]),
        .I3(M0[5]),
        .I4(M0[2]),
        .I5(M0[7]),
        .O(\M2[27]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h080000008E8C8808)) 
    \M2[27]_INST_0_i_13 
       (.I0(M0[7]),
        .I1(M0[2]),
        .I2(M0[4]),
        .I3(M0[6]),
        .I4(M0[0]),
        .I5(M0[5]),
        .O(\M2[27]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hEAFEA0E8FFFFFAFE)) 
    \M2[27]_INST_0_i_14 
       (.I0(M0[2]),
        .I1(M0[6]),
        .I2(M0[0]),
        .I3(M0[4]),
        .I4(M0[7]),
        .I5(M0[5]),
        .O(\M2[27]_INST_0_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hFEAACC00)) 
    \M2[27]_INST_0_i_4 
       (.I0(\M2[27]_INST_0_i_9_n_0 ),
        .I1(\M2[27]_INST_0_i_10_n_0 ),
        .I2(\M2[27]_INST_0_i_11_n_0 ),
        .I3(M0[3]),
        .I4(M0[1]),
        .O(\M0[85]_0 ));
  LUT5 #(
    .INIT(32'hFEAACC00)) 
    \M2[27]_INST_0_i_5 
       (.I0(\M2[27]_INST_0_i_12_n_0 ),
        .I1(\M2[27]_INST_0_i_13_n_0 ),
        .I2(\M2[27]_INST_0_i_14_n_0 ),
        .I3(M0[3]),
        .I4(M0[1]),
        .O(\M0[85] ));
  LUT6 #(
    .INIT(64'h4044004000400000)) 
    \M2[27]_INST_0_i_9 
       (.I0(M0[5]),
        .I1(M0[2]),
        .I2(M0[7]),
        .I3(M0[4]),
        .I4(M0[0]),
        .I5(M0[6]),
        .O(\M2[27]_INST_0_i_9_n_0 ));
endmodule

module layer0_N5
   (\M0[120] ,
    M0_1_sp_1,
    M0);
  output \M0[120] ;
  output M0_1_sp_1;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[120] ;
  wire M0_1_sn_1;
  wire \M2[29]_INST_0_i_12_n_0 ;
  wire \M2[29]_INST_0_i_13_n_0 ;
  wire \M2[5]_INST_0_i_4_n_0 ;
  wire \M2[5]_INST_0_i_5_n_0 ;
  wire \M2[5]_INST_0_i_6_n_0 ;

  assign M0_1_sp_1 = M0_1_sn_1;
  LUT6 #(
    .INIT(64'hFAA8A800EA808000)) 
    \M2[29]_INST_0_i_12 
       (.I0(M0[1]),
        .I1(M0[4]),
        .I2(M0[0]),
        .I3(M0[5]),
        .I4(M0[3]),
        .I5(M0[2]),
        .O(\M2[29]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hC080800000000000)) 
    \M2[29]_INST_0_i_13 
       (.I0(M0[2]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[4]),
        .I5(M0[1]),
        .O(\M2[29]_INST_0_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hB8C0)) 
    \M2[29]_INST_0_i_6 
       (.I0(\M2[29]_INST_0_i_12_n_0 ),
        .I1(M0[6]),
        .I2(\M2[29]_INST_0_i_13_n_0 ),
        .I3(M0[7]),
        .O(\M0[120] ));
  LUT6 #(
    .INIT(64'hAAFFAA00C000C000)) 
    \M2[5]_INST_0_i_1 
       (.I0(\M2[5]_INST_0_i_4_n_0 ),
        .I1(\M2[5]_INST_0_i_5_n_0 ),
        .I2(M0[1]),
        .I3(M0[6]),
        .I4(\M2[5]_INST_0_i_6_n_0 ),
        .I5(M0[7]),
        .O(M0_1_sn_1));
  LUT6 #(
    .INIT(64'hFEA8A800EA808000)) 
    \M2[5]_INST_0_i_4 
       (.I0(M0[1]),
        .I1(M0[4]),
        .I2(M0[0]),
        .I3(M0[5]),
        .I4(M0[3]),
        .I5(M0[2]),
        .O(\M2[5]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \M2[5]_INST_0_i_5 
       (.I0(M0[2]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[4]),
        .O(\M2[5]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hE880A000A0008000)) 
    \M2[5]_INST_0_i_6 
       (.I0(M0[1]),
        .I1(M0[2]),
        .I2(M0[3]),
        .I3(M0[5]),
        .I4(M0[0]),
        .I5(M0[4]),
        .O(\M2[5]_INST_0_i_6_n_0 ));
endmodule

module layer0_N6
   (sel,
    M0);
  output [1:0]sel;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M2[31]_INST_0_i_17_n_0 ;
  wire \M2[31]_INST_0_i_18_n_0 ;
  wire \M2[31]_INST_0_i_19_n_0 ;
  wire \M2[31]_INST_0_i_20_n_0 ;
  wire \M2[31]_INST_0_i_21_n_0 ;
  wire \M2[31]_INST_0_i_24_n_0 ;
  wire \M2[31]_INST_0_i_25_n_0 ;
  wire \M2[31]_INST_0_i_26_n_0 ;
  wire \M2[31]_INST_0_i_27_n_0 ;
  wire [1:0]sel;

  MUXF7 \M2[31]_INST_0_i_17 
       (.I0(\M2[31]_INST_0_i_24_n_0 ),
        .I1(\M2[31]_INST_0_i_25_n_0 ),
        .O(\M2[31]_INST_0_i_17_n_0 ),
        .S(M0[4]));
  MUXF7 \M2[31]_INST_0_i_18 
       (.I0(\M2[31]_INST_0_i_26_n_0 ),
        .I1(\M2[31]_INST_0_i_27_n_0 ),
        .O(\M2[31]_INST_0_i_18_n_0 ),
        .S(M0[4]));
  LUT6 #(
    .INIT(64'hDFFF4DDF04CF000C)) 
    \M2[31]_INST_0_i_19 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h4D04DF4D00000C00)) 
    \M2[31]_INST_0_i_20 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hCFFF0CCF004D0004)) 
    \M2[31]_INST_0_i_21 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h4DFF0CDF040D0004)) 
    \M2[31]_INST_0_i_24 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h4D04DF4F00000400)) 
    \M2[31]_INST_0_i_25 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF4DDF0C4D000C)) 
    \M2[31]_INST_0_i_26 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h4D0CFFDF04000C04)) 
    \M2[31]_INST_0_i_27 
       (.I0(M0[6]),
        .I1(M0[3]),
        .I2(M0[5]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[31]_INST_0_i_27_n_0 ));
  MUXF8 \M2[31]_INST_0_i_6 
       (.I0(\M2[31]_INST_0_i_17_n_0 ),
        .I1(\M2[31]_INST_0_i_18_n_0 ),
        .O(sel[0]),
        .S(M0[2]));
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \M2[31]_INST_0_i_7 
       (.I0(\M2[31]_INST_0_i_19_n_0 ),
        .I1(M0[2]),
        .I2(\M2[31]_INST_0_i_20_n_0 ),
        .I3(M0[4]),
        .I4(\M2[31]_INST_0_i_21_n_0 ),
        .O(sel[1]));
endmodule

module layer0_N7
   (\M0[17] ,
    \M0[16] ,
    M0);
  output \M0[17] ;
  output \M0[16] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[16] ;
  wire \M0[17] ;
  wire \M2[27]_INST_0_i_6_n_0 ;
  wire \M2[27]_INST_0_i_7_n_0 ;
  wire \M2[27]_INST_0_i_8_n_0 ;
  wire \M2[3]_INST_0_i_10_n_0 ;
  wire \M2[3]_INST_0_i_11_n_0 ;
  wire \M2[3]_INST_0_i_9_n_0 ;

  LUT5 #(
    .INIT(32'hFEAAEEAA)) 
    \M2[27]_INST_0_i_3 
       (.I0(\M2[27]_INST_0_i_6_n_0 ),
        .I1(\M2[27]_INST_0_i_7_n_0 ),
        .I2(\M2[27]_INST_0_i_8_n_0 ),
        .I3(M0[3]),
        .I4(M0[5]),
        .O(\M0[17] ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \M2[27]_INST_0_i_6 
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[6]),
        .I3(M0[7]),
        .I4(M0[1]),
        .I5(M0[2]),
        .O(\M2[27]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h7010F1307030F170)) 
    \M2[27]_INST_0_i_7 
       (.I0(M0[6]),
        .I1(M0[7]),
        .I2(M0[2]),
        .I3(M0[4]),
        .I4(M0[1]),
        .I5(M0[0]),
        .O(\M2[27]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFFCCDFCDFF)) 
    \M2[27]_INST_0_i_8 
       (.I0(M0[6]),
        .I1(M0[2]),
        .I2(M0[1]),
        .I3(M0[7]),
        .I4(M0[0]),
        .I5(M0[4]),
        .O(\M2[27]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h888A008888AA0888)) 
    \M2[3]_INST_0_i_10 
       (.I0(M0[3]),
        .I1(M0[5]),
        .I2(M0[6]),
        .I3(M0[7]),
        .I4(M0[2]),
        .I5(M0[1]),
        .O(\M2[3]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF777F0FFF0111)) 
    \M2[3]_INST_0_i_11 
       (.I0(M0[0]),
        .I1(M0[7]),
        .I2(M0[6]),
        .I3(M0[1]),
        .I4(M0[5]),
        .I5(M0[2]),
        .O(\M2[3]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFF8F8F8F8F8F8F8)) 
    \M2[3]_INST_0_i_4 
       (.I0(M0[2]),
        .I1(\M2[3]_INST_0_i_9_n_0 ),
        .I2(\M2[3]_INST_0_i_10_n_0 ),
        .I3(\M2[3]_INST_0_i_11_n_0 ),
        .I4(M0[3]),
        .I5(M0[4]),
        .O(\M0[16] ));
  LUT6 #(
    .INIT(64'h0000000017000000)) 
    \M2[3]_INST_0_i_9 
       (.I0(M0[1]),
        .I1(M0[6]),
        .I2(M0[0]),
        .I3(M0[5]),
        .I4(M0[4]),
        .I5(M0[7]),
        .O(\M2[3]_INST_0_i_9_n_0 ));
endmodule

module layer0_N8
   (\M0[67] ,
    \M0[69] ,
    M0);
  output \M0[67] ;
  output \M0[69] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[67] ;
  wire \M0[69] ;
  wire \M2[15]_INST_0_i_5_n_0 ;
  wire \M2[15]_INST_0_i_6_n_0 ;
  wire \M2[19]_INST_0_i_6_n_0 ;
  wire \M2[19]_INST_0_i_7_n_0 ;
  wire \M2[19]_INST_0_i_8_n_0 ;

  LUT4 #(
    .INIT(16'hE200)) 
    \M2[15]_INST_0_i_1 
       (.I0(\M2[15]_INST_0_i_5_n_0 ),
        .I1(M0[3]),
        .I2(\M2[15]_INST_0_i_6_n_0 ),
        .I3(M0[5]),
        .O(\M0[67] ));
  LUT6 #(
    .INIT(64'h000000002F0AAE2A)) 
    \M2[15]_INST_0_i_5 
       (.I0(M0[4]),
        .I1(M0[6]),
        .I2(M0[0]),
        .I3(M0[2]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[15]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h404454D4FFFFFFFF)) 
    \M2[15]_INST_0_i_6 
       (.I0(M0[0]),
        .I1(M0[2]),
        .I2(M0[4]),
        .I3(M0[6]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[15]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hA0AFA0A0C0C0C0C0)) 
    \M2[19]_INST_0_i_3 
       (.I0(\M2[19]_INST_0_i_6_n_0 ),
        .I1(\M2[19]_INST_0_i_7_n_0 ),
        .I2(M0[5]),
        .I3(M0[1]),
        .I4(\M2[19]_INST_0_i_8_n_0 ),
        .I5(M0[3]),
        .O(\M0[69] ));
  LUT4 #(
    .INIT(16'hF751)) 
    \M2[19]_INST_0_i_6 
       (.I0(M0[1]),
        .I1(M0[0]),
        .I2(M0[2]),
        .I3(M0[4]),
        .O(\M2[19]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000D0D0D0D4)) 
    \M2[19]_INST_0_i_7 
       (.I0(M0[0]),
        .I1(M0[2]),
        .I2(M0[4]),
        .I3(M0[6]),
        .I4(M0[7]),
        .I5(M0[1]),
        .O(\M2[19]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \M2[19]_INST_0_i_8 
       (.I0(M0[0]),
        .I1(M0[2]),
        .I2(M0[4]),
        .O(\M2[19]_INST_0_i_8_n_0 ));
endmodule

module layer0_N9
   (\M0[109] ,
    \M0[120] ,
    M0);
  output \M0[109] ;
  output \M0[120] ;
  input [7:0]M0;

  wire [7:0]M0;
  wire \M0[109] ;
  wire \M0[120] ;
  wire \M2[29]_INST_0_i_10_n_0 ;
  wire \M2[29]_INST_0_i_11_n_0 ;
  wire \M2[29]_INST_0_i_8_n_0 ;
  wire \M2[29]_INST_0_i_9_n_0 ;

  LUT5 #(
    .INIT(32'h80000000)) 
    \M2[29]_INST_0_i_10 
       (.I0(M0[4]),
        .I1(M0[1]),
        .I2(M0[0]),
        .I3(M0[7]),
        .I4(M0[2]),
        .O(\M2[29]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFCECCCCC)) 
    \M2[29]_INST_0_i_11 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[1]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[2]),
        .O(\M2[29]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAFFAA00CF00C000)) 
    \M2[29]_INST_0_i_4 
       (.I0(\M2[29]_INST_0_i_8_n_0 ),
        .I1(\M2[29]_INST_0_i_9_n_0 ),
        .I2(M0[6]),
        .I3(M0[5]),
        .I4(\M2[29]_INST_0_i_10_n_0 ),
        .I5(M0[3]),
        .O(\M0[120] ));
  LUT6 #(
    .INIT(64'hAFA0A0A0C0C0C0C0)) 
    \M2[29]_INST_0_i_5 
       (.I0(\M2[29]_INST_0_i_11_n_0 ),
        .I1(\M2[29]_INST_0_i_9_n_0 ),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(\M2[29]_INST_0_i_10_n_0 ),
        .I5(M0[3]),
        .O(\M0[109] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFCCCECCC)) 
    \M2[29]_INST_0_i_8 
       (.I0(M0[6]),
        .I1(M0[4]),
        .I2(M0[1]),
        .I3(M0[0]),
        .I4(M0[7]),
        .I5(M0[2]),
        .O(\M2[29]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hA8000000)) 
    \M2[29]_INST_0_i_9 
       (.I0(M0[4]),
        .I1(M0[7]),
        .I2(M0[0]),
        .I3(M0[1]),
        .I4(M0[2]),
        .O(\M2[29]_INST_0_i_9_n_0 ));
endmodule

module layer1
   (M2,
    \M0[126] ,
    \M0[126]_0 ,
    \M0[126]_1 ,
    \M0[126]_2 ,
    \M0[126]_3 ,
    \M0[126]_4 ,
    \M0[126]_5 ,
    \M0[126]_6 ,
    \M0[100] ,
    \M0[100]_0 ,
    \M0[100]_1 ,
    \M0[100]_2 ,
    \M0[100]_3 ,
    \M0[100]_4 ,
    \M0[100]_5 ,
    \M0[100]_6 ,
    M2_4_sp_1,
    M2_10_sp_1,
    M2_5_sp_1,
    \M2[5]_0 ,
    \M2[5]_1 ,
    \M2[5]_2 ,
    \M2[4]_0 ,
    \M2[4]_1 ,
    \M2[4]_2 ,
    \M2[4]_3 ,
    M2_16_sp_1,
    \M2[16]_0 ,
    \M2[16]_1 ,
    \M2[16]_2 ,
    M0,
    M2_13_sp_1,
    M2_0_sp_1,
    \M2[13]_0 ,
    M2_3_sp_1,
    M2_9_sp_1,
    \M2[13]_1 ,
    M2_22_sp_1,
    \M2[9]_0 ,
    \M2[3]_0 ,
    sel,
    M2_26_sp_1,
    M2_21_sp_1,
    \M2[3]_1 ,
    M2_7_sp_1,
    \M2[7]_0 ,
    \M2[7]_1 ,
    \M2[7]_2 ,
    M2_18_sp_1,
    \M2[18]_0 ,
    \M2[18]_1 ,
    \M2[18]_2 ,
    \M2[10]_0 ,
    \M2[10]_1 ,
    \M2[10]_2 ,
    \M2[10]_3 ,
    M2_15_sp_1,
    \M2[18]_3 ,
    \M2[15]_0 ,
    \M2[18]_4 ,
    \M2[22]_0 ,
    \M2[15]_1 ,
    M2_29_sp_1,
    \M2[29]_0 ,
    \M2[21]_0 ,
    \M2[21]_1 ,
    M2_24_sp_1,
    \M2[24]_0 ,
    M2_28_sp_1,
    \M2[29]_1 );
  output [30:0]M2;
  output \M0[126] ;
  output \M0[126]_0 ;
  output \M0[126]_1 ;
  output \M0[126]_2 ;
  output \M0[126]_3 ;
  output \M0[126]_4 ;
  output \M0[126]_5 ;
  output \M0[126]_6 ;
  output \M0[100] ;
  output \M0[100]_0 ;
  output \M0[100]_1 ;
  output \M0[100]_2 ;
  output \M0[100]_3 ;
  output \M0[100]_4 ;
  output \M0[100]_5 ;
  output \M0[100]_6 ;
  input M2_4_sp_1;
  input M2_10_sp_1;
  input M2_5_sp_1;
  input \M2[5]_0 ;
  input \M2[5]_1 ;
  input \M2[5]_2 ;
  input \M2[4]_0 ;
  input \M2[4]_1 ;
  input \M2[4]_2 ;
  input \M2[4]_3 ;
  input M2_16_sp_1;
  input \M2[16]_0 ;
  input \M2[16]_1 ;
  input \M2[16]_2 ;
  input [14:0]M0;
  input M2_13_sp_1;
  input M2_0_sp_1;
  input \M2[13]_0 ;
  input M2_3_sp_1;
  input M2_9_sp_1;
  input \M2[13]_1 ;
  input M2_22_sp_1;
  input \M2[9]_0 ;
  input \M2[3]_0 ;
  input [7:0]sel;
  input M2_26_sp_1;
  input M2_21_sp_1;
  input \M2[3]_1 ;
  input M2_7_sp_1;
  input \M2[7]_0 ;
  input \M2[7]_1 ;
  input \M2[7]_2 ;
  input M2_18_sp_1;
  input \M2[18]_0 ;
  input \M2[18]_1 ;
  input \M2[18]_2 ;
  input \M2[10]_0 ;
  input \M2[10]_1 ;
  input \M2[10]_2 ;
  input \M2[10]_3 ;
  input M2_15_sp_1;
  input \M2[18]_3 ;
  input \M2[15]_0 ;
  input \M2[18]_4 ;
  input \M2[22]_0 ;
  input \M2[15]_1 ;
  input M2_29_sp_1;
  input \M2[29]_0 ;
  input \M2[21]_0 ;
  input \M2[21]_1 ;
  input M2_24_sp_1;
  input \M2[24]_0 ;
  input M2_28_sp_1;
  input \M2[29]_1 ;

  wire [14:0]M0;
  wire \M0[100] ;
  wire \M0[100]_0 ;
  wire \M0[100]_1 ;
  wire \M0[100]_2 ;
  wire \M0[100]_3 ;
  wire \M0[100]_4 ;
  wire \M0[100]_5 ;
  wire \M0[100]_6 ;
  wire \M0[126] ;
  wire \M0[126]_0 ;
  wire \M0[126]_1 ;
  wire \M0[126]_2 ;
  wire \M0[126]_3 ;
  wire \M0[126]_4 ;
  wire \M0[126]_5 ;
  wire \M0[126]_6 ;
  wire [30:0]M2;
  wire \M2[10]_0 ;
  wire \M2[10]_1 ;
  wire \M2[10]_2 ;
  wire \M2[10]_3 ;
  wire \M2[13]_0 ;
  wire \M2[13]_1 ;
  wire \M2[15]_0 ;
  wire \M2[15]_1 ;
  wire \M2[16]_0 ;
  wire \M2[16]_1 ;
  wire \M2[16]_2 ;
  wire \M2[18]_0 ;
  wire \M2[18]_1 ;
  wire \M2[18]_2 ;
  wire \M2[18]_3 ;
  wire \M2[18]_4 ;
  wire \M2[21]_0 ;
  wire \M2[21]_1 ;
  wire \M2[22]_0 ;
  wire \M2[24]_0 ;
  wire \M2[29]_0 ;
  wire \M2[29]_1 ;
  wire \M2[3]_0 ;
  wire \M2[3]_1 ;
  wire \M2[4]_0 ;
  wire \M2[4]_1 ;
  wire \M2[4]_2 ;
  wire \M2[4]_3 ;
  wire \M2[5]_0 ;
  wire \M2[5]_1 ;
  wire \M2[5]_2 ;
  wire \M2[7]_0 ;
  wire \M2[7]_1 ;
  wire \M2[7]_2 ;
  wire \M2[9]_0 ;
  wire M2_0_sn_1;
  wire M2_10_sn_1;
  wire M2_13_sn_1;
  wire M2_15_sn_1;
  wire M2_16_sn_1;
  wire M2_18_sn_1;
  wire M2_21_sn_1;
  wire M2_22_sn_1;
  wire M2_24_sn_1;
  wire M2_26_sn_1;
  wire M2_28_sn_1;
  wire M2_29_sn_1;
  wire M2_3_sn_1;
  wire M2_4_sn_1;
  wire M2_5_sn_1;
  wire M2_7_sn_1;
  wire M2_9_sn_1;
  wire [7:0]sel;

  assign M2_0_sn_1 = M2_0_sp_1;
  assign M2_10_sn_1 = M2_10_sp_1;
  assign M2_13_sn_1 = M2_13_sp_1;
  assign M2_15_sn_1 = M2_15_sp_1;
  assign M2_16_sn_1 = M2_16_sp_1;
  assign M2_18_sn_1 = M2_18_sp_1;
  assign M2_21_sn_1 = M2_21_sp_1;
  assign M2_22_sn_1 = M2_22_sp_1;
  assign M2_24_sn_1 = M2_24_sp_1;
  assign M2_26_sn_1 = M2_26_sp_1;
  assign M2_28_sn_1 = M2_28_sp_1;
  assign M2_29_sn_1 = M2_29_sp_1;
  assign M2_3_sn_1 = M2_3_sp_1;
  assign M2_4_sn_1 = M2_4_sp_1;
  assign M2_5_sn_1 = M2_5_sp_1;
  assign M2_7_sn_1 = M2_7_sp_1;
  assign M2_9_sn_1 = M2_9_sp_1;
  layer1_N0 layer1_N0_inst
       (.M2(M2[1:0]),
        .\M2[0]_0 (M2_0_sn_1),
        .\M2[1]_0 (M2_3_sn_1),
        .\M2[1]_1 (M2_9_sn_1),
        .\M2[1]_2 (\M2[13]_1 ),
        .\M2[1]_3 (M2_22_sn_1),
        .\M2[1]_4 (\M2[9]_0 ),
        .M2_0_sp_1(M2_13_sn_1),
        .M2_1_sp_1(\M2[13]_0 ));
  layer1_N10 layer1_N10_inst
       (.M2(M2[20:19]),
        .\M2[21] (\M2[21]_0 ),
        .\M2[21]_0 (M2_21_sn_1),
        .\M2[21]_1 (\M2[10]_1 ),
        .\M2[21]_2 (M2_7_sn_1),
        .\M2[21]_3 (\M2[21]_1 ),
        .\M2[21]_4 (\M2[10]_2 ),
        .\M2[21]_5 (\M2[3]_1 ),
        .\M2[21]_6 (\M2[7]_1 ));
  layer1_N11 layer1_N11_inst
       (.M2(M2[22:21]),
        .\M2[22] (M2_29_sn_1),
        .\M2[22]_0 (\M2[22]_0 ),
        .\M2[22]_1 (\M2[29]_0 ),
        .\M2[22]_2 (M2_22_sn_1),
        .\M2[22]_3 (\M2[18]_4 ),
        .\M2[22]_4 (\M2[15]_1 ),
        .\M2[22]_5 (M2_0_sn_1),
        .\M2[22]_6 (\M2[15]_0 ));
  layer1_N12 layer1_N12_inst
       (.M0({M0[14:11],M0[8],M0[5:2]}),
        .\M0[126] (\M0[126] ),
        .\M0[126]_0 (\M0[126]_1 ),
        .\M0[126]_1 (\M0[126]_3 ),
        .\M0[126]_2 (\M0[126]_5 ),
        .M2(M2[24:23]),
        .\M2[24] (\M2[10]_0 ),
        .\M2[24]_0 (\M2[10]_3 ),
        .\M2[24]_1 (M2_4_sn_1),
        .\M2[24]_2 (M2_10_sn_1),
        .\M2[24]_3 (\M2[7]_2 ),
        .\M2[24]_4 (M2_24_sn_1),
        .\M2[24]_5 (\M2[7]_0 ),
        .\M2[24]_6 (\M2[24]_0 ));
  layer1_N13 layer1_N13_inst
       (.M2(M2[26:25]),
        .\M2[26] (M2_26_sn_1),
        .\M2[26]_0 (M2_18_sn_1),
        .\M2[26]_1 (M2_10_sn_1),
        .\M2[26]_2 (\M2[18]_0 ),
        .\M2[26]_3 (M2_4_sn_1),
        .\M2[26]_4 (\M2[3]_0 ),
        .sel(sel[5:4]));
  layer1_N14 layer1_N14_inst
       (.M2(M2[28:27]),
        .\M2[28] (M2_28_sn_1),
        .\M2[29] (M2_29_sn_1),
        .\M2[29]_0 (\M2[18]_3 ),
        .\M2[29]_1 (\M2[29]_1 ),
        .\M2[29]_2 (M2_15_sn_1),
        .\M2[29]_3 (\M2[29]_0 ),
        .\M2[29]_4 (M2_10_sn_1),
        .\M2[29]_5 (M2_4_sn_1));
  layer1_N15 layer1_N15_inst
       (.M2(M2[30:29]),
        .sel(sel));
  layer1_N1 layer1_N1_inst
       (.M2(M2[3:2]),
        .\M2[3] (\M2[13]_0 ),
        .\M2[3]_0 (\M2[3]_0 ),
        .\M2[3]_1 (M2_3_sn_1),
        .\M2[3]_2 (M2_26_sn_1),
        .\M2[3]_3 (M2_21_sn_1),
        .\M2[3]_4 (\M2[3]_1 ),
        .sel(sel[1:0]));
  layer1_N2 layer1_N2_inst
       (.M2(M2[5:4]),
        .\M2[4] (M2_4_sn_1),
        .\M2[4]_0 (M2_10_sn_1),
        .\M2[4]_1 (\M2[4]_0 ),
        .\M2[4]_2 (\M2[4]_1 ),
        .\M2[4]_3 (\M2[4]_2 ),
        .\M2[4]_4 (\M2[4]_3 ),
        .\M2[5] (M2_5_sn_1),
        .\M2[5]_0 (\M2[5]_0 ),
        .\M2[5]_1 (\M2[5]_1 ),
        .\M2[5]_2 (\M2[5]_2 ));
  layer1_N3 layer1_N3_inst
       (.M2(M2[7:6]),
        .\M2[7] (M2_7_sn_1),
        .\M2[7]_0 (\M2[7]_0 ),
        .\M2[7]_1 (\M2[7]_1 ),
        .\M2[7]_2 (\M2[7]_2 ),
        .sel({sel[7:6],sel[1:0]}));
  layer1_N4 layer1_N4_inst
       (.M2(M2[9:8]),
        .\M2[9] (M2_16_sn_1),
        .\M2[9]_0 (\M2[16]_0 ),
        .\M2[9]_1 (M2_18_sn_1),
        .\M2[9]_2 (\M2[18]_0 ),
        .\M2[9]_3 (\M2[9]_0 ),
        .\M2[9]_4 (\M2[18]_1 ),
        .\M2[9]_5 (\M2[18]_2 ),
        .\M2[9]_6 (M2_9_sn_1));
  layer1_N5 layer1_N5_inst
       (.M2(M2[11:10]),
        .\M2[10] (\M2[10]_0 ),
        .\M2[10]_0 (\M2[16]_0 ),
        .\M2[10]_1 (M2_10_sn_1),
        .\M2[10]_2 (\M2[10]_1 ),
        .\M2[10]_3 (M2_16_sn_1),
        .\M2[10]_4 (\M2[10]_2 ),
        .\M2[10]_5 (\M2[10]_3 ),
        .\M2[10]_6 (M2_4_sn_1));
  layer1_N6 layer1_N6_inst
       (.M0({M0[14:11],M0[5:4]}),
        .\M0[126] (\M0[126]_0 ),
        .\M0[126]_0 (\M0[126]_2 ),
        .\M0[126]_1 (\M0[126]_4 ),
        .\M0[126]_2 (\M0[126]_6 ),
        .M2(M2[13:12]),
        .\M2[12] (\M2[10]_3 ),
        .\M2[13] (M2_13_sn_1),
        .\M2[13]_0 (\M2[13]_0 ),
        .\M2[13]_1 (M2_3_sn_1),
        .\M2[13]_2 (\M2[13]_1 ),
        .\M2[13]_3 (\M2[18]_0 ),
        .\M2[13]_4 (\M2[10]_0 ),
        .\M2[13]_5 (M2_18_sn_1));
  layer1_N7 layer1_N7_inst
       (.M0({M0[10:9],M0[7:6],M0[1:0]}),
        .\M0[100] (\M0[100] ),
        .\M0[100]_0 (\M0[100]_0 ),
        .\M0[100]_1 (\M0[100]_1 ),
        .\M0[100]_2 (\M0[100]_2 ),
        .\M0[100]_3 (\M0[100]_3 ),
        .\M0[100]_4 (\M0[100]_4 ),
        .\M0[100]_5 (\M0[100]_5 ),
        .\M0[100]_6 (\M0[100]_6 ),
        .M2(M2[15:14]),
        .\M2[15] (M2_15_sn_1),
        .\M2[15]_0 (\M2[18]_3 ),
        .\M2[15]_1 (\M2[15]_0 ),
        .\M2[15]_2 (\M2[18]_4 ),
        .\M2[15]_3 (\M2[22]_0 ),
        .\M2[15]_4 (\M2[15]_1 ),
        .\M2[15]_5 (M2_29_sn_1),
        .\M2[15]_6 (\M2[29]_0 ));
  layer1_N8 layer1_N8_inst
       (.M2(M2[16]),
        .\M2[16] (M2_16_sn_1),
        .\M2[16]_0 (\M2[16]_0 ),
        .\M2[16]_1 (\M2[16]_1 ),
        .\M2[16]_2 (\M2[16]_2 ));
  layer1_N9 layer1_N9_inst
       (.M2(M2[18:17]),
        .\M2[18] (\M2[18]_2 ),
        .\M2[18]_0 (\M2[18]_3 ),
        .\M2[18]_1 (\M2[18]_0 ),
        .\M2[18]_2 (\M2[22]_0 ),
        .\M2[18]_3 (M2_15_sn_1),
        .\M2[18]_4 (\M2[18]_1 ),
        .\M2[18]_5 (\M2[18]_4 ),
        .\M2[18]_6 (M2_18_sn_1));
endmodule

module layer1_N0
   (M2,
    M2_0_sp_1,
    \M2[0]_0 ,
    M2_1_sp_1,
    \M2[1]_0 ,
    \M2[1]_1 ,
    \M2[1]_2 ,
    \M2[1]_3 ,
    \M2[1]_4 );
  output [1:0]M2;
  input M2_0_sp_1;
  input \M2[0]_0 ;
  input M2_1_sp_1;
  input \M2[1]_0 ;
  input \M2[1]_1 ;
  input \M2[1]_2 ;
  input \M2[1]_3 ;
  input \M2[1]_4 ;

  wire [1:0]M2;
  wire \M2[0]_0 ;
  wire \M2[0]_INST_0_i_1_n_0 ;
  wire \M2[0]_INST_0_i_2_n_0 ;
  wire \M2[0]_INST_0_i_3_n_0 ;
  wire \M2[1]_0 ;
  wire \M2[1]_1 ;
  wire \M2[1]_2 ;
  wire \M2[1]_3 ;
  wire \M2[1]_4 ;
  wire \M2[1]_INST_0_i_1_n_0 ;
  wire \M2[1]_INST_0_i_2_n_0 ;
  wire \M2[1]_INST_0_i_4_n_0 ;
  wire M2_0_sn_1;
  wire M2_1_sn_1;

  assign M2_0_sn_1 = M2_0_sp_1;
  assign M2_1_sn_1 = M2_1_sp_1;
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \M2[0]_INST_0 
       (.I0(\M2[0]_INST_0_i_1_n_0 ),
        .I1(M2_0_sn_1),
        .I2(\M2[0]_INST_0_i_2_n_0 ),
        .I3(\M2[0]_0 ),
        .I4(\M2[0]_INST_0_i_3_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hFF8F8F08FF3F7FF7)) 
    \M2[0]_INST_0_i_1 
       (.I0(\M2[1]_0 ),
        .I1(M2_1_sn_1),
        .I2(\M2[1]_1 ),
        .I3(\M2[1]_2 ),
        .I4(\M2[1]_3 ),
        .I5(\M2[1]_4 ),
        .O(\M2[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFAF0AFF1F1F51)) 
    \M2[0]_INST_0_i_2 
       (.I0(M2_1_sn_1),
        .I1(\M2[1]_0 ),
        .I2(\M2[1]_1 ),
        .I3(\M2[1]_2 ),
        .I4(\M2[1]_3 ),
        .I5(\M2[1]_4 ),
        .O(\M2[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C00000073070700)) 
    \M2[0]_INST_0_i_3 
       (.I0(\M2[1]_0 ),
        .I1(M2_1_sn_1),
        .I2(\M2[1]_1 ),
        .I3(\M2[1]_2 ),
        .I4(\M2[1]_3 ),
        .I5(\M2[1]_4 ),
        .O(\M2[0]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \M2[1]_INST_0 
       (.I0(\M2[1]_INST_0_i_1_n_0 ),
        .I1(M2_0_sn_1),
        .I2(\M2[1]_INST_0_i_2_n_0 ),
        .I3(\M2[0]_0 ),
        .I4(\M2[1]_INST_0_i_4_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFF7FFF7FFF007F)) 
    \M2[1]_INST_0_i_1 
       (.I0(\M2[1]_4 ),
        .I1(\M2[1]_0 ),
        .I2(M2_1_sn_1),
        .I3(\M2[1]_1 ),
        .I4(\M2[1]_2 ),
        .I5(\M2[1]_3 ),
        .O(\M2[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF37FF77FF0077)) 
    \M2[1]_INST_0_i_2 
       (.I0(M2_1_sn_1),
        .I1(\M2[1]_4 ),
        .I2(\M2[1]_0 ),
        .I3(\M2[1]_1 ),
        .I4(\M2[1]_2 ),
        .I5(\M2[1]_3 ),
        .O(\M2[1]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h07000000)) 
    \M2[1]_INST_0_i_4 
       (.I0(\M2[1]_4 ),
        .I1(M2_1_sn_1),
        .I2(\M2[1]_1 ),
        .I3(\M2[1]_2 ),
        .I4(\M2[1]_3 ),
        .O(\M2[1]_INST_0_i_4_n_0 ));
endmodule

module layer1_N1
   (M2,
    \M2[3] ,
    \M2[3]_0 ,
    \M2[3]_1 ,
    sel,
    \M2[3]_2 ,
    \M2[3]_3 ,
    \M2[3]_4 );
  output [1:0]M2;
  input \M2[3] ;
  input \M2[3]_0 ;
  input \M2[3]_1 ;
  input [1:0]sel;
  input \M2[3]_2 ;
  input \M2[3]_3 ;
  input \M2[3]_4 ;

  wire [1:0]M2;
  wire \M2[3] ;
  wire \M2[3]_0 ;
  wire \M2[3]_1 ;
  wire \M2[3]_2 ;
  wire \M2[3]_3 ;
  wire \M2[3]_4 ;
  wire \M2[3]_INST_0_i_2_n_0 ;
  wire [1:0]sel;

  LUT6 #(
    .INIT(64'h0000FFFF0000A8FF)) 
    \M2[2]_INST_0 
       (.I0(\M2[3] ),
        .I1(\M2[3]_0 ),
        .I2(\M2[3]_1 ),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(\M2[3]_INST_0_i_2_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'h0000000057575777)) 
    \M2[3]_INST_0 
       (.I0(sel[0]),
        .I1(\M2[3]_INST_0_i_2_n_0 ),
        .I2(\M2[3] ),
        .I3(\M2[3]_1 ),
        .I4(\M2[3]_0 ),
        .I5(sel[1]),
        .O(M2[1]));
  LUT3 #(
    .INIT(8'hFE)) 
    \M2[3]_INST_0_i_2 
       (.I0(\M2[3]_2 ),
        .I1(\M2[3]_3 ),
        .I2(\M2[3]_4 ),
        .O(\M2[3]_INST_0_i_2_n_0 ));
endmodule

module layer1_N10
   (M2,
    \M2[21] ,
    \M2[21]_0 ,
    \M2[21]_1 ,
    \M2[21]_2 ,
    \M2[21]_3 ,
    \M2[21]_4 ,
    \M2[21]_5 ,
    \M2[21]_6 );
  output [1:0]M2;
  input \M2[21] ;
  input \M2[21]_0 ;
  input \M2[21]_1 ;
  input \M2[21]_2 ;
  input \M2[21]_3 ;
  input \M2[21]_4 ;
  input \M2[21]_5 ;
  input \M2[21]_6 ;

  wire [1:0]M2;
  wire \M2[20]_INST_0_i_1_n_0 ;
  wire \M2[20]_INST_0_i_2_n_0 ;
  wire \M2[20]_INST_0_i_3_n_0 ;
  wire \M2[20]_INST_0_i_4_n_0 ;
  wire \M2[20]_INST_0_i_5_n_0 ;
  wire \M2[20]_INST_0_i_6_n_0 ;
  wire \M2[21] ;
  wire \M2[21]_0 ;
  wire \M2[21]_1 ;
  wire \M2[21]_2 ;
  wire \M2[21]_3 ;
  wire \M2[21]_4 ;
  wire \M2[21]_5 ;
  wire \M2[21]_6 ;
  wire \M2[21]_INST_0_i_1_n_0 ;
  wire \M2[21]_INST_0_i_3_n_0 ;
  wire \M2[21]_INST_0_i_5_n_0 ;

  MUXF8 \M2[20]_INST_0 
       (.I0(\M2[20]_INST_0_i_1_n_0 ),
        .I1(\M2[20]_INST_0_i_2_n_0 ),
        .O(M2[0]),
        .S(\M2[21] ));
  MUXF7 \M2[20]_INST_0_i_1 
       (.I0(\M2[20]_INST_0_i_3_n_0 ),
        .I1(\M2[20]_INST_0_i_4_n_0 ),
        .O(\M2[20]_INST_0_i_1_n_0 ),
        .S(\M2[21]_0 ));
  MUXF7 \M2[20]_INST_0_i_2 
       (.I0(\M2[20]_INST_0_i_5_n_0 ),
        .I1(\M2[20]_INST_0_i_6_n_0 ),
        .O(\M2[20]_INST_0_i_2_n_0 ),
        .S(\M2[21]_0 ));
  LUT6 #(
    .INIT(64'hBCBCCBC20F4F0404)) 
    \M2[20]_INST_0_i_3 
       (.I0(\M2[21]_1 ),
        .I1(\M2[21]_2 ),
        .I2(\M2[21]_3 ),
        .I3(\M2[21]_4 ),
        .I4(\M2[21]_5 ),
        .I5(\M2[21]_6 ),
        .O(\M2[20]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFF9E)) 
    \M2[20]_INST_0_i_4 
       (.I0(\M2[21]_6 ),
        .I1(\M2[21]_5 ),
        .I2(\M2[21]_3 ),
        .I3(\M2[21]_2 ),
        .O(\M2[20]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0F00080000000000)) 
    \M2[20]_INST_0_i_5 
       (.I0(\M2[21]_4 ),
        .I1(\M2[21]_1 ),
        .I2(\M2[21]_3 ),
        .I3(\M2[21]_5 ),
        .I4(\M2[21]_6 ),
        .I5(\M2[21]_2 ),
        .O(\M2[20]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF000FF70EFA000)) 
    \M2[20]_INST_0_i_6 
       (.I0(\M2[21]_1 ),
        .I1(\M2[21]_4 ),
        .I2(\M2[21]_2 ),
        .I3(\M2[21]_3 ),
        .I4(\M2[21]_6 ),
        .I5(\M2[21]_5 ),
        .O(\M2[20]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \M2[21]_INST_0 
       (.I0(\M2[21]_INST_0_i_1_n_0 ),
        .I1(\M2[21] ),
        .I2(\M2[21]_INST_0_i_3_n_0 ),
        .I3(\M2[21]_0 ),
        .I4(\M2[21]_INST_0_i_5_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hF0F08000FFF0F0F0)) 
    \M2[21]_INST_0_i_1 
       (.I0(\M2[21]_4 ),
        .I1(\M2[21]_1 ),
        .I2(\M2[21]_2 ),
        .I3(\M2[21]_6 ),
        .I4(\M2[21]_5 ),
        .I5(\M2[21]_3 ),
        .O(\M2[21]_INST_0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \M2[21]_INST_0_i_3 
       (.I0(\M2[21]_3 ),
        .I1(\M2[21]_5 ),
        .I2(\M2[21]_6 ),
        .I3(\M2[21]_2 ),
        .O(\M2[21]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0E00000FFF0F0A0)) 
    \M2[21]_INST_0_i_5 
       (.I0(\M2[21]_1 ),
        .I1(\M2[21]_4 ),
        .I2(\M2[21]_2 ),
        .I3(\M2[21]_6 ),
        .I4(\M2[21]_5 ),
        .I5(\M2[21]_3 ),
        .O(\M2[21]_INST_0_i_5_n_0 ));
endmodule

module layer1_N11
   (M2,
    \M2[22] ,
    \M2[22]_0 ,
    \M2[22]_1 ,
    \M2[22]_2 ,
    \M2[22]_3 ,
    \M2[22]_4 ,
    \M2[22]_5 ,
    \M2[22]_6 );
  output [1:0]M2;
  input \M2[22] ;
  input \M2[22]_0 ;
  input \M2[22]_1 ;
  input \M2[22]_2 ;
  input \M2[22]_3 ;
  input \M2[22]_4 ;
  input \M2[22]_5 ;
  input \M2[22]_6 ;

  wire [1:0]M2;
  wire \M2[22] ;
  wire \M2[22]_0 ;
  wire \M2[22]_1 ;
  wire \M2[22]_2 ;
  wire \M2[22]_3 ;
  wire \M2[22]_4 ;
  wire \M2[22]_5 ;
  wire \M2[22]_6 ;
  wire \M2[22]_INST_0_i_1_n_0 ;
  wire \M2[22]_INST_0_i_2_n_0 ;
  wire \M2[23]_INST_0_i_1_n_0 ;

  LUT5 #(
    .INIT(32'hFFFFEEE2)) 
    \M2[22]_INST_0 
       (.I0(\M2[22]_INST_0_i_1_n_0 ),
        .I1(\M2[22] ),
        .I2(\M2[22]_1 ),
        .I3(\M2[22]_INST_0_i_2_n_0 ),
        .I4(\M2[22]_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hFFFAFFEDFFEDFAB2)) 
    \M2[22]_INST_0_i_1 
       (.I0(\M2[22]_1 ),
        .I1(\M2[22]_2 ),
        .I2(\M2[22]_3 ),
        .I3(\M2[22]_6 ),
        .I4(\M2[22]_4 ),
        .I5(\M2[22]_5 ),
        .O(\M2[22]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \M2[22]_INST_0_i_2 
       (.I0(\M2[22]_6 ),
        .I1(\M2[22]_4 ),
        .I2(\M2[22]_5 ),
        .I3(\M2[22]_2 ),
        .I4(\M2[22]_3 ),
        .O(\M2[22]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \M2[23]_INST_0 
       (.I0(\M2[22] ),
        .I1(\M2[23]_INST_0_i_1_n_0 ),
        .I2(\M2[22]_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFAFAE8)) 
    \M2[23]_INST_0_i_1 
       (.I0(\M2[22]_1 ),
        .I1(\M2[22]_2 ),
        .I2(\M2[22]_3 ),
        .I3(\M2[22]_4 ),
        .I4(\M2[22]_5 ),
        .I5(\M2[22]_6 ),
        .O(\M2[23]_INST_0_i_1_n_0 ));
endmodule

module layer1_N12
   (\M0[126] ,
    \M0[126]_0 ,
    \M0[126]_1 ,
    \M0[126]_2 ,
    M2,
    M0,
    \M2[24] ,
    \M2[24]_0 ,
    \M2[24]_1 ,
    \M2[24]_2 ,
    \M2[24]_3 ,
    \M2[24]_4 ,
    \M2[24]_5 ,
    \M2[24]_6 );
  output \M0[126] ;
  output \M0[126]_0 ;
  output \M0[126]_1 ;
  output \M0[126]_2 ;
  output [1:0]M2;
  input [8:0]M0;
  input \M2[24] ;
  input \M2[24]_0 ;
  input \M2[24]_1 ;
  input \M2[24]_2 ;
  input \M2[24]_3 ;
  input \M2[24]_4 ;
  input \M2[24]_5 ;
  input \M2[24]_6 ;

  wire [8:0]M0;
  wire \M0[126] ;
  wire \M0[126]_0 ;
  wire \M0[126]_1 ;
  wire \M0[126]_2 ;
  wire [1:0]M2;
  wire \M2[24] ;
  wire \M2[24]_0 ;
  wire \M2[24]_1 ;
  wire \M2[24]_2 ;
  wire \M2[24]_3 ;
  wire \M2[24]_4 ;
  wire \M2[24]_5 ;
  wire \M2[24]_6 ;
  wire \M2[24]_INST_0_i_1_n_0 ;
  wire \M2[24]_INST_0_i_3_n_0 ;
  wire \M2[24]_INST_0_i_4_n_0 ;
  wire \M2[25]_INST_0_i_1_n_0 ;
  wire \M2[25]_INST_0_i_3_n_0 ;

  LUT5 #(
    .INIT(32'hB8FFB8CC)) 
    \M2[24]_INST_0 
       (.I0(\M2[24]_INST_0_i_1_n_0 ),
        .I1(\M2[24]_6 ),
        .I2(\M2[24]_INST_0_i_3_n_0 ),
        .I3(\M2[24] ),
        .I4(\M2[24]_INST_0_i_4_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hFFFFFFF3FFFFFFF7)) 
    \M2[24]_INST_0_i_1 
       (.I0(\M2[24]_0 ),
        .I1(\M2[24]_1 ),
        .I2(\M2[24]_5 ),
        .I3(\M2[24]_4 ),
        .I4(\M2[24]_3 ),
        .I5(\M2[24]_2 ),
        .O(\M2[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF378877C8370000)) 
    \M2[24]_INST_0_i_3 
       (.I0(\M2[24]_0 ),
        .I1(\M2[24]_1 ),
        .I2(\M2[24]_2 ),
        .I3(\M2[24]_3 ),
        .I4(\M2[24]_4 ),
        .I5(\M2[24]_5 ),
        .O(\M2[24]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF030707FFFCF800)) 
    \M2[24]_INST_0_i_4 
       (.I0(\M2[24]_2 ),
        .I1(\M2[24]_0 ),
        .I2(\M2[24]_1 ),
        .I3(\M2[24]_5 ),
        .I4(\M2[24]_4 ),
        .I5(\M2[24]_3 ),
        .O(\M2[24]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE2E2E2FFE2E2)) 
    \M2[25]_INST_0 
       (.I0(\M2[25]_INST_0_i_1_n_0 ),
        .I1(\M2[24] ),
        .I2(\M2[25]_INST_0_i_3_n_0 ),
        .I3(M0[4]),
        .I4(M0[1]),
        .I5(M0[0]),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFFF0F7F0F30000)) 
    \M2[25]_INST_0_i_1 
       (.I0(\M2[24]_2 ),
        .I1(\M2[24]_0 ),
        .I2(\M2[24]_3 ),
        .I3(\M2[24]_1 ),
        .I4(\M2[24]_4 ),
        .I5(\M2[24]_5 ),
        .O(\M2[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF770037000000)) 
    \M2[25]_INST_0_i_3 
       (.I0(\M2[24]_0 ),
        .I1(\M2[24]_1 ),
        .I2(\M2[24]_2 ),
        .I3(\M2[24]_3 ),
        .I4(\M2[24]_4 ),
        .I5(\M2[24]_5 ),
        .O(\M2[25]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000111011)) 
    g0_b0__0
       (.I0(M0[7]),
        .I1(M0[8]),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(M0[2]),
        .I5(M0[3]),
        .O(\M0[126] ));
  LUT6 #(
    .INIT(64'h1111111111333337)) 
    g1_b0__0
       (.I0(M0[7]),
        .I1(M0[8]),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(M0[2]),
        .I5(M0[3]),
        .O(\M0[126]_0 ));
  LUT6 #(
    .INIT(64'h33373737377777FF)) 
    g2_b0__0
       (.I0(M0[7]),
        .I1(M0[8]),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(M0[2]),
        .I5(M0[3]),
        .O(\M0[126]_1 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFFFFF)) 
    g3_b0__0
       (.I0(M0[7]),
        .I1(M0[8]),
        .I2(M0[5]),
        .I3(M0[6]),
        .I4(M0[2]),
        .I5(M0[3]),
        .O(\M0[126]_2 ));
endmodule

module layer1_N13
   (M2,
    sel,
    \M2[26] ,
    \M2[26]_0 ,
    \M2[26]_1 ,
    \M2[26]_2 ,
    \M2[26]_3 ,
    \M2[26]_4 );
  output [1:0]M2;
  input [1:0]sel;
  input \M2[26] ;
  input \M2[26]_0 ;
  input \M2[26]_1 ;
  input \M2[26]_2 ;
  input \M2[26]_3 ;
  input \M2[26]_4 ;

  wire [1:0]M2;
  wire \M2[26] ;
  wire \M2[26]_0 ;
  wire \M2[26]_1 ;
  wire \M2[26]_2 ;
  wire \M2[26]_3 ;
  wire \M2[26]_4 ;
  wire \M2[26]_INST_0_i_1_n_0 ;
  wire \M2[26]_INST_0_i_2_n_0 ;
  wire \M2[27]_INST_0_i_1_n_0 ;
  wire \M2[27]_INST_0_i_2_n_0 ;
  wire [1:0]sel;

  LUT4 #(
    .INIT(16'hFFE2)) 
    \M2[26]_INST_0 
       (.I0(\M2[26]_INST_0_i_1_n_0 ),
        .I1(sel[1]),
        .I2(\M2[26]_INST_0_i_2_n_0 ),
        .I3(\M2[26] ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hEFFDDDD8EEEEEFEF)) 
    \M2[26]_INST_0_i_1 
       (.I0(\M2[26]_0 ),
        .I1(\M2[26]_4 ),
        .I2(\M2[26]_3 ),
        .I3(\M2[26]_1 ),
        .I4(\M2[26]_2 ),
        .I5(sel[0]),
        .O(\M2[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAD9E48AAED864AA)) 
    \M2[26]_INST_0_i_2 
       (.I0(\M2[26]_0 ),
        .I1(\M2[26]_4 ),
        .I2(\M2[26]_3 ),
        .I3(sel[0]),
        .I4(\M2[26]_2 ),
        .I5(\M2[26]_1 ),
        .O(\M2[26]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    \M2[27]_INST_0 
       (.I0(\M2[27]_INST_0_i_1_n_0 ),
        .I1(sel[1]),
        .I2(\M2[27]_INST_0_i_2_n_0 ),
        .I3(\M2[26] ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAAFFFA)) 
    \M2[27]_INST_0_i_1 
       (.I0(\M2[26]_4 ),
        .I1(\M2[26]_1 ),
        .I2(\M2[26]_3 ),
        .I3(\M2[26]_2 ),
        .I4(sel[0]),
        .I5(\M2[26]_0 ),
        .O(\M2[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBBFBBB22202200)) 
    \M2[27]_INST_0_i_2 
       (.I0(\M2[26]_0 ),
        .I1(sel[0]),
        .I2(\M2[26]_1 ),
        .I3(\M2[26]_2 ),
        .I4(\M2[26]_3 ),
        .I5(\M2[26]_4 ),
        .O(\M2[27]_INST_0_i_2_n_0 ));
endmodule

module layer1_N14
   (M2,
    \M2[28] ,
    \M2[29] ,
    \M2[29]_0 ,
    \M2[29]_1 ,
    \M2[29]_2 ,
    \M2[29]_3 ,
    \M2[29]_4 ,
    \M2[29]_5 );
  output [1:0]M2;
  input \M2[28] ;
  input \M2[29] ;
  input \M2[29]_0 ;
  input \M2[29]_1 ;
  input \M2[29]_2 ;
  input \M2[29]_3 ;
  input \M2[29]_4 ;
  input \M2[29]_5 ;

  wire [1:0]M2;
  wire \M2[28] ;
  wire \M2[28]_INST_0_i_2_n_0 ;
  wire \M2[28]_INST_0_i_3_n_0 ;
  wire \M2[28]_INST_0_i_4_n_0 ;
  wire \M2[29] ;
  wire \M2[29]_0 ;
  wire \M2[29]_1 ;
  wire \M2[29]_2 ;
  wire \M2[29]_3 ;
  wire \M2[29]_4 ;
  wire \M2[29]_5 ;
  wire \M2[29]_INST_0_i_1_n_0 ;
  wire \M2[29]_INST_0_i_2_n_0 ;
  wire \M2[29]_INST_0_i_3_n_0 ;

  LUT5 #(
    .INIT(32'hFFF8FAF8)) 
    \M2[28]_INST_0 
       (.I0(\M2[28] ),
        .I1(\M2[28]_INST_0_i_2_n_0 ),
        .I2(\M2[28]_INST_0_i_3_n_0 ),
        .I3(\M2[29] ),
        .I4(\M2[28]_INST_0_i_4_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'h5F76FF7EEFEEFFEC)) 
    \M2[28]_INST_0_i_2 
       (.I0(\M2[29]_0 ),
        .I1(\M2[29]_1 ),
        .I2(\M2[29]_2 ),
        .I3(\M2[29]_3 ),
        .I4(\M2[29]_4 ),
        .I5(\M2[29]_5 ),
        .O(\M2[28]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC901030081031700)) 
    \M2[28]_INST_0_i_3 
       (.I0(\M2[29]_2 ),
        .I1(\M2[29]_0 ),
        .I2(\M2[29]_5 ),
        .I3(\M2[29]_3 ),
        .I4(\M2[29]_1 ),
        .I5(\M2[29]_4 ),
        .O(\M2[28]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEEEEFEFEFEFFF)) 
    \M2[28]_INST_0_i_4 
       (.I0(\M2[29]_3 ),
        .I1(\M2[29]_1 ),
        .I2(\M2[29]_5 ),
        .I3(\M2[29]_4 ),
        .I4(\M2[29]_2 ),
        .I5(\M2[29]_0 ),
        .O(\M2[28]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFAFCF0)) 
    \M2[29]_INST_0 
       (.I0(\M2[29]_INST_0_i_1_n_0 ),
        .I1(\M2[29]_INST_0_i_2_n_0 ),
        .I2(\M2[29]_INST_0_i_3_n_0 ),
        .I3(\M2[29] ),
        .I4(\M2[29]_3 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hDDDFCCCCDFFFCCCC)) 
    \M2[29]_INST_0_i_1 
       (.I0(\M2[29]_0 ),
        .I1(\M2[28] ),
        .I2(\M2[29]_5 ),
        .I3(\M2[29]_4 ),
        .I4(\M2[29]_1 ),
        .I5(\M2[29]_2 ),
        .O(\M2[29]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    \M2[29]_INST_0_i_2 
       (.I0(\M2[29]_4 ),
        .I1(\M2[29]_5 ),
        .I2(\M2[29]_2 ),
        .I3(\M2[29]_0 ),
        .I4(\M2[28] ),
        .I5(\M2[29]_1 ),
        .O(\M2[29]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF000F100F500FF00)) 
    \M2[29]_INST_0_i_3 
       (.I0(\M2[29]_2 ),
        .I1(\M2[29]_4 ),
        .I2(\M2[29]_1 ),
        .I3(\M2[28] ),
        .I4(\M2[29]_5 ),
        .I5(\M2[29]_0 ),
        .O(\M2[29]_INST_0_i_3_n_0 ));
endmodule

module layer1_N15
   (M2,
    sel);
  output [1:0]M2;
  input [7:0]sel;

  wire [1:0]M2;
  wire \M2[30]_INST_0_i_1_n_0 ;
  wire \M2[30]_INST_0_i_2_n_0 ;
  wire \M2[30]_INST_0_i_3_n_0 ;
  wire \M2[30]_INST_0_i_4_n_0 ;
  wire \M2[30]_INST_0_i_5_n_0 ;
  wire \M2[30]_INST_0_i_6_n_0 ;
  wire \M2[31]_INST_0_i_1_n_0 ;
  wire \M2[31]_INST_0_i_3_n_0 ;
  wire \M2[31]_INST_0_i_5_n_0 ;
  wire [7:0]sel;

  MUXF8 \M2[30]_INST_0 
       (.I0(\M2[30]_INST_0_i_1_n_0 ),
        .I1(\M2[30]_INST_0_i_2_n_0 ),
        .O(M2[0]),
        .S(sel[5]));
  MUXF7 \M2[30]_INST_0_i_1 
       (.I0(\M2[30]_INST_0_i_3_n_0 ),
        .I1(\M2[30]_INST_0_i_4_n_0 ),
        .O(\M2[30]_INST_0_i_1_n_0 ),
        .S(sel[4]));
  MUXF7 \M2[30]_INST_0_i_2 
       (.I0(\M2[30]_INST_0_i_5_n_0 ),
        .I1(\M2[30]_INST_0_i_6_n_0 ),
        .O(\M2[30]_INST_0_i_2_n_0 ),
        .S(sel[4]));
  LUT6 #(
    .INIT(64'h00000000000606E7)) 
    \M2[30]_INST_0_i_3 
       (.I0(sel[6]),
        .I1(sel[0]),
        .I2(sel[7]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\M2[30]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00010119719F9FFF)) 
    \M2[30]_INST_0_i_4 
       (.I0(sel[6]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[7]),
        .I5(sel[3]),
        .O(\M2[30]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h18E7E77FFFFFFFFF)) 
    \M2[30]_INST_0_i_5 
       (.I0(sel[6]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[7]),
        .I5(sel[3]),
        .O(\M2[30]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \M2[30]_INST_0_i_6 
       (.I0(sel[3]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[7]),
        .I4(sel[0]),
        .O(\M2[30]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \M2[31]_INST_0 
       (.I0(\M2[31]_INST_0_i_1_n_0 ),
        .I1(sel[5]),
        .I2(\M2[31]_INST_0_i_3_n_0 ),
        .I3(sel[4]),
        .I4(\M2[31]_INST_0_i_5_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'h011F7FFFFFFFFFFF)) 
    \M2[31]_INST_0_i_1 
       (.I0(sel[6]),
        .I1(sel[0]),
        .I2(sel[7]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\M2[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000F070F070F0F7F)) 
    \M2[31]_INST_0_i_3 
       (.I0(sel[0]),
        .I1(sel[6]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[7]),
        .O(\M2[31]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000000001011F)) 
    \M2[31]_INST_0_i_5 
       (.I0(sel[6]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[7]),
        .I5(sel[3]),
        .O(\M2[31]_INST_0_i_5_n_0 ));
endmodule

module layer1_N2
   (M2,
    \M2[4] ,
    \M2[4]_0 ,
    \M2[5] ,
    \M2[5]_0 ,
    \M2[5]_1 ,
    \M2[5]_2 ,
    \M2[4]_1 ,
    \M2[4]_2 ,
    \M2[4]_3 ,
    \M2[4]_4 );
  output [1:0]M2;
  input \M2[4] ;
  input \M2[4]_0 ;
  input \M2[5] ;
  input \M2[5]_0 ;
  input \M2[5]_1 ;
  input \M2[5]_2 ;
  input \M2[4]_1 ;
  input \M2[4]_2 ;
  input \M2[4]_3 ;
  input \M2[4]_4 ;

  wire [1:0]M2;
  wire \M2[4] ;
  wire \M2[4]_0 ;
  wire \M2[4]_1 ;
  wire \M2[4]_2 ;
  wire \M2[4]_3 ;
  wire \M2[4]_4 ;
  wire \M2[4]_INST_0_i_1_n_0 ;
  wire \M2[4]_INST_0_i_2_n_0 ;
  wire \M2[5] ;
  wire \M2[5]_0 ;
  wire \M2[5]_1 ;
  wire \M2[5]_2 ;
  wire \M2[5]_INST_0_i_2_n_0 ;
  wire \M2[5]_INST_0_i_3_n_0 ;

  MUXF8 \M2[4]_INST_0 
       (.I0(\M2[4]_INST_0_i_1_n_0 ),
        .I1(\M2[4]_INST_0_i_2_n_0 ),
        .O(M2[0]),
        .S(\M2[4] ));
  MUXF7 \M2[4]_INST_0_i_1 
       (.I0(\M2[4]_1 ),
        .I1(\M2[4]_2 ),
        .O(\M2[4]_INST_0_i_1_n_0 ),
        .S(\M2[4]_0 ));
  MUXF7 \M2[4]_INST_0_i_2 
       (.I0(\M2[4]_3 ),
        .I1(\M2[4]_4 ),
        .O(\M2[4]_INST_0_i_2_n_0 ),
        .S(\M2[4]_0 ));
  MUXF8 \M2[5]_INST_0 
       (.I0(\M2[5]_INST_0_i_2_n_0 ),
        .I1(\M2[5]_INST_0_i_3_n_0 ),
        .O(M2[1]),
        .S(\M2[4] ));
  MUXF7 \M2[5]_INST_0_i_2 
       (.I0(\M2[5]_1 ),
        .I1(\M2[5]_2 ),
        .O(\M2[5]_INST_0_i_2_n_0 ),
        .S(\M2[4]_0 ));
  MUXF7 \M2[5]_INST_0_i_3 
       (.I0(\M2[5] ),
        .I1(\M2[5]_0 ),
        .O(\M2[5]_INST_0_i_3_n_0 ),
        .S(\M2[4]_0 ));
endmodule

module layer1_N3
   (M2,
    \M2[7] ,
    sel,
    \M2[7]_0 ,
    \M2[7]_1 ,
    \M2[7]_2 );
  output [1:0]M2;
  input \M2[7] ;
  input [3:0]sel;
  input \M2[7]_0 ;
  input \M2[7]_1 ;
  input \M2[7]_2 ;

  wire [1:0]M2;
  wire \M2[6]_INST_0_i_1_n_0 ;
  wire \M2[6]_INST_0_i_2_n_0 ;
  wire \M2[6]_INST_0_i_3_n_0 ;
  wire \M2[6]_INST_0_i_4_n_0 ;
  wire \M2[7] ;
  wire \M2[7]_0 ;
  wire \M2[7]_1 ;
  wire \M2[7]_2 ;
  wire \M2[7]_INST_0_i_1_n_0 ;
  wire \M2[7]_INST_0_i_3_n_0 ;
  wire \M2[7]_INST_0_i_6_n_0 ;
  wire [3:0]sel;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \M2[6]_INST_0 
       (.I0(\M2[6]_INST_0_i_1_n_0 ),
        .I1(\M2[6]_INST_0_i_2_n_0 ),
        .I2(\M2[7] ),
        .I3(\M2[6]_INST_0_i_3_n_0 ),
        .I4(sel[1]),
        .I5(\M2[6]_INST_0_i_4_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFFFFFFF)) 
    \M2[6]_INST_0_i_1 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(\M2[7]_1 ),
        .I3(sel[3]),
        .I4(\M2[7]_2 ),
        .I5(\M2[7]_0 ),
        .O(\M2[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F7D7DF557735371)) 
    \M2[6]_INST_0_i_2 
       (.I0(\M2[7]_0 ),
        .I1(\M2[7]_2 ),
        .I2(sel[3]),
        .I3(\M2[7]_1 ),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\M2[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDD776FFFFFFFF)) 
    \M2[6]_INST_0_i_3 
       (.I0(\M2[7]_2 ),
        .I1(sel[3]),
        .I2(sel[2]),
        .I3(\M2[7]_1 ),
        .I4(sel[0]),
        .I5(\M2[7]_0 ),
        .O(\M2[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hC4C5F55545515DDC)) 
    \M2[6]_INST_0_i_4 
       (.I0(\M2[7]_0 ),
        .I1(sel[0]),
        .I2(\M2[7]_1 ),
        .I3(sel[2]),
        .I4(\M2[7]_2 ),
        .I5(sel[3]),
        .O(\M2[6]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFCFFBBFFFCFF88CC)) 
    \M2[7]_INST_0 
       (.I0(\M2[7]_INST_0_i_1_n_0 ),
        .I1(\M2[7] ),
        .I2(\M2[7]_INST_0_i_3_n_0 ),
        .I3(\M2[7]_0 ),
        .I4(sel[1]),
        .I5(\M2[7]_INST_0_i_6_n_0 ),
        .O(M2[1]));
  LUT5 #(
    .INIT(32'hCF0C8C0C)) 
    \M2[7]_INST_0_i_1 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(\M2[7]_2 ),
        .I3(sel[3]),
        .I4(\M2[7]_1 ),
        .O(\M2[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFDDD)) 
    \M2[7]_INST_0_i_3 
       (.I0(\M2[7]_2 ),
        .I1(sel[3]),
        .I2(\M2[7]_1 ),
        .I3(sel[2]),
        .I4(sel[0]),
        .O(\M2[7]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7775775555515111)) 
    \M2[7]_INST_0_i_6 
       (.I0(\M2[7]_0 ),
        .I1(\M2[7]_2 ),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(\M2[7]_1 ),
        .I5(sel[0]),
        .O(\M2[7]_INST_0_i_6_n_0 ));
endmodule

module layer1_N4
   (M2,
    \M2[9] ,
    \M2[9]_0 ,
    \M2[9]_1 ,
    \M2[9]_2 ,
    \M2[9]_3 ,
    \M2[9]_4 ,
    \M2[9]_5 ,
    \M2[9]_6 );
  output [1:0]M2;
  input \M2[9] ;
  input \M2[9]_0 ;
  input \M2[9]_1 ;
  input \M2[9]_2 ;
  input \M2[9]_3 ;
  input \M2[9]_4 ;
  input \M2[9]_5 ;
  input \M2[9]_6 ;

  wire [1:0]M2;
  wire \M2[8]_INST_0_i_1_n_0 ;
  wire \M2[8]_INST_0_i_2_n_0 ;
  wire \M2[9] ;
  wire \M2[9]_0 ;
  wire \M2[9]_1 ;
  wire \M2[9]_2 ;
  wire \M2[9]_3 ;
  wire \M2[9]_4 ;
  wire \M2[9]_5 ;
  wire \M2[9]_6 ;
  wire \M2[9]_INST_0_i_1_n_0 ;

  LUT4 #(
    .INIT(16'h30BB)) 
    \M2[8]_INST_0 
       (.I0(\M2[8]_INST_0_i_1_n_0 ),
        .I1(\M2[9] ),
        .I2(\M2[8]_INST_0_i_2_n_0 ),
        .I3(\M2[9]_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'h22000000000054D5)) 
    \M2[8]_INST_0_i_1 
       (.I0(\M2[9]_1 ),
        .I1(\M2[9]_5 ),
        .I2(\M2[9]_4 ),
        .I3(\M2[9]_2 ),
        .I4(\M2[9]_6 ),
        .I5(\M2[9]_3 ),
        .O(\M2[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF00000080)) 
    \M2[8]_INST_0_i_2 
       (.I0(\M2[9]_1 ),
        .I1(\M2[9]_2 ),
        .I2(\M2[9]_3 ),
        .I3(\M2[9]_4 ),
        .I4(\M2[9]_5 ),
        .I5(\M2[9]_6 ),
        .O(\M2[8]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h0B)) 
    \M2[9]_INST_0 
       (.I0(\M2[9]_INST_0_i_1_n_0 ),
        .I1(\M2[9] ),
        .I2(\M2[9]_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAB2A)) 
    \M2[9]_INST_0_i_1 
       (.I0(\M2[9]_1 ),
        .I1(\M2[9]_5 ),
        .I2(\M2[9]_4 ),
        .I3(\M2[9]_2 ),
        .I4(\M2[9]_3 ),
        .I5(\M2[9]_6 ),
        .O(\M2[9]_INST_0_i_1_n_0 ));
endmodule

module layer1_N5
   (M2,
    \M2[10] ,
    \M2[10]_0 ,
    \M2[10]_1 ,
    \M2[10]_2 ,
    \M2[10]_3 ,
    \M2[10]_4 ,
    \M2[10]_5 ,
    \M2[10]_6 );
  output [1:0]M2;
  input \M2[10] ;
  input \M2[10]_0 ;
  input \M2[10]_1 ;
  input \M2[10]_2 ;
  input \M2[10]_3 ;
  input \M2[10]_4 ;
  input \M2[10]_5 ;
  input \M2[10]_6 ;

  wire [1:0]M2;
  wire \M2[10] ;
  wire \M2[10]_0 ;
  wire \M2[10]_1 ;
  wire \M2[10]_2 ;
  wire \M2[10]_3 ;
  wire \M2[10]_4 ;
  wire \M2[10]_5 ;
  wire \M2[10]_6 ;
  wire \M2[10]_INST_0_i_1_n_0 ;
  wire \M2[10]_INST_0_i_3_n_0 ;
  wire \M2[10]_INST_0_i_4_n_0 ;
  wire \M2[11]_INST_0_i_1_n_0 ;
  wire \M2[11]_INST_0_i_2_n_0 ;

  LUT6 #(
    .INIT(64'h0000F0F02222FFF2)) 
    \M2[10]_INST_0 
       (.I0(\M2[10]_INST_0_i_1_n_0 ),
        .I1(\M2[10]_5 ),
        .I2(\M2[10]_INST_0_i_3_n_0 ),
        .I3(\M2[10]_INST_0_i_4_n_0 ),
        .I4(\M2[10]_0 ),
        .I5(\M2[10] ),
        .O(M2[0]));
  LUT3 #(
    .INIT(8'h01)) 
    \M2[10]_INST_0_i_1 
       (.I0(\M2[10]_2 ),
        .I1(\M2[10]_4 ),
        .I2(\M2[10]_3 ),
        .O(\M2[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000C0007)) 
    \M2[10]_INST_0_i_3 
       (.I0(\M2[10]_1 ),
        .I1(\M2[10]_6 ),
        .I2(\M2[10]_5 ),
        .I3(\M2[10]_2 ),
        .I4(\M2[10]_4 ),
        .I5(\M2[10]_3 ),
        .O(\M2[10]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00810F720FF8E008)) 
    \M2[10]_INST_0_i_4 
       (.I0(\M2[10]_1 ),
        .I1(\M2[10]_6 ),
        .I2(\M2[10]_3 ),
        .I3(\M2[10]_2 ),
        .I4(\M2[10]_5 ),
        .I5(\M2[10]_4 ),
        .O(\M2[10]_INST_0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0F02)) 
    \M2[11]_INST_0 
       (.I0(\M2[11]_INST_0_i_1_n_0 ),
        .I1(\M2[10] ),
        .I2(\M2[10]_0 ),
        .I3(\M2[11]_INST_0_i_2_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'h1000333111117777)) 
    \M2[11]_INST_0_i_1 
       (.I0(\M2[10]_5 ),
        .I1(\M2[10]_2 ),
        .I2(\M2[10]_1 ),
        .I3(\M2[10]_6 ),
        .I4(\M2[10]_3 ),
        .I5(\M2[10]_4 ),
        .O(\M2[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \M2[11]_INST_0_i_2 
       (.I0(\M2[10]_1 ),
        .I1(\M2[10]_2 ),
        .I2(\M2[10]_3 ),
        .I3(\M2[10]_4 ),
        .I4(\M2[10]_5 ),
        .I5(\M2[10]_6 ),
        .O(\M2[11]_INST_0_i_2_n_0 ));
endmodule

module layer1_N6
   (\M0[126] ,
    \M0[126]_0 ,
    \M0[126]_1 ,
    \M0[126]_2 ,
    M2,
    M0,
    \M2[13] ,
    \M2[13]_0 ,
    \M2[13]_1 ,
    \M2[13]_2 ,
    \M2[13]_3 ,
    \M2[12] ,
    \M2[13]_4 ,
    \M2[13]_5 );
  output \M0[126] ;
  output \M0[126]_0 ;
  output \M0[126]_1 ;
  output \M0[126]_2 ;
  output [1:0]M2;
  input [5:0]M0;
  input \M2[13] ;
  input \M2[13]_0 ;
  input \M2[13]_1 ;
  input \M2[13]_2 ;
  input \M2[13]_3 ;
  input \M2[12] ;
  input \M2[13]_4 ;
  input \M2[13]_5 ;

  wire [5:0]M0;
  wire \M0[126] ;
  wire \M0[126]_0 ;
  wire \M0[126]_1 ;
  wire \M0[126]_2 ;
  wire [1:0]M2;
  wire \M2[12] ;
  wire \M2[12]_INST_0_i_1_n_0 ;
  wire \M2[12]_INST_0_i_2_n_0 ;
  wire \M2[13] ;
  wire \M2[13]_0 ;
  wire \M2[13]_1 ;
  wire \M2[13]_2 ;
  wire \M2[13]_3 ;
  wire \M2[13]_4 ;
  wire \M2[13]_5 ;
  wire \M2[13]_INST_0_i_1_n_0 ;
  wire \M2[13]_INST_0_i_4_n_0 ;

  LUT4 #(
    .INIT(16'h0F08)) 
    \M2[12]_INST_0 
       (.I0(\M2[12]_INST_0_i_1_n_0 ),
        .I1(\M2[13] ),
        .I2(\M2[13]_0 ),
        .I3(\M2[12]_INST_0_i_2_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hD3535F5FFCDCDFDF)) 
    \M2[12]_INST_0_i_1 
       (.I0(\M2[13]_1 ),
        .I1(\M2[13]_2 ),
        .I2(\M2[13]_3 ),
        .I3(\M2[12] ),
        .I4(\M2[13]_4 ),
        .I5(\M2[13]_5 ),
        .O(\M2[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h04FD04FD04DD04DF)) 
    \M2[12]_INST_0_i_2 
       (.I0(\M2[13]_5 ),
        .I1(\M2[13]_2 ),
        .I2(\M2[13]_3 ),
        .I3(\M2[13]_1 ),
        .I4(\M2[12] ),
        .I5(\M2[13]_4 ),
        .O(\M2[12]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0F08)) 
    \M2[13]_INST_0 
       (.I0(\M2[13]_INST_0_i_1_n_0 ),
        .I1(\M2[13] ),
        .I2(\M2[13]_0 ),
        .I3(\M2[13]_INST_0_i_4_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'h70FFF7FFF0FFFFFF)) 
    \M2[13]_INST_0_i_1 
       (.I0(\M2[13]_3 ),
        .I1(\M2[13]_4 ),
        .I2(\M2[13]_2 ),
        .I3(\M2[13]_1 ),
        .I4(\M2[13]_5 ),
        .I5(\M2[12] ),
        .O(\M2[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0F0F070F)) 
    \M2[13]_INST_0_i_4 
       (.I0(\M2[13]_5 ),
        .I1(\M2[13]_3 ),
        .I2(\M2[13]_1 ),
        .I3(\M2[13]_4 ),
        .I4(\M2[13]_2 ),
        .O(\M2[13]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010111)) 
    g0_b1__0
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[126] ));
  LUT6 #(
    .INIT(64'h0111111313333333)) 
    g1_b1__0
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[126]_0 ));
  LUT6 #(
    .INIT(64'h333333777777777F)) 
    g2_b1__0
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[126]_1 ));
  LUT6 #(
    .INIT(64'h77FF7FFFFFFFFFFF)) 
    g3_b1__0
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[126]_2 ));
endmodule

module layer1_N7
   (\M0[100] ,
    \M0[100]_0 ,
    \M0[100]_1 ,
    \M0[100]_2 ,
    \M0[100]_3 ,
    \M0[100]_4 ,
    \M0[100]_5 ,
    \M0[100]_6 ,
    M2,
    M0,
    \M2[15] ,
    \M2[15]_0 ,
    \M2[15]_1 ,
    \M2[15]_2 ,
    \M2[15]_3 ,
    \M2[15]_4 ,
    \M2[15]_5 ,
    \M2[15]_6 );
  output \M0[100] ;
  output \M0[100]_0 ;
  output \M0[100]_1 ;
  output \M0[100]_2 ;
  output \M0[100]_3 ;
  output \M0[100]_4 ;
  output \M0[100]_5 ;
  output \M0[100]_6 ;
  output [1:0]M2;
  input [5:0]M0;
  input \M2[15] ;
  input \M2[15]_0 ;
  input \M2[15]_1 ;
  input \M2[15]_2 ;
  input \M2[15]_3 ;
  input \M2[15]_4 ;
  input \M2[15]_5 ;
  input \M2[15]_6 ;

  wire [5:0]M0;
  wire \M0[100] ;
  wire \M0[100]_0 ;
  wire \M0[100]_1 ;
  wire \M0[100]_2 ;
  wire \M0[100]_3 ;
  wire \M0[100]_4 ;
  wire \M0[100]_5 ;
  wire \M0[100]_6 ;
  wire [1:0]M2;
  wire \M2[14]_INST_0_i_1_n_0 ;
  wire \M2[14]_INST_0_i_2_n_0 ;
  wire \M2[14]_INST_0_i_3_n_0 ;
  wire \M2[15] ;
  wire \M2[15]_0 ;
  wire \M2[15]_1 ;
  wire \M2[15]_2 ;
  wire \M2[15]_3 ;
  wire \M2[15]_4 ;
  wire \M2[15]_5 ;
  wire \M2[15]_6 ;
  wire \M2[15]_INST_0_i_2_n_0 ;
  wire \M2[15]_INST_0_i_4_n_0 ;

  LUT6 #(
    .INIT(64'hEFEA5D5D45400808)) 
    \M2[14]_INST_0 
       (.I0(\M2[15] ),
        .I1(\M2[14]_INST_0_i_1_n_0 ),
        .I2(\M2[15]_0 ),
        .I3(\M2[14]_INST_0_i_2_n_0 ),
        .I4(\M2[15]_1 ),
        .I5(\M2[14]_INST_0_i_3_n_0 ),
        .O(M2[0]));
  LUT5 #(
    .INIT(32'h0E005AF1)) 
    \M2[14]_INST_0_i_1 
       (.I0(\M2[15]_5 ),
        .I1(\M2[15]_6 ),
        .I2(\M2[15]_2 ),
        .I3(\M2[15]_4 ),
        .I4(\M2[15]_3 ),
        .O(\M2[14]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF7)) 
    \M2[14]_INST_0_i_2 
       (.I0(\M2[15]_2 ),
        .I1(\M2[15]_3 ),
        .I2(\M2[15]_4 ),
        .O(\M2[14]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5555504000FF1555)) 
    \M2[14]_INST_0_i_3 
       (.I0(\M2[15]_0 ),
        .I1(\M2[15]_6 ),
        .I2(\M2[15]_5 ),
        .I3(\M2[15]_3 ),
        .I4(\M2[15]_4 ),
        .I5(\M2[15]_2 ),
        .O(\M2[14]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEF5D4508)) 
    \M2[15]_INST_0 
       (.I0(\M2[15] ),
        .I1(\M2[15]_INST_0_i_2_n_0 ),
        .I2(\M2[15]_0 ),
        .I3(\M2[15]_1 ),
        .I4(\M2[15]_INST_0_i_4_n_0 ),
        .O(M2[1]));
  LUT5 #(
    .INIT(32'h00AF000E)) 
    \M2[15]_INST_0_i_2 
       (.I0(\M2[15]_5 ),
        .I1(\M2[15]_6 ),
        .I2(\M2[15]_2 ),
        .I3(\M2[15]_3 ),
        .I4(\M2[15]_4 ),
        .O(\M2[15]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000005F5D5D5D)) 
    \M2[15]_INST_0_i_4 
       (.I0(\M2[15]_3 ),
        .I1(\M2[15]_4 ),
        .I2(\M2[15]_2 ),
        .I3(\M2[15]_5 ),
        .I4(\M2[15]_6 ),
        .I5(\M2[15]_0 ),
        .O(\M2[15]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1133000100000000)) 
    g0_b0__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100] ));
  LUT6 #(
    .INIT(64'h1113001100000000)) 
    g0_b1__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_0 ));
  LUT6 #(
    .INIT(64'h3377111301110000)) 
    g1_b0__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_1 ));
  LUT6 #(
    .INIT(64'h3337113300110000)) 
    g1_b1__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_2 ));
  LUT6 #(
    .INIT(64'h77F7337713130111)) 
    g2_b0__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_3 ));
  LUT6 #(
    .INIT(64'h777F333711330011)) 
    g2_b1__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_4 ));
  LUT6 #(
    .INIT(64'hFFFF77FF33371333)) 
    g3_b0__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_5 ));
  LUT6 #(
    .INIT(64'hFFFF777F33771133)) 
    g3_b1__1
       (.I0(M0[4]),
        .I1(M0[5]),
        .I2(M0[2]),
        .I3(M0[3]),
        .I4(M0[0]),
        .I5(M0[1]),
        .O(\M0[100]_6 ));
endmodule

module layer1_N8
   (M2,
    \M2[16] ,
    \M2[16]_0 ,
    \M2[16]_1 ,
    \M2[16]_2 );
  output [0:0]M2;
  input \M2[16] ;
  input \M2[16]_0 ;
  input \M2[16]_1 ;
  input \M2[16]_2 ;

  wire [0:0]M2;
  wire \M2[16] ;
  wire \M2[16]_0 ;
  wire \M2[16]_1 ;
  wire \M2[16]_2 ;

  LUT4 #(
    .INIT(16'h0215)) 
    \M1r/i_ 
       (.I0(\M2[16] ),
        .I1(\M2[16]_0 ),
        .I2(\M2[16]_1 ),
        .I3(\M2[16]_2 ),
        .O(M2));
endmodule

module layer1_N9
   (M2,
    \M2[18] ,
    \M2[18]_0 ,
    \M2[18]_1 ,
    \M2[18]_2 ,
    \M2[18]_3 ,
    \M2[18]_4 ,
    \M2[18]_5 ,
    \M2[18]_6 );
  output [1:0]M2;
  input \M2[18] ;
  input \M2[18]_0 ;
  input \M2[18]_1 ;
  input \M2[18]_2 ;
  input \M2[18]_3 ;
  input \M2[18]_4 ;
  input \M2[18]_5 ;
  input \M2[18]_6 ;

  wire [1:0]M2;
  wire \M2[18] ;
  wire \M2[18]_0 ;
  wire \M2[18]_1 ;
  wire \M2[18]_2 ;
  wire \M2[18]_3 ;
  wire \M2[18]_4 ;
  wire \M2[18]_5 ;
  wire \M2[18]_6 ;
  wire \M2[18]_INST_0_i_1_n_0 ;
  wire \M2[18]_INST_0_i_2_n_0 ;
  wire \M2[19]_INST_0_i_2_n_0 ;
  wire \M2[19]_INST_0_i_4_n_0 ;

  LUT4 #(
    .INIT(16'hEDE8)) 
    \M2[18]_INST_0 
       (.I0(\M2[18] ),
        .I1(\M2[18]_INST_0_i_1_n_0 ),
        .I2(\M2[18]_0 ),
        .I3(\M2[18]_INST_0_i_2_n_0 ),
        .O(M2[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBFBFEA)) 
    \M2[18]_INST_0_i_1 
       (.I0(\M2[18]_1 ),
        .I1(\M2[18]_2 ),
        .I2(\M2[18]_5 ),
        .I3(\M2[18]_3 ),
        .I4(\M2[18]_4 ),
        .I5(\M2[18]_6 ),
        .O(\M2[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEABBFABBFCECA)) 
    \M2[18]_INST_0_i_2 
       (.I0(\M2[18]_6 ),
        .I1(\M2[18]_1 ),
        .I2(\M2[18]_2 ),
        .I3(\M2[18]_5 ),
        .I4(\M2[18]_4 ),
        .I5(\M2[18]_3 ),
        .O(\M2[18]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hEDE8)) 
    \M2[19]_INST_0 
       (.I0(\M2[18] ),
        .I1(\M2[19]_INST_0_i_2_n_0 ),
        .I2(\M2[18]_0 ),
        .I3(\M2[19]_INST_0_i_4_n_0 ),
        .O(M2[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFBFFFF)) 
    \M2[19]_INST_0_i_2 
       (.I0(\M2[18]_1 ),
        .I1(\M2[18]_2 ),
        .I2(\M2[18]_3 ),
        .I3(\M2[18]_4 ),
        .I4(\M2[18]_5 ),
        .I5(\M2[18]_6 ),
        .O(\M2[19]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEF0888)) 
    \M2[19]_INST_0_i_4 
       (.I0(\M2[18]_4 ),
        .I1(\M2[18]_3 ),
        .I2(\M2[18]_5 ),
        .I3(\M2[18]_2 ),
        .I4(\M2[18]_1 ),
        .I5(\M2[18]_6 ),
        .O(\M2[19]_INST_0_i_4_n_0 ));
endmodule

(* ECO_CHECKSUM = "55c75b95" *) 
(* NotValidForBitStream *)
module logicnet
   (M0,
    clk,
    rst,
    M2);
  input [127:0]M0;
  input clk;
  input rst;
  output [31:0]M2;

  wire [127:0]M0;
  wire [31:0]M2;
  wire layer0_inst_n_0;
  wire layer0_inst_n_1;
  wire layer0_inst_n_10;
  wire layer0_inst_n_11;
  wire layer0_inst_n_12;
  wire layer0_inst_n_13;
  wire layer0_inst_n_15;
  wire layer0_inst_n_16;
  wire layer0_inst_n_17;
  wire layer0_inst_n_18;
  wire layer0_inst_n_19;
  wire layer0_inst_n_2;
  wire layer0_inst_n_20;
  wire layer0_inst_n_21;
  wire layer0_inst_n_22;
  wire layer0_inst_n_23;
  wire layer0_inst_n_24;
  wire layer0_inst_n_3;
  wire layer0_inst_n_33;
  wire layer0_inst_n_34;
  wire layer0_inst_n_35;
  wire layer0_inst_n_36;
  wire layer0_inst_n_37;
  wire layer0_inst_n_38;
  wire layer0_inst_n_39;
  wire layer0_inst_n_4;
  wire layer0_inst_n_40;
  wire layer0_inst_n_41;
  wire layer0_inst_n_42;
  wire layer0_inst_n_43;
  wire layer0_inst_n_44;
  wire layer0_inst_n_45;
  wire layer0_inst_n_46;
  wire layer0_inst_n_47;
  wire layer0_inst_n_48;
  wire layer0_inst_n_49;
  wire layer0_inst_n_5;
  wire layer0_inst_n_50;
  wire layer0_inst_n_51;
  wire layer0_inst_n_52;
  wire layer0_inst_n_53;
  wire layer0_inst_n_54;
  wire layer0_inst_n_55;
  wire layer0_inst_n_56;
  wire layer0_inst_n_57;
  wire layer0_inst_n_58;
  wire layer0_inst_n_59;
  wire layer0_inst_n_6;
  wire layer0_inst_n_60;
  wire layer0_inst_n_7;
  wire layer0_inst_n_8;
  wire layer0_inst_n_9;
  wire layer1_inst_n_31;
  wire layer1_inst_n_32;
  wire layer1_inst_n_33;
  wire layer1_inst_n_34;
  wire layer1_inst_n_35;
  wire layer1_inst_n_36;
  wire layer1_inst_n_37;
  wire layer1_inst_n_38;
  wire layer1_inst_n_39;
  wire layer1_inst_n_40;
  wire layer1_inst_n_41;
  wire layer1_inst_n_42;
  wire layer1_inst_n_43;
  wire layer1_inst_n_44;
  wire layer1_inst_n_45;
  wire layer1_inst_n_46;
  wire [7:0]sel;

  layer0 layer0_inst
       (.M0({M0[127:126],M0[123:118],M0[115:114],M0[111:100],M0[97:96],M0[93:84],M0[79:66],M0[61:52],M0[49:32],M0[29:24],M0[21:14],M0[11:0]}),
        .\M0[0]_0 (layer0_inst_n_42),
        .\M0[107] (layer0_inst_n_57),
        .\M0[109] (layer0_inst_n_51),
        .\M0[118] (layer0_inst_n_45),
        .\M0[11]_0 (layer0_inst_n_40),
        .\M0[120] (layer0_inst_n_37),
        .\M0[120]_0 (layer0_inst_n_52),
        .\M0[28]_0 (layer0_inst_n_16),
        .\M0[28]_1 (layer0_inst_n_50),
        .\M0[33]_0 (layer0_inst_n_20),
        .\M0[37]_0 (layer0_inst_n_22),
        .\M0[42]_0 (layer0_inst_n_18),
        .\M0[42]_1 (layer0_inst_n_58),
        .\M0[45]_0 (layer0_inst_n_1),
        .\M0[49]_0 (layer0_inst_n_48),
        .\M0[58]_0 (layer0_inst_n_34),
        .\M0[60]_0 (layer0_inst_n_56),
        .\M0[67]_0 (layer0_inst_n_53),
        .\M0[67]_1 (layer0_inst_n_60),
        .\M0[73]_0 (layer0_inst_n_6),
        .\M0[7]_0 (layer0_inst_n_3),
        .\M0[85]_0 (layer0_inst_n_44),
        .\M0[87]_0 (layer0_inst_n_7),
        .\M0[87]_1 (layer0_inst_n_8),
        .\M0[87]_2 (layer0_inst_n_9),
        .\M0[87]_3 (layer0_inst_n_10),
        .\M0[87]_4 (layer0_inst_n_11),
        .\M0[87]_5 (layer0_inst_n_12),
        .\M0[87]_6 (layer0_inst_n_13),
        .M0_0_sp_1(layer0_inst_n_41),
        .M0_11_sp_1(layer0_inst_n_39),
        .M0_16_sp_1(layer0_inst_n_36),
        .M0_17_sp_1(layer0_inst_n_35),
        .M0_1_sp_1(layer0_inst_n_38),
        .M0_28_sp_1(layer0_inst_n_15),
        .M0_29_sp_1(layer0_inst_n_49),
        .M0_33_sp_1(layer0_inst_n_19),
        .M0_37_sp_1(layer0_inst_n_21),
        .M0_42_sp_1(layer0_inst_n_17),
        .M0_45_sp_1(layer0_inst_n_0),
        .M0_49_sp_1(layer0_inst_n_47),
        .M0_53_sp_1(layer0_inst_n_59),
        .M0_58_sp_1(layer0_inst_n_33),
        .M0_60_sp_1(layer0_inst_n_55),
        .M0_66_sp_1(layer0_inst_n_24),
        .M0_67_sp_1(layer0_inst_n_23),
        .M0_69_sp_1(layer0_inst_n_54),
        .M0_73_sp_1(layer0_inst_n_5),
        .M0_7_sp_1(layer0_inst_n_2),
        .M0_85_sp_1(layer0_inst_n_43),
        .M0_87_sp_1(layer0_inst_n_4),
        .M0_97_sp_1(layer0_inst_n_46),
        .M2(M2[17]),
        .\M2[10]_INST_0_i_2 (layer1_inst_n_31),
        .\M2[10]_INST_0_i_2_0 (layer1_inst_n_33),
        .\M2[10]_INST_0_i_2_1 (layer1_inst_n_35),
        .\M2[10]_INST_0_i_2_2 (layer1_inst_n_37),
        .\M2[23]_INST_0_i_2 (layer1_inst_n_40),
        .\M2[23]_INST_0_i_2_0 (layer1_inst_n_42),
        .\M2[23]_INST_0_i_2_1 (layer1_inst_n_44),
        .\M2[23]_INST_0_i_2_2 (layer1_inst_n_46),
        .\M2[23]_INST_0_i_4 (layer1_inst_n_39),
        .\M2[23]_INST_0_i_4_0 (layer1_inst_n_41),
        .\M2[23]_INST_0_i_4_1 (layer1_inst_n_43),
        .\M2[23]_INST_0_i_4_2 (layer1_inst_n_45),
        .\M2[25]_INST_0_i_2 (layer1_inst_n_32),
        .\M2[25]_INST_0_i_2_0 (layer1_inst_n_34),
        .\M2[25]_INST_0_i_2_1 (layer1_inst_n_36),
        .\M2[25]_INST_0_i_2_2 (layer1_inst_n_38),
        .sel(sel));
  layer1 layer1_inst
       (.M0({M0[127:124],M0[101:100],M0[89],M0[63:62],M0[47:46],M0[43:42],M0[13:12]}),
        .\M0[100] (layer1_inst_n_39),
        .\M0[100]_0 (layer1_inst_n_40),
        .\M0[100]_1 (layer1_inst_n_41),
        .\M0[100]_2 (layer1_inst_n_42),
        .\M0[100]_3 (layer1_inst_n_43),
        .\M0[100]_4 (layer1_inst_n_44),
        .\M0[100]_5 (layer1_inst_n_45),
        .\M0[100]_6 (layer1_inst_n_46),
        .\M0[126] (layer1_inst_n_31),
        .\M0[126]_0 (layer1_inst_n_32),
        .\M0[126]_1 (layer1_inst_n_33),
        .\M0[126]_2 (layer1_inst_n_34),
        .\M0[126]_3 (layer1_inst_n_35),
        .\M0[126]_4 (layer1_inst_n_36),
        .\M0[126]_5 (layer1_inst_n_37),
        .\M0[126]_6 (layer1_inst_n_38),
        .M2({M2[31:18],M2[16:0]}),
        .\M2[10]_0 (layer0_inst_n_1),
        .\M2[10]_1 (layer0_inst_n_48),
        .\M2[10]_2 (layer0_inst_n_47),
        .\M2[10]_3 (layer0_inst_n_0),
        .\M2[13]_0 (layer0_inst_n_22),
        .\M2[13]_1 (layer0_inst_n_18),
        .\M2[15]_0 (layer0_inst_n_50),
        .\M2[15]_1 (layer0_inst_n_49),
        .\M2[16]_0 (layer0_inst_n_15),
        .\M2[16]_1 (layer0_inst_n_6),
        .\M2[16]_2 (layer0_inst_n_5),
        .\M2[18]_0 (layer0_inst_n_44),
        .\M2[18]_1 (layer0_inst_n_45),
        .\M2[18]_2 (layer0_inst_n_46),
        .\M2[18]_3 (layer0_inst_n_54),
        .\M2[18]_4 (layer0_inst_n_2),
        .\M2[21]_0 (layer0_inst_n_56),
        .\M2[21]_1 (layer0_inst_n_55),
        .\M2[22]_0 (layer0_inst_n_3),
        .\M2[24]_0 (layer0_inst_n_58),
        .\M2[29]_0 (layer0_inst_n_51),
        .\M2[29]_1 (layer0_inst_n_59),
        .\M2[3]_0 (layer0_inst_n_36),
        .\M2[3]_1 (layer0_inst_n_33),
        .\M2[4]_0 (layer0_inst_n_4),
        .\M2[4]_1 (layer0_inst_n_8),
        .\M2[4]_2 (layer0_inst_n_10),
        .\M2[4]_3 (layer0_inst_n_12),
        .\M2[5]_0 (layer0_inst_n_13),
        .\M2[5]_1 (layer0_inst_n_7),
        .\M2[5]_2 (layer0_inst_n_9),
        .\M2[7]_0 (layer0_inst_n_41),
        .\M2[7]_1 (layer0_inst_n_39),
        .\M2[7]_2 (layer0_inst_n_42),
        .\M2[9]_0 (layer0_inst_n_23),
        .M2_0_sp_1(layer0_inst_n_20),
        .M2_10_sp_1(layer0_inst_n_37),
        .M2_13_sp_1(layer0_inst_n_17),
        .M2_15_sp_1(layer0_inst_n_53),
        .M2_16_sp_1(layer0_inst_n_16),
        .M2_18_sp_1(layer0_inst_n_43),
        .M2_21_sp_1(layer0_inst_n_34),
        .M2_22_sp_1(layer0_inst_n_19),
        .M2_24_sp_1(layer0_inst_n_57),
        .M2_26_sp_1(layer0_inst_n_35),
        .M2_28_sp_1(layer0_inst_n_60),
        .M2_29_sp_1(layer0_inst_n_52),
        .M2_3_sp_1(layer0_inst_n_21),
        .M2_4_sp_1(layer0_inst_n_38),
        .M2_5_sp_1(layer0_inst_n_11),
        .M2_7_sp_1(layer0_inst_n_40),
        .M2_9_sp_1(layer0_inst_n_24),
        .sel(sel));
endmodule
