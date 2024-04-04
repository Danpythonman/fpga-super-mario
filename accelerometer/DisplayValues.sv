module DisplayValues
(
	input shortint signed data_x,
	input shortint signed data_y,
	input shortint signed data_z,
	input byte data_raw,
	input [9:0] SW,
	output [7:0] HEX5,
	output [7:0] HEX4,
	output [7:0] HEX3,
	output [7:0] HEX2,
	output [7:0] HEX1
);

	reg data_neg;
	reg [3:0] data_neg_replace;
	reg [3:0] data_thousands;
	reg [3:0] data_hundreds;
	reg [3:0] data_tens;
	reg [3:0] data_ones;

	always @(*) begin
//		if (SW[0]) begin
//			data_neg = 0;
//			data_hundreds <= 0;
//			data_tens <= data_raw[7:4];
//			data_tens <= data_raw[3:0];
//		end else
		if (SW[9]) begin
			if (SW[0]) begin
				data_thousands <= data_x[15:12];
				data_hundreds <= data_x[11:8];
				data_tens <= data_x[7:4];
				data_ones <= data_x[3:0];
			end
			else if (data_x < 0) begin
				data_neg <= 1;
				data_thousands <= -data_x / 1000;
				data_hundreds <= (-data_x % 1000) / 100;
				data_tens <= ((-data_x % 1000) % 100) / 10;
				data_ones <= ((-data_x % 1000) % 100) % 10;
			end else begin
				data_neg = 0;
				data_thousands <= data_x / 1000;
				data_hundreds <= (data_x % 1000) / 100;
				data_tens <= ((data_x % 1000) % 100) / 10;
				data_ones <= ((data_x % 1000) % 100) % 10;
			end
		end else if (SW[8]) begin
			if (SW[0]) begin
				data_thousands <= data_y[15:12];
				data_hundreds <= data_y[11:8];
				data_tens <= data_y[7:4];
				data_ones <= data_y[3:0];
			end
			else if (data_y < 0) begin
				data_neg <= 1;
				data_thousands <= -data_y / 1000;
				data_hundreds <= (-data_y % 1000) / 100;
				data_tens <= ((-data_y % 1000) % 100) / 10;
				data_ones <= ((-data_y % 1000) % 100) % 10;
			end else begin
				data_neg = 0;
				data_thousands <= data_y / 1000;
				data_hundreds <= (data_y % 1000) / 100;
				data_tens <= ((data_y % 1000) % 100) / 10;
				data_ones <= ((data_y % 1000) % 100) % 10;
			end
		end else if (SW[7]) begin
			if (SW[0]) begin
				data_thousands <= data_z[15:12];
				data_hundreds <= data_z[11:8];
				data_tens <= data_z[7:4];
				data_ones <= data_z[3:0];
			end
			else if (data_z < 0) begin
				data_neg <= 1;
				data_thousands <= -data_z / 1000;
				data_hundreds <= (-data_z % 1000) / 100;
				data_tens <= ((-data_z % 1000) % 100) / 10;
				data_ones <= ((-data_z % 1000) % 100) % 10;
			end else begin
				data_neg = 0;
				data_thousands <= data_z / 1000;
				data_hundreds <= (data_z % 1000) / 100;
				data_tens <= ((data_z % 1000) % 100) / 10;
				data_ones <= ((data_z % 1000) % 100) % 10;
			end
		end else begin
			data_neg <= 0;
			data_neg_replace <= 0;
			data_thousands <= 0;
			data_hundreds <= 0;
			data_tens <= 0;
			data_ones <= 0;
		end
	end

//	reg [7:0] HEX5_neg;
//	reg [7:0] HEX5_neg_replace;

	assign HEX5 = data_neg ? 8'b10111111 : 8'b11111111;
//	assign HEX5 = SW[0] ? HEX5_neg_replace : HEX5_neg;

//	NumberDisplay numberDisplay5
//	(
//		.in(data_neg_replace),
//		.display(data)
//	);

	NumberDisplay numberDisplay4
	(
		.in(data_thousands),
		.display(HEX4)
	);

	NumberDisplay numberDisplay3
	(
		.in(data_hundreds),
		.display(HEX3)
	);

	NumberDisplay numberDisplay2
	(
		.in(data_tens),
		.display(HEX2)
	);

	NumberDisplay numberDisplay1
	(
		.in(data_ones),
		.display(HEX1)
	);

endmodule
