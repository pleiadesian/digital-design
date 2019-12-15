// take least 10 bits of board clock as random number
module random_generator (clock, game_clk, resetn, rand);
	input		game_clk, resetn;
	output 	[9:0] rand;
	reg		[31:0] cnt;
	
	initial begin
		rand <= 10'b0;
		cnt <= 0;
	end
	
	always @ (posedge clock or negedge resetn)
		begin
			if (!resetn) begin
				cnt <= 0;
			end
			else begin
				cnt <= cnt + 1;
			end
		end
	
	always @ (posedge game_clk or negedge resetn)
		begin
			if (!resetn) begin
				rand <= 10'b0;
			end
			else begin
				rand <= cnt[9:0];
			end
		end
endmodule 