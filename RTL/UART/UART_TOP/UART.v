module UART #(parameter UART_DATA_WIDTH = 8)(
    // Global signals
    input  wire                     RST,
    input  wire                     TX_CLK,
    input  wire                     RX_CLK,
    
    // RX Interface
    input  wire                       RX_IN_S,
    output wire [UART_DATA_WIDTH-1:0] RX_OUT_P, 
    output wire                       RX_OUT_V,
    
    // TX Interface
    input  wire [UART_DATA_WIDTH-1:0] TX_IN_P, 
    input  wire                       TX_IN_V, 
    output wire                       TX_OUT_S,
    output wire                       TX_OUT_V,  
    
    // Configuration
    input  wire [5:0]               Prescale, 
    input  wire                     parity_enable,
    input  wire                     parity_type,
    output wire                     parity_error,
    output wire                     Stop_Error
);

    // UART Transmitter Instance
    UART_TX #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) UART_TX_UNIT (
        .CLK(TX_CLK),
        .RST(RST),
        .P_DATA(TX_IN_P),
        .DATA_VALID(TX_IN_V),
        .PAR_EN(parity_enable),
        .PAR_TYP(parity_type), 
        .TX_OUT(TX_OUT_S),
        .Busy(TX_OUT_V)
    );
     
    // UART Receiver Instance 
    UART_RX #(.UART_DATA_WIDTH(UART_DATA_WIDTH)) UART_RX_UNIT (
        .CLK(RX_CLK),
        .RST(RST),
        .RX_IN(RX_IN_S),
        .Prescale(Prescale),
        .PAR_EN(parity_enable),
        .PAR_TYPE(parity_type),
        .P_DATA(RX_OUT_P), 
        .data_valid(RX_OUT_V),
        .Parity_Error(parity_error),
        .Stop_Error(Stop_Error)  
    );

endmodule