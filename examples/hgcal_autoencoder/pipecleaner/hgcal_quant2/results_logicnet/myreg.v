module myreg #(parameter DataWidth=16) (
    input [DataWidth-1:0] data_in,
    input wire clk,
    input wire rst,
    output reg [DataWidth-1:0] data_out
    );
    always@(posedge clk) begin
    if(!rst)
        data_out<=data_in;
    else
        data_out<=0;
    end
endmodule

