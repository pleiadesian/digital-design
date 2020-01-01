module clock_cpu(clk_50, resetn, clk_t, clk_2t);
	input 	clk_50, resetn;
	output	clk_t;
	output 	clk_2t;
	reg		clk_t;
	reg		clk_2t;
	reg [31:0] cnt;
	parameter CYCLE = 2;  // the number of cycles of 1 clk_t on board clock
	
	initial begin
		clk_t <= 0;
		clk_2t <= 0;
		cnt <= 0;
	end
	
	always @ (posedge clk_50 or negedge resetn)
		begin
			if (!resetn) begin
				clk_t <= 0;
				clk_2t <= 0;
				cnt <= 0;
			end
			else begin
				if (cnt >= CYCLE/2 - 1) begin
					cnt <= 0;
					clk_t <= ~clk_t;
					if (!clk_t) begin
						clk_2t <= ~clk_2t;
					end
				end
				else begin
					cnt <= cnt + 1;
				end
			end
		end
endmodule