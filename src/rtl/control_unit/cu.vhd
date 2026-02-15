library ieee;
use ieee.std_logic_1164.all;

entity cu is
    port(
        clk   : in std_logic;
        reset : in std_logic;
        enter : in std_logic;
        D7, D711 , D2312 : IN std_logic;
        eq : in std_logic;
        win , lose , roll , sp : out std_logic
    );
end entity;

architecture Behavioral of cu is
    type state_type is (s0 , s1 , s2, s3, s4 , s5);
    signal curr_state : state_type := s0;
begin
    state_transition: process(clk, reset)
    begin
        if reset = '1' then
            curr_state <= s0;
        elsif rising_edge(clk) then
            case curr_state is
                when s0 =>
                    if reset = '0' and enter = '1' then
                        curr_state <= s1;
                    end if;
                when s1 =>
                    if enter = '1' then
                        curr_state <= s1;
                    elsif enter = '0' and D711 = '1' then
                        curr_state <= s2;
                    elsif enter = '0' and D2312 = '1' then
                        curr_state <= s3;
                    elsif enter = '0' and D711 = '0' and D2312 = '0' then
                        curr_state <= s4;
                    end if;
                when s2 =>
                    if reset = '1' then
                        curr_state <= s0;
                    elsif reset = '0' then
                        curr_state <= s2;
                    end if;
                when s3 =>
                    if reset = '1' then
                        curr_state <= s0;
                    elsif reset = '0' then
                        curr_state <= s3;
                    end if;
                when s4 =>
                    if enter = '1' then
                        curr_state <= s5;
                    elsif enter = '0' then
                        curr_state <= s4;
                    end if;
                when s5 =>
                    if enter = '1' then
                        curr_state <= s5;
                    elsif enter = '0' and D7 = '1' then
                        curr_state <= s3;
                    elsif enter = '0' and eq = '1' then
                        curr_state <= s2;
                    elsif enter = '0' and D7 = '0' and eq = '0' then
                        curr_state <= s4;
                    end if;
            end case;
        end if;
    end process;

    state_output: process(curr_state)
    begin 
        win <= '0';
        lose <= '0';
        roll <= '0';
        sp <= '0';
        case curr_state is
            when s1 =>
                roll <= '1';
            when s2 =>
                win <= '1';
            when s3 =>
                lose <= '1';
            when s4 =>
                sp <= '1';
            when s5 =>
                roll <= '1';
            when others =>
                null;
        end case;
    end process;
end;