module FinalProject
(
	input clock_50_mhz,
	input reset,
	input left_switch,
	input right_switch,
	input jump_button,
	output hsync,
	output vsync,
	output [3:0] vga_red,
	output [3:0] vga_green,
	output [3:0] vga_blue,
	output [9:0] leds
);

	wire [31:0] mario_x;
	wire [31:0] mario_y;
	wire vga_clock;

	/*
	 * Instantiate PLL to generate VGA clock
	 */
	pll pll_inst(
		.inclk0(clock_50_mhz),
		.c0(vga_clock)
	);

	MarioMover marioMover
	(
		.vga_clock(vga_clock),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.leds(leds[8:0])
	);

	VgaInterface vgaInterface
	(
		.vga_clock(vga_clock),
		.reset(reset),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.hsync(hsync),
		.vsync(vsync),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue)
	);

endmodule
