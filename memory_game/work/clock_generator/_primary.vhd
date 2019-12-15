library verilog;
use verilog.vl_types.all;
entity clock_generator is
    generic(
        GAME_CYCLE      : integer := 500;
        DISPLAY_CYCLE   : integer := 100
    );
    port(
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        game_clk        : out    vl_logic;
        display_clk     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of GAME_CYCLE : constant is 1;
    attribute mti_svvh_generic_type of DISPLAY_CYCLE : constant is 1;
end clock_generator;
