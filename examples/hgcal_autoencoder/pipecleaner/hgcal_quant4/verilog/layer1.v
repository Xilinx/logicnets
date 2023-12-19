module layer1 (input [255:0] M0, output [31:0] M1);

wire [7:0] layer1_N0_wire = {M0[251], M0[250], M0[245], M0[244], M0[205], M0[204], M0[153], M0[152]};
layer1_N0 layer1_N0_inst (.M0(layer1_N0_wire), .M1(M1[1:0]));

wire [7:0] layer1_N1_wire = {M0[167], M0[166], M0[79], M0[78], M0[45], M0[44], M0[11], M0[10]};
layer1_N1 layer1_N1_inst (.M0(layer1_N1_wire), .M1(M1[3:2]));

wire [7:0] layer1_N2_wire = {M0[227], M0[226], M0[155], M0[154], M0[41], M0[40], M0[15], M0[14]};
layer1_N2 layer1_N2_inst (.M0(layer1_N2_wire), .M1(M1[5:4]));

wire [7:0] layer1_N3_wire = {M0[237], M0[236], M0[229], M0[228], M0[219], M0[218], M0[65], M0[64]};
layer1_N3 layer1_N3_inst (.M0(layer1_N3_wire), .M1(M1[7:6]));

wire [7:0] layer1_N4_wire = {M0[155], M0[154], M0[127], M0[126], M0[83], M0[82], M0[31], M0[30]};
layer1_N4 layer1_N4_inst (.M0(layer1_N4_wire), .M1(M1[9:8]));

wire [7:0] layer1_N5_wire = {M0[107], M0[106], M0[97], M0[96], M0[53], M0[52], M0[5], M0[4]};
layer1_N5 layer1_N5_inst (.M0(layer1_N5_wire), .M1(M1[11:10]));

wire [7:0] layer1_N6_wire = {M0[229], M0[228], M0[101], M0[100], M0[7], M0[6], M0[5], M0[4]};
layer1_N6 layer1_N6_inst (.M0(layer1_N6_wire), .M1(M1[13:12]));

wire [7:0] layer1_N7_wire = {M0[227], M0[226], M0[155], M0[154], M0[41], M0[40], M0[35], M0[34]};
layer1_N7 layer1_N7_inst (.M0(layer1_N7_wire), .M1(M1[15:14]));

wire [7:0] layer1_N8_wire = {M0[183], M0[182], M0[95], M0[94], M0[15], M0[14], M0[3], M0[2]};
layer1_N8 layer1_N8_inst (.M0(layer1_N8_wire), .M1(M1[17:16]));

wire [7:0] layer1_N9_wire = {M0[181], M0[180], M0[177], M0[176], M0[159], M0[158], M0[133], M0[132]};
layer1_N9 layer1_N9_inst (.M0(layer1_N9_wire), .M1(M1[19:18]));

wire [7:0] layer1_N10_wire = {M0[187], M0[186], M0[147], M0[146], M0[139], M0[138], M0[103], M0[102]};
layer1_N10 layer1_N10_inst (.M0(layer1_N10_wire), .M1(M1[21:20]));

wire [7:0] layer1_N11_wire = {M0[247], M0[246], M0[191], M0[190], M0[163], M0[162], M0[151], M0[150]};
layer1_N11 layer1_N11_inst (.M0(layer1_N11_wire), .M1(M1[23:22]));

wire [7:0] layer1_N12_wire = {M0[223], M0[222], M0[203], M0[202], M0[173], M0[172], M0[17], M0[16]};
layer1_N12 layer1_N12_inst (.M0(layer1_N12_wire), .M1(M1[25:24]));

wire [7:0] layer1_N13_wire = {M0[221], M0[220], M0[181], M0[180], M0[33], M0[32], M0[11], M0[10]};
layer1_N13 layer1_N13_inst (.M0(layer1_N13_wire), .M1(M1[27:26]));

wire [7:0] layer1_N14_wire = {M0[239], M0[238], M0[157], M0[156], M0[155], M0[154], M0[19], M0[18]};
layer1_N14 layer1_N14_inst (.M0(layer1_N14_wire), .M1(M1[29:28]));

wire [7:0] layer1_N15_wire = {M0[167], M0[166], M0[95], M0[94], M0[67], M0[66], M0[21], M0[20]};
layer1_N15 layer1_N15_inst (.M0(layer1_N15_wire), .M1(M1[31:30]));

endmodule