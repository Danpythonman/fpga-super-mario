module FinalProjectVgaLogic
#(
	parameter BDR = 0, // border
	parameter SKY = 1, // sky
	parameter BLK = 2, // block
	parameter GND = 3, // ground
	parameter TKN = 4, // coin
	parameter CK1 = 5, // countdown clock 10s digit
	parameter CK2 = 6, // countdown clock 1s digit
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input vga_clock,
	input reset,
	input int number,
	input int mario_x,
	input int mario_y,
	input int goomba_x,
	input int goomba_y,
	input byte background [11:0][16:0],
	input int row,
	input int column,
	input wire display_enable,
	output [3:0] vga_red,
	output [3:0] vga_green,
	output [3:0] vga_blue,
	output [9:0] leds
);

	VgaInterface
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.CK1(CK1),
		.CK2(CK1),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaInterface (
		.vga_clock(vga_clock),
		.reset(reset),
		.number(number),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue),
		.leds(leds)
	);

endmodule
