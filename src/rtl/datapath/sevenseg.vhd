library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg is
    port (
        input : in  STD_LOGIC_VECTOR(2 downto 0);
        res : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity;

architecture Behavior of sevenseg is
begin
    process(input)
    begin
        case to_integer(unsigned(input)) is
            when 1 => res <= "0110000";
            when 2 => res <= "1101101";
            when 3 => res <= "1111001";
            when 4 => res <= "0110011";
            when 5 => res <= "1011011";
            when 6 => res <= "1011111";
            when others => res <= "0000000";
        end case;
    end process;
end architecture;