module edge_bit_counter #(parameter UART_DATA_WIDTH = 8)(
    input  wire        CLK, 
    input  wire        RST,
    input  wire [5:0]  prescale,
    input  wire        enable,
    output reg  [5:0]  edge_cnt,
    output reg  [3:0]  bit_cnt
);

    // Signal to detect last edge of a bit
    wire last_edge;

    // Edge counter
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            edge_cnt <= 0;
        end
        else if (enable && last_edge) begin
            edge_cnt <= 0;
        end
        else if (enable) begin
            edge_cnt <= edge_cnt + 1;
        end
        else begin
            edge_cnt <= 0;
        end
    end

    // Bit counter
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            bit_cnt <= 0;
        end
        else if (enable && last_edge) begin
            bit_cnt <= bit_cnt + 1;
        end
        else if (!enable) begin
            bit_cnt <= 0;
        end
    end

    // detect last edge
    assign last_edge = (edge_cnt == (prescale - 1));

endmodule
