// implement key debounce
module debounce(clk, key_reset, key_in, key_out);
	input		clk, key_reset, key_in;
	output	key_out;
	reg		key_out;
	
	// counter during debounce procedure
	reg [20:0] cnt;
	reg key_cnt;
	
	// debounce for 1000 * 20ns = 20us
	localparam DEBOUNCE_TIME = 1_000;
	
	// output key value after debounce finished
	always @ (posedge clk or negedge key_reset)
		begin
			if (key_reset == 0)
				key_out <= 0;
			else if (cnt == DEBOUNCE_TIME - 1)
				key_out <= key_in;
		end
		
	// keep counting during debouncing
	always @ (posedge clk or negedge key_reset)
		begin
			if (key_reset == 0)
				key_out <= 0;
			else if (key_cnt)
				cnt <= cnt + 1;
			else
				cnt <= 0;
		end
		
	// start and end debouncing
	always @ (posedge clk or negedge key_reset)
		begin
			if (key_reset == 0)
				key_out <= 0;
			else if (key_cnt == 0 && key_in != key_out)
				key_cnt <= 1;
			else if (cnt == DEBOUNCE_TIME - 1)
				key_cnt <= 0;
		end
endmodule