// implement key debounce
module debounce(clk, key_in, key_out);
	input		clk, key_in;
	output	key_out;
	reg		key_out;
	
	// counter during debounce procedure
	reg [31:0] cnt;
	reg key_valid;
	reg key_invalid;
	reg key_temp;
	
	// debounce for 500000 * 20ns = 10ms
	localparam DEBOUNCE_TIME = 500_000;
	
	initial begin
		key_valid <= 1;
		key_invalid <= 0;
		cnt <= 0;
		key_temp <= 1;
	end
	
	// output key value after debounce finished
	always @ (posedge clk)
		begin
			if (key_invalid) begin
				key_valid <= 0;
			end
			if (key_valid) 
				begin
					key_out <= key_in;
					key_temp <= key_in;
				end
			else
				begin
					cnt <= cnt + 1;
					key_out <= key_temp;
					if (cnt > 500000) begin
						key_valid <= 1;
						cnt <= 0;
					end
				end
		end
	always @ (negedge key_in)
		begin
			if (key_valid) begin
				key_invalid <= 1;
			end
			else begin
				key_invalid <= 0;
			end
		end
endmodule