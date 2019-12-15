module display_controller (input_key, exist, display_state, clk, display_clk, 
									resetn, hex5, hex4, hex3, hex2, hex1, hex0);
	input				input_key, clk, display_clk, resetn;
	input 	[2:0] display_state;
	output 	[6:0] hex5, hex4, hex3, hex2, hex1, hex0;
	
	
endmodule 