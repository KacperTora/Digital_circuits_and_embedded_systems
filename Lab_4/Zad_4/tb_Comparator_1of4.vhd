library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Comparator_1of4 is
end tb_Comparator_1of4;

architecture Behavioral of tb_Comparator_1of4 is
    component Comparator_1of4
        Port ( 
            A : in  STD_LOGIC_VECTOR (3 downto 0);
            B : in  STD_LOGIC_VECTOR (3 downto 0);
            A_gt_B : out STD_LOGIC;
            A_eq_B : out STD_LOGIC;
            A_lt_B : out STD_LOGIC
        );
    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    signal A_gt_B, A_eq_B, A_lt_B : STD_LOGIC;

begin
    UUT: Comparator_1of4 port map (
        A => A, B => B,
        A_gt_B => A_gt_B, A_eq_B => A_eq_B, A_lt_B => A_lt_B
    );

    stim_proc: process
    begin
        A <= "0100"; B <= "0100"; wait for 20 ns;
        
        A <= "1000"; B <= "0001"; wait for 20 ns;
        
        A <= "0010"; B <= "0100"; wait for 20 ns;
        
        A <= "0000"; B <= "0000"; wait for 20 ns;
        
        wait;
    end process;
end Behavioral;
