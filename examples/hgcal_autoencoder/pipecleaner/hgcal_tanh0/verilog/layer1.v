module layer1 (input [255:0] M0, output [31:0] M1);

wire [7:0] layer1_N0_wire = {M0[195], M0[194], M0[169], M0[168], M0[167], M0[166], M0[91], M0[90]};
layer1_N0 layer1_N0_inst (.M0(layer1_N0_wire), .M1(M1[1:0]));

wire [7:0] layer1_N1_wire = {M0[245], M0[244], M0[147], M0[146], M0[105], M0[104], M0[7], M0[6]};
layer1_N1 layer1_N1_inst (.M0(layer1_N1_wire), .M1(M1[3:2]));

wire [7:0] layer1_N2_wire = {M0[239], M0[238], M0[187], M0[186], M0[63], M0[62], M0[59], M0[58]};
layer1_N2 layer1_N2_inst (.M0(layer1_N2_wire), .M1(M1[5:4]));

wire [7:0] layer1_N3_wire = {M0[149], M0[148], M0[115], M0[114], M0[91], M0[90], M0[47], M0[46]};
layer1_N3 layer1_N3_inst (.M0(layer1_N3_wire), .M1(M1[7:6]));

wire [7:0] layer1_N4_wire = {M0[207], M0[206], M0[171], M0[170], M0[63], M0[62], M0[33], M0[32]};
layer1_N4 layer1_N4_inst (.M0(layer1_N4_wire), .M1(M1[9:8]));

wire [7:0] layer1_N5_wire = {M0[143], M0[142], M0[111], M0[110], M0[101], M0[100], M0[71], M0[70]};
layer1_N5 layer1_N5_inst (.M0(layer1_N5_wire), .M1(M1[11:10]));

wire [7:0] layer1_N6_wire = {M0[155], M0[154], M0[141], M0[140], M0[85], M0[84], M0[27], M0[26]};
layer1_N6 layer1_N6_inst (.M0(layer1_N6_wire), .M1(M1[13:12]));

wire [7:0] layer1_N7_wire = {M0[183], M0[182], M0[135], M0[134], M0[133], M0[132], M0[1], M0[0]};
layer1_N7 layer1_N7_inst (.M0(layer1_N7_wire), .M1(M1[15:14]));

wire [7:0] layer1_N8_wire = {M0[203], M0[202], M0[103], M0[102], M0[89], M0[88], M0[79], M0[78]};
layer1_N8 layer1_N8_inst (.M0(layer1_N8_wire), .M1(M1[17:16]));

wire [7:0] layer1_N9_wire = {M0[221], M0[220], M0[175], M0[174], M0[103], M0[102], M0[25], M0[24]};
layer1_N9 layer1_N9_inst (.M0(layer1_N9_wire), .M1(M1[19:18]));

wire [7:0] layer1_N10_wire = {M0[183], M0[182], M0[107], M0[106], M0[63], M0[62], M0[23], M0[22]};
layer1_N10 layer1_N10_inst (.M0(layer1_N10_wire), .M1(M1[21:20]));

wire [7:0] layer1_N11_wire = {M0[199], M0[198], M0[163], M0[162], M0[129], M0[128], M0[91], M0[90]};
layer1_N11 layer1_N11_inst (.M0(layer1_N11_wire), .M1(M1[23:22]));

wire [7:0] layer1_N12_wire = {M0[243], M0[242], M0[197], M0[196], M0[153], M0[152], M0[83], M0[82]};
layer1_N12 layer1_N12_inst (.M0(layer1_N12_wire), .M1(M1[25:24]));

wire [7:0] layer1_N13_wire = {M0[237], M0[236], M0[207], M0[206], M0[203], M0[202], M0[187], M0[186]};
layer1_N13 layer1_N13_inst (.M0(layer1_N13_wire), .M1(M1[27:26]));

wire [7:0] layer1_N14_wire = {M0[197], M0[196], M0[175], M0[174], M0[137], M0[136], M0[123], M0[122]};
layer1_N14 layer1_N14_inst (.M0(layer1_N14_wire), .M1(M1[29:28]));

wire [7:0] layer1_N15_wire = {M0[221], M0[220], M0[219], M0[218], M0[77], M0[76], M0[75], M0[74]};
layer1_N15 layer1_N15_inst (.M0(layer1_N15_wire), .M1(M1[31:30]));

endmodule