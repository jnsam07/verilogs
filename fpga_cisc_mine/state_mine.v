module state_mine (
    input reset,
    input clk,
    input [2:0] state_in,
    output reg [2:0] state_out
);

always @(posedge clk or posedge reset) begin

    if (reset) state_out <= 3'b111
    else
    state_in <= state_out;
end
endmodule