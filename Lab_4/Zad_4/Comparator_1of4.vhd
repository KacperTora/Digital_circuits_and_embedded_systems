library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_1of4 is
    Port ( 
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        A_gt_B : out STD_LOGIC;
        A_eq_B : out STD_LOGIC;
        A_lt_B : out STD_LOGIC
    );
end Comparator_1of4;

architecture Dataflow of Comparator_1of4 is
begin

    A_eq_B <= (A(3) and B(3)) or (A(2) and B(2)) or (A(1) and B(1)) or (A(0) and B(0));

    A_gt_B <= (A(3) and (B(2) or B(1) or B(0))) or
              (A(2) and (B(1) or B(0))) or
              (A(1) and B(0));

    A_lt_B <= (B(3) and (A(2) or A(1) or A(0))) or
              (B(2) and (A(1) or A(0))) or
              (B(1) and A(0));

end Dataflow;
