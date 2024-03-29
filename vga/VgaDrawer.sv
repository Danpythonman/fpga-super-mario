module VgaDrawer
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
	input             clk,
	input      int row,
	input      int col,
	input      int mario_x,
	input      int mario_y,
	input byte background [11:0][16:0],
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

	reg [3:0] background_red;
	reg [3:0] background_green;
	reg [3:0] background_blue;

	wire [3:0] mario_red;
	wire [3:0] mario_green;
	wire [3:0] mario_blue;

	VgaMarioDrawer vgaMarioDrawer (
		.x(col - mario_x),
		.y(row - mario_y),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(mario_red),
		.green(mario_green),
		.blue(mario_blue)
	);

	VgaEnvironmentDrawer #(
		.BDR(BDR),
		.SKY(SKY),
		.BLK(BLK),
		.GND(GND),
		.TKN(TKN),
		.MARIO_WIDTH(MARIO_WIDTH),
		.SCREEN_WIDTH(SCREEN_WIDTH),
		.SCREEN_HEIGHT(SCREEN_HEIGHT),
		.BLOCK_WIDTH(BLOCK_WIDTH)
	) vgaEnvironmentDrawer (
		.clk(clk),
		.col(col),
		.row(row),
		.background(background),
		.red(background_red),
		.green(background_green),
		.blue(background_blue)
	);

	always @(col, row) begin
		if (col >= mario_x && col <= mario_x + MARIO_WIDTH
			&& row >= mario_y && row <= mario_y + MARIO_WIDTH
		) begin
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

module VgaEnvironmentDrawer
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
	input             clk,
	input      int row,
	input      int col,
	input byte background [11:0][16:0],
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

	reg [3:0] background_red;
	reg [3:0] background_green;
	reg [3:0] background_blue;

	wire [3:0] coin_red;
	wire [3:0] coin_green;
	wire [3:0] coin_blue;

	VgaCoin vgaCoin(
		.x(col % 40),
		.y(row % 40),
		.background(background),
		.background_red(background_red),
		.background_green(background_green),
		.background_blue(background_blue),
		.red(coin_red),
		.green(coin_green),
		.blue(coin_blue)
	);

	always @(col, row) begin
		if (background[row / BLOCK_WIDTH][col/ BLOCK_WIDTH] == GND) begin
				background_red   <= 4'h0;
				background_green <= 4'hf;
				background_blue  <= 4'h2;
		end else if (background[row / BLOCK_WIDTH][col/ BLOCK_WIDTH] == SKY) begin
				background_red   <= 4'd0;
				background_green <= 4'd9;
				background_blue  <= 4'd15;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == BLK) begin
				background_red   <= 4'd8;
				background_green <= 4'd4;
				background_blue  <= 4'd3;
		end else if (background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == BDR) begin
				background_red   <= 4'h0;
				background_green <= 4'h0;
				background_blue  <= 4'h0;
		end else if(background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == TKN) begin
				background_red   <= 4'd0;
				background_green <= 4'd9;
				background_blue  <= 4'd15;
		end else begin
			background_red   <= 4'h0;
			background_green <= 4'h0;
			background_blue  <= 4'h0;
		end
	end

	always @(col, row) begin
		if(background[row / BLOCK_WIDTH][col / BLOCK_WIDTH] == TKN)begin
			red <= coin_red;
			green <= coin_green;
			blue <= coin_blue;
		end else begin
			red <= background_red;
			green <= background_green;
			blue <= background_blue;
		end
	end

endmodule

