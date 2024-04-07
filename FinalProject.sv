module FinalProject
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
	input start_button,
	output hsync,
	output vsync,
	output [3:0] vga_red,
	output [3:0] vga_green,
	output [3:0] vga_blue,
	output [9:0] leds
);

	wire display_enable;
	wire [31:0] column;
	wire [31:0] row;

	/*
	 * Signal generator. This will give us the row and column of the VGA so that
	 * we can write a color to the pixel at that coordinate. This also generates
	 * the HSYNC and VSYNC signals.
	 */
	VgaSignalGenerator vgaSignalGenerator
	(
		.pixel_clk(vga_clock),
		.reset_n(reset),           // Active low synchronous reset
		.h_sync(hsync),           // horizontal sync signal
		.v_sync(vsync),           // vertical sync signal
		.disp_ena(display_enable), // display enable (0 = all colors must be blank)
		.column(column),           // horizontal pixel coordinate
		.row(row)                  // vertical pixel coordinate
	);

	byte background [11:0][16:0];
	int mario_x;
	int mario_y;
	int goomba_x;
	int goomba_y;
	int goomba_2x;
	int goomba_2y;
	wire show_hearts;
	int lives;
	int seconds;

	FinalProjectGameLogic #(
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
	) finalProjectGameLogic (
		.vga_clock(vga_clock),
		.reset(reset),
		.left_switch(left_switch),
		.right_switch(right_switch),
		.jump_button(jump_button),
		.start_button(start_button),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.goomba_2x(goomba_2x),
		.goomba_2y(goomba_2y),
		.show_hearts(show_hearts),
		.seconds(seconds),
		.lives(lives),
		.leds(leds)
	);

	FinalProjectVgaLogic #(
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
	) finalProjectVgaLogic (
		.vga_clock(vga_clock),
		.reset(reset),
		.number(seconds),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_2x(goomba_2x),
		.goomba_2y(goomba_2y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.show_hearts(show_hearts),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue),
		.lives(lives)
		// .leds(leds)
	);

endmodule
