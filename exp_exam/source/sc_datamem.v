module sc_datamem (resetn,addr,datain,dataout,we,clock,mem_clk,dmem_clk,
	sw,key,hex5,hex4,hex3,hex2,hex1,hex0,led);
 
	input				resetn;
   input  [31:0]  addr;
   input  [31:0]  datain;
   
   input          we, clock,mem_clk;
	input  [9:0]	sw;
	input  [3:1]	key;
   output [31:0]  dataout;
   output         dmem_clk;
	output [6:0]	hex5, hex4, hex3, hex2, hex1, hex0;
	output [9:0]	led;
	reg	 [31:0]	dataout;
	reg	 [6:0]	hex5, hex4, hex3, hex2, hex1, hex0;
	reg	 [9:0]	led;
   
	wire	 [31:0]	mem_dataout;
   wire           dmem_clk;    
   wire           write_enable; 
   assign         write_enable = we & ~clock & (addr[31:8] != 24'hffffff);  // leave 8 bit address for I/O port
   
   assign         dmem_clk = mem_clk & ( ~ clock) ; 
   
	// synchronously input data to dram
   lpm_ram_dq_dram  dram(addr[6:2],dmem_clk,datain,write_enable,mem_dataout );
	
	// synchronously input data to I/O device(hex and led) or reset data on I/O device
	always @ (posedge dmem_clk or negedge resetn)
		begin
			if (!resetn) begin
				hex5 <= 7'b1111111;
				hex4 <= 7'b1111111;
				hex3 <= 7'b1111111;
				hex2 <= 7'b1111111;
				hex1 <= 7'b1111111;
				hex0 <= 7'b1111111;
				led <= 10'b0;
			end
			else if (we) begin
				case (addr)
					32'hffffff00: hex0 <= datain[6:0];
					32'hffffff10: hex1 <= datain[6:0];
					32'hffffff20: hex2 <= datain[6:0];
					32'hffffff30: hex3 <= datain[6:0];
					32'hffffff40: hex4 <= datain[6:0];
					32'hffffff50: hex5 <= datain[6:0];
					32'hffffff60: led <= datain[9:0];
				endcase
			end
		end
		
	// asynchronously output data from I/O device(switch or key) or dram
	always @ (*)
		begin
			case (addr)
				32'hffffff70:  dataout <= {29'b0, key};
				32'hffffff80:	dataout <= {22'b0, sw};
				default: dataout <= mem_dataout;
			endcase
		end
endmodule 