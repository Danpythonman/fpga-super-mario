module WinScreenDrawer
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
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
	output [9:0] leds
);

	int mario_x;
	int mario_y;
	logic [2:0] touch;

	byte background [11:0][16:0] = '{
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

	VgaInterface
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
	) vgaInterface (
		.vga_clock(vga_clock),
		.reset(reset),
		.mario_x(200),
		.mario_y(200),
		.goomba_x(1000),
		.goomba_y(1000),
		.background(background),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue)
	);

endmodule
