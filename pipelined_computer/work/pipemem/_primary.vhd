library verilog;
use verilog.vl_types.all;
entity pipemem is
    port(
        mwmem           : in     vl_logic;
        malu            : in     vl_logic_vector(31 downto 0);
        mb              : in     vl_logic_vector(31 downto 0);
        ram_clock       : in     vl_logic;
        resetn          : in     vl_logic;
        mmo             : out    vl_logic_vector(31 downto 0);
        sw              : in     vl_logic_vector(9 downto 0);
        key             : in     vl_logic_vector(3 downto 1);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        led             : out    vl_logic_vector(9 downto 0)
    );
end pipemem;
