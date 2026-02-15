library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end entity;

architecture Behavior of adder_tb is
    constant N : INTEGER := 4;
    signal A, B  : STD_LOGIC_VECTOR(N-1 downto 0) := (OTHERS => '0');
    signal cin   : STD_LOGIC := '0';
    signal cout  : STD_LOGIC := '0';
    signal res   : STD_LOGIC_VECTOR(N-1 downto 0) := (OTHERS => '0');
begin
    adder_inst: entity work.adder
    generic map(
        N => N
    )
    port map(
        A => A,
        B => B,
        cin => cin,
        cout => cout,
        res => res
    );

    sim_adder: process
    begin
        wait for 3 ns;
        A <= "0010";
        B <= "0100";
        cin <= '0';
        wait for 4 ns;

        A <= "0010";
        B <= "0110";
        cin <= '1';
        wait for 8 ns;
    end process;
end architecture;