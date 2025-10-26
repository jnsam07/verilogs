module acc_mine (
    input        clk,
    input        ld,
    input        reset,
    input  [7:0] acc_in,
    output reg [7:0] acc_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        acc_out <= 8'b0;
    else if (ld)
        acc_out <= acc_in;
end

endmodule
