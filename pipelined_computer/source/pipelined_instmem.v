module pipelined_instmem (addr,inst,rom_clock);
   input  [31:0] addr;
   input         rom_clock;
   output [31:0] inst;  
   
   lpm_rom_irom irom (addr[8:2],rom_clock,inst); 

endmodule 