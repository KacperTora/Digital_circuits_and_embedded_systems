library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Top_Ulepszony is
    Port ( 
        CLK_100MHz_P : in STD_LOGIC;
        CLK_100MHz_N : in STD_LOGIC;
        ROT_A        : in STD_LOGIC;
        ROT_B        : in STD_LOGIC;
        Y            : out STD_LOGIC;
        OLED_SDA     : inout STD_LOGIC;
        OLED_SCL     : inout STD_LOGIC
    );
end Top_Ulepszony;

architecture Behavioral of Top_Ulepszony is

    signal clk_buf    : STD_LOGIC;
    signal clk_100mhz : STD_LOGIC;

    signal rot_left   : STD_LOGIC;
    signal rot_right  : STD_LOGIC;
    
    signal det_en     : STD_LOGIC;
    signal det_X      : STD_LOGIC;
    signal det_Q      : STD_LOGIC_VECTOR(2 downto 0);
    
    signal oled_line  : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

    component RotaryEnc is
        port (
            ROT_A : in STD_LOGIC;
            ROT_B : in STD_LOGIC;
            Clk   : in STD_LOGIC;
            RotL  : out STD_LOGIC;
            RotR  : out STD_LOGIC
        );
    end component;

    component Seq_Detector_11100_En is
        Port ( 
            clk   : in  STD_LOGIC;
            en    : in  STD_LOGIC;
            X     : in  STD_LOGIC;
            Y     : out STD_LOGIC;
            Q_out : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    component OLED_1x32 is
        port (
            Clk_100MHz : in STD_LOGIC;
            Line       : in STD_LOGIC_VECTOR ( 31 downto 0 );
            DecPts     : in STD_LOGIC_VECTOR ( 7 downto 0 );
            Blank      : in STD_LOGIC_VECTOR ( 7 downto 0 );
            I2C_NACK   : out STD_LOGIC;
            OLED_SDA   : inout STD_LOGIC;
            OLED_SCL   : inout STD_LOGIC
        );
    end component;

begin

    inst_IBUFDS: IBUFDS port map (
        I => CLK_100MHz_P,
        IB => CLK_100MHz_N,
        O => clk_buf
    );
    
    inst_BUFG: BUFG port map (
        I => clk_buf,
        O => clk_100mhz
    );

    Inst_Rotary: RotaryEnc port map (
        ROT_A => ROT_A,
        ROT_B => ROT_B,
        Clk   => clk_100mhz,
        RotL  => rot_left,
        RotR  => rot_right
    );

    det_en <= rot_left or rot_right;
    det_X  <= '1' when rot_right = '1' else '0';

    Inst_Det: Seq_Detector_11100_En port map (
        clk   => clk_100mhz,
        en    => det_en,
        X     => det_X,
        Y     => Y,
        Q_out => det_Q
    );

    oled_line(2 downto 0) <= det_Q;
    
    Inst_OLED: OLED_1x32 port map (
        Clk_100MHz => clk_100mhz,
        Line       => oled_line,
        DecPts     => x"00",
        Blank      => "11111110", 
        I2C_NACK   => open,
        OLED_SDA   => OLED_SDA,
        OLED_SCL   => OLED_SCL
    );

end Behavioral;
