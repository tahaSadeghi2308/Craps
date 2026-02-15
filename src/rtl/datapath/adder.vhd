library ieee;
use ieee.std_logic_1164.all;

entity adder is
    generic (N : INTEGER := 4);
    port (
        A, B  : in  STD_LOGIC_VECTOR(N - 1 downto 0);
        cin   : in  STD_LOGIC;
        cout  : out STD_LOGIC;
        res   : out STD_LOGIC_VECTOR(N - 1 downto 0)
    );
end entity;

architecture Behavioral of adder is
begin
    process(A, B, cin)
        variable carry : STD_LOGIC_VECTOR(N downto 0);
    begin
        carry(0) := cin;
        for i in 0 to N-1 loop
            res(i) <= A(i) xor B(i) xor carry(i);
            carry(i+1) :=
                (A(i) and B(i)) or
                (A(i) and carry(i)) or
                (B(i) and carry(i));
        end loop;
        cout <= carry(N);
    end process;
end architecture;