module VgaDrawer
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CK1 = 5, // countdown clock 10s digit
	parameter CK2 = 6, // countdown clock 1s digit
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input clk,
	input      int row,
	input      int col,
	input int number,
	input int lives,
	input      int mario_x,
	input      int mario_y,
	input int goomba_x,
	input int goomba_y,
	input int goomba_2x,
	input int goomba_2y,
	input show_hearts,
	input byte background [11:0][16:0],
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

	reg [3:0] background_red;
	reg [3:0] background_green;
	reg [3:0] background_blue;

	wire [3:0] mario_red;
	wire [3:0] mario_green;
	wire [3:0] mario_blue;

	wire [3:0] goomba_red;
	wire [3:0] goomba_green;
	wire [3:0] goomba_blue;

	VgaMarioDrawer vgaMarioDrawer (
		.x(col - mario_x),
		.y(row - mario_y),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(mario_red),
		.green(mario_green),
		.blue(mario_blue)
	);

	wire [3:0] goomba2_red;
	wire [3:0] goomba2_green;
	wire [3:0] goomba2_blue;

	VgaGoombaDrawer vgaGoombaDrawer (
		.x(col - goomba_x),
		.y(row - goomba_y),
		.x2(col - goomba_2x),
		.y2(row - goomba_2y),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(goomba_red),
		.green(goomba_green),
		.blue(goomba_blue),
		.red2(goomba2_red),
		.green2(goomba2_green),
		.blue2(goomba2_blue)
	);

//	VgaGoombaDrawer vgaGoombaDrawer2 (
//		.x(col - goomba_2x),
//		.y(row - goomba_2y),
//		.background(background),
//		.background_red(background_red),
//		.background_green(background_green),
//		.background_blue(background_blue),
//		.red(goomba2_red),
//		.green(goomba2_green),
//		.blue(goomba2_blue)
//	);

	VgaEnvironmentDrawer #(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.CK1(CK1),
		.CK2(CK2),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaEnvironmentDrawer (
		.clk(clk),
		.col(col),
		.row(row),
		.number(number),
		.show_hearts(show_hearts),
		.lives(lives),
		.background(background),
		.red(background_red),
		.green(background_green),
		.blue(background_blue)
	);

	always @(col, row) begin
		if (col >= mario_x && col <= mario_x + CHARACTER_WIDTH
			&& row >= mario_y && row <= mario_y + CHARACTER_WIDTH
		) begin
			red <= mario_red;
			green <= mario_green;
			blue <= mario_blue;
		end else if(col >= goomba_x && col <= goomba_x + CHARACTER_WIDTH
			&& row >= goomba_y && row <= goomba_y + CHARACTER_WIDTH
		) begin 
			red <= goomba_red;
			green <= goomba_green;
			blue <= goomba_blue;
		end else if(col >= goomba_2x && col <= goomba_2x + CHARACTER_WIDTH
			&& row >= goomba_2y && row <= goomba_2y + CHARACTER_WIDTH
		) begin 
			red <= goomba2_red;
			green <= goomba2_green;
			blue <= goomba2_blue;
	end else begin
			red <= background_red;
			green <= background_green;
			blue <= background_blue;
		end
	end

endmodule

module VgaEnvironmentDrawer
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CK1 = 5, // countdown clock 10s digit
	parameter CK2 = 6, // countdown clock 1s digit
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input clk,
	input      int row,
	input      int col,
	input int number,
	input int lives,
	input show_hearts,
	input byte background [11:0][16:0],
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

	wire [31:0] x;
	wire [31:0] y;
	assign x = col % 40;
	assign y = row % 40;

	reg [3:0] background_red;
	reg [3:0] background_green;
	reg [3:0] background_blue;

	wire [3:0] coin_red;
	wire [3:0] coin_green;
	wire [3:0] coin_blue;

	VgaCoin vgaCoin(
		.x(x),
		.y(y),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(coin_red),
		.green(coin_green),
		.blue(coin_blue)
	);

	wire [3:0] heart_red;
	wire [3:0] heart_green;
	wire [3:0] heart_blue;

	VgaHeartDrawer vgaHeartDrawer(
		.x(x),
		.y(y),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(heart_red),
		.green(heart_green),
		.blue(heart_blue)
	);

