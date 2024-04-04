module NumberDisplay
#(
	parameter DOT = 0
)
(
	input [3:0] in,
	output [7:0] display
);

	assign B = in[0];
	assign A = in[1];
	assign D = in[2];
	assign C = in[3];

	assign display[0] = ~((~D & ~B) | (~C & A) | (D & A) | (C & ~B) | (C & ~D & ~A) | (~C & D & B));

	assign display[1] = ~((~C & ~D) | (~C & ~A & ~B) | (~C & A & B) | (~D & ~B) | (C & ~A & B));

	assign display[2] = ~((~C & ~A) | (~C & B) | (~C & D) | (~A & B) | (C & ~D));

	assign display[3] = ~((C & ~A) | (~C & ~D & ~B) | (~D & A & B) | (D & ~A & B) | (D & A & ~B));

	// display[4] = ~((~B & ~D ) | (C & A) | (C & D) | (A & ~B))
	//          = (B + D)(A' + C')(C' + D')(A' + B)
	//          = (A'B + A'D + BC' + C'D)(A'C' + BC' + A'D' + BD')
	//          = A'A'BC' + A'BBC' + A'A"BD' + A'BBD' + A'A'C'D + A'BC'D + A'A'DD' = A'bDD' + A'BC'C' + BBC'C' + A'BC'D' + BBC'D' + A'C'C'D + BC'C'D + A'C'DD' + BC'DD'
	//          = A'BC' + A'BC' + A'BD' + A'BD' + A'C'D + A'BC'D + A'BC' + BC' + A'BC'D' + BC'D' + A'C'D + BC'D
	//          = A'BC' + A'BD' + A'BC'D + BC' + A'BC'D' + A'C'D + BC'D
	//          = A'BC' + A'BD' + A'BC' + BC' + A'C'D + BCD'
	//          = A'BC' + A'BD' + BC' + A'C'D + BC'D
	assign display[4] = (~A & B & ~D) | (B & ~C) | (~A & ~C & D);

	assign display[5] = ~((~A & ~B) | (C & A) | (C & ~D) | (D & A & ~B) | (~C & D & ~A));

	assign display[6] = ~((C & ~D) | (A & ~B) | (C & B) | (~D & A) | (~C & D & ~A));

	assign display[7] = ~DOT;

endmodule
