library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity priorityencoder is
    port (
        a : in std_logic_vector (23 downto 0);
        res : out std_logic_vector (4 downto 0)
    );
end entity;

architecture rtl of priorityencoder is

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
    constant hc_92 : std_logic_vector (4 downto 0) := "10111";
    constant hc_91 : std_logic_vector (4 downto 0) := "10110";
    signal hc_93 : std_logic_vector (4 downto 0);
    constant hc_89 : std_logic_vector (4 downto 0) := "10101";
    constant hc_88 : std_logic_vector (4 downto 0) := "10100";
    signal hc_90 : std_logic_vector (4 downto 0);
    signal hc_94 : std_logic_vector (4 downto 0);
    constant hc_85 : std_logic_vector (4 downto 0) := "10011";
    constant hc_84 : std_logic_vector (4 downto 0) := "10010";
    signal hc_86 : std_logic_vector (4 downto 0);
    constant hc_82 : std_logic_vector (4 downto 0) := "10001";
    constant hc_81 : std_logic_vector (4 downto 0) := "10000";
    signal hc_83 : std_logic_vector (4 downto 0);
    signal hc_87 : std_logic_vector (4 downto 0);
    signal hc_95 : std_logic_vector (4 downto 0);
    constant hc_77 : std_logic_vector (4 downto 0) := "01111";
    constant hc_76 : std_logic_vector (4 downto 0) := "01110";
    signal hc_78 : std_logic_vector (4 downto 0);
    constant hc_74 : std_logic_vector (4 downto 0) := "01101";
    constant hc_73 : std_logic_vector (4 downto 0) := "01100";
    signal hc_75 : std_logic_vector (4 downto 0);
    signal hc_79 : std_logic_vector (4 downto 0);
    constant hc_70 : std_logic_vector (4 downto 0) := "01011";
    constant hc_69 : std_logic_vector (4 downto 0) := "01010";
    signal hc_71 : std_logic_vector (4 downto 0);
    constant hc_67 : std_logic_vector (4 downto 0) := "01001";
    constant hc_66 : std_logic_vector (4 downto 0) := "01000";
    signal hc_68 : std_logic_vector (4 downto 0);
    signal hc_72 : std_logic_vector (4 downto 0);
    signal hc_80 : std_logic_vector (4 downto 0);
    signal hc_96 : std_logic_vector (4 downto 0);
    constant hc_62 : std_logic_vector (4 downto 0) := "00111";
    constant hc_61 : std_logic_vector (4 downto 0) := "00110";
    signal hc_63 : std_logic_vector (4 downto 0);
    constant hc_59 : std_logic_vector (4 downto 0) := "00101";
    constant hc_58 : std_logic_vector (4 downto 0) := "00100";
    signal hc_60 : std_logic_vector (4 downto 0);
    signal hc_64 : std_logic_vector (4 downto 0);
    constant hc_55 : std_logic_vector (4 downto 0) := "00011";
    constant hc_54 : std_logic_vector (4 downto 0) := "00010";
    signal hc_56 : std_logic_vector (4 downto 0);
    constant hc_52 : std_logic_vector (4 downto 0) := "00001";
    constant hc_51 : std_logic_vector (4 downto 0) := "00000";
    signal hc_53 : std_logic_vector (4 downto 0);
    signal hc_57 : std_logic_vector (4 downto 0);
    signal hc_65 : std_logic_vector (4 downto 0);
    signal hc_97 : std_logic_vector (4 downto 0);
    constant hc_50 : std_logic_vector (4 downto 0) := "00000";
    signal hc_45 : std_logic;
    signal hc_44 : std_logic;
    signal hc_46 : std_logic;
    signal hc_42 : std_logic;
    signal hc_41 : std_logic;
    signal hc_43 : std_logic;
    signal hc_47 : std_logic;
    signal hc_38 : std_logic;
    signal hc_37 : std_logic;
    signal hc_39 : std_logic;
    signal hc_35 : std_logic;
    signal hc_34 : std_logic;
    signal hc_36 : std_logic;
    signal hc_40 : std_logic;
    signal hc_48 : std_logic;
    signal hc_29 : std_logic;
    signal hc_28 : std_logic;
    signal hc_30 : std_logic;
    signal hc_26 : std_logic;
    signal hc_25 : std_logic;
    signal hc_27 : std_logic;
    signal hc_31 : std_logic;
    signal hc_22 : std_logic;
    signal hc_21 : std_logic;
    signal hc_23 : std_logic;
    signal hc_19 : std_logic;
    signal hc_18 : std_logic;
    signal hc_20 : std_logic;
    signal hc_24 : std_logic;
    signal hc_32 : std_logic;
    signal hc_14 : std_logic;
    signal hc_13 : std_logic;
    signal hc_15 : std_logic;
    signal hc_11 : std_logic;
    signal hc_10 : std_logic;
    signal hc_12 : std_logic;
    signal hc_16 : std_logic;
    signal hc_7 : std_logic;
    signal hc_6 : std_logic;
    signal hc_8 : std_logic;
    signal hc_4 : std_logic;
    signal hc_3 : std_logic;
    signal hc_5 : std_logic;
    signal hc_9 : std_logic;
    signal hc_17 : std_logic;
    signal hc_33 : std_logic;
    signal hc_49 : std_logic;
    signal hc_98 : std_logic_vector (4 downto 0);

