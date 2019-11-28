module pipepc(npc, wpcir, clock, resetn, pc);
	input  [31:0] npc;
	input         wpcir, clock, resetn;
	output [31:0] pc;

	// TODO: modify to dffe32pc for 0 address instruction
	dffe32 pc_dff(npc, clock, resetn, wpcir, pc);
endmodule 