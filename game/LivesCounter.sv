module LivesCounter
(
	input vga_clock,
	input reset,
	input kill,
	output int lives
);

	enum int unsigned {
		RESET     = 0,
		THREE_LIVES = 2,
		TWO_LIVES = 4,
		TWO_LIVES2 = 8,
		ONE_LIFE = 16,
		ONE_LIFE2 = 32,
		DEAD = 64
	} state;

	always @(posedge vga_clock) begin
		case (state)
			RESET: begin
				lives <= 3;
			end
			THREE_LIVES: begin
				lives <= 3;
			end
			TWO_LIVES: begin
				lives <= 2;
			end
			TWO_LIVES2: begin
				lives <= 2;
			end
			ONE_LIFE: begin
				lives <= 1;
			end
			ONE_LIFE2: begin
				lives <= 1;
			end
			DEAD: begin
				lives <= 0;
			end
		endcase
	end

	always @(posedge vga_clock or negedge reset) begin
		if (!reset) begin
			state <= RESET;
		end else begin
			case (state)
				RESET: begin
					state <= THREE_LIVES;
				end
				THREE_LIVES: begin
					if (kill)
						state <= TWO_LIVES;
					else
						state <= THREE_LIVES;
				end
				TWO_LIVES: begin
					if (kill)
						state <= TWO_LIVES;
					else
						state <= TWO_LIVES2;
				end
				TWO_LIVES2: begin
					if (kill)
						state <= ONE_LIFE;
					else
						state <= TWO_LIVES2;
				end
				ONE_LIFE: begin
					if (kill)
						state <= ONE_LIFE;
					else
						state <= ONE_LIFE2;
				end
				ONE_LIFE2: begin
					if (kill)
						state <= DEAD;
					else
						state <= ONE_LIFE2;
				end
				DEAD: begin
					state <= DEAD;
				end
			endcase
		end
	end

endmodule
