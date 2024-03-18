module MovementClock
(
	input vga_clock,
	output movement_clock
);

	localparam TICK_THRESHOLD = 100_000;

	reg [31:0] count = 0;

	always @(negedge vga_clock) begin
		if (count == TICK_THRESHOLD) begin
			count <= 0;
			movement_clock = ~movement_clock;
		end else begin
			count <= count + 1;
		end
	end

endmodule
