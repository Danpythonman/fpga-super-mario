module FinalProject
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CLK = 5,
	parameter MARIO_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
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

	int mario_x;
	int mario_y;
	wire vga_clock;
	logic [2:0] touch;

	byte background [11:0][16:0] = '{
	'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
	'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
	'{ SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ BDR, CLK, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
};

/*
bottom right is top left
*/

	/*
	 * Instantiate PLL to generate VGA clock
	 */
	pll pll_inst(
		.inclk0(clock_50_mhz),
		.c0(vga_clock)
	);

	MarioMover
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.MARIO_WIDTH(MARIO_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) marioMover (
		.vga_clock(vga_clock),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y)	
	);

	VgaInterface
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.MARIO_WIDTH(MARIO_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaInterface (
		.vga_clock(vga_clock),
		.reset(reset),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.background(background),
		.hsync(hsync),
		.vsync(vsync),
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
		.MARIO_WIDTH(MARIO_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) marioCoin1(
		.clk(vga_clock),
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
		.MARIO_WIDTH(MARIO_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) marioCoin2(
		.clk(vga_clock),
		.x(1),
		.y(15),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.touch(touch[1])
	);

	always@(posedge vga_clock)begin
		if(touch[0])begin
			background [6][6] = SKY;
		end else if(touch[1])begin
			background [1][15] = SKY; // fix
		end
	end

	assign leds = touch;

endmodule