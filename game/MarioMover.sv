module MarioMover
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
	input left,
	input right,
	input jump,
	input byte background [11:0][16:0],
	output int mario_x,
	output int mario_y
);

	wire movement_clock;

	reg [31:0] jump_juice = 0;

	MovementClock movementClock
	(
		.vga_clock(vga_clock),
		.movement_clock(movement_clock)
	);

	int mario_x_intermediate;
	int mario_y_intermediate;

	MarioLeftRightMover
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
	) marioLeftRightMover (
		.movement_clock(movement_clock),
		.left(left),
		.right(right),
		.background(background),
		.reset(reset),
		.mario_y(mario_y),
		.mario_x(mario_x)
	);

	MarioUpDownMover
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
	) marioUpDownMover (
		.movement_clock(movement_clock),
		.jump(~jump),
		.background(background),
		.reset(reset),
		.mario_y(mario_y),
		.mario_x(mario_x)
	);

endmodule
