// 32 bit D-flip-flop with enabled bit
module dffe32 (d,clk,clrn,e,q);
   input  [31:0] d;
   input  clk,clrn,e;
   output [31:0] q;
   reg    [31:0] q;
   always @ (negedge clrn or posedge clk)
      if (clrn == 0) begin
			// pc=-4,npc=0 before CPU start work
			// pc <= 0 at the first posedge
         q <= -4;
      end else begin
         if (e == 1) q <= d;
      end
endmodule 