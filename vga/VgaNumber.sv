module VgaNumber(
	input [31:0] x,
	input [31:0] y,
	input int number,
	input byte background [11:0][16:0],
	input [3:0] background_red,
	input [3:0] background_green,
	input [3:0] background_blue,
	output [3:0] red,
	output [3:0] green,
	output [3:0] blue
);

	assign red = 0;
	assign green = 0;
	assign blue = 0;

//	wire [3:0] red0;
//	wire [3:0] green0;
//	wire [3:0] blue0;
//
//	Number0 number0(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red0),
//		.green(green0),
//		.blue(blue0)
//	);
//
//	wire [3:0] red1;
//	wire [3:0] green1;
//	wire [3:0] blue1;
//
//	Number1 number1(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red1),
//		.green(green1),
//		.blue(blue1)
//	);
//
//	wire [3:0] red2;
//	wire [3:0] green2;
//	wire [3:0] blue2;
//
//	Number2 number2(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red2),
//		.green(green2),
//		.blue(blue2)
//	);
//
//	wire [3:0] red3;
//	wire [3:0] green3;
//	wire [3:0] blue3;
//
//	Number3 number3(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red3),
//		.green(green3),
//		.blue(blue3)
//	);
//
//	wire [3:0] red4;
//	wire [3:0] green4;
//	wire [3:0] blue4;
//
//	Number4 number4(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red4),
//		.green(green4),
//		.blue(blue4)
//	);
//
//	wire [3:0] red5;
//	wire [3:0] green5;
//	wire [3:0] blue5;
//
//	Number5 number5(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red5),
//		.green(green5),
//		.blue(blue5)
//	);
//
//	wire [3:0] red6;
//	wire [3:0] green6;
//	wire [3:0] blue6;
//
//	Number6 number6(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red6),
//		.green(green6),
//		.blue(blue6)
//	);
//
//	wire [3:0] red7;
//	wire [3:0] green7;
//	wire [3:0] blue7;
//
//	Number7 number7(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red7),
//		.green(green7),
//		.blue(blue7)
//	);
//
//	wire [3:0] red8;
//	wire [3:0] green8;
//	wire [3:0] blue8;
//
//	Number8 number8(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red8),
//		.green(green8),
//		.blue(blue8)
//	);
//
//	wire [3:0] red9;
//	wire [3:0] green9;
//	wire [3:0] blue9;
//
//	Number9 number9(
//		.x(x),
//		.y(y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(red9),
//		.green(green9),
//		.blue(blue9)
//	);
//
//	always @(number) begin
//		case (number)
//			0: begin
//				red   <= red0;
//				green <= green0;
//				blue  <= blue0;
//			end
//			1: begin
//				red   <= red1;
//				green <= green1;
//				blue  <= blue1;
//			end
//			2: begin
//				red   <= red2;
//				green <= green2;
//				blue  <= blue2;
//			end
//			3: begin
//				red   <= red3;
//				green <= green3;
//				blue  <= blue3;
//			end
//			4: begin
//				red   <= red4;
//				green <= green4;
//				blue  <= blue4;
//			end
//			5: begin
//				red   <= red5;
//				green <= green5;
//				blue  <= blue5;
//			end
//			6: begin
//				red   <= red6;
//				green <= green6;
//				blue  <= blue6;
//			end
//			7: begin
//				red   <= red7;
//				green <= green7;
//				blue  <= blue7;
//			end
//			8: begin
//				red   <= red8;
//				green <= green8;
//				blue  <= blue8;
//			end
//			9: begin
//				red   <= red9;
//				green <= green9;
//				blue  <= blue9;
//			end
//		endcase
//	end

endmodule
