library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CrapsGame is
    port (
        clk     : in  std_logic;   
        reset   : in  std_logic;   
        roll    : in  std_logic;   
        seg1    : out std_logic_vector(6 downto 0); 
        seg2    : out std_logic_vector(6 downto 0); 
        win_led : out std_logic;   
        lose_led: out std_logic    
    );
end entity;

architecture Structural of CrapsGame is
    signal die1_value : std_logic_vector(2 downto 0);
    signal die2_value : std_logic_vector(2 downto 0);
    signal die1_extended : std_logic_vector(3 downto 0);
    signal die2_extended : std_logic_vector(3 downto 0);
    signal sum_result : std_logic_vector(3 downto 0);
    signal adder_cout : std_logic;
    signal point_value : std_logic_vector(3 downto 0);
    signal eq_signal : std_logic;
    signal D7_signal : std_logic;
    signal D711_signal : std_logic;
    signal D2312_signal : std_logic;
    signal win_signal : std_logic;
    signal lose_signal : std_logic;
    signal roll_signal : std_logic;
    signal sp_signal : std_logic;
begin

    die1_extended <= '0' & die1_value;
    die2_extended <= '0' & die2_value;

    die1_counter: entity work.random_counter
        port map (
            clk   => clk,
            roll  => roll_signal,
            value => die1_value
        );

    die2_counter: entity work.random_counter
        port map (
            clk   => clk,
            roll  => roll_signal,
            value => die2_value
        );

    dice_adder: entity work.adder
        generic map (N => 4)
        port map (
            A    => die1_extended,
            B    => die2_extended,
            cin  => '0',
            cout => adder_cout,
            res  => sum_result
        );

    point_register: entity work.point_reg
        generic map (N => 4)
        port map (
            clk    => clk,
            sp     => sp_signal,
            input  => sum_result,
            output => point_value
        );

    point_comparator: entity work.comparator
        generic map (N => 4)
        port map (
            A  => sum_result,
            B  => point_value,
            eq => eq_signal
        );

    game_test_logic: entity work.test_logic
        port map (
            input  => sum_result,
            D7     => D7_signal,
            D711   => D711_signal,
            D2312  => D2312_signal
        );

    controller: entity work.cu
        port map (
            clk    => clk,
            reset  => reset,
            enter  => roll,
            D7     => D7_signal,
            D711   => D711_signal,
            D2312  => D2312_signal,
            eq     => eq_signal,
            win    => win_signal,
            lose   => lose_signal,
            roll   => roll_signal,
            sp     => sp_signal
        );

    display1: entity work.sevenseg
        port map (
            input => die1_value,
            res   => seg1
        );

    display2: entity work.sevenseg
        port map (
            input => die2_value,
            res   => seg2
        );

    win_led  <= win_signal;
    lose_led <= lose_signal;

end architecture;