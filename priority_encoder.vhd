library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity priority_encoder is
    port (
        a : in std_logic_vector (23 downto 0);
        priority : out std_logic_vector (7 downto 0)
    );
end entity;

architecture rtl of priority_encoder is

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
    constant hc_117 : std_logic_vector (7 downto 0) := "00011000";
    constant hc_116 : std_logic_vector (7 downto 0) := "00010111";
    signal hc_118 : std_logic_vector (7 downto 0);
    constant hc_114 : std_logic_vector (7 downto 0) := "00010110";
    constant hc_113 : std_logic_vector (7 downto 0) := "00010101";
    signal hc_115 : std_logic_vector (7 downto 0);
    signal hc_119 : std_logic_vector (7 downto 0);
    constant hc_110 : std_logic_vector (7 downto 0) := "00010100";
    constant hc_109 : std_logic_vector (7 downto 0) := "00010011";
    signal hc_111 : std_logic_vector (7 downto 0);
    constant hc_107 : std_logic_vector (7 downto 0) := "00010010";
    constant hc_106 : std_logic_vector (7 downto 0) := "00010001";
    signal hc_108 : std_logic_vector (7 downto 0);
    signal hc_112 : std_logic_vector (7 downto 0);
    signal hc_120 : std_logic_vector (7 downto 0);
    constant hc_102 : std_logic_vector (7 downto 0) := "00010000";
    constant hc_101 : std_logic_vector (7 downto 0) := "00001111";
    signal hc_103 : std_logic_vector (7 downto 0);
    constant hc_99 : std_logic_vector (7 downto 0) := "00001110";
    constant hc_98 : std_logic_vector (7 downto 0) := "00001101";
    signal hc_100 : std_logic_vector (7 downto 0);
    signal hc_104 : std_logic_vector (7 downto 0);
    constant hc_95 : std_logic_vector (7 downto 0) := "00001100";
    constant hc_94 : std_logic_vector (7 downto 0) := "00001011";
    signal hc_96 : std_logic_vector (7 downto 0);
    constant hc_92 : std_logic_vector (7 downto 0) := "00001010";
    constant hc_91 : std_logic_vector (7 downto 0) := "00001001";
    signal hc_93 : std_logic_vector (7 downto 0);
    signal hc_97 : std_logic_vector (7 downto 0);
    signal hc_105 : std_logic_vector (7 downto 0);
    signal hc_121 : std_logic_vector (7 downto 0);
    constant hc_87 : std_logic_vector (7 downto 0) := "00001000";
    constant hc_86 : std_logic_vector (7 downto 0) := "00000111";
    signal hc_88 : std_logic_vector (7 downto 0);
    constant hc_84 : std_logic_vector (7 downto 0) := "00000110";
    constant hc_83 : std_logic_vector (7 downto 0) := "00000101";
    signal hc_85 : std_logic_vector (7 downto 0);
    signal hc_89 : std_logic_vector (7 downto 0);
    constant hc_80 : std_logic_vector (7 downto 0) := "00000100";
    constant hc_79 : std_logic_vector (7 downto 0) := "00000011";
    signal hc_81 : std_logic_vector (7 downto 0);
    constant hc_77 : std_logic_vector (7 downto 0) := "00000010";
    constant hc_76 : std_logic_vector (7 downto 0) := "00000001";
    signal hc_78 : std_logic_vector (7 downto 0);
    signal hc_82 : std_logic_vector (7 downto 0);
    signal hc_90 : std_logic_vector (7 downto 0);
    signal hc_122 : std_logic_vector (7 downto 0);
    constant hc_75 : std_logic_vector (7 downto 0) := "00000000";
    signal hc_70 : std_logic;
    signal hc_69 : std_logic;
    signal hc_71 : std_logic;
    signal hc_67 : std_logic;
    signal hc_66 : std_logic;
    signal hc_68 : std_logic;
    signal hc_72 : std_logic;
    signal hc_63 : std_logic;
    signal hc_62 : std_logic;
    signal hc_64 : std_logic;
    signal hc_60 : std_logic;
    signal hc_59 : std_logic;
    signal hc_61 : std_logic;
    signal hc_65 : std_logic;
    signal hc_73 : std_logic;
    signal hc_54 : std_logic;
    signal hc_53 : std_logic;
    signal hc_55 : std_logic;
    signal hc_51 : std_logic;
    signal hc_50 : std_logic;
    signal hc_52 : std_logic;
    signal hc_56 : std_logic;
    signal hc_47 : std_logic;
    signal hc_46 : std_logic;
    signal hc_48 : std_logic;
    signal hc_44 : std_logic;
    signal hc_43 : std_logic;
    signal hc_45 : std_logic;
    signal hc_49 : std_logic;
    signal hc_57 : std_logic;
    signal hc_39 : std_logic;
    signal hc_38 : std_logic;
    signal hc_40 : std_logic;
    signal hc_36 : std_logic;
    signal hc_35 : std_logic;
    signal hc_37 : std_logic;
    signal hc_41 : std_logic;
    signal hc_32 : std_logic;
    signal hc_31 : std_logic;
    signal hc_33 : std_logic;
    signal hc_29 : std_logic;
    signal hc_26 : std_logic;
    signal hc_25 : std_logic;
    signal hc_24 : std_logic;
    signal hc_23 : std_logic;
    signal hc_22 : std_logic;
    signal hc_21 : std_logic;
    signal hc_20 : std_logic;
    signal hc_19 : std_logic;
    signal hc_18 : std_logic;
    signal hc_17 : std_logic;
    signal hc_16 : std_logic;
    signal hc_15 : std_logic;
    signal hc_14 : std_logic;
    signal hc_13 : std_logic;
    signal hc_12 : std_logic;
    signal hc_11 : std_logic;
    signal hc_10 : std_logic;
    signal hc_9 : std_logic;
    signal hc_8 : std_logic;
    signal hc_7 : std_logic;
    signal hc_6 : std_logic;
    signal hc_5 : std_logic;
    signal hc_4 : std_logic;
    signal hc_3 : std_logic;
    signal hc_27 : std_logic_vector (23 downto 0);
    signal hc_28 : std_logic;
    signal hc_30 : std_logic;
    signal hc_34 : std_logic;
    signal hc_42 : std_logic;
    signal hc_58 : std_logic;
    signal hc_74 : std_logic;
    signal hc_123 : std_logic_vector (7 downto 0);

