// key[3]: game start button
// key[2]: player input button
// key[1]: next stage button
// key[0]: resetn
// sw[9:0]: player input
// led[9:0]: random sequence generated, which should be remembered and inputed by players
// hex: player scores (correct number, incorrect number, percent correct)
module memory_game_main(clk, resetn, sw, key, hex5, hex4, hex3, hex2, hex1, hex0, led, game_clk, 
								d, wn, we, exist, display_state, correct, incorrect, percent);
	input         clk, resetn;
	input  [9:0]  sw;
	input  [3:1]  key;
	output [6:0]  hex5, hex4, hex3, hex2, hex1, hex0;
	output [9:0]  led;
	output		  game_clk, we, exist;
	output [9:0]  d;
	output [3:0]  wn;
	output [2:0]  display_state;
	output	[6:0] correct, incorrect, percent;
	
	wire 			game_clk, display_clk, inc_point, dec_point, we, exist;
	wire [2:0]	display_state;
	wire [9:0] 	d, led_flow, led_input, led;
	wire [3:0]	wn;
	wire [6:0]	hex5_cntdn, hex4_cntdn, hex3_cntdn, hex2_cntdn, hex1_cntdn, hex0_cntdn;
	wire [6:0]  hex5_score, hex4_score, hex3_score, hex2_score, hex1_score, hex0_score;
	
	assign display_state = 0;
	assign led = we == 1 ? led_flow : led_input;
	assign hex5 = we == 1 ? hex5_cntdn : hex5_score;
	assign hex4 = we == 1 ? hex4_cntdn : hex4_score;
	assign hex3 = we == 1 ? hex3_cntdn : hex3_score;
	assign hex2 = we == 1 ? hex2_cntdn : hex2_score;
	assign hex1 = we == 1 ? hex1_cntdn : hex1_score;
	assign hex0 = we == 1 ? hex0_cntdn : hex0_score;
	
	clock_generator game_clk_gen(clk, resetn, game_clk);
	game_start game_st(key[3], clk, game_clk, resetn, d, wn, we, led_flow,
							hex5_cntdn, hex4_cntdn, hex3_cntdn, hex2_cntdn, hex1_cntdn, hex0_cntdn);
	number_mem num_mem(key[2], sw, d, wn, we, clk, resetn, exist, led_input);
	display_controller disp_cont(key[2], exist, display_state, clk, resetn, 
											hex5_score, hex4_score, hex3_score, 
											hex2_score, hex1_score, hex0_score, 
											correct, incorrect, percent);
	
endmodule 