library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Top_OLED_Hex is
    Port ( 
        CLK_100MHz_P : in STD_LOGIC;
        CLK_100MHz_N : in STD_LOGIC;
        sw_in        : in STD_LOGIC_VECTOR(3 downto 0); 
        btn_write    : in STD_LOGIC;
        led_ascii    : out STD_LOGIC_VECTOR(7 downto 0);
        OLED_SDA     : inout STD_LOGIC;
        OLED_SCL     : inout STD_LOGIC
    );
end Top_OLED_Hex;

architecture Behavioral of Top_OLED_Hex is
    signal clk_buf    : STD_LOGIC;
    signal clk_100mhz : STD_LOGIC;
    
    signal ascii_code : STD_LOGIC_VECTOR(7 downto 0);
    
    signal btn_reg    : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal write_pulse: STD_LOGIC;

    component Hex_to_ASCII is
        Port ( 
            hex_in    : in  STD_LOGIC_VECTOR (3 downto 0);
            ascii_out : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    component OLED_Txt is
        port (
            Clk_100MHz  : in STD_LOGIC;
            Goto00      : in STD_LOGIC;
            NewLine     : in STD_LOGIC;
            Home        : in STD_LOGIC;
            ASCII_WE    : in STD_LOGIC;
            ASCII       : in STD_LOGIC_VECTOR ( 7 downto 0 );
            OLED_SDA    : inout STD_LOGIC;
            OLED_SCL    : inout STD_LOGIC
        );
    end component;

begin
    inst_IBUFDS: IBUFDS port map (I => CLK_100MHz_P, IB => CLK_100MHz_N, O => clk_buf);
    inst_BUFG: BUFG port map (I => clk_buf, O => clk_100mhz);

    process(clk_100mhz)
    begin
        if rising_edge(clk_100mhz) then
            btn_reg(1) <= btn_reg(0);
            btn_reg(0) <= btn_write;
        end if;
    end process;
    write_pulse <= '1' when (btn_reg(1) = '0' and btn_reg(0) = '1') else '0';

    Inst_Conv: Hex_to_ASCII port map (
        hex_in    => sw_in,
        ascii_out => ascii_code
    );

    led_ascii <= ascii_code;

    Inst_OLED: OLED_Txt port map (
        Clk_100MHz => clk_100mhz,
        Goto00     => '0',
        NewLine    => '0',
        Home       => '0',
        ASCII_WE   => write_pulse,
        ASCII      => ascii_code,
        OLED_SDA   => OLED_SDA,
        OLED_SCL   => OLED_SCL
    );
end Behavioral;
