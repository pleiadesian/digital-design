library verilog;
use verilog.vl_types.all;
entity dff4 is
    port(
        d               : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end dff4;