begin

    -- logic
    with to_integer(hc_uns(hc_3)) select hc_93 <= 
        hc_91 when 0,
        hc_92 when others;
    with to_integer(hc_uns(hc_6)) select hc_90 <= 
        hc_88 when 0,
        hc_89 when others;
    with to_integer(hc_uns(hc_5)) select hc_94 <= 
        hc_90 when 0,
        hc_93 when others;
    with to_integer(hc_uns(hc_10)) select hc_86 <= 
        hc_84 when 0,
        hc_85 when others;
    with to_integer(hc_uns(hc_13)) select hc_83 <= 
        hc_81 when 0,
        hc_82 when others;
    with to_integer(hc_uns(hc_12)) select hc_87 <= 
        hc_83 when 0,
        hc_86 when others;
    with to_integer(hc_uns(hc_9)) select hc_95 <= 
        hc_87 when 0,
        hc_94 when others;
    with to_integer(hc_uns(hc_18)) select hc_78 <= 
        hc_76 when 0,
        hc_77 when others;
    with to_integer(hc_uns(hc_21)) select hc_75 <= 
        hc_73 when 0,
        hc_74 when others;
    with to_integer(hc_uns(hc_20)) select hc_79 <= 
        hc_75 when 0,
        hc_78 when others;
    with to_integer(hc_uns(hc_25)) select hc_71 <= 
        hc_69 when 0,
        hc_70 when others;
    with to_integer(hc_uns(hc_28)) select hc_68 <= 
        hc_66 when 0,
        hc_67 when others;
    with to_integer(hc_uns(hc_27)) select hc_72 <= 
        hc_68 when 0,
        hc_71 when others;
    with to_integer(hc_uns(hc_24)) select hc_80 <= 
        hc_72 when 0,
        hc_79 when others;
    with to_integer(hc_uns(hc_17)) select hc_96 <= 
        hc_80 when 0,
        hc_95 when others;
    with to_integer(hc_uns(hc_34)) select hc_63 <= 
        hc_61 when 0,
        hc_62 when others;
    with to_integer(hc_uns(hc_37)) select hc_60 <= 
        hc_58 when 0,
        hc_59 when others;
    with to_integer(hc_uns(hc_36)) select hc_64 <= 
        hc_60 when 0,
        hc_63 when others;
    with to_integer(hc_uns(hc_41)) select hc_56 <= 
        hc_54 when 0,
        hc_55 when others;
    with to_integer(hc_uns(hc_44)) select hc_53 <= 
        hc_51 when 0,
        hc_52 when others;
    with to_integer(hc_uns(hc_43)) select hc_57 <= 
        hc_53 when 0,
        hc_56 when others;
    with to_integer(hc_uns(hc_40)) select hc_65 <= 
        hc_57 when 0,
        hc_64 when others;
    with to_integer(hc_uns(hc_33)) select hc_97 <= 
        hc_65 when 0,
        hc_96 when others;
    hc_45 <= hc_sl(a(0 downto 0));
    hc_44 <= hc_sl(a(1 downto 1));
    hc_46 <= hc_sl(hc_uns(hc_44) or hc_uns(hc_45));
    hc_42 <= hc_sl(a(2 downto 2));
    hc_41 <= hc_sl(a(3 downto 3));
    hc_43 <= hc_sl(hc_uns(hc_41) or hc_uns(hc_42));
    hc_47 <= hc_sl(hc_uns(hc_43) or hc_uns(hc_46));
    hc_38 <= hc_sl(a(4 downto 4));
    hc_37 <= hc_sl(a(5 downto 5));
    hc_39 <= hc_sl(hc_uns(hc_37) or hc_uns(hc_38));
    hc_35 <= hc_sl(a(6 downto 6));
    hc_34 <= hc_sl(a(7 downto 7));
    hc_36 <= hc_sl(hc_uns(hc_34) or hc_uns(hc_35));
    hc_40 <= hc_sl(hc_uns(hc_36) or hc_uns(hc_39));
    hc_48 <= hc_sl(hc_uns(hc_40) or hc_uns(hc_47));
    hc_29 <= hc_sl(a(8 downto 8));
    hc_28 <= hc_sl(a(9 downto 9));
    hc_30 <= hc_sl(hc_uns(hc_28) or hc_uns(hc_29));
    hc_26 <= hc_sl(a(10 downto 10));
    hc_25 <= hc_sl(a(11 downto 11));
    hc_27 <= hc_sl(hc_uns(hc_25) or hc_uns(hc_26));
    hc_31 <= hc_sl(hc_uns(hc_27) or hc_uns(hc_30));
    hc_22 <= hc_sl(a(12 downto 12));
    hc_21 <= hc_sl(a(13 downto 13));
    hc_23 <= hc_sl(hc_uns(hc_21) or hc_uns(hc_22));
    hc_19 <= hc_sl(a(14 downto 14));
    hc_18 <= hc_sl(a(15 downto 15));
    hc_20 <= hc_sl(hc_uns(hc_18) or hc_uns(hc_19));
    hc_24 <= hc_sl(hc_uns(hc_20) or hc_uns(hc_23));
    hc_32 <= hc_sl(hc_uns(hc_24) or hc_uns(hc_31));
    hc_14 <= hc_sl(a(16 downto 16));
    hc_13 <= hc_sl(a(17 downto 17));
    hc_15 <= hc_sl(hc_uns(hc_13) or hc_uns(hc_14));
    hc_11 <= hc_sl(a(18 downto 18));
    hc_10 <= hc_sl(a(19 downto 19));
    hc_12 <= hc_sl(hc_uns(hc_10) or hc_uns(hc_11));
    hc_16 <= hc_sl(hc_uns(hc_12) or hc_uns(hc_15));
    hc_7 <= hc_sl(a(20 downto 20));
    hc_6 <= hc_sl(a(21 downto 21));
    hc_8 <= hc_sl(hc_uns(hc_6) or hc_uns(hc_7));
    hc_4 <= hc_sl(a(22 downto 22));
    hc_3 <= hc_sl(a(23 downto 23));
    hc_5 <= hc_sl(hc_uns(hc_3) or hc_uns(hc_4));
    hc_9 <= hc_sl(hc_uns(hc_5) or hc_uns(hc_8));
    hc_17 <= hc_sl(hc_uns(hc_9) or hc_uns(hc_16));
    hc_33 <= hc_sl(hc_uns(hc_17) or hc_uns(hc_32));
    hc_49 <= hc_sl(hc_uns(hc_33) or hc_uns(hc_48));
    with to_integer(hc_uns(hc_49)) select hc_98 <= 
        hc_50 when 0,
        hc_97 when others;

    -- aliases

    -- output assignments
    res <= hc_98;

end architecture;
