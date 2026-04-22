module deserializer #(parameter UART_DATA_WIDTH = 8) (
    input  wire                        CLK, 
    input  wire                        RST,
    input  wire                        deser_en,
    input  wire [5:0]                  prescale,
    input  wire [5:0]                  edge_cnt,
    input  wire                        sampled_bit,
    output reg  [UART_DATA_WIDTH-1:0]  P_DATA
);

    // Signal to detect last edge of a bit
    wire last_edge;

    // Shift register
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            P_DATA <= 0;
        end
        else if (deser_en) begin
            if (last_edge) begin
                P_DATA <= {sampled_bit, P_DATA[UART_DATA_WIDTH-1:1]};
            end
        end
    end

    // detect last edge
    assign last_edge = (edge_cnt == (prescale - 1));

endmodule
