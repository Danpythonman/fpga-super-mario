module VgaInterface
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
	input int lives,
	input int mario_x,
	input int mario_y,
	input int goomba_x,
	input int goomba_y,
	input byte background [11:0][16:0],
	input int row,
	input int column,
	input display_enable,
	output reg [3:0] vga_red,
	output reg [3:0] vga_green,
	output reg [3:0] vga_blue,
	output reg [9:0] leds
);

	reg [31:0] count = 0;
	always @(posedge vga_clock) begin
		leds[1] = 1;
		if (count == 25_00_000) begin
			leds[0] <= ~leds[0];
			count <= 0;
		end else begin
			count <= count + 1;
		end
	end

	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

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
		.CK1(CK1),
		.CK2(CK2),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaDrawer (
		.clk(vga_clock),
		.row(row),
		.col(column),
		.number(number),
		.lives(lives),
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
	always @(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			vga_red   <= 4'b0000;
			vga_green <= 4'b0000;
			vga_blue  <= 4'b0000;
		end else begin
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
	end

endmodule
