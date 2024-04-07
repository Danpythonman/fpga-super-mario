module SecondsCounter
(
	input vga_clock,
	input reset,
	output int seconds,
	output done,
	output reg [9:0] leds
);

	enum int unsigned {
		RESET    = 0,
		COUNTING = 2,
		DONE     = 4
	} state;

	/*
	 * 25,000,000 ticks in one second (because VGA clock is 25 MHz)
	 */
	localparam TICK_THRESHOLD = 25_000_000;

	int tick_count;

	always @(posedge vga_clock) begin
		case (state)
			RESET: begin
				seconds <= 25;
				tick_count <= 0;
				done <= 0;
			end
			COUNTING: begin
				done <= 0;
				if (tick_count == TICK_THRESHOLD) begin
					tick_count <= 0;
					if (seconds > 0) begin
						seconds <= seconds - 1;
					end else begin
						seconds <= 0;
					end
				end else begin
					tick_count <= tick_count + 1;
					seconds <= seconds;
				end
			end
			DONE: begin
				seconds <= 0;
				tick_count <= 0;
				done <= 1;
			end
		endcase
	end

	always @(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			state <= RESET;
		end else begin
			case(state)
				RESET: begin
					state <= COUNTING;
				end
				COUNTING: begin
					if (seconds == 0)
						state <= DONE;
					else
						state <= COUNTING;
				end
				DONE: begin
					state <= DONE;
				end
			endcase
		end
	end

endmodule
