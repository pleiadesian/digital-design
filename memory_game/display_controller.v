module display_controller (input_key, exist, display_state, clk, 
									resetn, hex5, hex4, hex3, hex2, hex1, hex0, correct, 
									incorrect, percent);
	input				input_key, exist, clk, resetn;
	input 	[2:0] display_state;
	output 	[6:0] hex5, hex4, hex3, hex2, hex1, hex0;
	output	[6:0] correct, incorrect, percent;
	wire		[6:0] hex5, hex4, hex3, hex2, hex1, hex0;
	reg		[6:0] correct, incorrect, percent;
	wire				display_digit;
	wire		[6:0]	hex5digit, hex4digit, hex3digit, hex2digit, hex1digit, hex0digit;
	
	assign hex5digit = correct / 10;
	assign hex4digit = correct % 10;
	assign hex3digit = incorrect / 10;
	assign hex2digit = incorrect % 10;
	assign hex1digit = percent / 10;
	assign hex0digit = percent % 10;
	
	assign display_digit = display_state == 0;
	
	sevenseg hex5seg(hex5digit, hex5, display_digit);
	sevenseg hex4seg(hex4digit, hex4, display_digit);
	sevenseg hex3seg(hex3digit, hex3, display_digit);
	sevenseg hex2seg(hex2digit, hex2, display_digit);
	sevenseg hex1seg(hex1digit, hex1, display_digit);
	sevenseg hex0seg(hex0digit, hex0, display_digit);
		
	always @ (negedge input_key or negedge resetn)
		begin
			if (!resetn) begin
				correct <= 0;
				incorrect <= 0;
				percent <= 0;
			end
			else begin
				if (exist == 1) begin
					correct <= correct + 1;
					percent <= correct * 100 / (correct + incorrect);
				end
				else begin
					incorrect <= incorrect + 1;
					percent <= correct * 100 / (correct + incorrect);
				end
			end
		end
endmodule 