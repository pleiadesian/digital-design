// implement key debounce
module debounce(clk, key_in, key_out);
	input		clk, key_in;
	output	key_out;
	reg		key_out;
	
	// counter during debounce procedure
	reg cnt;
	reg key_valid;
	
	// debounce for 500000 * 20ns = 10ms
	localparam DEBOUNCE_TIME = 500_000;
	
	initial begin
		key_valid <= 1;
		cnt <= 0;
	end
	
	// output key value after debounce finished
	always @ (posedge clk)
		begin
			if (~key_valid) begin
				cnt <= cnt + 1;
			end
		end
	always @ (negedge key_in)
		begin
			if (key_valid) begin
				key_valid <= 0;
			end
			if (~key_valid) begin
				if (cnt > 500000) begin
					key_valid <= 1;
					key_out <= key_in;
					cnt <= 0;
				end
			end
		end
endmodule