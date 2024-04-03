module VgaGoombaDrawer
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
	localparam COLOR5 = 5;
	localparam COLOR6 = 6;
	localparam COLOR7 = 7;
	localparam COLOR8 = 8;
	localparam COLOR9 = 9;
	localparam COLOR10 = 10;
	localparam COLOR11 = 11;
	localparam COLOR12 = 12;
	localparam COLOR13 = 13;

	reg [4:0] pattern [0:38][0:38] = '{
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
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
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
			COLOR4,
			COLOR5,
			COLOR5,
			COLOR4,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR4,
			COLOR4,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR7,
			COLOR5,
			COLOR5,
			COLOR7,
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
			COLOR6,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR5,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR5,
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
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR5,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR5,
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
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR7
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
			COLOR10,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR10,
			COLOR4,
			COLOR3,
			COLOR9,
			COLOR11,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR3,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR3,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR8,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR4,
			COLOR10,
			COLOR4,
			COLOR4,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR12,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR11,
			COLOR11,
			COLOR7,
			COLOR5,
			COLOR5,
			COLOR5,
			COLOR5,
			COLOR7,
			COLOR5,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR2,
			COLOR12,
			COLOR12,
			COLOR4,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR10,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR10,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR8,
			COLOR9,
			COLOR9,
			COLOR7,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR4,
			COLOR4,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR7,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR4,
			COLOR5,
			COLOR5,
			COLOR4,
			COLOR6,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR6,
			COLOR7,
			COLOR7,
			COLOR13,
			COLOR5
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR1,
			COLOR1,
			COLOR1
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR4,
			COLOR5,
			COLOR5,
			COLOR4,
			COLOR6,
			COLOR2,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR6,
			COLOR7,
			COLOR7,
			COLOR13,
			COLOR5
		},
		'{
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR7,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR8,
			COLOR9,
			COLOR9,
			COLOR7,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR4,
			COLOR4,
			COLOR12,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR10,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR10,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR6,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR8,
			COLOR11,
			COLOR11,
			COLOR7,
			COLOR5,
			COLOR5,
			COLOR5,
			COLOR5,
			COLOR7,
			COLOR5,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR8,
			COLOR2,
			COLOR12,
			COLOR12,
			COLOR4,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR5,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR12,
			COLOR10,
			COLOR10,
			COLOR10,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
		},
		'{
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR4,
			COLOR10,
			COLOR4,
			COLOR4,
			COLOR3,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR3,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR8,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR6,
			COLOR2,
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR1,
			COLOR1,
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR3,
			COLOR2,
			COLOR11,
			COLOR9,
			COLOR9,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR10,
			COLOR4,
			COLOR3,
			COLOR9,
			COLOR11,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR10,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9
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
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR7,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR7
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
			COLOR6,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR5,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR5,
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
			COLOR6,
			COLOR8,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
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
			COLOR5,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR9,
			COLOR5,
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
			COLOR4,
			COLOR5,
			COLOR5,
			COLOR4,
			COLOR3,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR6,
			COLOR4,
			COLOR4,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR7,
			COLOR5,
			COLOR5,
			COLOR7,
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
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
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
			COLOR10,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR2,
			COLOR3,
			COLOR1,
			COLOR1,
			COLOR1,
			COLOR1,
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
			red   <= background_red;
			green <= background_green;
			blue  <= background_blue;
		end else if (pattern[x][y] == COLOR2) begin
			red   <= 4'd9;
			green <= 4'd6;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR3) begin
			red   <= 4'd9;
			green <= 4'd9;
			blue  <= 4'd6;
		end else if (pattern[x][y] == COLOR4) begin
			red   <= 4'd13;
			green <= 4'd9;
			blue  <= 4'd9;
		end else if (pattern[x][y] == COLOR5) begin
			red   <= 4'd9;
			green <= 4'd9;
			blue  <= 4'd9;
		end else if (pattern[x][y] == COLOR6) begin
			red   <= 4'd9;
			green <= 4'd6;
			blue  <= 4'd6;
		end else if (pattern[x][y] == COLOR7) begin
			red   <= 4'd6;
			green <= 4'd6;
			blue  <= 4'd6;
		end else if (pattern[x][y] == COLOR8) begin
			red   <= 4'd6;
			green <= 4'd6;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR9) begin
			red   <= 4'd2;
			green <= 4'd2;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR10) begin
			red   <= 4'd13;
			green <= 4'd13;
			blue  <= 4'd9;
		end else if (pattern[x][y] == COLOR11) begin
			red   <= 4'd6;
			green <= 4'd2;
			blue  <= 4'd2;
		end else if (pattern[x][y] == COLOR12) begin
			red   <= 4'd13;
			green <= 4'd9;
			blue  <= 4'd6;
		end else if (pattern[x][y] == COLOR13) begin
			red   <= 4'd6;
			green <= 4'd6;
			blue  <= 4'd9;
		end	end

endmodule
