library verilog;
use verilog.vl_types.all;
entity number_mem is
    port(
        input_key       : in     vl_logic;
        sw              : in     vl_logic_vector(9 downto 0);
        d               : in     vl_logic_vector(9 downto 0);
        wn              : in     vl_logic_vector(3 downto 0);
        we              : in     vl_logic;
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        exist           : out    vl_logic;
        led             : out    vl_logic_vector(9 downto 0)
    );
end number_mem;
