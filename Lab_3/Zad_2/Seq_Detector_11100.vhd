library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seq_Detector_11100 is
    Port ( 
        clk   : in  STD_LOGIC;
        X     : in  STD_LOGIC;
        Y     : out STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Seq_Detector_11100;

architecture Structural_Mealy of Seq_Detector_11100 is
    signal Q : STD_LOGIC_VECTOR (2 downto 0) := "000";
    
    signal D : STD_LOGIC_VECTOR (2 downto 0);
begin

    D(2) <= Q(1) and Q(0) and (not X);

    D(1) <= X and (Q(0) or Q(1));

    D(0) <= X and ((not Q(0)) or Q(1));

    Y <= Q(2) and (not X);

    process(clk)
    begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;

    Q_out <= Q;

end Structural_Mealy;
