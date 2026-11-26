library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Dino_Game is
end tb_Dino_Game;

architecture Behavioral of tb_Dino_Game is
    component Dino_Game
        Generic (
            PERIOD_START : integer;
            PERIOD_MIN   : integer;
            PERIOD_STEP  : integer
        );
        Port (
            clk      : in  STD_LOGIC;
            key_rdy  : in  STD_LOGIC;
            key_code : in  STD_LOGIC_VECTOR (7 downto 0);
            state_o  : out STD_LOGIC_VECTOR (1 downto 0);
            obst_o   : out STD_LOGIC_VECTOR (20 downto 0);
            height_o : out STD_LOGIC_VECTOR (1 downto 0);
            score_o  : out STD_LOGIC_VECTOR (15 downto 0);
            best_o   : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal clk      : STD_LOGIC := '0';
    signal key_rdy  : STD_LOGIC := '0';
    signal key_code : STD_LOGIC_VECTOR (7 downto 0) := x"00";
    signal state_o  : STD_LOGIC_VECTOR (1 downto 0);
    signal obst_o   : STD_LOGIC_VECTOR (20 downto 0);
    signal height_o : STD_LOGIC_VECTOR (1 downto 0);
    signal score_o  : STD_LOGIC_VECTOR (15 downto 0);
    signal best_o   : STD_LOGIC_VECTOR (15 downto 0);
    constant CLK_PERIOD : time := 10 ns;
begin
    UUT : Dino_Game
        generic map (PERIOD_START => 20, PERIOD_MIN => 8, PERIOD_STEP => 4)
        port map (
            clk => clk, key_rdy => key_rdy, key_code => key_code,
            state_o => state_o, obst_o => obst_o, height_o => height_o,
            score_o => score_o, best_o => best_o
        );

    clk_process : process
    begin
        clk <= '0'; wait for CLK_PERIOD / 2;
        clk <= '1'; wait for CLK_PERIOD / 2;
    end process;

    stim_proc : process
        procedure send_byte (code : in STD_LOGIC_VECTOR (7 downto 0)) is
        begin
            wait until falling_edge(clk);
            key_code <= code;
            key_rdy  <= '1';
            wait until falling_edge(clk);
            key_rdy  <= '0';
        end procedure;

        procedure press_space is
        begin
            send_byte(x"29");
            send_byte(x"F0");
            send_byte(x"29");
        end procedure;
    begin
        wait for 100 ns;
        press_space;

        for i in 0 to 2000 loop
            wait until rising_edge(clk);
            if obst_o(4) = '1' and height_o = "00" then
                press_space;
            end if;
        end loop;

        wait until state_o = "10";
        wait for 2 us;
        press_space;
        wait for 2 us;
        wait;
    end process;
end Behavioral;
