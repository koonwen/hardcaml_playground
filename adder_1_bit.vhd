library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_1_bit is
    port (
        b : in std_logic;
        a : in std_logic;
        c : out std_logic
    );
end entity;

architecture rtl of adder_1_bit is

    -- conversion functions
    function hc_uns(a : std_logic)        return unsigned         is variable b : unsigned(0 downto 0); begin b(0) := a; return b; end;
    function hc_uns(a : std_logic_vector) return unsigned         is begin return unsigned(a); end;
    function hc_sgn(a : std_logic)        return signed           is variable b : signed(0 downto 0); begin b(0) := a; return b; end;
    function hc_sgn(a : std_logic_vector) return signed           is begin return signed(a); end;
    function hc_sl (a : std_logic_vector) return std_logic        is begin return a(a'right); end;
    function hc_sl (a : unsigned)         return std_logic        is begin return a(a'right); end;
    function hc_sl (a : signed)           return std_logic        is begin return a(a'right); end;
    function hc_sl (a : boolean)          return std_logic        is begin if a then return '1'; else return '0'; end if; end;
    function hc_slv(a : std_logic_vector) return std_logic_vector is begin return a; end;
    function hc_slv(a : unsigned)         return std_logic_vector is begin return std_logic_vector(a); end;
    function hc_slv(a : signed)           return std_logic_vector is begin return std_logic_vector(a); end;

    -- signal declarations
    signal hc_4 : std_logic;

begin

    -- logic
    hc_4 <= hc_sl(hc_uns(a) + hc_uns(b));

    -- aliases

    -- output assignments
    c <= hc_4;

end architecture;
