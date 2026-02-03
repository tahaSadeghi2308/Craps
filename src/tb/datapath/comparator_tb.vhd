library ieee;
use ieee.std_logic_1164.all;

entity comparator_tb is
end entity;

architecture Behavior of comparator_tb is
    constant N : integer := 5;
    signal A , B : std_logic_vector(N - 1 downto 0) := (others => '0');
    signal eq : std_logic := '0';
begin
    comparator_inst: entity work.comparator
    generic map(
        N => N
    )
    port map(
        A => A,
        B => B,
        eq => eq
    );

    sim_proc: process 
    begin
        -- equality check
        A <= "11100";
        B <= "11100";
        wait for 10 ns;

        -- non-equality check
        A <= "11100";
        B <= "11001";
        wait for 20 ns;

    end process;

end;