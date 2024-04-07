module VgaNumberMax6(
	input [31:0] x,
	input [31:0] y,
	input int number,
	input byte background [11:0][16:0],
	input [3:0] background_red,
	input [3:0] background_green,
	input [3:0] background_blue,
	output reg [3:0] red,
	output reg [3:0] green,
	output reg [3:0] blue
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
//			default: begin
//				red   <= red0;
//				green <= green0;
//				blue  <= blue0;
//			end
//		endcase
//	end

endmodule
