library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Counter_Mod9_Down is
end tb_Counter_Mod9_Down;

architecture Behavioral of tb_Counter_Mod9_Down is
    component Counter_Mod9_Down
        Port ( 
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR (3 downto 0);

    constant CLK_PERIOD : time := 20 ns;
begin

    UUT: Counter_Mod9_Down port map (
        clk   => clk,
        reset => reset,
        Q     => Q
    );

    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for 25 ns;
        reset <= '0';

        wait for 400 ns;

        wait;
    end process;

end Behavioral;
