module VgaNumber(
	input [31:0] x,
	input [31:0] y,
	input byte background [11:0][16:0],
	input [3:0] background_red,
	input [3:0] background_green,
	input [3:0] background_blue,
	output reg [3:0] red,
	output reg [3:0] green,
	output reg [3:0] blue
);

//Number0 number0(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number1 number1(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number2 number2(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number3 number3(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number4 number4(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number5 number5(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number6 number6(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number7 number7(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

//Number8 number8(
//	.x(x),
//	.y(y),
//	.background(background),
//	.background_red(background_red),
//	.background_green(background_green),
//	.background_blue(background_blue),
//	.red(red),
//	.green(green),
//	.blue(blue)
//);

Number9 number9(
	.x(x),
	.y(y),
	.background(background),
	.background_red(background_red),
	.background_green(background_green),
	.background_blue(background_blue),
	.red(red),
	.green(green),
	.blue(blue)
);


endmodule