module VgaDrawer
(
	input             clk,
	input      [31:0] row,
	input      [31:0] col,
	input      [31:0] mario_x,
	input      [31:0] mario_y,
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

	reg [3:0] background_red;
	reg [3:0] background_green;
	reg [3:0] background_blue;

	localparam MARIO_WIDTH = 42;

	localparam BDR = 0;
	localparam SKY = 1;
	localparam BLK = 2;
	localparam GND = 3;

	byte background [11:0][16:0] = '{
		'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR },
		'{ GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, BLK, BLK, BLK, BLK, SKY, SKY, SKY, SKY, SKY, BLK, BLK, BLK, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },

		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY, SKY },
		'{ BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR, BDR }
	};

	wire [3:0] mario_red;
	wire [3:0] mario_green;
	wire [3:0] mario_blue;

	VgaMarioDrawer vgaMarioDrawer
	(
		.x(col - mario_x),
		.y(row - mario_y),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(mario_red),
		.green(mario_green),
		.blue(mario_blue)
	);

	always @(col, row) begin
		if (background[row / 40][col/ 40] == GND) begin
				background_red   <= 4'h0;
				background_green <= 4'hf;
				background_blue  <= 4'h2;
		end else if (background[row / 40][col/ 40] == SKY) begin
				background_red   <= 4'd0;
				background_green <= 4'd9;
				background_blue  <= 4'd15;
		end else if (background[row / 40][col / 40] == BLK) begin
				background_red   <= 4'd8;
				background_green <= 4'd4;
				background_blue  <= 4'd3;
		end else if (background[row / 40][col / 40] == BDR) begin
				background_red   <= 4'hf;
				background_green <= 4'h0;
				background_blue  <= 4'h0;
		end else begin
			background_red   <= 4'h0;
			background_green <= 4'h0;
			background_blue  <= 4'h0;
		end
	end

	always @(col, row) begin
		if (col >= mario_x && col <= mario_x + MARIO_WIDTH && row >= mario_y && row <= mario_y + MARIO_WIDTH) begin
			red <= mario_red;
			green <= mario_green;
			blue <= mario_blue;
		end else begin
			red <= background_red;
			green <= background_green;
			blue <= background_blue;
		end
	end

endmodule
