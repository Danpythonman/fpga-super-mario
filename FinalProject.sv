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
	wire vga_clock;
	logic [2:0] touch;

	byte background [11:0][16:0] = '{
	'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
	'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
	'{ SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY },
	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

	'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
	'{ BDR, CLK, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
};

/*
bottom right is top left
*/

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

	int seconds;

	SecondsCounter secondsCounter
	(
		.vga_clock(vga_clock),
		.reset(reset),
		.seconds_count(seconds)
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
		.leds        (level1_leds)
  )
	MarioMover
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
	) marioMover (
		.vga_clock(vga_clock),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.background(background),
		.mario_x(mario_x),
		.mario_y(mario_y)	
	);
	
		GoombaMover
	#(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.CHARACTER_WIDTH(CHARACTER_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) goombaMover (
		.vga_clock(vga_clock),
		.left(left_switch),
		.right(right_switch),
		.jump(jump_button),
		.background(background),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y)	
	);

	VgaInterface
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
	) vgaInterface (
		.vga_clock(vga_clock),
		.reset(reset),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.goomba_x(goomba_x),
		.goomba_y(goomba_y),
		.background(background),
		.hsync(hsync),
		.vsync(vsync),
		.vga_red(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue)
	);

	MarioCoin
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
	) marioCoin1(
		.clk(vga_clock),
		.x(6),
		.y(6),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.touch(touch[0])
	);

		MarioCoin
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
	) marioCoin2(
		.clk(vga_clock),
		.x(1),
		.y(15),
		.mario_x(mario_x),
		.mario_y(mario_y),
		.touch(touch[1])
	);

//	assign vga_red = level1_vga_red;
//	assign vga_red = level1_vga_red;
//	assign vga_red = level1_vga_red;

	enum int unsigned {
		START = 0,
		LEVEL1 = 2
//		WIN = 4,
//		GAME_OVER = 8
	} state;
//	assign leds = 10'b1010101010;
	always @(*) begin
		leds[9] <= start_button;
//		leds[2] <= 1;
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
				level1_reset        <= 1;
				level1_left_switch  <= 0;
				level1_right_switch <= 0;
				level1_jump_button  <= 0;
				vga_red      <= start_screen_vga_red;
				vga_green    <= start_screen_vga_green;
				vga_blue     <= start_screen_vga_blue;
			end
			LEVEL1: begin
				leds[0] <= 0;
				leds[1] <= 1;
				start_screen_vga_clock    <= 0;
				start_screen_reset        <= 1;
				start_screen_left_switch  <= 0;
				start_screen_right_switch <= 0;
				start_screen_jump_button  <= 0;
				level1_vga_clock    <= vga_clock;
				level1_reset        <= reset;
				level1_left_switch  <= left_switch;
				level1_right_switch <= right_switch;
				level1_jump_button  <= jump_button;
				vga_red      <= level1_vga_red;
				vga_green    <= level1_vga_green;
				vga_blue     <= level1_vga_blue;
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
					if (seconds == 0)
						state <= LEVEL1;
					else
						state <= LEVEL1;
				end
			endcase
		end
	end

endmodule
