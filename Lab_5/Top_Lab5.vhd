library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Top_Lab5 is
    Port (
        CLK_100MHz_P : in    STD_LOGIC;
        CLK_100MHz_N : in    STD_LOGIC;
        PS2A_Clk     : in    STD_LOGIC;
        PS2A_Data    : in    STD_LOGIC;
        SW_X         : in    STD_LOGIC;
        LED          : out   STD_LOGIC_VECTOR (7 downto 0);
        OLED_SDA     : inout STD_LOGIC;
        OLED_SCL     : inout STD_LOGIC
    );
end Top_Lab5;

architecture Behavioral of Top_Lab5 is
    constant DIV_MAX : integer := 49999999;

    signal clk_buf      : STD_LOGIC;
    signal clk_100mhz   : STD_LOGIC;
    signal div_cnt      : integer range 0 to DIV_MAX := 0;
    signal tick         : STD_LOGIC := '0';
    signal ps2_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal ps2_ready    : STD_LOGIC;
    signal cnt_q        : STD_LOGIC_VECTOR (7 downto 0);
    signal oled_line    : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

    component PS2_RX is
        port (
            Clk_100MHz : in  STD_LOGIC;
            PS2_Clk    : in  STD_LOGIC;
            PS2_Data   : in  STD_LOGIC;
            PS2_DO     : out STD_LOGIC_VECTOR (7 downto 0);
            PS2_DOrdy  : out STD_LOGIC
        );
    end component;

    component Counter_UpDown8 is
        Port (
            clk      : in  STD_LOGIC;
            ce       : in  STD_LOGIC;
            key_rdy  : in  STD_LOGIC;
            key_code : in  STD_LOGIC_VECTOR (7 downto 0);
            X        : in  STD_LOGIC;
            Q        : out STD_LOGIC_VECTOR (7 downto 0);
            Y        : out STD_LOGIC_VECTOR (1 downto 0)
        );
    end component;

    component OLED_1x32 is
        port (
            Clk_100MHz : in    STD_LOGIC;
            Line       : in    STD_LOGIC_VECTOR (31 downto 0);
            DecPts     : in    STD_LOGIC_VECTOR (7 downto 0);
            Blank      : in    STD_LOGIC_VECTOR (7 downto 0);
            I2C_NACK   : out   STD_LOGIC;
            OLED_SDA   : inout STD_LOGIC;
            OLED_SCL   : inout STD_LOGIC
        );
    end component;
begin
    inst_IBUFDS : IBUFDS port map (I => CLK_100MHz_P, IB => CLK_100MHz_N, O => clk_buf);
    inst_BUFG   : BUFG   port map (I => clk_buf, O => clk_100mhz);

    process (clk_100mhz)
    begin
        if rising_edge(clk_100mhz) then
            if div_cnt = DIV_MAX then
                div_cnt <= 0;
                tick    <= '1';
            else
                div_cnt <= div_cnt + 1;
                tick    <= '0';
            end if;
        end if;
    end process;

    Inst_PS2 : PS2_RX port map (
        Clk_100MHz => clk_100mhz,
        PS2_Clk    => PS2A_Clk,
        PS2_Data   => PS2A_Data,
        PS2_DO     => ps2_data_out,
        PS2_DOrdy  => ps2_ready
    );

    Inst_Cnt : Counter_UpDown8 port map (
        clk      => clk_100mhz,
        ce       => tick,
        key_rdy  => ps2_ready,
        key_code => ps2_data_out,
        X        => SW_X,
        Q        => cnt_q,
        Y        => open
    );

    LED <= cnt_q;
    oled_line(7 downto 0) <= cnt_q;

    Inst_OLED : OLED_1x32 port map (
        Clk_100MHz => clk_100mhz,
        Line       => oled_line,
        DecPts     => x"00",
        Blank      => "11111100",
        I2C_NACK   => open,
        OLED_SDA   => OLED_SDA,
        OLED_SCL   => OLED_SCL
    );
end Behavioral;
