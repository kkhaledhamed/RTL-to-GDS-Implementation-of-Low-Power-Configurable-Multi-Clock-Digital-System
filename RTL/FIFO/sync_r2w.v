module sync_r2w #(
    parameter ADDRSIZE = 3
)(
    input  wire              wclk,    // write clock
    input  wire              wrst_n,  // active-low reset
    input  wire [ADDRSIZE:0] rptr,    // Gray-coded read pointer
    output reg  [ADDRSIZE:0] wq2_rptr // synced read pointer (to wclk domain)
);

    // Internal stage-1 synchronizer register
    reg [ADDRSIZE:0] wq1_rptr;

    always @(posedge wclk or negedge wrst_n) begin 
        if (!wrst_n) begin
            wq1_rptr  <= 0;
            wq2_rptr  <= 0;
        end else begin
            wq1_rptr  <= rptr;
            wq2_rptr  <= wq1_rptr;
        end
    end
endmodule
