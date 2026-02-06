library ieee;
use ieee.std_logic_1164.all;

entity point_reg_tb is
end entity;

architecture Behavioral of point_reg_tb is
    constant N : integer := 4;
    signal clk : std_logic := '0';
    signal input : std_logic_vector(N - 1 downto 0) := (others => '0');
    signal sp : std_logic := '0';
    signal output : std_logic_vector(N - 1 downto 0) := (others => '0');
begin
    point_reg_inst: entity work.point_reg
    generic map (N => N)
    port map (
        clk => clk,
        sp => sp,
        input => input,
        output => output
    );

    sim_clk: process 
    begin
        wait for 5 ns;
        clk <= not clk;
        wait for 5 ns;
        clk <= not clk;
    end process;

    sim_reg: process(clk) 
    begin
        if rising_edge(clk) then
            input <= "1010";
            sp <= '1';
        end if;
    end process;
end architecture;