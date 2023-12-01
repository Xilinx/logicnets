module layer0_N11 ( input [7:0] M0, output [1:0] M1 );

	(*rom_style = "distributed" *) reg [1:0] M1r;
	assign M1 = M1r;
	always @ (M0) begin
		case (M0)
			8'b00000000: M1r = 2'b00;
			8'b01000000: M1r = 2'b00;
			8'b10000000: M1r = 2'b00;
			8'b11000000: M1r = 2'b00;
			8'b00010000: M1r = 2'b00;
			8'b01010000: M1r = 2'b00;
			8'b10010000: M1r = 2'b00;
			8'b11010000: M1r = 2'b00;
			8'b00100000: M1r = 2'b00;
			8'b01100000: M1r = 2'b00;
			8'b10100000: M1r = 2'b00;
			8'b11100000: M1r = 2'b00;
			8'b00110000: M1r = 2'b00;
			8'b01110000: M1r = 2'b00;
			8'b10110000: M1r = 2'b00;
			8'b11110000: M1r = 2'b00;
			8'b00000100: M1r = 2'b00;
			8'b01000100: M1r = 2'b00;
			8'b10000100: M1r = 2'b00;
			8'b11000100: M1r = 2'b00;
			8'b00010100: M1r = 2'b00;
			8'b01010100: M1r = 2'b00;
			8'b10010100: M1r = 2'b00;
			8'b11010100: M1r = 2'b00;
			8'b00100100: M1r = 2'b00;
			8'b01100100: M1r = 2'b00;
			8'b10100100: M1r = 2'b00;
			8'b11100100: M1r = 2'b00;
			8'b00110100: M1r = 2'b00;
			8'b01110100: M1r = 2'b00;
			8'b10110100: M1r = 2'b00;
			8'b11110100: M1r = 2'b00;
			8'b00001000: M1r = 2'b00;
			8'b01001000: M1r = 2'b00;
			8'b10001000: M1r = 2'b00;
			8'b11001000: M1r = 2'b00;
			8'b00011000: M1r = 2'b00;
			8'b01011000: M1r = 2'b00;
			8'b10011000: M1r = 2'b00;
			8'b11011000: M1r = 2'b00;
			8'b00101000: M1r = 2'b00;
			8'b01101000: M1r = 2'b00;
			8'b10101000: M1r = 2'b00;
			8'b11101000: M1r = 2'b00;
			8'b00111000: M1r = 2'b00;
			8'b01111000: M1r = 2'b00;
			8'b10111000: M1r = 2'b00;
			8'b11111000: M1r = 2'b00;
			8'b00001100: M1r = 2'b00;
			8'b01001100: M1r = 2'b00;
			8'b10001100: M1r = 2'b00;
			8'b11001100: M1r = 2'b00;
			8'b00011100: M1r = 2'b00;
			8'b01011100: M1r = 2'b00;
			8'b10011100: M1r = 2'b00;
			8'b11011100: M1r = 2'b00;
			8'b00101100: M1r = 2'b00;
			8'b01101100: M1r = 2'b00;
			8'b10101100: M1r = 2'b00;
			8'b11101100: M1r = 2'b00;
			8'b00111100: M1r = 2'b00;
			8'b01111100: M1r = 2'b00;
			8'b10111100: M1r = 2'b00;
			8'b11111100: M1r = 2'b00;
			8'b00000001: M1r = 2'b00;
			8'b01000001: M1r = 2'b00;
			8'b10000001: M1r = 2'b00;
			8'b11000001: M1r = 2'b00;
			8'b00010001: M1r = 2'b00;
			8'b01010001: M1r = 2'b00;
			8'b10010001: M1r = 2'b00;
			8'b11010001: M1r = 2'b00;
			8'b00100001: M1r = 2'b00;
			8'b01100001: M1r = 2'b00;
			8'b10100001: M1r = 2'b00;
			8'b11100001: M1r = 2'b00;
			8'b00110001: M1r = 2'b00;
			8'b01110001: M1r = 2'b00;
			8'b10110001: M1r = 2'b00;
			8'b11110001: M1r = 2'b00;
			8'b00000101: M1r = 2'b00;
			8'b01000101: M1r = 2'b00;
			8'b10000101: M1r = 2'b00;
			8'b11000101: M1r = 2'b00;
			8'b00010101: M1r = 2'b00;
			8'b01010101: M1r = 2'b00;
			8'b10010101: M1r = 2'b00;
			8'b11010101: M1r = 2'b00;
			8'b00100101: M1r = 2'b00;
			8'b01100101: M1r = 2'b00;
			8'b10100101: M1r = 2'b00;
			8'b11100101: M1r = 2'b00;
			8'b00110101: M1r = 2'b00;
			8'b01110101: M1r = 2'b00;
			8'b10110101: M1r = 2'b00;
			8'b11110101: M1r = 2'b00;
			8'b00001001: M1r = 2'b00;
			8'b01001001: M1r = 2'b00;
			8'b10001001: M1r = 2'b00;
			8'b11001001: M1r = 2'b00;
			8'b00011001: M1r = 2'b00;
			8'b01011001: M1r = 2'b00;
			8'b10011001: M1r = 2'b00;
			8'b11011001: M1r = 2'b00;
			8'b00101001: M1r = 2'b00;
			8'b01101001: M1r = 2'b00;
			8'b10101001: M1r = 2'b00;
			8'b11101001: M1r = 2'b00;
			8'b00111001: M1r = 2'b00;
			8'b01111001: M1r = 2'b00;
			8'b10111001: M1r = 2'b00;
			8'b11111001: M1r = 2'b00;
			8'b00001101: M1r = 2'b00;
			8'b01001101: M1r = 2'b00;
			8'b10001101: M1r = 2'b00;
			8'b11001101: M1r = 2'b00;
			8'b00011101: M1r = 2'b00;
			8'b01011101: M1r = 2'b00;
			8'b10011101: M1r = 2'b00;
			8'b11011101: M1r = 2'b00;
			8'b00101101: M1r = 2'b00;
			8'b01101101: M1r = 2'b00;
			8'b10101101: M1r = 2'b00;
			8'b11101101: M1r = 2'b00;
			8'b00111101: M1r = 2'b00;
			8'b01111101: M1r = 2'b00;
			8'b10111101: M1r = 2'b00;
			8'b11111101: M1r = 2'b00;
			8'b00000010: M1r = 2'b00;
			8'b01000010: M1r = 2'b00;
			8'b10000010: M1r = 2'b00;
			8'b11000010: M1r = 2'b00;
			8'b00010010: M1r = 2'b00;
			8'b01010010: M1r = 2'b00;
			8'b10010010: M1r = 2'b00;
			8'b11010010: M1r = 2'b00;
			8'b00100010: M1r = 2'b00;
			8'b01100010: M1r = 2'b00;
			8'b10100010: M1r = 2'b00;
			8'b11100010: M1r = 2'b00;
			8'b00110010: M1r = 2'b00;
			8'b01110010: M1r = 2'b00;
			8'b10110010: M1r = 2'b00;
			8'b11110010: M1r = 2'b00;
			8'b00000110: M1r = 2'b00;
			8'b01000110: M1r = 2'b00;
			8'b10000110: M1r = 2'b00;
			8'b11000110: M1r = 2'b00;
			8'b00010110: M1r = 2'b00;
			8'b01010110: M1r = 2'b00;
			8'b10010110: M1r = 2'b00;
			8'b11010110: M1r = 2'b00;
			8'b00100110: M1r = 2'b00;
			8'b01100110: M1r = 2'b00;
			8'b10100110: M1r = 2'b00;
			8'b11100110: M1r = 2'b00;
			8'b00110110: M1r = 2'b00;
			8'b01110110: M1r = 2'b00;
			8'b10110110: M1r = 2'b00;
			8'b11110110: M1r = 2'b00;
			8'b00001010: M1r = 2'b00;
			8'b01001010: M1r = 2'b00;
			8'b10001010: M1r = 2'b00;
			8'b11001010: M1r = 2'b00;
			8'b00011010: M1r = 2'b00;
			8'b01011010: M1r = 2'b00;
			8'b10011010: M1r = 2'b00;
			8'b11011010: M1r = 2'b00;
			8'b00101010: M1r = 2'b00;
			8'b01101010: M1r = 2'b00;
			8'b10101010: M1r = 2'b00;
			8'b11101010: M1r = 2'b00;
			8'b00111010: M1r = 2'b00;
			8'b01111010: M1r = 2'b00;
			8'b10111010: M1r = 2'b00;
			8'b11111010: M1r = 2'b00;
			8'b00001110: M1r = 2'b00;
			8'b01001110: M1r = 2'b00;
			8'b10001110: M1r = 2'b00;
			8'b11001110: M1r = 2'b00;
			8'b00011110: M1r = 2'b00;
			8'b01011110: M1r = 2'b00;
			8'b10011110: M1r = 2'b00;
			8'b11011110: M1r = 2'b00;
			8'b00101110: M1r = 2'b00;
			8'b01101110: M1r = 2'b00;
			8'b10101110: M1r = 2'b00;
			8'b11101110: M1r = 2'b00;
			8'b00111110: M1r = 2'b00;
			8'b01111110: M1r = 2'b00;
			8'b10111110: M1r = 2'b00;
			8'b11111110: M1r = 2'b00;
			8'b00000011: M1r = 2'b00;
			8'b01000011: M1r = 2'b00;
			8'b10000011: M1r = 2'b00;
			8'b11000011: M1r = 2'b00;
			8'b00010011: M1r = 2'b00;
			8'b01010011: M1r = 2'b00;
			8'b10010011: M1r = 2'b00;
			8'b11010011: M1r = 2'b00;
			8'b00100011: M1r = 2'b00;
			8'b01100011: M1r = 2'b00;
			8'b10100011: M1r = 2'b00;
			8'b11100011: M1r = 2'b00;
			8'b00110011: M1r = 2'b00;
			8'b01110011: M1r = 2'b00;
			8'b10110011: M1r = 2'b00;
			8'b11110011: M1r = 2'b00;
			8'b00000111: M1r = 2'b00;
			8'b01000111: M1r = 2'b00;
			8'b10000111: M1r = 2'b00;
			8'b11000111: M1r = 2'b00;
			8'b00010111: M1r = 2'b00;
			8'b01010111: M1r = 2'b00;
			8'b10010111: M1r = 2'b00;
			8'b11010111: M1r = 2'b00;
			8'b00100111: M1r = 2'b00;
			8'b01100111: M1r = 2'b00;
			8'b10100111: M1r = 2'b00;
			8'b11100111: M1r = 2'b00;
			8'b00110111: M1r = 2'b00;
			8'b01110111: M1r = 2'b00;
			8'b10110111: M1r = 2'b00;
			8'b11110111: M1r = 2'b00;
			8'b00001011: M1r = 2'b00;
			8'b01001011: M1r = 2'b00;
			8'b10001011: M1r = 2'b00;
			8'b11001011: M1r = 2'b00;
			8'b00011011: M1r = 2'b00;
			8'b01011011: M1r = 2'b00;
			8'b10011011: M1r = 2'b00;
			8'b11011011: M1r = 2'b00;
			8'b00101011: M1r = 2'b00;
			8'b01101011: M1r = 2'b00;
			8'b10101011: M1r = 2'b00;
			8'b11101011: M1r = 2'b00;
			8'b00111011: M1r = 2'b00;
			8'b01111011: M1r = 2'b00;
			8'b10111011: M1r = 2'b00;
			8'b11111011: M1r = 2'b00;
			8'b00001111: M1r = 2'b00;
			8'b01001111: M1r = 2'b00;
			8'b10001111: M1r = 2'b00;
			8'b11001111: M1r = 2'b00;
			8'b00011111: M1r = 2'b00;
			8'b01011111: M1r = 2'b00;
			8'b10011111: M1r = 2'b00;
			8'b11011111: M1r = 2'b00;
			8'b00101111: M1r = 2'b00;
			8'b01101111: M1r = 2'b00;
			8'b10101111: M1r = 2'b00;
			8'b11101111: M1r = 2'b00;
			8'b00111111: M1r = 2'b00;
			8'b01111111: M1r = 2'b00;
			8'b10111111: M1r = 2'b00;
			8'b11111111: M1r = 2'b00;

		endcase
	end
endmodule