//	wire [3:0] number_tens_red;
//	wire [3:0] number_tens_green;
//	wire [3:0] number_tens_blue;
//
//	VgaNumberMax6 vgaNumberTensDigit(
//	 	.x(col % 40),
//	 	.y(row % 40),
//	 	.number(number / 10),
//	 	.background(background),
//	 	.background_red(background_red),
//	 	.background_green(background_green),
//	 	.background_blue(background_blue),
//	 	.red(number_tens_red),
//	 	.green(number_tens_green),
//	 	.blue(number_tens_blue)
//	);
//
//	wire [3:0] number_ones_red;
//	wire [3:0] number_ones_green;
//	wire [3:0] number_ones_blue;
//
//	VgaNumber vgaNumberOnesDigit(
//	 	.x(col % 40),
//	 	.y(row % 40),
//	 	.number(number % 10),
//		.background(background),
//	 	.background_red(background_red),
//	 	.background_green(background_green),
//	 	.background_blue(background_blue),
//	 	.red(number_ones_red),
//	 	.green(number_ones_green),
//	 	.blue(number_ones_blue)
//	);

	wire [3:0] red0;
	wire [3:0] green0;
	wire [3:0] blue0;

	Number0 number0(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red0),
		.green(green0),
		.blue(blue0)
	);

	wire [3:0] red1;
	wire [3:0] green1;
	wire [3:0] blue1;

	Number1 number1(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red1),
		.green(green1),
		.blue(blue1)
	);

	wire [3:0] red2;
	wire [3:0] green2;
	wire [3:0] blue2;

	Number2 number2(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red2),
		.green(green2),
		.blue(blue2)
	);

	wire [3:0] red3;
	wire [3:0] green3;
	wire [3:0] blue3;

	Number3 number3(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red3),
		.green(green3),
		.blue(blue3)
	);

	wire [3:0] red4;
	wire [3:0] green4;
	wire [3:0] blue4;

	Number4 number4(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red4),
		.green(green4),
		.blue(blue4)
	);

	wire [3:0] red5;
	wire [3:0] green5;
	wire [3:0] blue5;

	Number5 number5(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red5),
		.green(green5),
		.blue(blue5)
	);

	wire [3:0] red6;
	wire [3:0] green6;
	wire [3:0] blue6;

	Number6 number6(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red6),
		.green(green6),
		.blue(blue6)
	);

	wire [3:0] red7;
	wire [3:0] green7;
	wire [3:0] blue7;

	Number7 number7(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red7),
		.green(green7),
		.blue(blue7)
	);

	wire [3:0] red8;
	wire [3:0] green8;
	wire [3:0] blue8;

	Number8 number8(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red8),
		.green(green8),
		.blue(blue8)
	);

	wire [3:0] red9;
	wire [3:0] green9;
	wire [3:0] blue9;

	Number9 number9(
		.x(x),
		.y(y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(red9),
		.green(green9),
		.blue(blue9)
	);

	always @(col, row) begin
		if (background[row / BLOCK_WIDTH][col/ BLOCK_WIDTH] == GND) begin
				background_red   <= 4'h0;
				background_green <= 4'hf;
				background_blue  <= 4'h2;
		end else if (background[row / BLOCK_WIDTH][col/ BLOCK_WIDTH] == SKY) begin
				background_red   <= 4'd0;
				background_green <= 4'd9;
				background_blue  <= 4'd15;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == BLK) begin
				background_red   <= 4'd8;
				background_green <= 4'd4;
				background_blue  <= 4'd3;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == BDR) begin
				background_red   <= 4'h0;
				background_green <= 4'h0;
				background_blue  <= 4'h0;
		end else if(background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == TKN) begin
				background_red   <= 4'd0;
				background_green <= 4'd9;
				background_blue  <= 4'd15;
		end else if(background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == CK1) begin
				background_red   <= 4'd0;
				background_green <= 4'd0;
				background_blue  <= 4'd0;
		end else if(background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == CK2) begin
				background_red   <= 4'd0;
				background_green <= 4'd0;
				background_blue  <= 4'd0;
		end else begin
			background_red   <= 4'h0;
			background_green <= 4'h0;
			background_blue  <= 4'h0;
		end
	end

	always @(col, row) begin
		if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == TKN) begin
			red <= coin_red;
			green <= coin_green;
			blue <= coin_blue;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == CK1) begin
//			red <= 0;
//			green <= 0;
//			blue <= 0;
			case (number / 10)
				0: begin
					red   <= red0;
					green <= green0;
					blue  <= blue0;
				end
				1: begin
					red   <= red1;
					green <= green1;
					blue  <= blue1;
				end
				2: begin
					red   <= red2;
					green <= green2;
					blue  <= blue2;
				end
				default: begin
					red <= red0;
					green <= green0;
					blue <= blue0;
				end
			endcase
//			red <= number_tens_red;
//			green <= number_tens_green;
//			blue <= number_tens_blue;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == CK2) begin
			case (number % 10)
				0: begin
					red   <= red0;
					green <= green0;
					blue  <= blue0;
				end
				1: begin
					red   <= red1;
					green <= green1;
					blue  <= blue1;
				end
				2: begin
					red   <= red2;
					green <= green2;
					blue  <= blue2;
				end
				3: begin
					red   <= red3;
					green <= green3;
					blue  <= blue3;
				end
				4: begin
					red   <= red4;
					green <= green4;
					blue  <= blue4;
				end
				5: begin
					red   <= red5;
					green <= green5;
					blue  <= blue5;
				end
				6: begin
					red   <= red6;
					green <= green6;
					blue  <= blue6;
				end
				7: begin
					red   <= red7;
					green <= green7;
					blue  <= blue7;
				end
				8: begin
					red   <= red8;
					green <= green8;
					blue  <= blue8;
				end
				9: begin
					red   <= red9;
					green <= green9;
					blue  <= blue9;
				end
			endcase
//			red <= number_ones_red;
//			green <= number_ones_green;
//			blue <= number_ones_blue;
		end
		else if (row / BLOCK_WIDTH == 0 && col / BLOCK_WIDTH == 2 && lives == 3 && show_hearts) begin
			red <= heart_red;
			green <= heart_green;
			blue <= heart_blue;
		end
		else if (row / BLOCK_WIDTH == 0 && col / BLOCK_WIDTH == 1 && lives >= 2 && show_hearts) begin
			red <= heart_red;
			green <= heart_green;
			blue <= heart_blue;
		end
		else if (row / BLOCK_WIDTH == 0 && col / BLOCK_WIDTH == 0 && lives >= 1 && show_hearts) begin
			red <= heart_red;
			green <= heart_green;
			blue <= heart_blue;
		end else begin
			red <= background_red;
			green <= background_green;
			blue <= background_blue;
		end
	end

endmodule
