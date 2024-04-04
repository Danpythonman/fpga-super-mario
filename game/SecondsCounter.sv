module SecondsCounter
(
	input vga_clock,
	input reset,
	output int seconds_count
);

	localparam TICK_THRESHOLD = 25_000_000;

	int tick_count = 0;
	int seconds = 60;

	always @(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			seconds <= 60;
			tick_count <= 0;
		end else begin
			if (tick_count == TICK_THRESHOLD) begin
				tick_count <= 0;
				if (seconds > 0) begin
					seconds <= seconds - 1;
				end
			end else begin
				tick_count <= tick_count + 1;
			end
		end
	end

endmodule
