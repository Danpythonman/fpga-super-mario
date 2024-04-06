module GoombaLeftRightMover
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
	input movement_clock,
	input reset,
	input byte background [11:0][16:0],
	input int mario_x,
	input int mario_y,
	input int goomba_y,
	output int goomba_x,
	output logic lose
);

	int previous_goomba_x = 100;
	int goomba_left;
	int goomba_right;
	int goomba_top;
	int goomba_bottom;

	assign goomba_left = (previous_goomba_x - 1) / BLOCK_WIDTH;
	assign goomba_right = (previous_goomba_x + 1 + CHARACTER_WIDTH) / BLOCK_WIDTH;
	assign goomba_top = goomba_y / BLOCK_WIDTH;
	assign goomba_bottom = (goomba_y + CHARACTER_WIDTH - 1) / BLOCK_WIDTH;

	/*
	 * Goomba is either stationary, moving left, or moving right.
	 */
	enum int unsigned {
		RESET = 0,
		LEFT  = 4,
		RIGHT = 8,
		LOSE  = 16
	} state, next_state;

	/*
	 * Deciding next state.
	 */
	always_ff@(posedge movement_clock) begin
		next_state = RESET;
		case(state)
			RESET: begin
				next_state = RIGHT;
			end
			LEFT: begin
				if (mario_x + CHARACTER_WIDTH >= goomba_x
					&& mario_x <= goomba_x + CHARACTER_WIDTH
					&& mario_y + CHARACTER_WIDTH >= goomba_y)
					next_state = LOSE;
				else if (background[goomba_top][goomba_left] == BLK 
						|| background[goomba_bottom][goomba_left] == BLK
						|| goomba_x <= 0)
					next_state = RIGHT;
				else
					next_state = LEFT;
			end
			RIGHT: begin
				if (mario_x + CHARACTER_WIDTH >= goomba_x
					&& mario_x <= goomba_x + CHARACTER_WIDTH
					&& mario_y + CHARACTER_WIDTH >= goomba_y)
					next_state = LOSE;
				else if (background[goomba_top][goomba_right] == BLK 
						|| background[goomba_bottom][goomba_right] == BLK 
						|| goomba_x + CHARACTER_WIDTH >= SCREEN_WIDTH)
					next_state = LEFT;
				else
					next_state = RIGHT;
			end
			LOSE: begin
				next_state = LOSE;
			end
		endcase
	end

	/*
	 * Deciding outputs. This is a Moore-type FSM because outputs are dependant
	 * on state.
	 */
	always_ff@(posedge movement_clock) begin
		case(state)
			RESET: begin
				lose <= 0;
				goomba_x <= 300;
			end
			LEFT: begin
				lose <= 0;
				goomba_x <= previous_goomba_x - 1;
			end
			RIGHT: begin
				lose <= 0;
				goomba_x <= previous_goomba_x + 1;
			end
			LOSE: begin
				lose <= 1;
				goomba_x <= goomba_x;
			end
		endcase
	end

	always_ff@(posedge movement_clock or negedge reset) begin
		if (!reset)
			previous_goomba_x <= 100;
		else begin
			if (state == RESET)
				previous_goomba_x <= 100;
			else
				previous_goomba_x <= goomba_x;
		end
	end

	/*
	 * Net state transition.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		if(~reset)
			state <= RIGHT;
		else
			state <= next_state;
	end

endmodule
