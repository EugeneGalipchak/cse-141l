library verilog;
use verilog.vl_types.all;
entity \register\ is
    generic(
        W               : integer := 16;
        R               : integer := 8
    );
    port(
        clk             : in     vl_logic;
        wen_i           : in     vl_logic;
        wa_i            : in     vl_logic_vector;
        wd_i            : in     vl_logic_vector;
        ra0_i           : in     vl_logic_vector;
        ra1_i           : in     vl_logic_vector;
        rd0_o           : out    vl_logic_vector;
        rd1_o           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of W : constant is 1;
    attribute mti_svvh_generic_type of R : constant is 1;
end \register\;
