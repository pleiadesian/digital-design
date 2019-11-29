module pipedereg(dwreg, dm2reg, dwmem, daluc, daluimm, da, db, dimm, drn, dshift,
	djal, dpc4, clock, resetn, ewreg, em2reg, ewmem, ealuc, ealuimm,
	ea, eb, eimm, ern0, eshift, ejal, epc4);
	input         dwreg, dm2reg, dwmem, daluimm, dshift, djal, clock, resetn;
	input  [3:0]  daluc;
	input  [4:0]  drn;
	input  [31:0] da, db, dimm, dpc4;
	output        ewreg, em2reg, ewmem, ealuimm, eshift, ejal;
	output [3:0]  ealuc;
	output [4:0]  ern0;
	output [31:0] ea, eb, eimm, epc4;

	dff1 wreg_dff(dwreg, clock, resetn, ewreg);
	dff1 m2reg_dff(dm2reg, clock, resetn, em2reg);
	dff1 wmem_dff(dwmem, clock, resetn, ewmem);
	dff1 jal_dff(djal, clock, resetn, ejal);
	dff4 aluc_dff(daluc, clock, resetn, ealuc);
	dff1 aluimm_dff(daluimm, clock, resetn, ealuimm);
	dff1 shift_dff(dshift, clock, resetn, eshift);
	dff32 pc4_dff(dpc4, clock, resetn, epc4);
	dff32 a_dff(da, clock, resetn, ea);
	dff32 b_dff(db, clock, resetn, eb);
	dff32 imm_dff(dimm, clock, resetn, eimm);
	dff5 rn_dff(drn, clock, resetn, ern0);
endmodule