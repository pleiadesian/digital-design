module pipemwreg(mwreg, mm2reg, mmo, malu, mrn, clock, resetn,
	wwreg, wm2reg, wmo, walu, wrn);
	input         mwreg, mm2reg, clock, resetn;
	input  [4:0]  mrn;
	input  [31:0] mmo, malu;
	output        wwreg, wm2reg;
	output [4:0]  wrn;
	output [31:0] wmo, walu;

	dff1 wreg_dff(mwreg, clock, resetn, wwreg);
	dff1 m2reg_dff(mm2reg, clock, resetn, wm2reg);
	dff32 alu_dff(malu, clock, resetn, walu);
	dff32 mo_dff(mmo, clock, resetn, wmo);
	dff5 rn_dff(mrn, clock, resetn, wrn);
endmodule 