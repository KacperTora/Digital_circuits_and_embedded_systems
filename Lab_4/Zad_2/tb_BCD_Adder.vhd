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
        A <= "0010"; B <= "0011"; Cin <= '0'; wait for 20 ns;
        
        A <= "0101"; B <= "0111"; Cin <= '0'; wait for 20 ns;
        
        A <= "1001"; B <= "1001"; Cin <= '1'; wait for 20 ns;
        
        A <= "1000"; B <= "0001"; Cin <= '0'; wait for 20 ns;
        
        A <= "1000"; B <= "1000"; Cin <= '0'; wait for 20 ns;

        wait;
    end process;
end Behavioral;
