module FinalProjectGameLogic
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CK1 = 5,
	parameter CK2 = 6,
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
	input vga_clock,
	input reset,
	input left_switch,
	input right_switch,
	input jump_button,
	input start_button,
	output byte background [11:0][16:0],
	output int mario_x,
	output int mario_y,
	output int goomba_x,
	output int goomba_y,
	output int seconds,
	output int lives,
	output [9:0] leds
);

	LivesCounter livesCounter
	(
		.vga_clock(vga_clock),
		.reset(reset),
		.kill(level1_lose || level2_lose || level3_lose),
		.lives(lives)
	);
	wire start_screen_vga_clock;
	wire start_screen_reset;
	wire start_screen_left_switch;
	wire start_screen_right_switch;
	wire start_screen_jump_button;
	byte start_screen_background [11:0][16:0];
	int start_screen_mario_x;
	int start_screen_mario_y;
	int start_screen_goomba_x;
	int start_screen_goomba_y;
	int start_screen_seconds;
	wire start_screen_win;
	wire start_screen_lose;
	wire [9:0] start_screen_leds;

	StartScreenDrawer startScreenDrawer
	(
		.vga_clock    (start_screen_vga_clock),
		.reset        (start_screen_reset),
		.left_switch  (start_screen_left_switch),
		.right_switch (start_screen_right_switch),
		.jump_button  (start_screen_jump_button),
		.background   (start_screen_background),
		.mario_x      (start_screen_mario_x),
		.mario_y      (start_screen_mario_y),
		.goomba_x     (start_screen_goomba_x),
		.goomba_y     (start_screen_goomba_y),
		.seconds      (start_screen_seconds),
		.win          (start_screen_win),
		.lose         (start_screen_lose),
		.leds         (start_screen_leds)
	);

	wire prelevel1_vga_clock;
	wire prelevel1_reset;
	wire prelevel1_left_switch;
	wire prelevel1_right_switch;
	wire prelevel1_jump_button;
	byte prelevel1_background [11:0][16:0];
	int prelevel1_mario_x;
	int prelevel1_mario_y;
	int prelevel1_goomba_x;
	int prelevel1_goomba_y;
	int prelevel1_seconds;
	wire prelevel1_win;
	wire prelevel1_lose;
	wire [9:0] prelevel1_leds;

	PreLevel1 prelevel1
	(
		.vga_clock    (prelevel1_vga_clock),
		.reset        (prelevel1_reset),
		.left_switch  (prelevel1_left_switch),
		.right_switch (prelevel1_right_switch),
		.jump_button  (prelevel1_jump_button),
		.background   (prelevel1_background),
		.mario_x      (prelevel1_mario_x),
		.mario_y      (prelevel1_mario_y),
		.goomba_x     (prelevel1_goomba_x),
		.goomba_y     (prelevel1_goomba_y),
		.seconds      (prelevel1_seconds),
		.win          (prelevel1_win),
		.lose         (prelevel1_lose),
		.leds         (prelevel1_leds)
	);

	wire level1_vga_clock;
	wire level1_reset;
	wire level1_left_switch;
	wire level1_right_switch;
	wire level1_jump_button;
	byte level1_background [11:0][16:0];
	int level1_mario_x;
	int level1_mario_y;
	int level1_goomba_x;
	int level1_goomba_y;
	int level1_seconds;
	wire level1_win;
	wire level1_lose;
	wire [9:0] level1_leds;

	Level1 level1
	(
		.vga_clock    (level1_vga_clock),
		.reset        (level1_reset),
		.left_switch  (level1_left_switch),
		.right_switch (level1_right_switch),
		.jump_button  (level1_jump_button),
		.background   (level1_background),
		.mario_x      (level1_mario_x),
		.mario_y      (level1_mario_y),
		.goomba_x     (level1_goomba_x),
		.goomba_y     (level1_goomba_y),
		.seconds      (level1_seconds),
		.win          (level1_win),
		.lose         (level1_lose),
		.leds         (level1_leds)
	);

	wire level2_vga_clock;
	wire level2_reset;
	wire level2_left_switch;
	wire level2_right_switch;
	wire level2_jump_button;
	byte level2_background [11:0][16:0];
	int level2_mario_x;
	int level2_mario_y;
	int level2_goomba_x;
	int level2_goomba_y;
	int level2_seconds;
	wire level2_win;
	wire level2_lose;
	wire [9:0] level2_leds;

	Level2 level2
	(
		.vga_clock    (level2_vga_clock),
		.reset        (level2_reset),
		.left_switch  (level2_left_switch),
		.right_switch (level2_right_switch),
		.jump_button  (level2_jump_button),
		.background   (level2_background),
		.mario_x      (level2_mario_x),
		.mario_y      (level2_mario_y),
		.goomba_x     (level2_goomba_x),
		.goomba_y     (level2_goomba_y),
		.seconds      (level2_seconds),
		.win          (level2_win),
		.lose         (level2_lose),
		.leds         (level2_leds)
	);

	wire level3_vga_clock;
	wire level3_reset;
	wire level3_left_switch;
	wire level3_right_switch;
	wire level3_jump_button;
	byte level3_background [11:0][16:0];
	int level3_mario_x;
	int level3_mario_y;
	int level3_goomba_x;
	int level3_goomba_y;
	int level3_seconds;
	wire level3_win;
	wire level3_lose;
	wire [9:0] level3_leds;

	Level3 level3
	(
		.vga_clock    (level3_vga_clock),
		.reset        (level3_reset),
		.left_switch  (level3_left_switch),
		.right_switch (level3_right_switch),
		.jump_button  (level3_jump_button),
		.background   (level3_background),
		.mario_x      (level3_mario_x),
		.mario_y      (level3_mario_y),
		.goomba_x     (level3_goomba_x),
		.goomba_y     (level3_goomba_y),
		.seconds      (level3_seconds),
		.win          (level3_win),
		.lose         (level3_lose),
		.leds         (level3_leds)
	);

	wire win_screen_vga_clock;
	wire win_screen_reset;
	wire win_screen_left_switch;
	wire win_screen_right_switch;
	wire win_screen_jump_button;
	byte win_screen_background [11:0][16:0];
	int win_screen_mario_x;
	int win_screen_mario_y;
	int win_screen_goomba_x;
	int win_screen_goomba_y;
	int win_screen_seconds;
	wire win_screen_win;
	wire win_screen_lose;
	wire [9:0] win_screen_leds;

	WinScreenDrawer winScreenDrawer
	(
		.vga_clock    (win_screen_vga_clock),
		.reset        (win_screen_reset),
		.left_switch  (win_screen_left_switch),
		.right_switch (win_screen_right_switch),
		.jump_button  (win_screen_jump_button),
		.background   (win_screen_background),
		.mario_x      (win_screen_mario_x),
		.mario_y      (win_screen_mario_y),
		.goomba_x     (win_screen_goomba_x),
		.goomba_y     (win_screen_goomba_y),
		.seconds      (win_screen_seconds),
		.win          (win_screen_win),
		.lose         (win_screen_lose),
		.leds         (win_screen_leds)
	);

	wire game_over_vga_clock;
	wire game_over_reset;
	wire game_over_left_switch;
	wire game_over_right_switch;
	wire game_over_jump_button;
	byte game_over_background [11:0][16:0];
	int game_over_mario_x;
	int game_over_mario_y;
	int game_over_goomba_x;
	int game_over_goomba_y;
	int game_over_seconds;
	wire game_over_win;
	wire game_over_lose;
	wire [9:0] game_over_leds;

	GameOverScreenDrawer gameOverScreenDrawer
	(
		.vga_clock    (game_over_vga_clock),
		.reset        (game_over_reset),
		.left_switch  (game_over_left_switch),
		.right_switch (game_over_right_switch),
		.jump_button  (game_over_jump_button),
		.background   (game_over_background),
		.mario_x      (game_over_mario_x),
		.mario_y      (game_over_mario_y),
		.goomba_x     (game_over_goomba_x),
		.goomba_y     (game_over_goomba_y),
		.seconds      (game_over_seconds),
		.win          (game_over_win),
		.lose         (game_over_lose),
		.leds         (game_over_leds)
	);

	enum int unsigned {
		START     = 0,
		PRELEVEL1 = 2,
		LEVEL1    = 4,
		LEVEL2    = 8,
		LEVEL3    = 16,
		WIN       = 32,
		GAME_OVER = 64
	} state;

	always @(*) begin
		start_screen_vga_clock    = vga_clock;
		start_screen_reset        = 0;
		start_screen_left_switch  = 0;
		start_screen_right_switch = 0;
		start_screen_jump_button  = 0;

		prelevel1_vga_clock    = vga_clock;
		prelevel1_reset        = 0;
		prelevel1_left_switch  = 0;
		prelevel1_right_switch = 0;
		prelevel1_jump_button  = 0;

		level1_vga_clock    = vga_clock;
		level1_reset        = 0;
		level1_left_switch  = 0;
		level1_right_switch = 0;
		level1_jump_button  = 0;

		level2_vga_clock    = vga_clock;
		level2_reset        = 0;
		level2_left_switch  = 0;
		level2_right_switch = 0;
		level2_jump_button  = 0;

		level3_vga_clock    = vga_clock;
		level3_reset        = 0;
		level3_left_switch  = 0;
		level3_right_switch = 0;
		level3_jump_button  = 0;

		win_screen_vga_clock    = vga_clock;
		win_screen_reset        = 0;
		win_screen_left_switch  = 0;
		win_screen_right_switch = 0;
		win_screen_jump_button  = 0;

		game_over_vga_clock    = vga_clock;
		game_over_reset        = 0;
		game_over_left_switch  = 0;
		game_over_right_switch = 0;
		game_over_jump_button  = 0;

		case (state)
			START: begin
				start_screen_vga_clock    = vga_clock;
				start_screen_reset        = reset;
				start_screen_left_switch  = left_switch;
				start_screen_right_switch = right_switch;
				start_screen_jump_button  = jump_button;

				background = start_screen_background;
				mario_x    = start_screen_mario_x;
				mario_y    = start_screen_mario_y;
				goomba_x   = start_screen_goomba_x;
				goomba_y   = start_screen_goomba_y;
				seconds    = start_screen_seconds;
			end
			PRELEVEL1: begin
				prelevel1_vga_clock    = vga_clock;
				prelevel1_reset        = reset;
				prelevel1_left_switch  = left_switch;
				prelevel1_right_switch = right_switch;
				prelevel1_jump_button  = jump_button;

				background = prelevel1_background;
				mario_x    = prelevel1_mario_x;
				mario_y    = prelevel1_mario_y;
				goomba_x   = prelevel1_goomba_x;
				goomba_y   = prelevel1_goomba_y;
				seconds    = prelevel1_seconds;
			end
			LEVEL1: begin
				level1_vga_clock    = vga_clock;
				level1_reset        = reset || level1_lose;
				level1_left_switch  = left_switch;
				level1_right_switch = right_switch;
				level1_jump_button  = jump_button;

				background = level1_background;
				mario_x    = level1_mario_x;
				mario_y    = level1_mario_y;
				goomba_x   = level1_goomba_x;
				goomba_y   = level1_goomba_y;
				seconds    = level1_seconds;
			end
			LEVEL2: begin
				level2_vga_clock    = vga_clock;
				level2_reset        = reset || level2_lose;
				level2_left_switch  = left_switch;
				level2_right_switch = right_switch;
				level2_jump_button  = jump_button;

				background = level2_background;
				mario_x    = level2_mario_x;
				mario_y    = level2_mario_y;
				goomba_x   = level2_goomba_x;
				goomba_y   = level2_goomba_y;
				seconds    = level2_seconds;
			end
			LEVEL3: begin
				level3_vga_clock    = vga_clock;
				level3_reset        = reset || level3_lose;
				level3_left_switch  = left_switch;
				level3_right_switch = right_switch;
				level3_jump_button  = jump_button;

				background = level3_background;
				mario_x    = level3_mario_x;
				mario_y    = level3_mario_y;
				goomba_x   = level3_goomba_x;
				goomba_y   = level3_goomba_y;
				seconds    = level3_seconds;
			end
			WIN: begin
				win_screen_vga_clock    = vga_clock;
				win_screen_reset        = reset;
				win_screen_left_switch  = left_switch;
				win_screen_right_switch = right_switch;
				win_screen_jump_button  = jump_button;

				background = win_screen_background;
				mario_x    = win_screen_mario_x;
				mario_y    = win_screen_mario_y;
				goomba_x   = win_screen_goomba_x;
				goomba_y   = win_screen_goomba_y;
				seconds    = win_screen_seconds;
			end
			GAME_OVER: begin
				game_over_vga_clock    = vga_clock;
				game_over_reset        = reset;
				game_over_left_switch  = left_switch;
				game_over_right_switch = right_switch;
				game_over_jump_button  = jump_button;

				background = game_over_background;
				mario_x    = game_over_mario_x;
				mario_y    = game_over_mario_y;
				goomba_x   = game_over_goomba_x;
				goomba_y   = game_over_goomba_y;
				seconds    = game_over_seconds;
			end
		endcase
	end

	always @(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			state <= START;
		end else begin
			case(state)
				START: begin
					if (!start_button)
						state <= LEVEL1;
					else
						state <= START;
				end
				PRELEVEL1: begin
					if (lives <= 0)
						state <= GAME_OVER;
					else if (!start_button)
						state <= LEVEL1;
					else
						state <= PRELEVEL1;
				end
				LEVEL1: begin
					if (level1_win)
						state <= LEVEL2;
					else if (level1_lose)
						state <= PRELEVEL1;
					else if (lives <= 0)
						state <= GAME_OVER;
					else
						state <= LEVEL1;
				end
				LEVEL2: begin
					if (level2_win)
						state <= LEVEL3;
					else if (level2_lose)
						state <= PRELEVEL1;
					else if (lives <= 0)
						state <= GAME_OVER;
					else
						state <= LEVEL2;
				end
				LEVEL3: begin
					if (level3_win)
						state <= WIN;
					else if (level3_lose)
						state <= PRELEVEL1;
					else if (lives <= 0)
						state <= GAME_OVER;
					else
						state <= LEVEL3;
				end
				WIN: begin
					state <= WIN;
				end
				GAME_OVER: begin
					state <= GAME_OVER;
				end
			endcase
		end
	end

	assign leds[9] = lives == 3;
	assign leds[8] = lives == 2;
	assign leds[7] = lives == 1;
	assign leds[6] = lives == 0;

endmodule
