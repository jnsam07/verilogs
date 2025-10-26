module ir_mine (
    input reset,
    input clk,
    input ld,
    input [7:0] ir_in,
    output reg ir_out
);

always@(posedge reset or posedge clk) begin
    if (reset) ir_out <= ir_in;
    else
        if(ld)
        ir_in <= ir_out;
        else
        ir_out <= ir_out;
end



endmodule