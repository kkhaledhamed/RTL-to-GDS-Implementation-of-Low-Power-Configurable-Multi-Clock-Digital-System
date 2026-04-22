module rptr_empty #(
    parameter ADDRSIZE = 3
)(
    output reg                 rempty,    // FIFO empty flag
    output wire [ADDRSIZE-1:0] raddr,     // memory address (binary)
    output reg  [ADDRSIZE  :0] rptr,      // Gray-coded read pointer
    input       [ADDRSIZE  :0] rq2_wptr,  // synchronized write pointer
    input                      rinc,      // read increment
    input                      rclk, rrst_n
);

    // Internal binary read pointer
    reg [ADDRSIZE:0] rbin;
    reg [ADDRSIZE:0] rbin_next, rgray_next;
    reg rempty_next;

    // Compute next binary and Gray pointers
    always @(*) begin
        rbin_next  = rbin + ((rinc & ~rempty) ? 1'b1 : 1'b0);
        rgray_next = (rbin_next >> 1) ^ rbin_next; // binary to Gray conversion
        rempty_next = (rgray_next == rq2_wptr); // Empty Condition
    end

    // Update pointers
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rbin   <= 0;
            rptr   <= 0;
            rempty <= 1'b1;
        end else begin
            rbin   <= rbin_next;
            rptr   <= rgray_next;
            rempty <= rempty_next;
        end
    end

    // Binary address to access memory
    assign raddr = rbin[ADDRSIZE-1:0];

endmodule
