library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    generic (N : INTEGER := 4);
    port (
        A , B: IN std_logic_vector(N - 1 downto 0);
        eq : out std_logic 
    );
end entity;

architecture behavior of comparator is
begin
    eq <= '1' when A = B else '0';
end architecture;