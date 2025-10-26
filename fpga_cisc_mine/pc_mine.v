module pc_mine (
    input ld_pc,
    input inc_pc,
    input clk,
    input reset,
    input [4:0] pc_in,
    output reg [4:0] pc_out
);

always@(posedge reset or posedge clk) begin
    if (reset)
    pc_out <= 5'b0;
    else
        if(ld_pc)
        pc_out <= pc_in;
        else if(inc_pc)
        pc_out <= (pc_out + 1);
end
endmodule