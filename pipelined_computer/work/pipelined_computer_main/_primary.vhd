library verilog;
use verilog.vl_types.all;
entity pipelined_computer_main is
    port(
        resetn          : in     vl_logic;
        clock           : in     vl_logic;
        mem_clock       : out    vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        ealu            : out    vl_logic_vector(31 downto 0);
        malu            : out    vl_logic_vector(31 downto 0);
        walu            : out    vl_logic_vector(31 downto 0);
        pc4             : out    vl_logic_vector(31 downto 0);
        bpc             : out    vl_logic_vector(31 downto 0);
        jpc             : out    vl_logic_vector(31 downto 0);
        pcsource        : out    vl_logic_vector(1 downto 0);
        ins             : out    vl_logic_vector(31 downto 0);
        dpc4            : out    vl_logic_vector(31 downto 0);
        da              : out    vl_logic_vector(31 downto 0);
        db              : out    vl_logic_vector(31 downto 0);
        dimm            : out    vl_logic_vector(31 downto 0);
        drn             : out    vl_logic_vector(4 downto 0);
        eb              : out    vl_logic_vector(31 downto 0);
        ern             : out    vl_logic_vector(4 downto 0);
        mmo             : out    vl_logic_vector(31 downto 0);
        mrn             : out    vl_logic_vector(4 downto 0);
        wdi             : out    vl_logic_vector(31 downto 0);
        wrn             : out    vl_logic_vector(4 downto 0);
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
end pipelined_computer_main;
