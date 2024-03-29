//=============================================
//
// 该 Verilog HDL 代码，是用于对设计模块进行仿真时，对输入信号的模拟输入值的设定。
// 否则，待仿真的对象模块，会因为缺少输入信号，而“不知所措”。
// 该文件可设定若干对目标设计功能进行各种情况下测试的输入用例，以判断自己的功能设计是否正确。
//
// 对于CPU设计来说，基本输入量只有：复位信号、时钟信号。
//
// 对于带I/O设计，则需要设定各输入信号值。
//
//
// =============================================


// `timescale 10ns/10ns            // 仿真时间单位/时间精度
`timescale 1ps/1ps            // 仿真时间单位/时间精度

//
// （1）仿真时间单位/时间精度：数字必须为1、10、100
// （2）仿真时间单位：模块仿真时间和延时的基准单位
// （3）仿真时间精度：模块仿真时间和延时的精确程度，必须小于或等于仿真单位时间
//
//      时间单位：s/秒、ms/毫秒、us/微秒、ns/纳秒、ps/皮秒、fs/飞秒（10负15次方）。


module pipelined_computer_sim;

    reg           resetn_sim;
    reg           clock_50M_sim;
	 reg	  [9:0]	sw_sim;
	 reg	  [3:1]	key_sim;

	 wire				mem_clock_sim;
    wire   [6:0]  hex0_sim,hex1_sim,hex2_sim,hex3_sim,hex4_sim,hex5_sim;
	 wire   [9:0]	led_sim;
	 
	 wire   [31:0]  pc_sim,inst_sim,ealu_sim,malu_sim,walu_sim;
	 wire	  [31:0]  pc4_sim, bpc_sim, jpc_sim;
	 wire   [1:0] pcsource_sim;
	 wire   [31:0] ins_sim,dpc4_sim,da_sim,db_sim,dimm_sim,eb_sim,mmo_sim,wdi_sim;
	 wire   [4:0]  drn_sim,ern_sim,mrn_sim,wrn_sim;
	 
	 initial
		begin
			key_sim <= 3'b111;
			sw_sim <= 10'b0101110110;
		end
	 
    pipelined_computer_main    pipelined_computer_instance (resetn_sim,clock_50M_sim,mem_clock_sim, pc_sim,
																					inst_sim,ealu_sim,malu_sim,walu_sim,
																					pc4_sim, bpc_sim, jpc_sim, pcsource_sim,
																					ins_sim,dpc4_sim,da_sim,db_sim,dimm_sim,
																					drn_sim,eb_sim,ern_sim,mmo_sim,mrn_sim,wdi_sim,wrn_sim,
																					sw_sim, key_sim, hex5_sim, hex4_sim, hex3_sim, hex2_sim, 
																					hex1_sim, hex0_sim, led_sim);
															
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
					#2000 sw_sim = ~sw_sim;
		  end
		  
	 
	 // press key in turn every 500 time unit
	 initial
		begin
			while (1) begin
				#1000 key_sim <= 3'b110;
				#1000 key_sim <= 3'b101;
				#1000 key_sim <= 3'b011;
			end
		end
	 	  
		  
    initial
        begin
          $display($time,"resetn=%b clock_50M=%b", resetn_sim, clock_50M_sim);
        end

endmodule 
