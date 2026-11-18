library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Counter_UpDown8 is
end tb_Counter_UpDown8;

architecture Behavioral of tb_Counter_UpDown8 is
    component Counter_UpDown8
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

    signal clk      : STD_LOGIC := '0';
    signal ce       : STD_LOGIC := '1';
    signal key_rdy  : STD_LOGIC := '0';
    signal key_code : STD_LOGIC_VECTOR (7 downto 0) := x"00";
    signal X        : STD_LOGIC := '1';
    signal Q        : STD_LOGIC_VECTOR (7 downto 0);
    signal Y        : STD_LOGIC_VECTOR (1 downto 0);
    constant CLK_PERIOD : time := 10 ns;
begin
    UUT : Counter_UpDown8 port map (
        clk => clk, ce => ce, key_rdy => key_rdy, key_code => key_code,
        X => X, Q => Q, Y => Y
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
    begin
        wait for 50 ns;

        send_byte(x"1C");
        wait for 60 ns;

        X <= '0';
        wait for 60 ns;

        send_byte(x"F0");
        send_byte(x"1C");
        wait for 40 ns;

        X <= '1';
        send_byte(x"FE");
        wait for 40 ns;

        X <= '0';
        send_byte(x"01");
        wait for 40 ns;

        wait;
    end process;
end Behavioral;
