module display_controller (input_key, exist, display_state, clk, display_clk, 
									resetn, hex5, hex4, hex3, hex2, hex1, hex0);
	input				input_key, exist, clk, display_clk, resetn;
	input 	[2:0] display_state;
	output 	[6:0] hex5, hex4, hex3, hex2, hex1, hex0;
	
	reg		[6:0] correct, incorrect, percent;
	
	always @ (negedge resetn)
		begin
			correct <= 0;
			incorrect <= 0;
			percent <= 0;
		end
		
	always @ (negedge input_key)
		begin
			if (exist == 1) begin
				correct <= correct + 1;
				percent <= correct / (correct + incorrect);
			end
			else begin
				incorrect <= incorrect + 1;
				percent <= correct / (correct + incorrect);
			end
		end
		
	always @ (posedge clk)
		begin
			if (display_state == 0) begin
				hex5 <= correct / 10;
				hex4 <= correct % 10;
endmodule 