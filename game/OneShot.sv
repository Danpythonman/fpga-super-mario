module OneShot
(
    input vga_clock,
    input reset,
    input signal,
    output reg pressed
);

	enum int unsigned {
        RESET     = 0,
		UNPRESSED = 2,
        PRESSED   = 4,
        HELD      = 8
	} state;

    always @(*) begin
		case (state)
            RESET: begin
                pressed <= 0;
            end
			UNPRESSED: begin
                pressed <= 0;
            end
            PRESSED: begin
                pressed <= 1;
            end
            HELD: begin
                pressed <= 0;
            end
        endcase
    end

    always @(posedge vga_clock or negedge reset) begin
        if (!reset) begin
            state <= RESET;
        end else begin
            case(state)
                RESET: begin
                    state <= UNPRESSED;
                end
                UNPRESSED: begin
                    if (signal)
                        state <= PRESSED;
                    else
                        state <= UNPRESSED;
                end
                PRESSED: begin
                    if (signal)
                        state <= HELD;
                    else
                        state <= UNPRESSED;
                end
                HELD: begin
                    if (signal)
                        state <= HELD;
                    else
                        state <= UNPRESSED;
                end
            endcase
        end
    end

endmodule
