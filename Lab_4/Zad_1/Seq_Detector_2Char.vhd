library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seq_Detector_2Char is
    Port ( 
        clk : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR (7 downto 0);
        y   : out STD_LOGIC
    );
end Seq_Detector_2Char;

architecture Behavioral of Seq_Detector_2Char is

    constant CHAR1 : STD_LOGIC_VECTOR(7 downto 0) := x"4F";
    constant CHAR2 : STD_LOGIC_VECTOR(7 downto 0) := x"4B";

    type state_type is (S0, S1, S2);
    signal state : state_type := S0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when S0 | S2 =>
                    if din = CHAR1 then
                        state <= S1;
                    else
                        state <= S0;
                    end if;
                    
                when S1 =>
                    if din = CHAR2 then
                        state <= S2;
                    elsif din = CHAR1 then
                        state <= S1;
                    else
                        state <= S0;
                    end if;
            end case;
        end if;
    end process;
    
    y <= '1' when state = S2 else '0';
end Behavioral;
