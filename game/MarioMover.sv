module MarioMover
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter MARIO_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input vga_clock,
	input left,
	input right,
	input jump,
	input byte background [11:0][16:0],
	output reg [31:0] mario_x,
	output reg [31:0] mario_y,
	output [8:0] leds
);

	wire movement_clock;

	reg [31:0] jump_juice = 0;

	MovementClock movementClock
	(
		.vga_clock(vga_clock),
		.movement_clock(movement_clock)
	);

	initial begin
		mario_x = 0;
		mario_y = 360;
	end

	always @(posedge movement_clock) begin
		if (left && right) begin
			// do nothing
			mario_x = 0;
			mario_y = 360;
			leds = 10'b100000000;
		end else if (left) begin
			if (background[mario_y / BLOCK_WIDTH][(mario_x - 1) / BLOCK_WIDTH] == BLK 
			|| background[(mario_y + MARIO_WIDTH) / BLOCK_WIDTH][(mario_x - 1) / BLOCK_WIDTH] == BLK
			|| mario_x == 0) begin
				// do nothing
				leds = 10'b010000000;
			end else begin
				mario_x = mario_x - 1;
				leds = 10'b001000000;
			end
		end else if (right) begin
			if (background[mario_y / BLOCK_WIDTH][(mario_x + 1 + MARIO_WIDTH) / BLOCK_WIDTH] == BLK 
			|| background[(mario_y + MARIO_WIDTH) / BLOCK_WIDTH][(mario_x + 1 + MARIO_WIDTH) / BLOCK_WIDTH] == BLK 
			|| mario_x + MARIO_WIDTH == SCREEN_WIDTH) begin
				// do nothing
				leds = 10'b000100000;
			end else begin
				mario_x = mario_x + 1;
				leds = 10'b000010000;
			end
		end

		if (~jump)begin
			if (jump_juice == 0) begin
				jump_juice = 200;
			end
		end

		if (jump_juice > 0) begin
			if (background[(mario_y - 1) / BLOCK_WIDTH][mario_x / BLOCK_WIDTH] != BLK
				&& background[(mario_y - 1) / BLOCK_WIDTH][(mario_x + MARIO_WIDTH) / BLOCK_WIDTH] != BLK
				&& background[(mario_y - 1) / BLOCK_WIDTH][mario_x / BLOCK_WIDTH] != BDR
			) begin
				jump_juice = jump_juice - 1;
				mario_y = mario_y - 1;
			end else begin
				jump_juice = 0;
			end
		end else if (background[(mario_y + 1 + MARIO_WIDTH) / BLOCK_WIDTH][mario_x / BLOCK_WIDTH] != GND 
			&& background[(mario_y + 1 + MARIO_WIDTH) / BLOCK_WIDTH][mario_x / BLOCK_WIDTH] != BLK 
			&& background[(mario_y + 1 + MARIO_WIDTH) / BLOCK_WIDTH][(mario_x + MARIO_WIDTH) / BLOCK_WIDTH] != BLK
		) begin
			mario_y = mario_y + 1;
		end else begin
			// do nothing
			leds = 10'b000001000;
		end
	end

endmodule
