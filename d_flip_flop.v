module d_flip_flop(
    input wire clk, clr, D,
    output reg Q, notQ
);
    always@(posedge clk)
    begin
        if(clr) begin Q = 0; notQ = !Q; end
        else begin Q = D; notQ = !D; end
    end
endmodule