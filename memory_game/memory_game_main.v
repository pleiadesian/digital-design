// key[3]: game start button
// key[2]: player input button
// key[1]: next stage button
// key[0]: resetn
// sw[9:0]: player input
// led[9:0]: random sequence generated, which should be remembered and inputed by players
// hex: player scores (correct number, incorrect number, percent correct)
module memory_game_main(clock, resetn, sw, key, hex5, hex4, hex3, hex2, hex1, hex0, led);
	input         clock, resetn;
	input  [9:0]  sw;
	input  [3:1]  key;
	output [6:0]  hex5, hex4, hex3, hex2, hex1, hex0;
	output [9:0]  led;
	
	wire 			game_clk, display_clk, inc_point, dec_point, we;
	wire [9:0] 	rand, d;
	wire [1:0] 	display_state;
	wire [3:0]	wn;
	
	clock_generator game_clk_gen(clock, resetn, game_clk, display_clk);
	game_start game_st(key[3], clock, game_clk, resetn, d, wn, we, led);
	number_mem num_mem(sw, d, wn, we, clk, resetn, exist);
	display_controller disp_cont(key[2], exist, display_state, clk, display_clk, 
											resetn, hex5, hex4, hex3, hex2, hex1, hex0);
	
endmodule 