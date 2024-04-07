module VgaHeartDrawer
(
	input [31:0] x,
	input [31:0] y,
	input byte background [11:0][16:0],
	input [3:0] background_red,
	input [3:0] background_green,
	input [3:0] background_blue,
	output reg [3:0] red,
	output reg [3:0] green,
	output reg [3:0] blue
);

	localparam NULL = 0;
	localparam COLOR1 = 1;
	localparam COLOR2 = 2;
	localparam COLOR3 = 3;
	localparam COLOR4 = 4;

	reg [3:0] pattern [0:38][0:38] = '{
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR1,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR1,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR4,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1
		}
	};

	always @(x, y) begin
		if (pattern[x][y] == NULL) begin
			red   <= background_red;
			green <= background_green;
			blue  <= background_blue;
		end else if (pattern[x][y] == COLOR1) begin
			red   <= 4'd0;
			green <= 4'd0;
			blue  <= 4'd0;
		end else if (pattern[x][y] == COLOR2) begin
			red   <= 4'd2;
			green <= 4'd2;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR3) begin
			red   <= 4'd13;
			green <= 4'd2;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR4) begin
			red   <= 4'd6;
			green <= 4'd2;
			blue  <= 4'd2;
		end	end

endmodule
