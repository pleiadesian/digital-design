library verilog;
use verilog.vl_types.all;
entity game_start is
    generic(
        DISPLAY_CYCLE   : integer := 10
    );
    port(
        start_key       : in     vl_logic;
        clk             : in     vl_logic;
        game_clk        : in     vl_logic;
        resetn          : in     vl_logic;
        d               : out    vl_logic_vector(9 downto 0);
        wn              : out    vl_logic_vector(3 downto 0);
        we              : out    vl_logic;
        led             : out    vl_logic_vector(9 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DISPLAY_CYCLE : constant is 1;
end game_start;
