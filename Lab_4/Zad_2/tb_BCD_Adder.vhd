library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_BCD_Adder is
end tb_BCD_Adder;

architecture Behavioral of tb_BCD_Adder is
    component BCD_Adder
        Port ( 
            A    : in  STD_LOGIC_VECTOR (3 downto 0);
            B    : in  STD_LOGIC_VECTOR (3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR (3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin
    UUT: BCD_Adder port map (
        A => A, 
        B => B, 
        Cin => Cin, 
        Sum => Sum, 
        Cout => Cout
    );

    stim_proc: process
begin
    Cin <= '0';
    for i in 0 to 9 loop
        for j in 0 to 9 loop
            A <= std_logic_vector(to_unsigned(i, 4));
            B <= std_logic_vector(to_unsigned(j, 4));
            wait for 20 ns;
        end loop;
    end loop;
    wait;
end process;

end Behavioral;
