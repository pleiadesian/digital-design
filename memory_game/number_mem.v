// exist: compare user input with saved leds value
// wb: if exist, delete the value in latch
// d, wn, we: write value when display leds flow
module number_mem (input_key, sw, d, wn, we, clk, clrn, exist, led);
   input 	[3:0] wn;
   input 	[9:0] d, sw;
   input 			input_key, we, clk, clrn;
	output			exist;
	output	[9:0] led;
	reg		[9:0]	led;
   
   reg [9:0] register [0:9];
   
	assign exist = sw != 0 && ((register[0] == sw) || (register[1] == sw) || (register[2] == sw) ||
						(register[3] == sw) || (register[4] == sw) || (register[5] == sw) ||
						(register[6] == sw) || (register[7] == sw) || (register[8] == sw) ||
						(register[9] == sw));
						
	initial begin: init
		integer i;
      for (i=0; i<10; i=i+1)
			register[i] <= 0;
	end

   always @(posedge clk or negedge clrn) begin
      if (clrn == 0) begin: reset // reset
			integer i;
         for (i=0; i<10; i=i+1)
            register[i] <= 0;
      end else begin
         if (we == 1) begin
            register[wn] <= d;
			end
			else if (!input_key) begin: inputkey
				integer i;
				for (i=0; i<10; i=i+1) begin
					if (register[i] == sw) begin
						register[i] <= 0;
					end
				end
			end
			else begin
				led <= sw;
			end
      end
   end
endmodule 