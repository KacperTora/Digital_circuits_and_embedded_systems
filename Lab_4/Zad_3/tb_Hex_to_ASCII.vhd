library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Hex_to_ASCII is
end tb_Hex_to_ASCII;

architecture Behavioral of tb_Hex_to_ASCII is
    component Hex_to_ASCII
        Port ( 
            hex_in    : in  STD_LOGIC_VECTOR (3 downto 0);
            ascii_out : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal hex_in    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal ascii_out : STD_LOGIC_VECTOR(7 downto 0);
begin
    UUT: Hex_to_ASCII port map (
        hex_in => hex_in,
        ascii_out => ascii_out
    );

    stim_proc: process
    begin
        hex_in <= x"0"; wait for 20 ns;
        hex_in <= x"9"; wait for 20 ns;
        hex_in <= x"A"; wait for 20 ns;
        hex_in <= x"F"; wait for 20 ns;
        wait;
    end process;
end Behavioral;
