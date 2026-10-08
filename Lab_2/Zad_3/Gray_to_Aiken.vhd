library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gray_to_Aiken is
    Port ( 
        G_in  : in  STD_LOGIC_VECTOR (3 downto 0);
        A_out : out STD_LOGIC_VECTOR (3 downto 0);
        E     : out STD_LOGIC
    );
end Gray_to_Aiken;

architecture Dataflow of Gray_to_Aiken is
begin
    E <= G_in(3) and (not G_in(2) or G_in(1));

    A_out(3) <= G_in(2) and (not G_in(1) or (not G_in(3) and G_in(0)));

    A_out(2) <= G_in(2) and (not G_in(1) or (not G_in(3) and not G_in(0)));

    A_out(1) <= (G_in(1) and not G_in(3) and (G_in(0) or not G_in(2))) or 
                (G_in(3) and G_in(2) and not G_in(1));

    A_out(0) <= (not G_in(3) and (G_in(2) xor G_in(1) xor G_in(0))) or 
                (G_in(3) and G_in(2) and not G_in(1) and G_in(0));

end Dataflow;
