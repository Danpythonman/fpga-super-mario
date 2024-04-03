module VgaInterface
#(
	parameter BDR = 0, // border
	parameter SKY = 1, // sky
	parameter BLK = 2, // block
	parameter GND = 3, // ground
	parameter TKN = 4, // coin
	parameter CLK = 5, // countdown clock
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input vga_clock,
	input reset,
	input int mario_x,
	input int mario_y,
	input int goomba_x,
	input int goomba_y,
	input byte background [11:0][16:0],

	output hsync,
	output vsync,
	output reg [3:0] vga_red,
	output reg [3:0] vga_green,
	output reg [3:0] vga_blue
);

	int row;
	int column;
	wire display_enable;
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

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

	/*
	 * Draws to the screen.
	 */
	VgaDrawer
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.CLK(CLK),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaDrawer (
		.clk(vga_clock),
		.row(row),
		.col(column),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.background(background),
		.red(red),
		.green(green),
		.blue(blue)
	);

	/*
	 * Only write colors to a pixel if display is enabled.
	 */
	always @(posedge vga_clock) begin
		if (display_enable == 1'b1) begin
			vga_red   <= red;
			vga_green <= green;
			vga_blue  <= blue;
		end else begin
			vga_red   <= 4'b0000;
			vga_green <= 4'b0000;
			vga_blue  <= 4'b0000;
		end
	end

endmodule
