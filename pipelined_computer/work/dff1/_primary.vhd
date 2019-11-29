library verilog;
use verilog.vl_types.all;
entity dff1 is
    port(
        d               : in     vl_logic;
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        q               : out    vl_logic
    );
end dff1;
