library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Gate_NAND is
end tb_Gate_NAND;

architecture Behavioral of tb_Gate_NAND is
    component Gate_NAND
        Port ( 
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin
    UUT: Gate_NAND port map (
        A => A,
        B => B,
        Y => Y
    );

    stim_proc: process
    begin
        A <= '0'; B <= '0'; wait for 50 ns;
        A <= '0'; B <= '1'; wait for 50 ns;
        A <= '1'; B <= '0'; wait for 50 ns;
        A <= '1'; B <= '1'; wait for 50 ns;
        wait;
    end process;
end Behavioral;
