module number_mem (sw, d, wn, we, clk, clrn, exist);
   input 	[3:0] wn;
   input 	[9:0] d, sw;
   input 			we, clk, clrn, input_key;
   output 	[9:0] num;
	output			exist;
   
   reg [9:0] register [0:9];
   
	assign exist = (register[0] == sw) || (register[1] == sw) || (register[2] == sw) ||
						(register[3] == sw) || (register[4] == sw) || (register[5] == sw) ||
						(register[6] == sw) || (register[7] == sw) || (register[8] == sw) ||
						(register[9] == sw);

   always @(posedge clk or negedge clrn) begin
      if (clrn == 0) begin: reset // reset
			integer i;
         for (i=0; i<10; i=i+1)
            register[i] <= 0;
      end else begin
         if (we == 1)          // write
            register[wn] <= d;
      end
   end
endmodule 