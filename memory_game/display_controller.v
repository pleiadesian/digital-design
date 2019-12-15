module display_controller (input_key, exist, display_state, clk, display_clk, 
									resetn, hex5, hex4, hex3, hex2, hex1, hex0);
	input				input_key, exist, clk, display_clk, resetn;
	input 	[2:0] display_state;
	output 	[6:0] hex5, hex4, hex3, hex2, hex1, hex0;
	
	reg		[6:0] correct, incorrect, percent;
	wire				display_digit;
	
	assign display_digit = display_state == 0;
	
	sevenseg hex5seg(correct / 10, hex5, display_digit);
	sevenseg hex4seg(correct % 10, hex4, display_digit);
	sevenseg hex3seg(incorrect / 10, hex3, display_digit);
	sevenseg hex2seg(incorrect % 10, hex2, display_digit);
	sevenseg hex1seg(percent / 10, hex1, display_digit);
	sevenseg hex0seg(percent % 10, hex0, display_digit);
	
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
				percent <= correct * 100 / (correct + incorrect);
			end
			else begin
				incorrect <= incorrect + 1;
				percent <= correct * 100 / (correct + incorrect);
			end
		end
endmodule 