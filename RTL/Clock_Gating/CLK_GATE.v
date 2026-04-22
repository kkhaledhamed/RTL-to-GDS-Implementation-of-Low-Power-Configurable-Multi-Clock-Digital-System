
/////////////////////////////////////////////////////////////
/////////////////////// Clock Gating ////////////////////////
/////////////////////////////////////////////////////////////

module CLK_GATE (
input      CLK_EN,
input      CLK,
output     GATED_CLK
);

/*

    // Latch Output, Internal Connection
    reg LATCH_OUT ;

    // ======== Functionality ======== 
    //latch 
    always @(CLK or CLK_EN) begin
        if(!CLK) begin
            LATCH_OUT <= CLK_EN ;
        end
    end

    // ANDING
    assign  GATED_CLK = CLK && LATCH_OUT ;

*/



TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_EN),
.CK(CLK),
.ECK(GATED_CLK)
);






endmodule
