module UART_RX #(parameter UART_DATA_WIDTH = 8)(
    input wire CLK,
    input wire RST,
    input wire PAR_TYPE,
    input wire PAR_EN,
    input wire [5:0] Prescale,
    input wire RX_IN,
    output wire [UART_DATA_WIDTH-1:0] P_DATA,
    output wire data_valid,
    output wire Parity_Error,
    output wire Stop_Error
);

    // Internal signals
    wire enable;
    wire [5:0] edge_cnt;
    wire [3:0] bit_cnt;
    wire sampled_bit;
    wire data_samp_en;
    wire deser_en;
    wire par_chk_en;
    wire start_chk_en;
    wire stop_chk_en;
    wire start_glitch;
    
    // Module instantiations
    data_sampling #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) data_sampling_UNIT(
        .CLK(CLK),
        .RST(RST),
        .prescale(Prescale),
        .edge_cnt(edge_cnt),
        .RX_IN(RX_IN),
        .data_samp_en(data_samp_en),
        .sampled_bit(sampled_bit)
    );

    deserializer #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) deserializer_UNIT(
        .CLK(CLK),
        .RST(RST),
        .deser_en(deser_en),
        .prescale(Prescale),
        .edge_cnt(edge_cnt),
        .sampled_bit(sampled_bit),
        .P_DATA(P_DATA)
    );

    edge_bit_counter #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) edge_bit_counter_UNIT(
        .CLK(CLK),
        .RST(RST),
        .prescale(Prescale),
        .enable(enable),
        .edge_cnt(edge_cnt),
        .bit_cnt(bit_cnt)
    );

    FSM_RX #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) FSM_RX_UNIT(
        .CLK(CLK),
        .RST(RST),
        .S_DATA(RX_IN),
        .PAR_EN(PAR_EN),
        .prescale(Prescale),
        .par_err(par_err),
        .edge_cnt(edge_cnt),
        .bit_cnt(bit_cnt),
        .start_glitch(start_glitch),
        .stop_err(stop_err),
        .par_chk_en(par_chk_en),
        .start_chk_en(start_chk_en),
        .enable(enable),
        .data_samp_en(data_samp_en),
        .stop_chk_en(stop_chk_en),
        .deser_en(deser_en),
        .data_valid(data_valid)
    );

    parity_check #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) parity_check_UNIT(
        .CLK(CLK),
        .RST(RST),
        .par_chk_en(par_chk_en),
        .sampled_bit(sampled_bit),
        .PAR_TYPE(PAR_TYPE),
        .P_DATA(P_DATA),
        .par_err(Parity_Error) 
    );

    start_check start_check_UNIT(
        .CLK(CLK),
        .RST(RST),
        .start_chk_en(start_chk_en),
        .sampled_bit(sampled_bit),
        .start_glitch(start_glitch)
    );

    stop_check stop_check_UNIT(
        .CLK(CLK),
        .RST(RST),
        .stop_chk_en(stop_chk_en),
        .sampled_bit(sampled_bit),
        .stop_err(Stop_Error) 
    );

endmodule
