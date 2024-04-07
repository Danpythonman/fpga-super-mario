module WinScreenDrawer
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
	output win,
	output lose,
	output [9:0] leds
);

	assign mario_x = 1000;
	assign mario_y = 1000;
	assign goomba_x = 1000;
	assign goomba_y = 1000;
	assign seconds = 0;
	assign win = 0;
	assign lose = 0;

	assign background = '{
	'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, BDR, BDR, BDR, SKY, SKY, SKY, SKY, SKY, BDR, BDR, BDR, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR},

	'{ BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, BDR, BDR, BDR},
	'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR},

	'{ BDR, BDR, SKY, SKY, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, SKY, SKY, BDR, BDR},
	'{ BDR, BDR, SKY, SKY, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, SKY, SKY, BDR, BDR},
	'{ BDR, BDR, SKY, SKY, SKY, BDR, BDR, BDR, BDR, BDR, BDR, BDR, SKY, SKY, SKY, BDR, BDR},
	'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR}
};

/*
x (right to left)[0-16]
y (down to up)[0-11]
*/

endmodule
