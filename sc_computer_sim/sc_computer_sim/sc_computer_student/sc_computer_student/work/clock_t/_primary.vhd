library verilog;
use verilog.vl_types.all;
entity clock_t is
    generic(
        CYCLE           : integer := 2
    );
    port(
        clk_50          : in     vl_logic;
        resetn          : in     vl_logic;
        clk_t           : out    vl_logic;
        clk_2t          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CYCLE : constant is 1;
end clock_t;
