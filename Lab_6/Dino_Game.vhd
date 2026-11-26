library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dino_Game is
    Generic (
        PERIOD_START : integer := 20000000;
        PERIOD_MIN   : integer := 8000000;
        PERIOD_STEP  : integer := 400000
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
end Dino_Game;

architecture Behavioral of Dino_Game is
    constant SPACE_CODE : STD_LOGIC_VECTOR (7 downto 0) := x"29";
    constant BREAK_CODE : STD_LOGIC_VECTOR (7 downto 0) := x"F0";
    constant EXT_CODE   : STD_LOGIC_VECTOR (7 downto 0) := x"E0";

    constant PLAYER_COL : integer := 2;
    constant JUMP_LEN   : integer := 4;
    constant MIN_GAP    : integer := 6;
    constant OVER_WAIT  : integer := 8;

    type state_type is (S_START, S_GAME, S_OVER);
    signal state : state_type := S_START;

    signal ignore_next : STD_LOGIC := '0';
    signal space       : STD_LOGIC;

    signal period   : integer range 0 to PERIOD_START := PERIOD_START;
    signal tick_cnt : integer range 0 to PERIOD_START := 0;
    signal tick     : STD_LOGIC := '0';

    signal lfsr     : STD_LOGIC_VECTOR (15 downto 0) := x"ACE1";
    signal obst     : STD_LOGIC_VECTOR (20 downto 0) := (others => '0');
    signal new_obst : STD_LOGIC;
    signal gap      : integer range 0 to MIN_GAP := MIN_GAP;
    signal jmp      : integer range 0 to JUMP_LEN := 0;
    signal hit      : STD_LOGIC;
    signal wait_cnt : integer range 0 to OVER_WAIT := 0;

    signal score : unsigned (15 downto 0) := (others => '0');
    signal best  : unsigned (15 downto 0) := (others => '0');

    function bcd_inc (v : unsigned (15 downto 0)) return unsigned is
        variable r : unsigned (15 downto 0) := v;
        variable c : STD_LOGIC := '1';
    begin
        for i in 0 to 3 loop
            if c = '1' then
                if r(4*i+3 downto 4*i) = 9 then
                    r(4*i+3 downto 4*i) := "0000";
                else
                    r(4*i+3 downto 4*i) := r(4*i+3 downto 4*i) + 1;
                    c := '0';
                end if;
            end if;
        end loop;
        return r;
    end function;
begin
    space <= '1' when key_rdy = '1' and ignore_next = '0' and key_code = SPACE_CODE
             else '0';

    process (clk)
    begin
        if rising_edge(clk) then
            if key_rdy = '1' then
                if key_code = BREAK_CODE then
                    ignore_next <= '1';
                elsif key_code /= EXT_CODE then
                    ignore_next <= '0';
                end if;
            end if;
        end if;
    end process;

    process (clk)
    begin
        if rising_edge(clk) then
            if tick_cnt >= period - 1 then
                tick_cnt <= 0;
                tick     <= '1';
            else
                tick_cnt <= tick_cnt + 1;
                tick     <= '0';
            end if;
        end if;
    end process;

    process (clk)
    begin
        if rising_edge(clk) then
            lfsr <= lfsr(14 downto 0) & (lfsr(15) xor lfsr(13) xor lfsr(12) xor lfsr(10));
        end if;
    end process;

    new_obst <= '1' when gap = 0 and lfsr(1 downto 0) = "11" else '0';

    hit <= '1' when obst(PLAYER_COL) = '1' and jmp = 0 else '0';

    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when S_START | S_OVER =>
                    if state = S_OVER and tick = '1' and wait_cnt < OVER_WAIT then
                        wait_cnt <= wait_cnt + 1;
                    end if;
                    if space = '1' and (state = S_START or wait_cnt = OVER_WAIT) then
                        state  <= S_GAME;
                        obst   <= (others => '0');
                        jmp    <= 0;
                        gap    <= MIN_GAP;
                        score  <= (others => '0');
                        period <= PERIOD_START;
                    end if;

                when S_GAME =>
                    if hit = '1' then
                        state    <= S_OVER;
                        wait_cnt <= 0;
                        if score > best then
                            best <= score;
                        end if;
                    else
                        if space = '1' and jmp = 0 then
                            jmp <= JUMP_LEN;
                        elsif tick = '1' and jmp > 0 then
                            jmp <= jmp - 1;
                        end if;

                        if tick = '1' then
                            obst <= new_obst & obst(20 downto 1);
                            if new_obst = '1' then
                                gap <= MIN_GAP;
                            elsif gap > 0 then
                                gap <= gap - 1;
                            end if;
                            if obst(PLAYER_COL) = '1' then
                                score <= bcd_inc(score);
                                if period > PERIOD_MIN then
                                    period <= period - PERIOD_STEP;
                                end if;
                            end if;
                        end if;
                    end if;
            end case;
        end if;
    end process;

    with state select state_o <=
        "00" when S_START,
        "01" when S_GAME,
        "10" when S_OVER;

    height_o <= "00" when jmp = 0 else
                "01" when jmp = 1 or jmp = JUMP_LEN else
                "10";

    obst_o  <= obst;
    score_o <= std_logic_vector(score);
    best_o  <= std_logic_vector(best);
end Behavioral;
