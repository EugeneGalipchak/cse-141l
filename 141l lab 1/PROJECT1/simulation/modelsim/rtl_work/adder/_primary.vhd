library verilog;
use verilog.vl_types.all;
entity adder is
    generic(
        W               : integer := 8
    );
    port(
        clk             : in     vl_logic;
        a_i             : in     vl_logic_vector;
        b_i             : in     vl_logic_vector;
        sum_o           : out    vl_logic_vector;
        is_odd_o        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of W : constant is 1;
end adder;
