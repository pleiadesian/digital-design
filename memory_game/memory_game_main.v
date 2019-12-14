module memory_game_main(clock, resetn, sw, key, hex5, hex4, hex3, hex2, hex1, hex0, led);
	input         clock, resetn;
	input  [9:0]  sw;
	input  [3:1]  key;
	output [6:0]  hex5, hex4, hex3, hex2, hex1, hex0;
	output [9:0]  led;
	
	wire game_clk, display_clk, inc_point, dec_point;
	wire [9:0] rand;
	wire [1:0] display_state;
	
	clock_generator game_clk_gen(clock, resetn, game_clk, display_clk);
	random_generator rand_gen(game_clk, resetn, rand);
	game_start game_st(key[3], game_clk, resetn, led);
	player_input play_in(key[2], sw, clock, resetn, display_state, inc_point, dec_point);
	display_controller disp_cont(display_state, display_clk, resetn, hex5, hex4, hex3, hex2, hex1, hex0);
	
endmodule 