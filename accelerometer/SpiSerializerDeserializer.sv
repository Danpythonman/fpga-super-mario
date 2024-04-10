/*
 * This module uses code from University of California Davis
 * https://www.ece.ucdavis.edu/~bbaas/180/tutorials/accelerometer.html
 */
module SpiSerializerDeserializer
(
    input reset,
    input spi_clk,
    input spi_clk_out,
    input [15:0] data_tx,
    input start,
    output done,
    output reg [7:0] data_rx,
    output SPI_SDI,
    input SPI_SDO,
    output SPI_CSN,
    output SPI_CLK
);

localparam  IDLE = 0; // Wait for start.
localparam WRITE = 1; // Write out data.
localparam  READ = 2; // Read data.
localparam STALL = 3; // Stall for 1 cycle while asserting "done"

reg [1:0]  state = IDLE;
reg [3:0]  count;
reg [15:0] data_tx_reg;
reg read;

// Active signal
wire spi_active;
assign spi_active = (state == READ || state == WRITE);

// Chip select
assign SPI_CSN = ~(spi_active || start);

// SPI CLK
assign SPI_CLK = spi_active ? spi_clk_out : 1'b1;

// SPI Data, must be high if not writing
assign SPI_SDI = (state == WRITE) ? data_tx_reg[count] : 1'b1;

// Signal to higher level module that transaction is complete.
assign done    = (state == STALL);

// In idle state, wait for the start signal. Then get data_tx input. If the MSB
// of data_tx is 1, then it is a read operation, so we must receive 8 more bits.
// Otherwise, it is a write operation, in which case the first 8 bits are an
// address and the next 8 bits are data that must also be written. Afterwords,
// assert done signal in the stall state for a clock cycle.

always @(posedge spi_clk or negedge reset) begin
    if (reset == 1'b0) begin
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                count <= 4'b1111;
                if (start) begin
                    read        <= data_tx[15];
                    data_tx_reg <= data_tx;
                    state       <= WRITE;
                end
            end

            WRITE: begin
                // Decrement event counter
                count <= count - 4'b0001;
                // If writing, then keep writing here. Otherwise, branch to the
                // READ state to read 8 bits.
                if (read && (count == 8)) begin
                    state <= READ;
                end else if (count == 0) begin
                    state <= STALL;
                end
            end

            READ: begin
                // Decrement event counter
                count <= count - 4'b0001;
                // Read data and shift it in
                data_rx <= {data_rx[6:0],SPI_SDO};
                if (count == 0) begin
                    state <= STALL;
                end
            end
            // Idle state for one clock cycle to assert done signal
            STALL: state <= IDLE;
        endcase
    end
end

endmodule
