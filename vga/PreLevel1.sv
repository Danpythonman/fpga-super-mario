module PreLevel1
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
	output byte background [11:0][16:0],
	output int mario_x,
	output int mario_y,
	output int goomba_x,
	output int goomba_y,
	output int seconds,
	output win,
	output lose,
	output [9:0] leds
);

	wire seconds_done;

	assign seconds = 60;

	assign mario_x = 100;
	assign mario_y = 360;
	assign goomba_x = 300;
	assign goomba_y = 360;

	always@(posedge vga_clock or negedge reset) begin
		background <= '{
			'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
			'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
			'{ SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

			'{ SKY, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY },

			'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, TKN, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
			'{ BDR, CK2, CK1, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
		};
	end

	assign win = 0;
	assign lose = 0;

endmodule
