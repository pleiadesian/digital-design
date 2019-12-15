library verilog;
use verilog.vl_types.all;
entity random_generator is
    port(
        clk             : in     vl_logic;
        game_clk        : in     vl_logic;
        resetn          : in     vl_logic;
        randnum         : out    vl_logic_vector(9 downto 0)
    );
end random_generator;
