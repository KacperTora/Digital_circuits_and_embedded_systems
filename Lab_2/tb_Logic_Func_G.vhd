library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Logic_Func_G is
end tb_Logic_Func_G;

architecture Behavioral of tb_Logic_Func_G is
    component Logic_Func_G
        Port ( 
            W : in  STD_LOGIC;
            X : in  STD_LOGIC;
            Y : in  STD_LOGIC;
            Z : in  STD_LOGIC;
            G : out STD_LOGIC
        );
    end component;

    signal W : STD_LOGIC := '0';
    signal X : STD_LOGIC := '0';
    signal Y : STD_LOGIC := '0';
    signal Z : STD_LOGIC := '0';
    signal G : STD_LOGIC;

begin
    UUT: Logic_Func_G port map (
        W => W,
        X => X,
        Y => Y,
        Z => Z,
        G => G
    );

    stim_proc: process
    begin
        W <= '0'; X <= '0'; Y <= '0'; Z <= '0'; wait for 20 ns;
        W <= '0'; X <= '0'; Y <= '0'; Z <= '1'; wait for 20 ns;
        W <= '0'; X <= '0'; Y <= '1'; Z <= '0'; wait for 20 ns;
        W <= '0'; X <= '0'; Y <= '1'; Z <= '1'; wait for 20 ns;
        W <= '0'; X <= '1'; Y <= '0'; Z <= '0'; wait for 20 ns;
        W <= '0'; X <= '1'; Y <= '0'; Z <= '1'; wait for 20 ns;
        W <= '0'; X <= '1'; Y <= '1'; Z <= '0'; wait for 20 ns;
        W <= '0'; X <= '1'; Y <= '1'; Z <= '1'; wait for 20 ns;
        W <= '1'; X <= '0'; Y <= '0'; Z <= '0'; wait for 20 ns;
        W <= '1'; X <= '0'; Y <= '0'; Z <= '1'; wait for 20 ns;
        W <= '1'; X <= '0'; Y <= '1'; Z <= '0'; wait for 20 ns;
        W <= '1'; X <= '0'; Y <= '1'; Z <= '1'; wait for 20 ns;
        W <= '1'; X <= '1'; Y <= '0'; Z <= '0'; wait for 20 ns;
        W <= '1'; X <= '1'; Y <= '0'; Z <= '1'; wait for 20 ns;
        W <= '1'; X <= '1'; Y <= '1'; Z <= '0'; wait for 20 ns;
        W <= '1'; X <= '1'; Y <= '1'; Z <= '1'; wait for 20 ns;
        wait;
    end process;
end Behavioral;
