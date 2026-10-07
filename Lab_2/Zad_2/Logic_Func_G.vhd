library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Func_G is
    Port ( 
        W : in  STD_LOGIC;
        X : in  STD_LOGIC;
        Y : in  STD_LOGIC;
        Z : in  STD_LOGIC;
        G : out STD_LOGIC
    );
end Logic_Func_G;

architecture Behavioral of Logic_Func_G is
begin
    G <= (not W and not Y and Z) or 
         (W and Y and not Z) or 
         (W and not X and not Z);
end Behavioral;
