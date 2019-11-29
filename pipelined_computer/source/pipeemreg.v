module pipeemreg(ewreg, em2reg, ewmem, ealu, eb, ern, clock, 
		resetn, mwreg, mm2reg, mwmem, malu, mb, mrn);
	input         ewreg, em2reg, ewmem, clock, resetn;
	input  [4:0]  ern;
	input  [31:0] ealu, eb;
	output        mwreg, mm2reg, mwmem;
	output [4:0]  mrn;
	output [31:0] malu, mb;

	dff1 wreg_dff(ewreg, clock, resetn, mwreg);
	dff1 m2reg_dff(em2reg, clock, resetn, mm2reg);
	dff1 wmem_dff(ewmem, clock, resetn, mwmem);
	dff32 alu_dff(ealu, clock, resetn, malu);
	dff32 b_dff(eb, clock, resetn, mb);
	dff5 rn_dff(ern, clock, resetn, mrn);
endmodule 