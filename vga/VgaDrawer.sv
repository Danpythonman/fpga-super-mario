module VgaDrawer
(
	input             clk,
	input      [31:0] row,
	input      [31:0] col,
	output reg [3:0]  red,
	output reg [3:0]  green,
	output reg [3:0]  blue
);

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

	always @(col, row) begin
		if (background[row / 40][col/ 40] == GND) begin
				red   <= 4'd12;
				green <= 4'd9;
				blue  <= 4'd5;
		end else if (background[row / 40][col/ 40] == SKY) begin
				red   <= 4'd0;
				green <= 4'd9;
				blue  <= 4'd15;
		end else if (background[row / 40][col / 40] == BLK) begin
				red   <= 4'd8;
				green <= 4'd4;
				blue  <= 4'd3;
		end else if (background[row / 40][col / 40] == BDR) begin
				red   <= 4'hf;
				green <= 4'h0;
				blue  <= 4'h0;
		end else begin
			red   <= 4'h0;
			green <= 4'h0;
			blue  <= 4'h0;
		end
	end
endmodule
