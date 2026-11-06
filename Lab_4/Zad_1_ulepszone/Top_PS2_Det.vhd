library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Top_PS2_Det is
    Port ( 
        CLK_100MHz_P : in STD_LOGIC;
        CLK_100MHz_N : in STD_LOGIC;
        PS2A_Clk     : in STD_LOGIC;
        PS2A_Data    : in STD_LOGIC;
        Y            : out STD_LOGIC
    );
end Top_PS2_Det;

architecture Behavioral of Top_PS2_Det is
    signal clk_buf    : STD_LOGIC;
    signal clk_100mhz : STD_LOGIC;
    signal ps2_data_out : STD_LOGIC_VECTOR(7 downto 0);
    signal ps2_ready    : STD_LOGIC;

    component PS2_RX is
        port (
            Clk_100MHz : in  STD_LOGIC;
            PS2_Clk    : in  STD_LOGIC;
            PS2_Data   : in  STD_LOGIC;
            PS2_DO     : out STD_LOGIC_VECTOR (7 downto 0);
            PS2_DOrdy  : out STD_LOGIC
        );
    end component;

    component Seq_Detector_2Char_En is
        Port ( 
            clk : in  STD_LOGIC;
            en  : in  STD_LOGIC;
            din : in  STD_LOGIC_VECTOR (7 downto 0);
            y   : out STD_LOGIC
        );
    end component;

begin
    inst_IBUFDS: IBUFDS port map (
        I  => CLK_100MHz_P,
        IB => CLK_100MHz_N,
        O  => clk_buf
    );
    
    inst_BUFG: BUFG port map (
        I => clk_buf,
        O => clk_100mhz
    );

    Inst_PS2: PS2_RX port map (
        Clk_100MHz => clk_100mhz,
        PS2_Clk    => PS2A_Clk,
        PS2_Data   => PS2A_Data,
        PS2_DO     => ps2_data_out, 
        PS2_DOrdy  => ps2_ready     
    );

    Inst_Det: Seq_Detector_2Char_En port map (
        clk => clk_100mhz,
        en  => ps2_ready, 
        din => ps2_data_out,
        y   => Y
    );
end Behavioral;
