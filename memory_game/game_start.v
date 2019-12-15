// display some numbers on led, and remember them
module game_start (start_key, clk, game_clk, resetn, d, wn, we, led, 
						hex5, hex4, hex3, hex2, hex1, hex0);
	input 			start_key, clk, game_clk, resetn;
	output [9:0]	led, d;
	output [3:0]	wn;
	output			we;
	output [6:0]	hex5, hex4, hex3, hex2, hex1, hex0;
	reg	 [6:0]	hex5, hex4, hex3, hex2, hex1, hex0;
	reg	 [3:0]	display_num;
	parameter DISPLAY_CYCLE = 10;  // display times in one round of game
	
	reg	 [9:0]	led;
	reg	 [3:0]	wn;
	reg	 [9:0]	d;
	reg 				we, start, finish;
	wire	 [9:0]	randnum;
	
	parameter code_G = 7'b1000010;
	parameter code_O = 7'b1000000;
	parameter code_I = 7'b1111001;
	parameter code_N = 7'b1001000;
	parameter code_none = 7'b1111111;
	
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
			if (!resetn) begin
				display_num <= 0;
				wn <= 0;
				d <= 0;
				we <= 0;
				start <= 0;
			end
			else if (start == 1) begin
				if (display_num < DISPLAY_CYCLE) begin
					led <= randnum;
					wn <= display_num;
					d <= randnum;
					display_num <= display_num + 1;
				end
				else begin
					display_num <= 0;
					wn <= 0;
					d <= 0;
					we <= 0;
					start <= 0;
				end
			end
			else if (start == 0 && !start_key) begin
				hex5 <= code_none;
				hex4 <= code_G;
				hex3 <= code_O;
				hex2 <= code_I;
				hex1 <= code_N;
				hex0 <= code_G;
				start <= 1;
				we <= 1;
				display_num <= 0;
				wn <= 0;
				d <= 0;
			end
		end
endmodule 