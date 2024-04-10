module LevelFinish
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
	output byte background [11:0][16:0],
	output int mario_x,
	output int mario_y,
	output int goomba_x,
	output int goomba_y,
	output int goomba_2x,
	output int goomba_2y,
	output int seconds,
	output reg win,
	output lose,
	output [9:0] leds
);

	assign goomba_x = 1000;
	assign goomba_y = 1000;
	assign goomba_2x = 1000;
	assign goomba_2y = 1000;

	assign background = '{
		'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
		'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
		'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

		'{ SKY, SKY, SKY, SKY, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
		'{ SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, // [15][3]

		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
	};

	assign win = mario_x >= 580;
	assign lose = 0;

//	wire seconds_done;
//
//	SecondsCounter secondsCounter
//	(
//		.vga_clock(vga_clock),
//		.reset(reset),
//		.seconds(seconds),
//		.done(seconds_done),
//		.leds(leds)
//	);

	/* TOP LEFT (of screen) IS BOTTOM RIGHT (of array)
	x (right to left)[0-16]
	y (down to up)[0-11]
	*/

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

//	logic touch;
//
//   MarioCoin
//	#(
//		.BDR(BDR),
//		.SKY(SKY),
//		.BLK(BLK),
//		.GND(GND),
//		.TKN(TKN),
//		.CHARACTER_WIDTH(CHARACTER_WIDTH),
//		.SCREEN_WIDTH(SCREEN_WIDTH),
//		.SCREEN_HEIGHT(SCREEN_HEIGHT),
//		.BLOCK_WIDTH(BLOCK_WIDTH)
//	) marioCoin1 (
//		.clk(vga_clock),
//		.reset(reset),
//		.x(15),
//		.y(3),
//		.mario_x(mario_x),
//		.mario_y(mario_y),
//		.touch(touch)
//	);
//	int number_of_coins;
//	always@(posedge vga_clock or negedge reset) begin
//		if (!reset) begin
//			win <= 0;
//			number_of_coins <= 1;
//			background <= '{
//				'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
//				'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
//				'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
//				'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
//				'{ SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
//
//				'{ SKY, SKY, SKY, SKY, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
//				'{ SKY, SKY, SKY, SKY, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
//				'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
//				'{ SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, // [15][3]
//
//				'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY }, 
//				'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
//				'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
//			};
//			// background [5][2] <= TKN;
//			// background [2][15] <= TKN;
//			// background [2][9] <= TKN;
//
//		end else begin
//			if (touch) begin
//				win <= 1;
//				background [3][15] <= SKY; // [y][x]
//				number_of_coins <= number_of_coins - 1;
//			end else begin
//				win <= 0;
//			end
//		end
//	end

////	assign win = number_of_coins == 0;
//	assign lose = 0;

endmodule
