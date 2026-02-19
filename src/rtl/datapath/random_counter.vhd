library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity random_counter is
    port (
        clk   : in  std_logic;
        roll  : in  std_logic;
        value : out std_logic_vector(2 downto 0)
    );
end entity;

architecture Behavior of random_counter is
    signal lfsr : std_logic_vector(3 downto 0) := "1011";
    signal dice_val : unsigned(2 downto 0) := "101";
begin
    process(clk)
        variable temp : unsigned(2 downto 0);
    begin
        if rising_edge(clk) then
            if roll = '1' then
                lfsr <= lfsr(2 downto 0) & (lfsr(3) xor lfsr(2));
                temp := unsigned(lfsr(2 downto 0)) mod 6 + 1;
                dice_val <= temp;
            end if;
        end if;
    end process;
    value <= std_logic_vector(dice_val);
end architecture;
