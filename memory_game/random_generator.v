// take least 10 bits of board clock as random number
module random_generator (clk, game_clk, resetn, randnum);
	input		clk, game_clk, resetn;
	output 	[9:0] randnum;
	reg		[9:0]	randnum;
	reg		[31:0] cnt;
	
	initial begin
		randnum <= 10'b0;
		cnt <= 0;
	end
	
	always @ (posedge clk or negedge resetn)
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
				randnum <= 10'b0;
			end
			else begin
				randnum <= cnt[15:6];
			end
		end
endmodule 