module GoombaLeftRightMover
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40,
	parameter STARTX = 300
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

	int previous_goomba_x = STARTX;
	int goomba_left;
	int goomba_right;
	int goomba_top;
	int goomba_bottom;

	assign goomba_left = (goomba_x - 1) / BLOCK_WIDTH;
	assign goomba_right = (goomba_x + 1 + CHARACTER_WIDTH) / BLOCK_WIDTH;
	assign goomba_top = goomba_y / BLOCK_WIDTH;
	assign goomba_bottom = (goomba_y + CHARACTER_WIDTH - 1) / BLOCK_WIDTH;

	/*
	 * Goomba is either stationary, moving left, or moving right.
	 */
	enum int unsigned {
		RESET = 0,
		LEFT  = 2,
		RIGHT = 4,
		KILL  = 8,
		LOSE  = 16
	} state, next_state;

	/*
	 * Deciding next state.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		if (!reset) begin
			state <= RESET;
		end else begin
			case(state)
				RESET: begin
					state <= RIGHT;
				end
				LEFT: begin
					if (mario_x + CHARACTER_WIDTH >= goomba_x
							&& mario_x <= goomba_x + CHARACTER_WIDTH
							&& mario_y + CHARACTER_WIDTH == goomba_y)
						state <= KILL;
					else if (mario_x + CHARACTER_WIDTH >= goomba_x
							&& mario_x <= goomba_x + CHARACTER_WIDTH
							&& mario_y + CHARACTER_WIDTH >= goomba_y)
						state <= LOSE;
					else if (background[goomba_top][goomba_left] == BLK 
							|| background[goomba_bottom][goomba_left] == BLK
							|| goomba_x <= 0)
						state <= RIGHT;
					else
						state <= LEFT;
				end
				RIGHT: begin
					if (mario_x + CHARACTER_WIDTH >= goomba_x
							&& mario_x <= goomba_x + CHARACTER_WIDTH
							&& mario_y + CHARACTER_WIDTH == goomba_y)
						state <= KILL;
					else if  (mario_x + CHARACTER_WIDTH >= goomba_x
							&& mario_x <= goomba_x + CHARACTER_WIDTH
							&& mario_y + CHARACTER_WIDTH >= goomba_y)
						state <= LOSE;
					else if (background[goomba_top][goomba_right] == BLK 
							|| background[goomba_bottom][goomba_right] == BLK 
							|| goomba_x + CHARACTER_WIDTH >= SCREEN_WIDTH)
						state <= LEFT;
					else
						state <= RIGHT;
				end
				KILL: begin
					state <= KILL;
				end
				LOSE: begin
					state <= LOSE;
				end
			endcase
		end
	end

	/*
	 * Deciding outputs. This is a Moore-type FSM because outputs are dependant
	 * on state.
	 */
	always_ff@(posedge movement_clock) begin
		case(state)
			RESET: begin
				lose <= 0;
				goomba_x <= STARTX;
			end
			LEFT: begin
				lose <= 0;
				goomba_x <= goomba_x - 1;
			end
			RIGHT: begin
				lose <= 0;
				goomba_x <= goomba_x + 1;
			end
			KILL: begin
				lose <= 0;
				goomba_x <= 1000; // put goomba off screen
			end
			LOSE: begin
				lose <= 1;
				goomba_x <= goomba_x;
			end
		endcase
	end

	// always_ff@(posedge movement_clock or negedge reset) begin
	// 	if (!reset)
	// 		previous_goomba_x <= 300;
	// 	else begin
	// 		if (state == RESET)
	// 			previous_goomba_x <= 300;
	// 		else
	// 			previous_goomba_x <= goomba_x;
	// 	end
	// end

	/*
	 * Next state transition.
	 */
	// always_ff@(posedge movement_clock or negedge reset) begin
	// 	if(~reset)
	// 		state <= RESET;
	// 	else
	// 		state <= next_state;
	// end

endmodule
