module clock_generator (clock, resetn, game_clk);
	input 	clock, resetn;
	output 	game_clk;
	
	reg		game_clk;
	reg		display_clk;
	reg [31:0] game_cnt;
	reg [31:0] display_cnt;
	parameter GAME_CYCLE = 50000000;  // the number of cycles of 1 game_clk on board clock
	//parameter DISPLAY_CYCLE = 100; //000000;  // the number of cycles of 1 display_clk on board clock
	
	initial begin
		game_clk <= 0;
		//display_clk <= 0;
		game_cnt <= 0;
		//display_cnt <= 0;
	end
	
	always @ (posedge clock or negedge resetn)
		begin
			if (!resetn) begin
				game_clk <= 0;
				//display_clk <= 0;
				game_cnt <= 0;
				//display_cnt <= 0;
			end
			else begin
				if (game_cnt >= GAME_CYCLE/2 - 1) begin
					game_cnt <= 0;
					game_clk <= ~game_clk;
				end
				else begin
					game_cnt <= game_cnt + 1;
				end
				//if (display_cnt >= DISPLAY_CYCLE/2 - 1) begin
					//display_cnt <= 0;
					//display_clk <= ~display_clk;
				//end
				//else begin
					//display_cnt <= display_cnt + 1;
				//end
			end
		end
endmodule 