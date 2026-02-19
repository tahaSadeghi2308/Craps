library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CrapsGame_tb is
end entity;

architecture Behavior of CrapsGame_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal roll : std_logic := '0';
    signal seg1 : std_logic_vector(6 downto 0);
    signal seg2 : std_logic_vector(6 downto 0);
    signal win_led : std_logic;
    signal lose_led : STD_LOGIC;
    constant CLK_PERIOD : time := 10 ns;
begin
    CrapsGame_inst: entity work.CrapsGame
        port map (
            clk      => clk,
            reset    => reset,
            roll     => roll,
            seg1     => seg1,
            seg2     => seg2,
            win_led  => win_led,
            lose_led => lose_led
        );

    clk_sim: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    main_proc: process
    begin
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD;

        roll <= '1';
        wait for CLK_PERIOD * 5;
        roll <= '0';
        wait for CLK_PERIOD * 10;

        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Test 2: Multiple rolls to test point game
        -- First roll (establish point or win/lose)
        roll <= '1';
        wait for CLK_PERIOD * 3;
        roll <= '0';
        wait for CLK_PERIOD * 5;
        
        -- If no immediate win/lose, continue rolling
        if win_led = '0' and lose_led = '0' then
            -- Second roll attempt
            wait for CLK_PERIOD * 5;
            roll <= '1';
            wait for CLK_PERIOD * 3;
            roll <= '0';
            wait for CLK_PERIOD * 10;
            
            if win_led = '0' and lose_led = '0' then
                -- Third roll attempt
                wait for CLK_PERIOD * 5;
                roll <= '1';
                wait for CLK_PERIOD * 3;
                roll <= '0';
                wait for CLK_PERIOD * 10;
            end if;
        end if;

        -- Reset for next test
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Test 3: Test roll button hold
        roll <= '1';
        wait for CLK_PERIOD * 20;
        roll <= '0';
        wait for CLK_PERIOD * 10;

        -- Reset for next test
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Test 4: Test reset during game
        roll <= '1';
        wait for CLK_PERIOD * 3;
        roll <= '0';
        wait for CLK_PERIOD * 5;
        
        -- Apply reset mid-game
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD * 5;

        -- Test 5: Rapid roll presses
        for i in 0 to 4 loop
            roll <= '1';
            wait for CLK_PERIOD;
            roll <= '0';
            wait for CLK_PERIOD * 8;
        end loop;
        
        wait for CLK_PERIOD * 10;

        -- End simulation
        wait;
    end process;

end architecture;
