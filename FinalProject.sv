module FinalProject
#(
	parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
	parameter TKN = 4,
	parameter CLK = 5,
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
	output hsync,
	output vsync,
	output reg [3:0] vga_red,
	output reg [3:0] vga_green,
	output reg [3:0] vga_blue,
	output reg [9:0] leds
);

	int row;
	int column;
	wire display_enable;

	int mario_x;
	int mario_y;
	int goomba_x;
	int goomba_y;
	logic [2:0] touch;

	/*
	 * Signal generator. This will give us the row and column of the VGA so that
	 * we can write a color to the pixel at that coordinate. This also generates
	 * the HSYNC and VSYNC signals.
	 */
	VgaSignalGenerator vgaSignalGenerator
	(
		.pixel_clk(vga_clock),
		.reset_n(reset),           // Active low synchronous reset
		.h_sync(hsync),           // horizontal sync signal
		.v_sync(vsync),           // vertical sync signal
		.disp_ena(display_enable), // display enable (0 = all colors must be blank)
		.column(column),           // horizontal pixel coordinate
		.row(row)                  // vertical pixel coordinate
	);

	wire start_screen_vga_clock;
	wire start_screen_reset;
	wire start_screen_left_switch;
	wire start_screen_right_switch;
	wire start_screen_jump_button;
	wire [3:0] start_screen_vga_red;
	wire [3:0] start_screen_vga_green;
	wire [3:0] start_screen_vga_blue;
	wire [9:0] start_screen_leds;

	StartScreenDrawer startScreenDrawer
	(
		.vga_clock   (start_screen_vga_clock),
		.reset       (start_screen_reset),
		.left_switch (start_screen_left_switch),
		.right_switch(start_screen_right_switch),
		.jump_button (start_screen_jump_button),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red     (start_screen_vga_red),
		.vga_green   (start_screen_vga_green),
		.vga_blue    (start_screen_vga_blue),
		.leds        (start_screen_leds)
	);

	wire level1_vga_clock;
	wire level1_reset;
	wire level1_left_switch;
	wire level1_right_switch;
	wire level1_jump_button;
	wire [3:0] level1_vga_red;
	wire [3:0] level1_vga_green;
	wire [3:0] level1_vga_blue;
	wire [9:0] level1_leds;
	wire level1_win;
	wire level1_lose;

	Level1 level1
	(
		.vga_clock   (level1_vga_clock),
		.reset       (level1_reset),
		.left_switch (level1_left_switch),
		.right_switch(level1_right_switch),
		.jump_button (level1_jump_button),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red     (level1_vga_red),
		.vga_green   (level1_vga_green),
		.vga_blue    (level1_vga_blue),
		.win(level1_win),
		.lose(level1_lose),
		.leds        (level1_leds)
	);

	wire win_vga_clock;
	wire win_reset;
	wire win_left_switch;
	wire win_right_switch;
	wire win_jump_button;
	wire [3:0] win_vga_red;
	wire [3:0] win_vga_green;
	wire [3:0] win_vga_blue;
	wire [9:0] win_leds;

	WinScreenDrawer winScreenDrawer
	(
		.vga_clock   (win_vga_clock),
		.reset       (win_reset),
		.left_switch (win_left_switch),
		.right_switch(win_right_switch),
		.jump_button (win_jump_button),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red     (win_vga_red),
		.vga_green   (win_vga_green),
		.vga_blue    (win_vga_blue),
		.leds        (win_leds)
	);

	wire game_over_vga_clock;
	wire game_over_reset;
	wire game_over_left_switch;
	wire game_over_right_switch;
	wire game_over_jump_button;
	wire [3:0] game_over_vga_red;
	wire [3:0] game_over_vga_green;
	wire [3:0] game_over_vga_blue;
	wire [9:0] game_over_leds;

	GameOverScreenDrawer gameOverScreenDrawer
	(
		.vga_clock   (game_over_vga_clock),
		.reset       (game_over_reset),
		.left_switch (game_over_left_switch),
		.right_switch(game_over_right_switch),
		.jump_button (game_over_jump_button),
		.row(row),
		.column(column),
		.display_enable(display_enable),
		.vga_red     (game_over_vga_red),
		.vga_green   (game_over_vga_green),
		.vga_blue    (game_over_vga_blue),
		.leds        (game_over_leds)
	);

	enum int unsigned {
		START = 0,
		LEVEL1 = 2,
		WIN = 4,
		GAME_OVER = 8
	} state;

	always @(*) begin
		leds[9] <= start_button;
		case (state)
			START: begin
				leds[0] <= 1;
				leds[1] <= 0;
				leds[2] <= 1;
				start_screen_vga_clock    <= vga_clock;
				start_screen_reset        <= reset;
				start_screen_left_switch  <= left_switch;
				start_screen_right_switch <= right_switch;
				start_screen_jump_button  <= jump_button;
				level1_vga_clock    <= 0;
				level1_reset        <= 0;
				level1_left_switch  <= 0;
				level1_right_switch <= 0;
				level1_jump_button  <= 0;
				win_vga_clock    <= 0;
				win_reset        <= 0;
				win_left_switch  <= 0;
				win_right_switch <= 0;
				win_jump_button  <= 0;
				game_over_vga_clock    <= 0;
				game_over_reset        <= 0;
				game_over_left_switch  <= 0;
				game_over_right_switch <= 0;
				game_over_jump_button  <= 0;

				vga_red      <= start_screen_vga_red;
				vga_green    <= start_screen_vga_green;
				vga_blue     <= start_screen_vga_blue;
			end
			LEVEL1: begin
				leds[0] <= 0;
				leds[1] <= 1;
				start_screen_vga_clock    <= 0;
				start_screen_reset        <= 0;
				start_screen_left_switch  <= 0;
				start_screen_right_switch <= 0;
				start_screen_jump_button  <= 0;
				level1_vga_clock    <= vga_clock;
				level1_reset        <= reset;
				level1_left_switch  <= left_switch;
				level1_right_switch <= right_switch;
				level1_jump_button  <= jump_button;
				win_vga_clock    <= 0;
				win_reset        <= 0;
				win_left_switch  <= 0;
				win_right_switch <= 0;
				win_jump_button  <= 0;
				game_over_vga_clock    <= 0;
				game_over_reset        <= 0;
				game_over_left_switch  <= 0;
				game_over_right_switch <= 0;
				game_over_jump_button  <= 0;

				vga_red      <= level1_vga_red;
				vga_green    <= level1_vga_green;
				vga_blue     <= level1_vga_blue;
			end
			WIN: begin
				leds[0] <= 0;
				leds[1] <= 1;
				start_screen_vga_clock    <= 0;
				start_screen_reset        <= 0;
				start_screen_left_switch  <= 0;
				start_screen_right_switch <= 0;
				start_screen_jump_button  <= 0;
				level1_vga_clock    <= 0;
				level1_reset        <= 0;
				level1_left_switch  <= 0;
				level1_right_switch <= 0;
				level1_jump_button  <= 0;
				win_vga_clock    <= vga_clock;
				win_reset        <= reset;
				win_left_switch  <= left_switch;
				win_right_switch <= right_switch;
				win_jump_button  <= jump_button;
				game_over_vga_clock    <= 0;
				game_over_reset        <= 0;
				game_over_left_switch  <= 0;
				game_over_right_switch <= 0;
				game_over_jump_button  <= 0;

				vga_red      <= win_vga_red;
				vga_green    <= win_vga_green;
				vga_blue     <= win_vga_blue;
			end
			GAME_OVER: begin
				leds[0] <= 0;
				leds[1] <= 1;
				start_screen_vga_clock    <= 0;
				start_screen_reset        <= 0;
				start_screen_left_switch  <= 0;
				start_screen_right_switch <= 0;
				start_screen_jump_button  <= 0;
				level1_vga_clock    <= 0;
				level1_reset        <= 0;
				level1_left_switch  <= 0;
				level1_right_switch <= 0;
				level1_jump_button  <= 0;
				win_vga_clock    <= 0;
				win_reset        <= 0;
				win_left_switch  <= 0;
				win_right_switch <= 0;
				win_jump_button  <= 0;
				game_over_vga_clock    <= vga_clock;
				game_over_reset        <= reset;
				game_over_left_switch  <= left_switch;
				game_over_right_switch <= right_switch;
				game_over_jump_button  <= jump_button;

				vga_red      <= game_over_vga_red;
				vga_green    <= game_over_vga_green;
				vga_blue     <= game_over_vga_blue;
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
				LEVEL1: begin
					if (level1_win)
						state <= WIN;
					else if (level1_lose)
						state <= GAME_OVER;
					else
						state <= LEVEL1;
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

endmodule
