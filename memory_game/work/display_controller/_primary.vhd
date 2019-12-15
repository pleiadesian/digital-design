library verilog;
use verilog.vl_types.all;
entity display_controller is
    port(
        input_key       : in     vl_logic;
        exist           : in     vl_logic;
        display_state   : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        display_clk     : in     vl_logic;
        resetn          : in     vl_logic;
        hex5            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        correct         : out    vl_logic_vector(6 downto 0);
        incorrect       : out    vl_logic_vector(6 downto 0);
        percent         : out    vl_logic_vector(6 downto 0)
    );
end display_controller;
