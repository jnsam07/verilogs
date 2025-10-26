module fsm (
    input clk,
    input rst,
    input go,
    input ws,
    output reg rd
    output reg ds
);

reg [1:0] state, next_state;

parameter IDLE = 2'b00, READ = 2'b01, DLY = 2'b10, DONE = 2'b11;

//next state logic
always @(posedge clk or posedge rst) 
begin
if (rst) state <= IDLE;
else state <= next_state;
end

always @(state or go or ws) begin

    case(state)

    IDLE    :   if(go) next_state <= READ;
                else next_state <= IDLE;

    READ    :   begin
                rd <= 1'b1;
                next_state <= DLY;
                end

    DLY     :   begin
                rd <= 1'b1;
                if(!ws) next_state <= DONE;
                else next_state <= READ;
                end

    DONE    :   begin
                ds <= 1'b1;
                next_state <= IDLE;
                end

    endcase
end



endmodule