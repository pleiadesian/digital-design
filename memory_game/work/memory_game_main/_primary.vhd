library verilog;
use verilog.vl_types.all;
entity memory_game_main is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        sw              : in     vl_logic_vector(9 downto 0);
        key             : in     vl_logic_vector(3 downto 1);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        led             : out    vl_logic_vector(9 downto 0);
        game_clk        : out    vl_logic;
        display_clk     : out    vl_logic;
        d               : out    vl_logic_vector(9 downto 0);
        wn              : out    vl_logic_vector(3 downto 0);
        we              : out    vl_logic;
        exist           : out    vl_logic;
        display_state   : out    vl_logic_vector(2 downto 0);
        correct         : out    vl_logic_vector(6 downto 0);
        incorrect       : out    vl_logic_vector(6 downto 0);
        percent         : out    vl_logic_vector(6 downto 0)
    );
end memory_game_main;
