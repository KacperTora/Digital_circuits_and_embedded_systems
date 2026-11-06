-- JS PWr Edu PL
-- --------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity PS2_RX is
  port (
    Clk_100MHz : in STD_LOGIC;
    PS2_Clk : in STD_LOGIC;
    PS2_Data : in STD_LOGIC;
    PS2_DO : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PS2_DOrdy : out STD_LOGIC
  );
end PS2_RX;

architecture STRUCTURE of PS2_RX is
  signal CntDiv_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal iDO_Rdy : STD_LOGIC;
  signal iDO_Rdy0 : STD_LOGIC;
  signal iDO_Rdy_i_2_n_0 : STD_LOGIC;
  signal iDO_Rdy_i_3_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_6_in : STD_LOGIC;
  signal p_7_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal qBusy : STD_LOGIC;
  signal qBusy_i_1_n_0 : STD_LOGIC;
  signal qPS_Clk : STD_LOGIC;
  signal qPS_Clk_Prev : STD_LOGIC;
  signal qPS_Clk_i_1_n_0 : STD_LOGIC;
  signal \reg10b_reg_n_0_[0]\ : STD_LOGIC;
  signal \reg10b_reg_n_0_[1]\ : STD_LOGIC;
  signal \reg10b_reg_n_0_[2]\ : STD_LOGIC;
  signal \reg10b_reg_n_0_[5]\ : STD_LOGIC;
  signal \reg10b_reg_n_0_[6]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CntDiv[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CntDiv[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CntDiv[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CntDiv[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of iDO_Rdy_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of qBusy_i_1 : label is "soft_lutpair0";
begin
\CntDiv[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CntDiv_reg(0),
      O => plusOp(0)
    );
\CntDiv[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => CntDiv_reg(0),
      I1 => CntDiv_reg(1),
      O => plusOp(1)
    );
\CntDiv[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => CntDiv_reg(0),
      I1 => CntDiv_reg(1),
      I2 => CntDiv_reg(2),
      O => plusOp(2)
    );
\CntDiv[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => CntDiv_reg(1),
      I1 => CntDiv_reg(0),
      I2 => CntDiv_reg(2),
      I3 => CntDiv_reg(3),
      O => plusOp(3)
    );
\CntDiv_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => plusOp(0),
      Q => CntDiv_reg(0),
      R => '0'
    );
\CntDiv_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => plusOp(1),
      Q => CntDiv_reg(1),
      R => '0'
    );
\CntDiv_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => plusOp(2),
      Q => CntDiv_reg(2),
      R => '0'
    );
\CntDiv_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => plusOp(3),
      Q => CntDiv_reg(3),
      R => '0'
    );
\PS2_DO_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => \reg10b_reg_n_0_[0]\,
      Q => PS2_DO(0),
      R => '0'
    );
\PS2_DO_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => \reg10b_reg_n_0_[1]\,
      Q => PS2_DO(1),
      R => '0'
    );
\PS2_DO_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => \reg10b_reg_n_0_[2]\,
      Q => PS2_DO(2),
      R => '0'
    );
\PS2_DO_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => p_1_in,
      Q => PS2_DO(3),
      R => '0'
    );
\PS2_DO_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => p_2_in,
      Q => PS2_DO(4),
      R => '0'
    );
\PS2_DO_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => \reg10b_reg_n_0_[5]\,
      Q => PS2_DO(5),
      R => '0'
    );
\PS2_DO_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => \reg10b_reg_n_0_[6]\,
      Q => PS2_DO(6),
      R => '0'
    );
\PS2_DO_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => iDO_Rdy,
      D => p_5_in,
      Q => PS2_DO(7),
      R => '0'
    );
PS2_DOrdy_reg: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => iDO_Rdy,
      Q => PS2_DOrdy,
      R => '0'
    );
iDO_Rdy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8228288228828228"
    )
        port map (
      I0 => iDO_Rdy_i_2_n_0,
      I1 => \reg10b_reg_n_0_[5]\,
      I2 => p_2_in,
      I3 => p_5_in,
      I4 => \reg10b_reg_n_0_[6]\,
      I5 => iDO_Rdy_i_3_n_0,
      O => iDO_Rdy0
    );
iDO_Rdy_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => PS2_Data,
      I1 => qBusy,
      I2 => \reg10b_reg_n_0_[0]\,
      I3 => qPS_Clk,
      I4 => qPS_Clk_Prev,
      O => iDO_Rdy_i_2_n_0
    );
iDO_Rdy_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \reg10b_reg_n_0_[1]\,
      I1 => p_6_in,
      I2 => p_0_in,
      I3 => p_1_in,
      I4 => \reg10b_reg_n_0_[2]\,
      O => iDO_Rdy_i_3_n_0
    );
iDO_Rdy_reg: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => iDO_Rdy0,
      Q => iDO_Rdy,
      R => '0'
    );
qBusy_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C5F0F0"
    )
        port map (
      I0 => PS2_Data,
      I1 => \reg10b_reg_n_0_[0]\,
      I2 => qBusy,
      I3 => qPS_Clk,
      I4 => qPS_Clk_Prev,
      O => qBusy_i_1_n_0
    );
qBusy_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => qBusy_i_1_n_0,
      Q => qBusy,
      R => '0'
    );
qPS_Clk_Prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => qPS_Clk,
      Q => qPS_Clk_Prev,
      R => '0'
    );
qPS_Clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000002"
    )
        port map (
      I0 => PS2_Clk,
      I1 => CntDiv_reg(2),
      I2 => CntDiv_reg(3),
      I3 => CntDiv_reg(1),
      I4 => CntDiv_reg(0),
      I5 => qPS_Clk,
      O => qPS_Clk_i_1_n_0
    );
qPS_Clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => qPS_Clk_i_1_n_0,
      Q => qPS_Clk,
      R => '0'
    );
\reg10b[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => qPS_Clk,
      I1 => qPS_Clk_Prev,
      I2 => qBusy,
      O => p_7_in
    );
\reg10b[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => qPS_Clk,
      I1 => qPS_Clk_Prev,
      I2 => qBusy,
      O => p_3_in
    );
\reg10b_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => \reg10b_reg_n_0_[1]\,
      Q => \reg10b_reg_n_0_[0]\,
      S => p_7_in
    );
\reg10b_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => \reg10b_reg_n_0_[2]\,
      Q => \reg10b_reg_n_0_[1]\,
      S => p_7_in
    );
\reg10b_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => p_1_in,
      Q => \reg10b_reg_n_0_[2]\,
      S => p_7_in
    );
\reg10b_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => p_2_in,
      Q => p_1_in,
      S => p_7_in
    );
\reg10b_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => \reg10b_reg_n_0_[5]\,
      Q => p_2_in,
      S => p_7_in
    );
\reg10b_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => \reg10b_reg_n_0_[6]\,
      Q => \reg10b_reg_n_0_[5]\,
      S => p_7_in
    );
\reg10b_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => p_5_in,
      Q => \reg10b_reg_n_0_[6]\,
      S => p_7_in
    );
\reg10b_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => p_6_in,
      Q => p_5_in,
      S => p_7_in
    );
\reg10b_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => p_0_in,
      Q => p_6_in,
      S => p_7_in
    );
\reg10b_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => p_3_in,
      D => PS2_Data,
      Q => p_0_in,
      R => p_7_in
    );
end STRUCTURE;
