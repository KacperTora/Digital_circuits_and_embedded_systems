library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_NAND is
    Port ( 
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end Gate_NAND;

architecture Behavioral of Gate_NAND is
begin
    Y <= A nand B;
end Behavioral;
