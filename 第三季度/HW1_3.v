module HW1_3 (out, inp, clk);
  output reg out;
  input wire inp;
  input wire clk;
  parameter a0 = 3'b000,  a1 = 3'b001, a2 = 3'b010, a3 = 3'b011 , a4 = 3'b100;
  reg [2:0] state;

  initial begin
    state=a0;
    out=0;
  end

  always @(posedge clk)begin
        case(state)
            a0: 
                state=inp==0 ? a0:a1;
            a1: 
                state=inp==0 ? a2:a3;
            a2: 
                state=inp==0 ? a4:a0;
            a3: 
               state=inp==0 ? a1:a2;
            a4: 
                state=inp==0 ? a3:a4;
        endcase

        out = state == a0;
    end
endmodule