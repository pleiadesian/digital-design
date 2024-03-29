module sevenseg (data, ledsegments, display_digit);
	input				display_digit;
	input 	[6:0] data;
	output 	[6:0]	ledsegments;
	reg 		[6:0] ledsegments;
	
	initial begin
		ledsegments = 7'b111_1111;
	end
	
	always @ (*)
		if (display_digit == 1) begin
			case(data)
								// gfe_dcba // 7段LED数码管的位段编号
								// 654_3210 // DE1-SOC板上的信号位编号
				0: ledsegments = 7'b100_0000; // DE1-SOC板上的数码管为共阳极接法。
				1: ledsegments = 7'b111_1001;
				2: ledsegments = 7'b010_0100;
				3: ledsegments = 7'b011_0000;
				4: ledsegments = 7'b001_1001;
				5: ledsegments = 7'b001_0010;
				6: ledsegments = 7'b000_0010;
				7: ledsegments = 7'b111_1000;
				8: ledsegments = 7'b000_0000;
				9: ledsegments = 7'b001_0000;
			default: ledsegments = 7'b111_1111; // 其它值时全灭。
			endcase
		end
endmodule 