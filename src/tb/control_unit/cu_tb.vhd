library ieee;
use ieee.std_logic_1164.all;

entity cu_tb is
end entity;

architecture Behavioral of cu_tb is
    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal enter : std_logic := '0';
    signal D7, D711 , D2312 : std_logic := '0';
    signal eq : std_logic := '0';
    signal win , lose , roll , sp : std_logic := '0';
    constant clk_period : time := 5 ns;
begin
    cu_inst: entity work.cu
    port map(
        clk => clk,
        reset => reset,
        enter => enter,
        D7 => D7,
        D711 => D711,
        D2312 => D2312,
        eq => eq,
        win => win,
        lose => lose,
        roll => roll,
        sp => sp
    );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    sim_process: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        enter <= '1';
        wait for clk_period;
        enter <= '0';
        D711 <= '1';
        reset <= '0';
        wait for clk_period * 2;
    end process;
end Behavioral;