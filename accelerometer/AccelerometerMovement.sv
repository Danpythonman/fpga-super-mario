module AccelerometerMovement
(
	input clk,
	input spi_clk,
	input reset,
	input button,
	input [9:0] SW,
	output [7:0] HEX5,
	output [7:0] HEX4,
	output [7:0] HEX3,
	output [7:0] HEX2,
	output [7:0] HEX1,
	output [7:0] HEX0,
	output [9:0] LEDR,
	output left,
	output right,
	output jump,

	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO
);

	shortint signed data_x;
	shortint signed data_y;
	shortint signed data_z;
	shortint signed data;
	logic data_valid;

	localparam SPI_CLK_FREQ  = 200;  // SPI Clock (Hz)
	localparam UPDATE_FREQ   = 1;    // Sampling frequency (Hz)

	logic data_update;

	SpiController
	#(
		.SPI_CLK_FREQ   (SPI_CLK_FREQ),
		.UPDATE_FREQ    (UPDATE_FREQ))
	SpiController
	(
		.reset_n    (reset),
		.clk        (clk),
		.spi_clk    (clk),
		.spi_clk_out(spi_clk),
		.data_update(data_update),
		.data_x     (data_x),
		.data_y     (data_y),
		.data_z     (data_z),
		.SPI_SDI    (GSENSOR_SDI),
		.SPI_SDO    (GSENSOR_SDO),
		.SPI_CSN    (GSENSOR_CS_N),
		.SPI_CLK    (GSENSOR_SCLK),
		.interrupt  (GSENSOR_INT)
	);

	assign left = data_x > 100;
	assign right = data_x < -100;
	assign jump = data_y > 200;

	DisplayValues displayValues
	(
		.data_x(data_x),
		.data_y(data_y),
		.data_z(data_z),
		.data_raw(data),
		.SW(SW),
		.HEX5(HEX5),
		.HEX4(HEX4),
		.HEX3(HEX3),
		.HEX2(HEX2),
		.HEX1(HEX1)
	);

endmodule