begin

    -- logic
    with to_integer(hc_uns(hc_28)) select hc_118 <= 
        hc_116 when 0,
        hc_117 when others;
    with to_integer(hc_uns(hc_31)) select hc_115 <= 
        hc_113 when 0,
        hc_114 when others;
    with to_integer(hc_uns(hc_30)) select hc_119 <= 
        hc_115 when 0,
        hc_118 when others;
    with to_integer(hc_uns(hc_35)) select hc_111 <= 
        hc_109 when 0,
        hc_110 when others;
    with to_integer(hc_uns(hc_38)) select hc_108 <= 
        hc_106 when 0,
        hc_107 when others;
    with to_integer(hc_uns(hc_37)) select hc_112 <= 
        hc_108 when 0,
        hc_111 when others;
    with to_integer(hc_uns(hc_34)) select hc_120 <= 
        hc_112 when 0,
        hc_119 when others;
    with to_integer(hc_uns(hc_43)) select hc_103 <= 
        hc_101 when 0,
        hc_102 when others;
    with to_integer(hc_uns(hc_46)) select hc_100 <= 
        hc_98 when 0,
        hc_99 when others;
    with to_integer(hc_uns(hc_45)) select hc_104 <= 
        hc_100 when 0,
        hc_103 when others;
    with to_integer(hc_uns(hc_50)) select hc_96 <= 
        hc_94 when 0,
        hc_95 when others;
    with to_integer(hc_uns(hc_53)) select hc_93 <= 
        hc_91 when 0,
        hc_92 when others;
    with to_integer(hc_uns(hc_52)) select hc_97 <= 
        hc_93 when 0,
        hc_96 when others;
    with to_integer(hc_uns(hc_49)) select hc_105 <= 
        hc_97 when 0,
        hc_104 when others;
    with to_integer(hc_uns(hc_42)) select hc_121 <= 
        hc_105 when 0,
        hc_120 when others;
    with to_integer(hc_uns(hc_59)) select hc_88 <= 
        hc_86 when 0,
        hc_87 when others;
    with to_integer(hc_uns(hc_62)) select hc_85 <= 
        hc_83 when 0,
        hc_84 when others;
    with to_integer(hc_uns(hc_61)) select hc_89 <= 
        hc_85 when 0,
        hc_88 when others;
    with to_integer(hc_uns(hc_66)) select hc_81 <= 
        hc_79 when 0,
        hc_80 when others;
    with to_integer(hc_uns(hc_69)) select hc_78 <= 
        hc_76 when 0,
        hc_77 when others;
    with to_integer(hc_uns(hc_68)) select hc_82 <= 
        hc_78 when 0,
        hc_81 when others;
    with to_integer(hc_uns(hc_65)) select hc_90 <= 
        hc_82 when 0,
        hc_89 when others;
    with to_integer(hc_uns(hc_58)) select hc_122 <= 
        hc_90 when 0,
        hc_121 when others;
    hc_70 <= hc_sl(hc_27(23 downto 23));
    hc_69 <= hc_sl(hc_27(22 downto 22));
    hc_71 <= hc_sl(hc_uns(hc_69) or hc_uns(hc_70));
    hc_67 <= hc_sl(hc_27(21 downto 21));
    hc_66 <= hc_sl(hc_27(20 downto 20));
    hc_68 <= hc_sl(hc_uns(hc_66) or hc_uns(hc_67));
    hc_72 <= hc_sl(hc_uns(hc_68) or hc_uns(hc_71));
    hc_63 <= hc_sl(hc_27(19 downto 19));
    hc_62 <= hc_sl(hc_27(18 downto 18));
    hc_64 <= hc_sl(hc_uns(hc_62) or hc_uns(hc_63));
    hc_60 <= hc_sl(hc_27(17 downto 17));
    hc_59 <= hc_sl(hc_27(16 downto 16));
    hc_61 <= hc_sl(hc_uns(hc_59) or hc_uns(hc_60));
    hc_65 <= hc_sl(hc_uns(hc_61) or hc_uns(hc_64));
    hc_73 <= hc_sl(hc_uns(hc_65) or hc_uns(hc_72));
    hc_54 <= hc_sl(hc_27(15 downto 15));
    hc_53 <= hc_sl(hc_27(14 downto 14));
    hc_55 <= hc_sl(hc_uns(hc_53) or hc_uns(hc_54));
    hc_51 <= hc_sl(hc_27(13 downto 13));
    hc_50 <= hc_sl(hc_27(12 downto 12));
    hc_52 <= hc_sl(hc_uns(hc_50) or hc_uns(hc_51));
    hc_56 <= hc_sl(hc_uns(hc_52) or hc_uns(hc_55));
    hc_47 <= hc_sl(hc_27(11 downto 11));
    hc_46 <= hc_sl(hc_27(10 downto 10));
    hc_48 <= hc_sl(hc_uns(hc_46) or hc_uns(hc_47));
    hc_44 <= hc_sl(hc_27(9 downto 9));
    hc_43 <= hc_sl(hc_27(8 downto 8));
    hc_45 <= hc_sl(hc_uns(hc_43) or hc_uns(hc_44));
    hc_49 <= hc_sl(hc_uns(hc_45) or hc_uns(hc_48));
    hc_57 <= hc_sl(hc_uns(hc_49) or hc_uns(hc_56));
    hc_39 <= hc_sl(hc_27(7 downto 7));
    hc_38 <= hc_sl(hc_27(6 downto 6));
    hc_40 <= hc_sl(hc_uns(hc_38) or hc_uns(hc_39));
    hc_36 <= hc_sl(hc_27(5 downto 5));
    hc_35 <= hc_sl(hc_27(4 downto 4));
    hc_37 <= hc_sl(hc_uns(hc_35) or hc_uns(hc_36));
    hc_41 <= hc_sl(hc_uns(hc_37) or hc_uns(hc_40));
    hc_32 <= hc_sl(hc_27(3 downto 3));
    hc_31 <= hc_sl(hc_27(2 downto 2));
    hc_33 <= hc_sl(hc_uns(hc_31) or hc_uns(hc_32));
    hc_29 <= hc_sl(hc_27(1 downto 1));
    hc_26 <= hc_sl(a(23 downto 23));
    hc_25 <= hc_sl(a(22 downto 22));
    hc_24 <= hc_sl(a(21 downto 21));
    hc_23 <= hc_sl(a(20 downto 20));
    hc_22 <= hc_sl(a(19 downto 19));
    hc_21 <= hc_sl(a(18 downto 18));
    hc_20 <= hc_sl(a(17 downto 17));
    hc_19 <= hc_sl(a(16 downto 16));
    hc_18 <= hc_sl(a(15 downto 15));
    hc_17 <= hc_sl(a(14 downto 14));
    hc_16 <= hc_sl(a(13 downto 13));
    hc_15 <= hc_sl(a(12 downto 12));
    hc_14 <= hc_sl(a(11 downto 11));
    hc_13 <= hc_sl(a(10 downto 10));
    hc_12 <= hc_sl(a(9 downto 9));
    hc_11 <= hc_sl(a(8 downto 8));
    hc_10 <= hc_sl(a(7 downto 7));
    hc_9 <= hc_sl(a(6 downto 6));
    hc_8 <= hc_sl(a(5 downto 5));
    hc_7 <= hc_sl(a(4 downto 4));
    hc_6 <= hc_sl(a(3 downto 3));
    hc_5 <= hc_sl(a(2 downto 2));
    hc_4 <= hc_sl(a(1 downto 1));
    hc_3 <= hc_sl(a(0 downto 0));
    hc_27 <= hc_3 & hc_4 & hc_5 & hc_6 & hc_7 & hc_8 & hc_9 & hc_10 & hc_11 & hc_12 & hc_13 & hc_14 & hc_15 & hc_16 & hc_17 & hc_18 & hc_19 & hc_20 & hc_21 & hc_22 & hc_23 & hc_24 & hc_25 & hc_26;
    hc_28 <= hc_sl(hc_27(0 downto 0));
    hc_30 <= hc_sl(hc_uns(hc_28) or hc_uns(hc_29));
    hc_34 <= hc_sl(hc_uns(hc_30) or hc_uns(hc_33));
    hc_42 <= hc_sl(hc_uns(hc_34) or hc_uns(hc_41));
    hc_58 <= hc_sl(hc_uns(hc_42) or hc_uns(hc_57));
    hc_74 <= hc_sl(hc_uns(hc_58) or hc_uns(hc_73));
    with to_integer(hc_uns(hc_74)) select hc_123 <= 
        hc_75 when 0,
        hc_122 when others;

    -- aliases

    -- output assignments
    priority <= hc_123;

end architecture;
