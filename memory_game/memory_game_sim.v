`timescale 1ps/1ps            // 仿真时间单位/时间精度

module pipelined_computer_sim;

    reg           resetn_sim;
    reg           clock_50M_sim;
	 reg	  [9:0]	sw_sim;
	 reg	  [3:1]	key_sim;

	 wire				mem_clock_sim;
    wire   [6:0]  hex0_sim,hex1_sim,hex2_sim,hex3_sim,hex4_sim,hex5_sim;
	 wire   [9:0]	led_sim;
	 
	 initial
		begin
			key_sim <= 3'b111;
			sw_sim <= 10'b0101110110;
		end
	 
	 memory_game_main memory_game_instance(clock_50M_sim, resetn_sim, sw_sim, key_sim, 
														hex5_sim, hex4_sim, hex3_sim, hex2_sim, hex1_sim, 
														hex0_sim, led_sim);
	 initial
        begin
            clock_50M_sim = 1;
            while (1)
                #1  clock_50M_sim = ~clock_50M_sim;
        end

	 initial
        begin
            resetn_sim = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn_sim = 1;
        end

	
	 // change all switch state every 1000 time unit
	 initial
	     begin
				while (1)
					#200000000000 sw_sim = ~sw_sim;
		  end
		  
	 
	 // press key in turn every 500 time unit
	 initial
		begin
			while (1) begin
				#100000000 key_sim <= 3'b011;
				#100000000 key_sim <= 3'b111;
			end
		end
	 	  
		  
    initial
        begin
          $display($time,"resetn=%b clock_50M=%b", resetn_sim, clock_50M_sim);
        end

endmodule 