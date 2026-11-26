library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Top_Lab6 is
    Port (
        CLK_100MHz_P : in    STD_LOGIC;
        CLK_100MHz_N : in    STD_LOGIC;
        PS2A_Clk     : in    STD_LOGIC;
        PS2A_Data    : in    STD_LOGIC;
        LED          : out   STD_LOGIC_VECTOR (7 downto 0);
        OLED_SDA     : inout STD_LOGIC;
        OLED_SCL     : inout STD_LOGIC
    );
end Top_Lab6;

architecture Behavioral of Top_Lab6 is
    signal clk_buf    : STD_LOGIC;
    signal clk_100mhz : STD_LOGIC;

    signal ps2_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal ps2_ready    : STD_LOGIC;

    signal game_state : STD_LOGIC_VECTOR (1 downto 0);
    signal obst       : STD_LOGIC_VECTOR (20 downto 0);
    signal height     : STD_LOGIC_VECTOR (1 downto 0);
    signal score      : STD_LOGIC_VECTOR (15 downto 0);
    signal best       : STD_LOGIC_VECTOR (15 downto 0);

    signal oled_goto  : STD_LOGIC;
    signal oled_we    : STD_LOGIC;
    signal oled_ascii : STD_LOGIC_VECTOR (7 downto 0);

    component PS2_RX is
        port (
            Clk_100MHz : in  STD_LOGIC;
            PS2_Clk    : in  STD_LOGIC;
            PS2_Data   : in  STD_LOGIC;
            PS2_DO     : out STD_LOGIC_VECTOR (7 downto 0);
            PS2_DOrdy  : out STD_LOGIC
        );
    end component;

    component Dino_Game is
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

    component Dino_Render is
        Port (
            clk      : in  STD_LOGIC;
            state_i  : in  STD_LOGIC_VECTOR (1 downto 0);
            obst_i   : in  STD_LOGIC_VECTOR (20 downto 0);
            height_i : in  STD_LOGIC_VECTOR (1 downto 0);
            score_i  : in  STD_LOGIC_VECTOR (15 downto 0);
            best_i   : in  STD_LOGIC_VECTOR (15 downto 0);
            Goto00   : out STD_LOGIC;
            ASCII_WE : out STD_LOGIC;
            ASCII    : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    component OLED_Txt is
        port (
            Clk_100MHz : in    STD_LOGIC;
            Goto00     : in    STD_LOGIC;
            NewLine    : in    STD_LOGIC;
            Home       : in    STD_LOGIC;
            ASCII_WE   : in    STD_LOGIC;
            ASCII      : in    STD_LOGIC_VECTOR (7 downto 0);
            OLED_SDA   : inout STD_LOGIC;
            OLED_SCL   : inout STD_LOGIC
        );
    end component;
begin
    inst_IBUFDS : IBUFDS port map (I => CLK_100MHz_P, IB => CLK_100MHz_N, O => clk_buf);
    inst_BUFG   : BUFG   port map (I => clk_buf, O => clk_100mhz);

    Inst_PS2 : PS2_RX port map (
        Clk_100MHz => clk_100mhz,
        PS2_Clk    => PS2A_Clk,
        PS2_Data   => PS2A_Data,
        PS2_DO     => ps2_data_out,
        PS2_DOrdy  => ps2_ready
    );

    Inst_Game : Dino_Game port map (
        clk      => clk_100mhz,
        key_rdy  => ps2_ready,
        key_code => ps2_data_out,
        state_o  => game_state,
        obst_o   => obst,
        height_o => height,
        score_o  => score,
        best_o   => best
    );

    Inst_Render : Dino_Render port map (
        clk      => clk_100mhz,
        state_i  => game_state,
        obst_i   => obst,
        height_i => height,
        score_i  => score,
        best_i   => best,
        Goto00   => oled_goto,
        ASCII_WE => oled_we,
        ASCII    => oled_ascii
    );

    Inst_OLED : OLED_Txt port map (
        Clk_100MHz => clk_100mhz,
        Goto00     => oled_goto,
        NewLine    => '0',
        Home       => '0',
        ASCII_WE   => oled_we,
        ASCII      => oled_ascii,
        OLED_SDA   => OLED_SDA,
        OLED_SCL   => OLED_SCL
    );

    LED <= score(7 downto 0);
end Behavioral;
