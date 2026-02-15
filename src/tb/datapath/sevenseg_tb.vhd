library ieee;
use ieee.std_logic_1164.all;

entity sevenseg_tb is
end entity;

architecture Behavior of sevenseg_tb is
    signal input : std_logic_vector(2 downto 0) := (others => '0');
    signal res : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
begin
    sevenseg_inst: entity work.sevenseg
    port map(
        input => input,
        res => res
    );

    sim_proc: process
    begin
        input <= "100";
        wait for 4 ns;
        input <= "101";
        wait for 4 ns;
    end process;
end architecture;