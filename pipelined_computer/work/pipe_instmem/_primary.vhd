library verilog;
use verilog.vl_types.all;
entity pipe_instmem is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        rom_clock       : in     vl_logic
    );
end pipe_instmem;
