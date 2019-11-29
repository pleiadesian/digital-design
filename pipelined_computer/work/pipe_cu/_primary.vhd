library verilog;
use verilog.vl_types.all;
entity pipe_cu is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        ern             : in     vl_logic_vector(4 downto 0);
        mrn             : in     vl_logic_vector(4 downto 0);
        rsrtequ         : in     vl_logic;
        ewreg           : in     vl_logic;
        em2reg          : in     vl_logic;
        mwreg           : in     vl_logic;
        mm2reg          : in     vl_logic;
        wpcir           : out    vl_logic;
        wreg            : out    vl_logic;
        m2reg           : out    vl_logic;
        wmem            : out    vl_logic;
        jal             : out    vl_logic;
        aluimm          : out    vl_logic;
        shift           : out    vl_logic;
        regrt           : out    vl_logic;
        sext            : out    vl_logic;
        pcsource        : out    vl_logic_vector(1 downto 0);
        fwda            : out    vl_logic_vector(1 downto 0);
        fwdb            : out    vl_logic_vector(1 downto 0);
        aluc            : out    vl_logic_vector(3 downto 0)
    );
end pipe_cu;
