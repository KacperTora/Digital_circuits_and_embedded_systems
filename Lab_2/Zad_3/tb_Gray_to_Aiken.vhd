library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Gray_to_Aiken is
end tb_Gray_to_Aiken;

architecture Behavioral of tb_Gray_to_Aiken is
    component Gray_to_Aiken
        Port ( 
            G_in  : in  STD_LOGIC_VECTOR (3 downto 0);
            A_out : out STD_LOGIC_VECTOR (3 downto 0);
            E     : out STD_LOGIC
        );
    end component;

    signal G_in  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal A_out : STD_LOGIC_VECTOR(3 downto 0);
    signal E     : STD_LOGIC;

begin
    UUT: Gray_to_Aiken port map (
        G_in  => G_in,
        A_out => A_out,
        E     => E
    );

    stim_proc: process
    begin
        G_in <= "0000"; wait for 20 ns;
        G_in <= "0001"; wait for 20 ns;
        G_in <= "0011"; wait for 20 ns;
        G_in <= "0010"; wait for 20 ns;
        G_in <= "0110"; wait for 20 ns;
        G_in <= "0111"; wait for 20 ns;
        G_in <= "0101"; wait for 20 ns;
        G_in <= "0100"; wait for 20 ns;
        G_in <= "1100"; wait for 20 ns;
        G_in <= "1101"; wait for 20 ns;

        G_in <= "1111"; wait for 20 ns;
        G_in <= "1110"; wait for 20 ns;
        G_in <= "1010"; wait for 20 ns;
        G_in <= "1011"; wait for 20 ns;
        G_in <= "1001"; wait for 20 ns;
        G_in <= "1000"; wait for 20 ns;

        wait;
    end process;
end Behavioral;
