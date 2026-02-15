library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_logic is
    port (
        input  : in  STD_LOGIC_VECTOR(3 downto 0);
        D7    : out STD_LOGIC;
        D711  : out STD_LOGIC;
        D2312 : out STD_LOGIC
    );
end entity;

architecture Behavior of test_logic is
    signal din_int : INTEGER range 0 to 15;
begin
    din_int <= to_integer(unsigned(input));
    D7    <= '1' when din_int = 7 else '0';
    D711  <= '1' when (din_int = 7 or din_int = 11) else '0';
    D2312 <= '1' when (din_int = 2 or din_int = 3 or din_int = 12) else '0';
end architecture;