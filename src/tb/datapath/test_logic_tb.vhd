library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_logic_tb is
end entity;

architecture Behavior of test_logic_tb is
    signal input : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal D7 : STD_LOGIC;
    signal D711 : STD_LOGIC;
    signal D2312 : STD_LOGIC;
begin
    test_logic_inst: entity work.test_logic
    port map(
        input => input,
        D7 => D7,
        D711 => D711,
        D2312 => D2312
    );

    test_sim: process
    begin
        input <= "0000";
        wait for 10 ns;

        input <= "0111";
        wait for 10 ns;
        input <= "1011";
        wait for 10 ns;

        input <= "0010";
        wait for 10 ns;

        input <= "0011";
        wait for 10 ns;

        input <= "1100";
        wait for 10 ns;
    end process;
end architecture;