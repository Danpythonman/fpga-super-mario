module MarioMover
(
	input vga_clock,
	input left,
	input right,
	input jump,
	output reg [31:0] mario_x,
	output reg [31:0] mario_y,
	output [8:0] leds
);

	localparam MARIO_WIDTH = 42;

	wire movement_clock;

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
			mario_x <= 0;
			mario_y <= 360;
			leds = 10'b100000000;
		end else if (left) begin
			if (mario_x == 0) begin
				// do nothing
				leds = 10'b010000000;
			end else begin
				mario_x = mario_x - 1;
				leds = 10'b001000000;
			end
		end else if (right) begin
			if (mario_x + MARIO_WIDTH == 640) begin
				// do nothing
				leds = 10'b000100000;
			end else begin
				mario_x = mario_x + 1;
				leds = 10'b000010000;
			end
		end else begin
			// do nothing
			leds = 10'b000001000;
		end
	end

endmodule
