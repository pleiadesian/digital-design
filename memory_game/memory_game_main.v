module memory_game_main(clock, resetn, sw, key, hex5, hex4, hex3, hex2, hex1, hex0, led);
	input         clock, resetn;
	input  [9:0]  sw;
	input  [3:1]  key;
	output [6:0]  hex5, hex4, hex3, hex2, hex1, hex0;
	output [9:0]  led;
	
endmodule 