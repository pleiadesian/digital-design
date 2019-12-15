// display some numbers on led, and remember them
module game_start (start_key, rand, clk, game_clk, resetn, d, wn, we, led);
	input 			start_key, game_clk, resetn;
	input  [9:0]	randnum;
	output [9:0]	led;
	reg	 [31:0]	display_num;
	parameter DISPLAY_CYCLE = 10;  // display times in one round of game
	
	reg	 [3:0]	rn, wn;
	reg	 [9:0]	d, rand;
	reg 				we, start;
	
	random_generator rand_gen(clk, game_clk, resetn, randnum);
	
	initial begin
		display_num <= 0;
		wn <= 0;
		d <= 0;
		we <= 0;
		start <= 0;
		led <= 0;
	end
	
	// put number to led and memory
	always @ (posedge game_clk)
		begin
			if (start == 1) begin
				if (display_num < DISPLAY_CYCLE) begin
					led <= randnum;
					wn <= display_num;
					d <= randnum;
					display_num <= display_num + 1;
				end
				else begin
					led <= 0;
					display_num <= 0;
					wn <= 0;
					d <= 0;
					we <= 0;
					start <= 0;
				end
			end
		end
	
	// game start
	always @ (negedge game_clk or negedge resetn)
		begin
			if (!resetn) begin
				display_num <= 0;
				wn <= 0;
				d <= 0;
				we <= 0;
				start <= 0;
				led <= 0;
			end
			else begin
				start <= 1;
				we <= 1;
			end
		end
endmodule 