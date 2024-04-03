module MarioUpDownMover
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
	input movement_clock,
	input reset,
	input jump,
	input byte background [11:0][16:0],
	input int mario_x,
	output int mario_y
);

	int previous_mario_y = 100;
	int mario_left;
	int mario_right;
	int mario_top;
	int mario_bottom;
    int pixels_to_jump;
    int previous_pixels_to_jump;
    int pixel_velocity;

	assign mario_left = (mario_x + 1) / BLOCK_WIDTH;
	assign mario_right = (mario_x - 1 + CHARACTER_WIDTH) / BLOCK_WIDTH;
	assign mario_top = (previous_mario_y - 1) / BLOCK_WIDTH;
	assign mario_bottom = (previous_mario_y + 1 + CHARACTER_WIDTH) / BLOCK_WIDTH;

	/*
	 * Mario is either stationary, moving up (jumping), or moving down
     * (falling).
	 */
	enum int unsigned {
		RESET      = 0,
		STATIONARY = 2,
        ABOUT_TO_JUMP = 4,
		JUMPING    = 8,
		FALLING    = 16
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
            // STATIONARY: begin
            //     next_state = STATIONARY;
            // end
            STATIONARY: begin
                if (background[mario_bottom][mario_left] != BLK
                        && background[mario_bottom][mario_right] != BLK
                        && background[mario_bottom][mario_left] != GND
                        && background[mario_bottom][mario_right] != GND)
                    next_state = FALLING;
                else if (jump)
                    next_state = JUMPING;
                else
                    next_state = STATIONARY;
            end
            ABOUT_TO_JUMP: begin
                if (background[mario_top][mario_left] == BLK
                        || background[mario_top][mario_right] == BLK
                        || background[mario_top][mario_left] == BDR
                        || background[mario_top][mario_right] == BDR
                        || mario_y <= 0)
                    next_state = STATIONARY;
                else
                    next_state = JUMPING;
            end
            JUMPING: begin
                if (pixels_to_jump <= 0)
                    next_state = STATIONARY;
                else if (background[mario_top][mario_left] == BLK
                        || background[mario_top][mario_right] == BLK
                        || background[mario_top][mario_left] == BDR
                        || background[mario_top][mario_right] == BDR
                        || mario_y <= 0)
                    next_state = STATIONARY;
                else
                    next_state = JUMPING;
            end
            FALLING: begin
                if (background[mario_bottom][mario_left] != BLK
                        && background[mario_bottom][mario_right] != BLK
                        && background[mario_bottom][mario_left] != GND
                        && background[mario_bottom][mario_right] != GND)
                    next_state = FALLING;
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
                mario_y <= 360;
                pixels_to_jump <= 150;
                pixel_velocity <= 0;
            end
            STATIONARY: begin
                mario_y <= previous_mario_y;
                pixels_to_jump <= 150;
            end
            ABOUT_TO_JUMP: begin
                mario_y <= previous_mario_y;
                pixels_to_jump <= 150;
                pixel_velocity <= 0;
            end
            JUMPING: begin
                mario_y <= previous_mario_y - 1;
                pixels_to_jump <= previous_pixels_to_jump - 1;
                pixel_velocity <= 0;
            end
            FALLING: begin
                mario_y <= previous_mario_y + 1;
                pixels_to_jump <= 150;
                pixel_velocity <= 0;
            end
        endcase
    end

	always_ff@(posedge movement_clock or negedge reset) begin
		if (!reset) begin
			previous_mario_y <= 360;
            previous_pixels_to_jump <= 150;
        end else begin
			if (state == RESET) begin
				previous_mario_y <= 360;
                previous_pixels_to_jump <= 150;
            end else if (state == ABOUT_TO_JUMP) begin
                previous_mario_y <= mario_y;
                previous_pixels_to_jump <= 150;
            end else if (state == JUMPING) begin
                previous_mario_y <= mario_y;
                previous_pixels_to_jump <= pixels_to_jump;
            end else begin
				previous_mario_y <= mario_y;
                previous_pixels_to_jump <= 150;
            end
		end
	end

	/*
	 * Net state transition.
	 */
	always_ff@(posedge movement_clock or negedge reset) begin
		if(~reset)
			state <= RESET;
		else
			state <= next_state;
	end

endmodule
