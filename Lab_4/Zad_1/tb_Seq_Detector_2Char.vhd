library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Seq_Detector_2Char is
end tb_Seq_Detector_2Char;

architecture Behavioral of tb_Seq_Detector_2Char is
    component Seq_Detector_2Char
        Port ( 
            clk : in  STD_LOGIC;
            din : in  STD_LOGIC_VECTOR (7 downto 0);
            y   : out STD_LOGIC
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal din : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal y   : STD_LOGIC;
    constant CLK_PERIOD : time := 20 ns;

begin
    UUT: Seq_Detector_2Char port map (clk => clk, din => din, y => y);

    clk_process: process
    begin
        clk <= '0'; wait for CLK_PERIOD / 2;
        clk <= '1'; wait for CLK_PERIOD / 2;
    end process;

    stim_proc: process
    begin
        din <= x"00"; wait for 30 ns;
        din <= x"4F"; wait for CLK_PERIOD;
        din <= x"4B"; wait for CLK_PERIOD;
        din <= x"41"; wait for CLK_PERIOD;
        wait;
    end process;
end Behavioral;
