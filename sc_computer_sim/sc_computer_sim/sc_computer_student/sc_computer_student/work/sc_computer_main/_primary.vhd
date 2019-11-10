library verilog;
use verilog.vl_types.all;
entity sc_computer_main is
    port(
        resetn          : in     vl_logic;
        clock           : in     vl_logic;
        mem_clk         : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        memout          : out    vl_logic_vector(31 downto 0);
        imem_clk        : out    vl_logic;
        dmem_clk        : out    vl_logic;
        key             : in     vl_logic_vector(3 downto 1);
        data            : out    vl_logic_vector(31 downto 0);
        wmem            : out    vl_logic;
        sw              : in     vl_logic_vector(9 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        led             : out    vl_logic_vector(9 downto 0)
    );
end sc_computer_main;
