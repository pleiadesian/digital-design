library verilog;
use verilog.vl_types.all;
entity leds is
    port(
        clk_50M         : in     vl_logic;
        reset_n         : in     vl_logic;
        led             : out    vl_logic_vector(9 downto 0)
    );
end leds;
