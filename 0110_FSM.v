module FSM (clk, rst, din_bit, detect_out);

input clk, rst, din_bit;
output detect_out;
reg [2:0] state, next_state;

parameter start = 3'b000, st1 = 3'b001, st2 = 3'b010, st3 = 3'b011, st4 = 3'b100;

//next reg
always @(posedge clk, posedge rst)
    begin
        if(rst == 1) state <= start;
        else state <= next_state;
    end



always @(state, din_bit)
    begin
        case(state)

        start : if (din_bit == 0) next_state <= st1;
                else next_state <= start;

        st1 : if (din_bit == 1) next_state <= st2;
                else next_state <= st1;

        st2 : if (din_bit == 1) next_state <= st3;
                else next_state <= st1;

        st3 : if (din_bit == 0) next_state <= st4;
                else next_state <= start;

        st4 : if (din_bit == 1) next_state <= st2;
                else next_state <= st1;

        default : next_state <= start;
        endcase

    end


//output Logic
assign detect_out = (state == st4);


endmodule