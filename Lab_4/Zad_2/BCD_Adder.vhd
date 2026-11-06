library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Adder is
    Port ( 
        A    : in  STD_LOGIC_VECTOR (3 downto 0);
        B    : in  STD_LOGIC_VECTOR (3 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR (3 downto 0);
        Cout : out STD_LOGIC
    );
end BCD_Adder;

architecture Dataflow of BCD_Adder is
    signal sum_bin  : unsigned(4 downto 0);
    signal c_out    : std_logic;
    signal sum_corr : unsigned(4 downto 0);
begin

    sum_bin <= ('0' & unsigned(A)) + ('0' & unsigned(B)) + ("0000" & Cin);

    c_out <= sum_bin(4) or (sum_bin(3) and sum_bin(2)) or (sum_bin(3) and sum_bin(1));

    sum_corr <= ('0' & sum_bin(3 downto 0)) + "00110" when c_out = '1' else
                ('0' & sum_bin(3 downto 0));

    Sum  <= std_logic_vector(sum_corr(3 downto 0));
    Cout <= c_out;

end Dataflow;
