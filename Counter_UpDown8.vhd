library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_UpDown8 is
    Port (
        clk      : in  STD_LOGIC;                     -- zegar 100 MHz
        ce       : in  STD_LOGIC;                     -- impuls z dzielnika (tempo liczenia)
        key_rdy  : in  STD_LOGIC;                     -- PS2_DOrdy
        key_code : in  STD_LOGIC_VECTOR (7 downto 0); -- PS2_DO
        X        : in  STD_LOGIC;                     -- przelacznik kierunku: 1 = gora, 0 = dol
        Q        : out STD_LOGIC_VECTOR (7 downto 0); -- stan licznika
        Y        : out STD_LOGIC_VECTOR (1 downto 0)  -- wyjscia automatu: Y = E U
    );
end Counter_UpDown8;

architecture Behavioral of Counter_UpDown8 is
    constant BREAK_CODE : STD_LOGIC_VECTOR (7 downto 0) := x"F0";
    constant EXT_CODE   : STD_LOGIC_VECTOR (7 downto 0) := x"E0";

    -- automat sterujacy (graf): S0 = czekanie, S1 = gora, S2 = dol
    type state_type is (S0, S1, S2);
    signal state : state_type := S0;

    signal ignore_next : STD_LOGIC := '0';
    signal K : STD_LOGIC;                             -- odebrano poprawny kod klawisza
    signal E : STD_LOGIC;                             -- enable
    signal U : STD_LOGIC;                             -- kierunek

    signal Q_reg : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal G     : STD_LOGIC_VECTOR (7 downto 0);     -- G(i) = Q0*Q1*...*Q(i-1)
    signal B     : STD_LOGIC_VECTOR (7 downto 0);     -- B(i) = NOT(Q0)*...*NOT(Q(i-1))
    signal T     : STD_LOGIC_VECTOR (7 downto 0);     -- sygnaly przelaczenia
    signal D     : STD_LOGIC_VECTOR (7 downto 0);     -- wzbudzenia przerzutnikow D
begin
    ---------------------------------------------------------------
    -- Filtr kodow klawiatury (jak w Lab 4): pomijamy F0, bajt po F0 oraz E0
    ---------------------------------------------------------------
    K <= '1' when key_rdy = '1' and ignore_next = '0'
                  and key_code /= BREAK_CODE and key_code /= EXT_CODE
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

    ---------------------------------------------------------------
    -- Automat sterujacy (Moore) wg grafu
    ---------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when S0 =>
                    if K = '1' then state <= S1; end if;
                when S1 =>
                    if X = '0' then state <= S2; end if;
                when S2 =>
                    if X = '1' then state <= S1; end if;
            end case;
        end if;
    end process;

    E <= '0' when state = S0 else '1';
    U <= '1' when state = S1 else '0';
    Y <= E & U;

    ---------------------------------------------------------------
    -- Rownania z siatek, uogolnione na 8 bitow:
    --   Ti = U*Q0*...*Q(i-1) + NOT(U)*NOT(Q0)*...*NOT(Q(i-1)),  T0 = 1
    --   Di = Qi XOR Ti
    ---------------------------------------------------------------
    G(0) <= '1';
    B(0) <= '1';
    gen_chain : for i in 1 to 7 generate
        G(i) <= G(i-1) and Q_reg(i-1);
        B(i) <= B(i-1) and not Q_reg(i-1);
    end generate;

    gen_bits : for i in 0 to 7 generate
        T(i) <= (U and G(i)) or ((not U) and B(i));
        D(i) <= Q_reg(i) xor T(i);
    end generate;

    ---------------------------------------------------------------
    -- Rejestr licznika: ladowanie ma priorytet nad liczeniem
    ---------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if K = '1' then
                Q_reg <= key_code;
            elsif E = '1' and ce = '1' then
                Q_reg <= D;
            end if;
        end if;
    end process;

    Q <= Q_reg;
end Behavioral;
