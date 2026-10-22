library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Seq_Detector_11100 is
end tb_Seq_Detector_11100;

architecture Behavioral of tb_Seq_Detector_11100 is
    component Seq_Detector_11100
        Port ( 
            clk   : in  STD_LOGIC;
            X     : in  STD_LOGIC;
            Y     : out STD_LOGIC;
            Q_out : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal X     : STD_LOGIC := '0';
    signal Y     : STD_LOGIC;
    signal Q_out : STD_LOGIC_VECTOR (2 downto 0);

    constant CLK_PERIOD : time := 20 ns;
begin

    UUT: Seq_Detector_11100 port map (
        clk   => clk,
        X     => X,
        Y     => Y,
        Q_out => Q_out
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
        wait for 25 ns;

        X <= '0'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;

        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;

        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;

        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;
        X <= '1'; wait for CLK_PERIOD;
        X <= '0'; wait for CLK_PERIOD;

        wait for 100 ns;
        wait;
    end process;

end Behavioral;
