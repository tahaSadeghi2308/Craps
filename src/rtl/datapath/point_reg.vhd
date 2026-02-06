library ieee;
use ieee.std_logic_1164.all;

entity point_reg is
    generic (N : integer := 4);
    port (
        clk : in std_logic;
        sp : in std_logic;
        input : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture Behavioral of point_reg is
    signal reg : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    output <= reg;
    process(clk)
    begin
        if rising_edge(clk) and sp = '1' then
            reg <= input;
        end if;
    end process;
end architecture;