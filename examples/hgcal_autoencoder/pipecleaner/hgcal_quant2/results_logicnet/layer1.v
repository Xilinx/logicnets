module layer1 (input [63:0] M0, output [31:0] M1);

wire [7:0] layer1_N0_wire = {M0[47], M0[46], M0[41], M0[40], M0[35], M0[34], M0[21], M0[20]};
layer1_N0 layer1_N0_inst (.M0(layer1_N0_wire), .M1(M1[1:0]));

wire [7:0] layer1_N1_wire = {M0[45], M0[44], M0[33], M0[32], M0[17], M0[16], M0[1], M0[0]};
layer1_N1 layer1_N1_inst (.M0(layer1_N1_wire), .M1(M1[3:2]));

wire [7:0] layer1_N2_wire = {M0[57], M0[56], M0[55], M0[54], M0[39], M0[38], M0[9], M0[8]};
layer1_N2 layer1_N2_inst (.M0(layer1_N2_wire), .M1(M1[5:4]));

wire [7:0] layer1_N3_wire = {M0[41], M0[40], M0[39], M0[38], M0[21], M0[20], M0[1], M0[0]};
layer1_N3 layer1_N3_inst (.M0(layer1_N3_wire), .M1(M1[7:6]));

wire [7:0] layer1_N4_wire = {M0[63], M0[62], M0[61], M0[60], M0[17], M0[16], M0[9], M0[8]};
layer1_N4 layer1_N4_inst (.M0(layer1_N4_wire), .M1(M1[9:8]));

wire [7:0] layer1_N5_wire = {M0[37], M0[36], M0[23], M0[22], M0[5], M0[4], M0[3], M0[2]};
layer1_N5 layer1_N5_inst (.M0(layer1_N5_wire), .M1(M1[11:10]));

wire [7:0] layer1_N6_wire = {M0[59], M0[58], M0[57], M0[56], M0[37], M0[36], M0[31], M0[30]};
layer1_N6 layer1_N6_inst (.M0(layer1_N6_wire), .M1(M1[13:12]));

wire [7:0] layer1_N7_wire = {M0[47], M0[46], M0[37], M0[36], M0[29], M0[28], M0[5], M0[4]};
layer1_N7 layer1_N7_inst (.M0(layer1_N7_wire), .M1(M1[15:14]));

wire [7:0] layer1_N8_wire = {M0[61], M0[60], M0[23], M0[22], M0[9], M0[8], M0[1], M0[0]};
layer1_N8 layer1_N8_inst (.M0(layer1_N8_wire), .M1(M1[17:16]));

wire [7:0] layer1_N9_wire = {M0[29], M0[28], M0[21], M0[20], M0[9], M0[8], M0[5], M0[4]};
layer1_N9 layer1_N9_inst (.M0(layer1_N9_wire), .M1(M1[19:18]));

wire [7:0] layer1_N10_wire = {M0[27], M0[26], M0[23], M0[22], M0[19], M0[18], M0[7], M0[6]};
layer1_N10 layer1_N10_inst (.M0(layer1_N10_wire), .M1(M1[21:20]));

wire [7:0] layer1_N11_wire = {M0[57], M0[56], M0[53], M0[52], M0[41], M0[40], M0[11], M0[10]};
layer1_N11 layer1_N11_inst (.M0(layer1_N11_wire), .M1(M1[23:22]));

wire [7:0] layer1_N12_wire = {M0[49], M0[48], M0[43], M0[42], M0[29], M0[28], M0[17], M0[16]};
layer1_N12 layer1_N12_inst (.M0(layer1_N12_wire), .M1(M1[25:24]));

wire [7:0] layer1_N13_wire = {M0[51], M0[50], M0[43], M0[42], M0[41], M0[40], M0[15], M0[14]};
layer1_N13 layer1_N13_inst (.M0(layer1_N13_wire), .M1(M1[27:26]));

wire [7:0] layer1_N14_wire = {M0[39], M0[38], M0[37], M0[36], M0[31], M0[30], M0[19], M0[18]};
layer1_N14 layer1_N14_inst (.M0(layer1_N14_wire), .M1(M1[29:28]));

wire [7:0] layer1_N15_wire = {M0[55], M0[54], M0[31], M0[30], M0[27], M0[26], M0[3], M0[2]};
layer1_N15 layer1_N15_inst (.M0(layer1_N15_wire), .M1(M1[31:30]));

endmodule