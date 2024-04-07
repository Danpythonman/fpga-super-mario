module GoombaMover
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
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
	input int mario_x,
	input int mario_y,
	input int goomba_x_initial,
    input int goomba_y_initial,
	output int goomba_x,
	output int goomba_y,
	output lose
);

	wire movement_clock;

	MovementClock movementClock
	(
		.vga_clock(vga_clock),
		.movement_clock(movement_clock)
	);

	// assign goomba_y = 360;

	wire mario_hit_goomba;
	assign lose = mario_hit_goomba;

	GoombaLeftRightMover
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) goombaLeftRightMover (
		.movement_clock(movement_clock),
		.background(background),
		.reset(reset),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x_initial(goomba_x_initial),
        .goomba_y_initial(goomba_y_initial),
		.goomba_y(goomba_y),
		.goomba_x(goomba_x),
		.lose(mario_hit_goomba)
	);

endmodule
