module MarioCoin
#(
    parameter BDR = 0,
	parameter SKY = 1,
	parameter BLK = 2,
	parameter GND = 3,
    parameter TKN = 4,
	parameter CHARACTER_WIDTH = 42,
	parameter SCREEN_WIDTH = 640,
	parameter SCREEN_HEIGHT = 480,
	parameter BLOCK_WIDTH = 40
)
(
    input clk,
    input reset,
    input int x,
    input int y,
    input int mario_x,
    input int mario_y,
    output logic touch
);

    int mario_left;
	int mario_right;
	int mario_top;
	int mario_bottom;

    assign mario_left = (mario_x + 10) / BLOCK_WIDTH;
	assign mario_right = (mario_x - 10 + CHARACTER_WIDTH) / BLOCK_WIDTH;
	assign mario_top = (mario_y + 10) / BLOCK_WIDTH;
	assign mario_bottom = (mario_y - 10 + CHARACTER_WIDTH) / BLOCK_WIDTH;

	enum int unsigned {
		RESET    = 0,
		ACTIVE   = 2,
		TOUCH    = 4,
        INACTIVE = 8
	} state;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            touch <= 0;
        end else begin
            case (state)
                RESET: begin
                    touch <= 0;
                end
                ACTIVE: begin
                    touch <= 0;
                end
                TOUCH: begin
                    touch <= 1;
                end
                INACTIVE: begin
                    touch <= 0;
                end
            endcase
        end
    end

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= RESET;
        end else begin
            case (state)
                RESET: begin
                    state <= ACTIVE;
                end
                ACTIVE: begin
                    if (mario_left == x && mario_top == y
                            || mario_left == x && mario_bottom == y 
                            || mario_right == x && mario_top == y
                            || mario_right == x && mario_bottom == y) begin
                        state <= TOUCH;
                    end else begin
                        state <= ACTIVE;
                    end
                end
                TOUCH: begin
                    state <= INACTIVE;
                end
                INACTIVE: begin
                    state <= INACTIVE;
                end
            endcase
        end
    end

endmodule
