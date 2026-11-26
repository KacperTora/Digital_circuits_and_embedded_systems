library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dino_Render is
    Generic (
        REFRESH : integer := 1000000
    );
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
end Dino_Render;

architecture Behavioral of Dino_Render is
    constant ST_START : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ST_OVER  : STD_LOGIC_VECTOR (1 downto 0) := "10";

    subtype line_t is string (1 to 21);
    constant TXT_SCORE  : line_t := "PKT ????     REK ????";
    constant TXT_START1 : line_t := "  DINOZAUR  NA FPGA  ";
    constant TXT_START2 : line_t := "   SPACJA = START    ";
    constant TXT_OVER1  : line_t := "    KONIEC  GRY !    ";
    constant TXT_OVER2  : line_t := "  SPACJA = OD NOWA   ";

    type rstate_type is (R_IDLE, R_GOTO, R_WRITE);
    signal rstate : rstate_type := R_IDLE;

    signal ref_cnt : integer range 0 to REFRESH := 0;
    signal row     : integer range 0 to 7 := 0;
    signal col     : integer range 0 to 20 := 0;
    signal ch      : STD_LOGIC_VECTOR (7 downto 0);

    function to_ascii (c : character) return STD_LOGIC_VECTOR is
    begin
        return std_logic_vector(to_unsigned(character'pos(c), 8));
    end function;

    function digit (d : STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
    begin
        return "0011" & d;
    end function;

    type codes_t is array (0 to 20) of STD_LOGIC_VECTOR (7 downto 0);
    function to_codes (s : line_t) return codes_t is
        variable r : codes_t;
    begin
        for i in 0 to 20 loop
            r(i) := to_ascii(s(i + 1));
        end loop;
        return r;
    end function;

    constant C_SCORE  : codes_t := to_codes(TXT_SCORE);
    constant C_START1 : codes_t := to_codes(TXT_START1);
    constant C_START2 : codes_t := to_codes(TXT_START2);
    constant C_OVER1  : codes_t := to_codes(TXT_OVER1);
    constant C_OVER2  : codes_t := to_codes(TXT_OVER2);
begin
    process (clk)
    begin
        if rising_edge(clk) then
            case rstate is
                when R_IDLE =>
                    if ref_cnt = REFRESH - 1 then
                        ref_cnt <= 0;
                        rstate  <= R_GOTO;
                    else
                        ref_cnt <= ref_cnt + 1;
                    end if;

                when R_GOTO =>
                    row    <= 0;
                    col    <= 0;
                    rstate <= R_WRITE;

                when R_WRITE =>
                    if row = 7 and col = 19 then
                        rstate <= R_IDLE;
                    elsif col = 20 then
                        col <= 0;
                        row <= row + 1;
                    else
                        col <= col + 1;
                    end if;
            end case;
        end if;
    end process;

    Goto00   <= '1' when rstate = R_GOTO  else '0';
    ASCII_WE <= '1' when rstate = R_WRITE else '0';
    ASCII    <= ch;

    process (row, col, state_i, obst_i, height_i, score_i, best_i)
    begin
        ch <= to_ascii(' ');
        case row is
            when 0 =>
                case col is
                    when 4  => ch <= digit(score_i(15 downto 12));
                    when 5  => ch <= digit(score_i(11 downto 8));
                    when 6  => ch <= digit(score_i(7 downto 4));
                    when 7  => ch <= digit(score_i(3 downto 0));
                    when 17 => ch <= digit(best_i(15 downto 12));
                    when 18 => ch <= digit(best_i(11 downto 8));
                    when 19 => ch <= digit(best_i(7 downto 4));
                    when 20 => ch <= digit(best_i(3 downto 0));
                    when others => ch <= C_SCORE(col);
                end case;

            when 2 =>
                if state_i = ST_START then
                    ch <= C_START1(col);
                elsif state_i = ST_OVER then
                    ch <= C_OVER1(col);
                end if;

            when 3 =>
                if state_i = ST_START then
                    ch <= C_START2(col);
                elsif state_i = ST_OVER then
                    ch <= C_OVER2(col);
                end if;

            when 4 =>
                if col = 2 and height_i = "10" then
                    ch <= to_ascii('D');
                end if;

            when 5 =>
                if col = 2 and height_i = "01" then
                    ch <= to_ascii('D');
                end if;

            when 6 =>
                if col = 2 and state_i = ST_OVER then
                    ch <= to_ascii('X');
                elsif col = 2 and height_i = "00" then
                    ch <= to_ascii('D');
                elsif obst_i(col) = '1' then
                    ch <= to_ascii('#');
                end if;

            when 7 =>
                ch <= to_ascii('=');

            when others =>
                ch <= to_ascii(' ');
        end case;
    end process;
end Behavioral;
