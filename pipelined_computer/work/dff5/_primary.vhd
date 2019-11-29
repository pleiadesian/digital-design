library verilog;
use verilog.vl_types.all;
entity dff5 is
    port(
        d               : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        q               : out    vl_logic_vector(4 downto 0)
    );
end dff5;
