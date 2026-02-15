library ieee;
use ieee.std_logic_1164.all;

entity random_counter_tb is
end entity;

architecture Behavior of random_counter_tb is
    signal clk, roll : STD_LOGIC := '0';
    signal value : std_logic_vector(2 downto 0);
begin
    random_counter_inst: entity work.random_counter
    port map(
        clk => clk,
        roll => roll,
        value => value
    );

    clk_sim: process 
    begin 
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;

    counter_sim: process 
    begin
        wait for 14 ns;
        roll <='1';
        wait for 10 ns;
        roll <= '0';
    end process;
end;