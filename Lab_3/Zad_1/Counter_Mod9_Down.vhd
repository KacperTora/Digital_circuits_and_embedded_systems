library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_Mod9_Down is
    Port ( 
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Counter_Mod9_Down;

architecture Structural_DFF of Counter_Mod9_Down is
    signal Q_reg : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    
    signal D : STD_LOGIC_VECTOR (3 downto 0);
begin
  
    D(3) <= not Q_reg(2) and (Q_reg(1) or Q_reg(0));

    D(2) <= not (Q_reg(2) xor (Q_reg(1) or Q_reg(0)));

    D(1) <= not (Q_reg(1) xor Q_reg(0));

    D(0) <= (not Q_reg(0)) or (not Q_reg(3) and not Q_reg(2));

    process(clk, reset)
    begin
        if reset = '1' then
            Q_reg <= "1011";
        elsif rising_edge(clk) then
            Q_reg <= D;
        end if;
    end process;

    Q <= Q_reg;

end Structural_DFF;
