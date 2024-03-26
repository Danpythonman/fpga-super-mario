module MarioLeftRightMover
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter MARIO_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input movement_clock,
	input reset,
	input left,
	input right,
	input byte background [11:0][16:0],
	input int mario_y,
	output int mario_x
);

	int previous_mario_x = 100;
	int mario_left;
	int mario_right;
	int mario_top;
	int mario_bottom;

	assign mario_left = (previous_mario_x - 1) / BLOCK_WIDTH;
	assign mario_right = (previous_mario_x + 1 + MARIO_WIDTH) / BLOCK_WIDTH;
	assign mario_top = mario_y / BLOCK_WIDTH;
	assign mario_bottom = (mario_y + MARIO_WIDTH - 1) / BLOCK_WIDTH;

	/*
	 * Mario is either stationary, moving left, or moving right.
	 */
	enum int unsigned {
		RESET      = 0,
		STATIONARY = 2,
		LEFT       = 4,
		RIGHT      = 8
	} state, next_state;

	/*
	 * Deciding next state.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		next_state = RESET;
		case(state)
			RESET: begin
				next_state = STATIONARY;
			end
			STATIONARY: begin
				if (left && right)
					next_state = STATIONARY;
				else if (left)
					if (background[mario_top][mario_left] == BLK 
							|| background[mario_bottom][mario_left] == BLK 
							|| mario_x <= 0)
						next_state = STATIONARY;
					else
						next_state = LEFT;
				else if (right)
					if (background[mario_top][mario_right] == BLK 
							|| background[mario_bottom][mario_right] == BLK 
							|| mario_x + MARIO_WIDTH >= SCREEN_WIDTH)
						next_state = STATIONARY;
					else
						next_state = RIGHT;
				else
					next_state = STATIONARY;
			end
			LEFT: begin
				if (background[mario_top][mario_left] == BLK 
						|| background[mario_bottom][mario_left] == BLK
						|| mario_x <= 0)
					next_state = STATIONARY;
				else if (left && right)
					next_state = STATIONARY;
				else if (left)
					next_state = LEFT;
				else
					next_state = STATIONARY;
			end
			RIGHT: begin
				if (background[mario_top][mario_right] == BLK 
						|| background[mario_bottom][mario_right] == BLK 
						|| mario_x + MARIO_WIDTH >= SCREEN_WIDTH)
					next_state = STATIONARY;
				else if (left && right)
					next_state = STATIONARY;
				else if (right)
					next_state = RIGHT;
				else
					next_state = STATIONARY;
			end
		endcase
	end

	/*
	 * Deciding outputs. This is a Moore-type FSM because outputs are dependant
	 * on state.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		case(state)
			RESET: begin
				mario_x <= 100;
			end
			STATIONARY: begin
				mario_x <= previous_mario_x;
			end
			LEFT: begin
				mario_x <= previous_mario_x - 1;
			end
			RIGHT: begin
				mario_x <= previous_mario_x + 1;
			end
		endcase
	end

	always_ff@(posedge movement_clock or negedge reset) begin
		if (!reset)
			previous_mario_x <= 100;
		else begin
			if (state == RESET)
				previous_mario_x <= 100;
			else
				previous_mario_x <= mario_x;
		end
	end

	/*
	 * Net state transition.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		if(~reset)
			state <= STATIONARY;
		else
			state <= next_state;
	end

endmodule
