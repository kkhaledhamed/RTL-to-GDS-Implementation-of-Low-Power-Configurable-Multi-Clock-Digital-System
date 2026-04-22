module FIFO #(
    parameter DATASIZE = 8,   // width of data bus
    parameter ADDRSIZE = 3,   // address width
    parameter MEMDEPTH = 8
)(
    input  wire                  wclk,    // write clock
    input  wire                  wrst_n,  // active-low reset (write domain)
    input  wire                  rclk,    // read clock
    input  wire                  rrst_n,  // active-low reset (read domain)
    input  wire                  winc,    // write enable
    input  wire                  rinc,    // read enable
    input  wire [DATASIZE-1:0]   wdata,   // write data
    output wire [DATASIZE-1:0]   rdata,   // read data
    output wire                  wfull,   // FIFO full flag
    output wire                  rempty   // FIFO empty flag
);

    // Internal signals
    wire [ADDRSIZE-1:0] waddr, raddr;
    wire [ADDRSIZE:0]   wptr, rptr;
    wire [ADDRSIZE:0]   wq2_rptr, rq2_wptr;

    // ============================================================
    // FIFO MEMORY
    // ============================================================
    memory #(
        .ADDRSIZE(ADDRSIZE),
        .DATASIZE(DATASIZE),
        .MEMDEPTH(MEMDEPTH)
    ) mem_UNIT (
        .wdata (wdata),
        .waddr (waddr),
        .raddr (raddr),
        .wclk  (wclk),
        .winc  (winc),
        .wfull (wfull),
        .wrst_n(wrst_n),
        .rdata (rdata)
    );

    // ============================================================
    // SYNCHRONIZERS
    // ============================================================
    sync_r2w #(.ADDRSIZE(ADDRSIZE)) sync_r2w_UNIT (
        .wclk    (wclk),
        .wrst_n  (wrst_n),
        .rptr    (rptr),
        .wq2_rptr(wq2_rptr)
    );

    sync_w2r #(.ADDRSIZE(ADDRSIZE)) sync_w2r_UNIT (
        .rclk    (rclk),
        .rrst_n  (rrst_n),
        .wptr    (wptr),
        .rq2_wptr(rq2_wptr)
    );

    // ============================================================
    // WRITE POINTER & FULL FLAG
    // ============================================================
    wptr_full #(.ADDRSIZE(ADDRSIZE)) wptr_full_UNIT (
        .wfull   (wfull),
        .waddr   (waddr),
        .wptr    (wptr),
        .wq2_rptr(wq2_rptr),
        .winc    (winc),
        .wclk    (wclk),
        .wrst_n  (wrst_n)
    );

    // ============================================================
    // READ POINTER & EMPTY FLAG
    // ============================================================
    rptr_empty #(.ADDRSIZE(ADDRSIZE)) rptr_empty_UNIT (
        .rempty  (rempty),
        .raddr   (raddr),
        .rptr    (rptr),
        .rq2_wptr(rq2_wptr),
        .rinc    (rinc),
        .rclk    (rclk),
        .rrst_n  (rrst_n)
    );

endmodule
