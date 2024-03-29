module VgaMarioDrawer
(
	input int x,
	input int y,
	input byte background [11:0][16:0],
	input [3:0] background_red,
	input [3:0] background_green,
	input [3:0] background_blue,
	output reg [3:0] red,
	output reg [3:0] green,
	output reg [3:0] blue
);

	localparam NULL = 0;
	localparam RED = 1;
	localparam ORANGE = 2;
	localparam BROWN = 3;

	reg [2:0] mario_pattern[0:41][0:41] = '{
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  RED,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  RED,
			  RED,
			  RED,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  BROWN,
			  BROWN,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  ORANGE,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  BROWN,
			  BROWN,
			  BROWN
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 },
		 '{
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL,
			  NULL
		 }
	};

	always @(x, y) begin
		if (mario_pattern[x][y] == NULL) begin
			red <= background_red;
			green <= background_green;
			blue <= background_blue;
		end else if (mario_pattern[x][y] == RED) begin
			red <= 4'd15;
			green <= 4'd3;
			blue <= 4'd0;
		end else if (mario_pattern[x][y] == BROWN) begin
			red <= 4'd10;
			green <= 4'd7;
			blue <= 4'd0;
		end else if (mario_pattern[x][y] == ORANGE) begin
			red <= 4'd15;
			green <= 4'd9;
			blue <= 4'd4;
		end
	end

endmodule
