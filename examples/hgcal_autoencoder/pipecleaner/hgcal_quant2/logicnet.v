module logicnet (input [127:0] M0, input clk, input rst, output[31:0] M2);
wire [127:0] M0w;
myreg #(.DataWidth(128)) layer0_reg (.data_in(M0), .clk(clk), .rst(rst), .data_out(M0w));
wire [63:0] M1;
layer0 layer0_inst (.M0(M0w), .M1(M1));
wire [63:0] M1w;
myreg #(.DataWidth(64)) layer1_reg (.data_in(M1), .clk(clk), .rst(rst), .data_out(M1w));
layer1 layer1_inst (.M0(M1w), .M1(M2));

endmodule
