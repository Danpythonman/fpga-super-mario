module Level2
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CK1 = 5,
	parameter CK2 = 6,
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input vga_clock,
	input reset,
	input left_switch,
	input right_switch,
	input jump_button,
	input int row,
	input int column,
	input display_enable,
	output [3:0] vga_red,
	output [3:0] vga_green,
	output [3:0] vga_blue,
	output win,
	output lose,
	output [9:0] leds
);

	int mario_x;
	int mario_y;
	logic [2:0] touch;

	byte background [11:0][16:0] = '{
		'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
		'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
		'{ SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

		'{ SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ BDR, CK2, CK1, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
	};

	/* TOP LEFT (of screen) IS BOTTOM RIGHT (of array)
	x (right to left)[0-16]
	y (down to up)[0-11]
	*/

	int goomba_x;
	int goomba_y;
	int number_of_coins = 2;

	int seconds;
	wire seconds_done;

	SecondsCounter secondsCounter
	(
		.vga_clock(vga_clock),
		.reset(reset),
		.seconds(seconds),
		.done(seconds_done),
		.leds(leds)
	);

	MarioMover
	#(
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
	) marioMover (
		.vga_clock(vga_clock),
		.reset(reset),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y)	
	);

	wire mario_hit_goomba;

	GoombaMover
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) goombaMover (
		.vga_clock(vga_clock),
		.reset(reset),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.lose(mario_hit_goomba)
	);

	VgaInterface
	#(
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
	) vgaInterface (
		.vga_clock(vga_clock),
		.reset(reset),
		.number(seconds),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.background(background),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue)
	);

	MarioCoin
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) marioCoin1 (
		.clk(vga_clock),
		.reset(reset),
		.x(6),
		.y(6),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.touch(touch[0])
	);

	MarioCoin
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) marioCoin2 (
		.clk(vga_clock),
		.reset(reset),
		.x(14),
		.y(2),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.touch(touch[1])
	);

	always@(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			number_of_coins <= 2;
			background [6][6] <= TKN;
			background [2][14] <= TKN;
		end else begin
			if (touch[0]) begin
				background [6][6] <= SKY; // [y][x]
				number_of_coins <= number_of_coins - 1;
			end else if(touch[1])begin
				background [2][14] <= SKY; // [y][x]
				number_of_coins <= number_of_coins - 1;
			end
		end
	end

	assign win = number_of_coins == 0;
	assign lose = seconds_done || mario_hit_goomba;

endmodule
