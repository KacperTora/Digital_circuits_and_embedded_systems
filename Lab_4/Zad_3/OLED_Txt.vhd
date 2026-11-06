-- JS PWr Edu PL
-- --------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity OLED_Txt is
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
end OLED_Txt;

architecture STRUCTURE of OLED_Txt is
  signal Addr_Clr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \Addr_Clr[0]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Clr[1]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Clr[3]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Clr[5]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Clr[7]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Clr[7]_i_3_n_0\ : STD_LOGIC;
  signal \Addr_RB[5]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_RB[6]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_RB[7]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_RB[7]_i_3_n_0\ : STD_LOGIC;
  signal \Addr_RB[7]_i_6_n_0\ : STD_LOGIC;
  signal \Addr_RB[7]_i_7_n_0\ : STD_LOGIC;
  signal Addr_Rd0_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \Addr_Rd[5]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Rd[7]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Rd[7]_i_3_n_0\ : STD_LOGIC;
  signal \Addr_Wr[0]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[1]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[2]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[3]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[4]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[4]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Wr[4]_i_3_n_0\ : STD_LOGIC;
  signal \Addr_Wr[4]_i_4_n_0\ : STD_LOGIC;
  signal \Addr_Wr[4]_i_5_n_0\ : STD_LOGIC;
  signal \Addr_Wr[5]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[5]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Wr[6]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[6]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Wr[7]_i_1_n_0\ : STD_LOGIC;
  signal \Addr_Wr[7]_i_2_n_0\ : STD_LOGIC;
  signal \Addr_Wr[7]_i_3_n_0\ : STD_LOGIC;
  signal DO : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[10]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[13]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[13]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[15]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[17]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[22]_i_9_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[7]_i_1_n_0\ : STD_LOGIC;
  signal I2C_FIFO_Empty : STD_LOGIC;
  signal I2C_FIFO_Full : STD_LOGIC;
  signal L : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal Mask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \Mask[0]_i_10_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_15_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_2_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_5_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[0]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_6_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[1]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_11_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_15_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_16_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_2_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[2]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_10_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_11_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_15_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_16_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_4_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_6_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[3]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_11_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_2_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[4]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_10_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_15_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_2_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[5]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_10_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_12_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_13_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_14_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_15_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_2_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_5_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[6]_i_9_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_1_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_3_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_4_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_5_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_6_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_7_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_8_n_0\ : STD_LOGIC;
  signal \Mask[7]_i_9_n_0\ : STD_LOGIC;
  signal \Mask_reg[0]_i_11_n_0\ : STD_LOGIC;
  signal \Mask_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \Mask_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \Mask_reg[2]_i_10_n_0\ : STD_LOGIC;
  signal \Mask_reg[2]_i_8_n_0\ : STD_LOGIC;
  signal \Mask_reg[5]_i_11_n_0\ : STD_LOGIC;
  signal \Mask_reg[6]_i_11_n_0\ : STD_LOGIC;
  signal \Mask_reg[6]_i_6_n_0\ : STD_LOGIC;
  signal NACK : STD_LOGIC;
  signal NACK_i_1_n_0 : STD_LOGIC;
  signal NACK_i_2_n_0 : STD_LOGIC;
  signal NACK_i_3_n_0 : STD_LOGIC;
  signal NACK_i_4_n_0 : STD_LOGIC;
  signal NACK_i_5_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_11_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_12_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_13_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_14_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_15_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_16_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_17_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_18_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_19_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_1_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_20_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_21_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_22_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_23_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_24_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_25_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_26_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_27_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_2_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_3_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_4_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_5_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_6_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_7_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_8_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_9_n_0 : STD_LOGIC;
  signal RAM_reg_bram_0_i_10_n_0 : STD_LOGIC;
  signal RAM_reg_bram_0_i_12_n_0 : STD_LOGIC;
  signal RAM_reg_bram_0_i_13_n_0 : STD_LOGIC;
  signal RAM_reg_bram_0_i_1_n_0 : STD_LOGIC;
  signal SCLout_i_1_n_0 : STD_LOGIC;
  signal SCLout_i_2_n_0 : STD_LOGIC;
  signal SCLout_i_3_n_0 : STD_LOGIC;
  signal SCLout_i_4_n_0 : STD_LOGIC;
  signal SCLout_i_5_n_0 : STD_LOGIC;
  signal SCLout_i_6_n_0 : STD_LOGIC;
  signal SCLout_i_7_n_0 : STD_LOGIC;
  signal SCLout_i_8_n_0 : STD_LOGIC;
  signal SCLout_i_9_n_0 : STD_LOGIC;
  signal SDAout_i_10_n_0 : STD_LOGIC;
  signal SDAout_i_11_n_0 : STD_LOGIC;
  signal SDAout_i_12_n_0 : STD_LOGIC;
  signal SDAout_i_1_n_0 : STD_LOGIC;
  signal SDAout_i_2_n_0 : STD_LOGIC;
  signal SDAout_i_3_n_0 : STD_LOGIC;
  signal SDAout_i_4_n_0 : STD_LOGIC;
  signal SDAout_i_5_n_0 : STD_LOGIC;
  signal SDAout_i_7_n_0 : STD_LOGIC;
  signal SDAout_i_8_n_0 : STD_LOGIC;
  signal SDAout_i_9_n_0 : STD_LOGIC;
  signal \addrROM[2]_i_1_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_1_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_2_n_0\ : STD_LOGIC;
  signal \addrRd[0]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[0]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[1]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[2]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[3]_i_1_n_0\ : STD_LOGIC;
  signal addrWr_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cnt20b[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt20b[0]_i_3_n_0\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \cntBits[0]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[1]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[2]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_2_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_3_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_4_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_5_n_0\ : STD_LOGIC;
  signal \cntChar[0]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[1]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[2]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[3]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[4]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[5]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[5]_i_2_n_0\ : STD_LOGIC;
  signal \cntChar[6]_i_1_n_0\ : STD_LOGIC;
  signal \cntChar[7]_i_2_n_0\ : STD_LOGIC;
  signal \cntChar[7]_i_3_n_0\ : STD_LOGIC;
  signal \cntChar[7]_i_4_n_0\ : STD_LOGIC;
  signal \cntChar[7]_i_5_n_0\ : STD_LOGIC;
  signal \cntCol[0]_i_1_n_0\ : STD_LOGIC;
  signal \cntCol[1]_i_1_n_0\ : STD_LOGIC;
  signal \cntCol[2]_i_1_n_0\ : STD_LOGIC;
  signal \cntSCL[10]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[13]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_3_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_4_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_5_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_6_n_0\ : STD_LOGIC;
  signal \cntSCL[4]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[4]_i_3_n_0\ : STD_LOGIC;
  signal \cntSCL[4]_i_4_n_0\ : STD_LOGIC;
  signal \cntSCL[4]_i_5_n_0\ : STD_LOGIC;
  signal \cntSCL[4]_i_6_n_0\ : STD_LOGIC;
  signal \cntSCL[5]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[8]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[9]_i_2_n_0\ : STD_LOGIC;
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal \g0_b0__1_n_0\ : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal \g0_b1__1_n_0\ : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal \g0_b2__1_n_0\ : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal \g0_b3__0_n_0\ : STD_LOGIC;
  signal \g0_b3__1_n_0\ : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal \g0_b4__0_n_0\ : STD_LOGIC;
  signal \g0_b4__1_n_0\ : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal \g0_b5__0_n_0\ : STD_LOGIC;
  signal \g0_b5__1_n_0\ : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal \g0_b6__0_n_0\ : STD_LOGIC;
  signal \g0_b6__1_n_0\ : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal \g1_b0__0_n_0\ : STD_LOGIC;
  signal g1_b0_n_0 : STD_LOGIC;
  signal \g1_b1__0_n_0\ : STD_LOGIC;
  signal g1_b1_n_0 : STD_LOGIC;
  signal \g1_b2__0_n_0\ : STD_LOGIC;
  signal g1_b2_n_0 : STD_LOGIC;
  signal \g1_b3__0_n_0\ : STD_LOGIC;
  signal g1_b3_n_0 : STD_LOGIC;
  signal \g1_b4__0_n_0\ : STD_LOGIC;
  signal g1_b4_n_0 : STD_LOGIC;
  signal \g1_b5__0_n_0\ : STD_LOGIC;
  signal g1_b5_n_0 : STD_LOGIC;
  signal \g1_b6__0_n_0\ : STD_LOGIC;
  signal g1_b6_n_0 : STD_LOGIC;
  signal \g1_b7__0_n_0\ : STD_LOGIC;
  signal g1_b7_n_0 : STD_LOGIC;
  signal iEmpty_i_1_n_0 : STD_LOGIC;
  signal iEmpty_i_2_n_0 : STD_LOGIC;
  signal iFull_i_1_n_0 : STD_LOGIC;
  signal iFull_i_2_n_0 : STD_LOGIC;
  signal \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_IIC_master/FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_IIC_master/RdNotWr0\ : STD_LOGIC;
  signal \i_IIC_master/SCLin\ : STD_LOGIC;
  signal \i_IIC_master/SCLout_reg_n_0\ : STD_LOGIC;
  signal \i_IIC_master/SDAin\ : STD_LOGIC;
  signal \i_IIC_master/SDAout1__0\ : STD_LOGIC;
  signal \i_IIC_master/T\ : STD_LOGIC;
  signal \i_IIC_master/cntBits\ : STD_LOGIC;
  signal \i_IIC_master/cntBits_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_IIC_master/cntBits_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_IIC_master/cntBits_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_IIC_master/cntBits_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_IIC_master/cntSCL\ : STD_LOGIC;
  signal \i_IIC_master/cntSCL__0\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \i_IIC_master/i_FIFO/addrRd\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \i_IIC_master/i_FIFO/addrRd_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_IIC_master/i_FIFO/p_1_in\ : STD_LOGIC;
  signal \i_IIC_master/i_FIFO/plusOp0_in\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_IIC_master/p_0_in\ : STD_LOGIC;
  signal \i_IIC_master/p_2_in\ : STD_LOGIC;
  signal \i_IIC_master/rSDAin\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[0]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[1]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[2]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[3]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[4]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[5]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[6]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[7]_i_1_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut[7]_i_3_n_0\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_IIC_master/sregOut_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_main_ctrl/ASCII\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[11]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[12]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[13]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[14]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[17]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[20]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[21]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[22]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \i_main_ctrl/FSM_onehot_state_reg_n_0_[9]\ : STD_LOGIC;
  signal \i_main_ctrl/I2C_FIFO_DI1__1\ : STD_LOGIC;
  signal \i_main_ctrl/RAM_Goto00\ : STD_LOGIC;
  signal \i_main_ctrl/addrROM10_out__0\ : STD_LOGIC;
  signal \i_main_ctrl/addrROM_reg\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \i_main_ctrl/addrROM_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \i_main_ctrl/addrROM_reg__0__0\ : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \i_main_ctrl/cnt20b\ : STD_LOGIC;
  signal \i_main_ctrl/cnt20b_reg\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \i_main_ctrl/cntBlink_reg\ : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \i_main_ctrl/cntBlink_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_main_ctrl/cntBlink_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_main_ctrl/cntBlink_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_main_ctrl/cntBlink_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_main_ctrl/cntChar_reg_n_0_[7]\ : STD_LOGIC;
  signal \i_main_ctrl/cntCol\ : STD_LOGIC;
  signal \i_main_ctrl/cntCol_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_main_ctrl/cntCol_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_main_ctrl/cntCol_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/Addr_LT_reg\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \i_main_ctrl/i_RAM/Addr_PtB\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \i_main_ctrl/i_RAM/Addr_RB_reg\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \i_main_ctrl/i_RAM/Addr_Rd_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \i_main_ctrl/i_RAM/Addr_Rd_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/L\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \i_main_ctrl/i_RAM/do_scroll\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/in_scrclr\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/in_scrclr0\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/p_3_in\ : STD_LOGIC;
  signal \i_main_ctrl/i_RAM/p_7_in\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[0]_i_7_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[1]_i_11_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[3]_i_13_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[5]_i_6_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/Mask_reg[6]_i_7_n_0\ : STD_LOGIC;
  signal \i_main_ctrl/i_ROM/fontROM[0][0]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \i_main_ctrl/i_ROM/fontROM[0][2]__207\ : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal \i_main_ctrl/i_ROM/fontROM[0][4]__210\ : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \i_main_ctrl/i_ROM/fontROM[0][5]__183\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \i_main_ctrl/next_state11_in\ : STD_LOGIC;
  signal \i_main_ctrl/next_state15_out\ : STD_LOGIC;
  signal \i_main_ctrl/next_state1__7\ : STD_LOGIC;
  signal \i_main_ctrl/next_state2\ : STD_LOGIC;
  signal \i_main_ctrl/p_0_in2_in\ : STD_LOGIC;
  signal \i_main_ctrl/p_1_in\ : STD_LOGIC;
  signal \i_main_ctrl/p_1_in3_in\ : STD_LOGIC;
  signal \i_main_ctrl/p_3_in\ : STD_LOGIC;
  signal \i_main_ctrl/p_5_in\ : STD_LOGIC;
  signal in_scrclr_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rSCLin : STD_LOGIC;
  signal sregOut : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \sregOut[7]_i_2_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_5_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_6_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_7_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_8_n_0\ : STD_LOGIC;
  signal \NLW_cnt20b_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_cnt20b_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOE_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOF_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOG_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOH_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 7 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Addr_Clr[0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \Addr_Clr[1]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \Addr_Clr[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Addr_Clr[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Addr_Clr[5]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \Addr_Clr[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Addr_LT[5]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \Addr_LT[6]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \Addr_LT[7]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \Addr_RB[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Addr_RB[7]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \Addr_RB[7]_i_4\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \Addr_RB[7]_i_5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \Addr_RB[7]_i_6\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \Addr_RB[7]_i_7\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \Addr_Rd[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \Addr_Rd[1]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \Addr_Rd[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \Addr_Rd[3]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \Addr_Rd[4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \Addr_Rd[5]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \Addr_Rd[6]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \Addr_Wr[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \Addr_Wr[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \Addr_Wr[3]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \Addr_Wr[4]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \Addr_Wr[4]_i_5\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \Addr_Wr[5]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \Addr_Wr[7]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \FSM_onehot_state[10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_onehot_state[13]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FSM_onehot_state[13]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \FSM_onehot_state[13]_i_4\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \FSM_onehot_state[15]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \FSM_onehot_state[17]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1__0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_10\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_13\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_5\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_6\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \FSM_onehot_state[22]_i_8\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \FSM_onehot_state[5]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \FSM_onehot_state[5]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \Mask[3]_i_14\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Mask[3]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Mask[5]_i_10\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Mask[5]_i_8\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Mask[6]_i_10\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Mask[7]_i_5\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \Mask[7]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Mask[7]_i_8\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Mask[7]_i_9\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of NACK_i_4 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of NACK_i_5 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_10 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_12 : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_14 : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_16 : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_18 : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_20 : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_3 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_4 : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_5 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_6 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_7 : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_8 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_9 : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of SCLout_i_5 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of SDAout_i_4 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of SDAout_i_9 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addrROM[0]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \addrROM[1]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \addrROM[2]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \addrROM[3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addrROM[4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addrROM[5]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addrRd[1]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addrRd[2]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \addrRd[3]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \addrRd_rep[0]_i_2\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addrRd_rep[0]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addrWr[0]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \addrWr[1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \addrWr[2]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \addrWr[3]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \cntBits[0]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \cntBits[1]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \cntBits[2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \cntBits[3]_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \cntBlink[1]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \cntBlink[2]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \cntBlink[3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \cntBlink[4]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \cntChar[1]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \cntChar[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cntChar[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cntChar[5]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \cntChar[6]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \cntChar[7]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \cntChar[7]_i_5\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \cntCol[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \cntCol[2]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \cntSCL[0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \cntSCL[10]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \cntSCL[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cntSCL[12]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cntSCL[14]_i_5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \cntSCL[14]_i_6\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \cntSCL[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cntSCL[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cntSCL[4]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \cntSCL[5]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of g0_b7 : label is "soft_lutpair12";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \i_IIC_master/FSM_onehot_state_reg[0]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_IIC_master/FSM_onehot_state_reg[1]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_IIC_master/FSM_onehot_state_reg[3]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_IIC_master/FSM_onehot_state_reg[4]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_IIC_master/FSM_onehot_state_reg[5]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute box_type : string;
  attribute box_type of \i_IIC_master/IOBUF_SCL\ : label is "PRIMITIVE";
  attribute box_type of \i_IIC_master/IOBUF_SDA\ : label is "PRIMITIVE";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 128;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is "OLED_Txt/i_IIC_master/i_FIFO/RAM_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 15;
  attribute ram_offset : integer;
  attribute ram_offset of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\ : label is 7;
  attribute IOB : string;
  attribute IOB of \i_IIC_master/rSCLin_reg\ : label is "TRUE";
  attribute IOB of \i_IIC_master/rSDAin_reg\ : label is "TRUE";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[0]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[10]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[11]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[12]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[13]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[14]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[15]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[16]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[17]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[18]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[19]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[1]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[20]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[21]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[22]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[2]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[3]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[4]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[5]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[6]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[7]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[8]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute FSM_ENCODED_STATES of \i_main_ctrl/FSM_onehot_state_reg[9]\ : label is "swaitconfig:00000000000000000000001,spushconfig:00000000000000000001000,sgoconfig:00000000000000000010000,srefr_col:00000000000000000100000,srefr_ascii:00000000000000010000000,spushinit:00000000000000100000000,srefr_go:00000000000000000000100,sgoinit:00000000000010000000000,snack_config_w:00000000000100000000000,swaitready:00000000001000000000000,snack_cls_w:00000000100000000000000,srefr_wait:00000000010000000000000,sreset:00000010000000000000000,snack_cls:00000100000000000000000,sgocls:00000001000000000000000,srefr_loop:00010000000000000000000,snack_init_w:00100000000000000000000,srefr_push:00000000000000001000000,swaitcls:01000000000000000000000,spushcls:00001000000000000000000,snack_init:10000000000000000000000,swaitinit:00000000000001000000000,snack_config:00000000000000000000010";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "p0_d7";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "p0_d7";
  attribute METHODOLOGY_DRC_VIOS of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 1792;
  attribute RTL_RAM_NAME of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "OLED_Txt/i_main_ctrl/i_RAM/RAM_reg";
  attribute RTL_RAM_STYLE of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "auto";
  attribute RTL_RAM_TYPE of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is "RAM_TDP";
  attribute ram_addr_begin of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 0;
  attribute ram_addr_end of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 255;
  attribute ram_offset of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 0;
  attribute ram_slice_begin of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 0;
  attribute ram_slice_end of \i_main_ctrl/i_RAM/RAM_reg_bram_0\ : label is 6;
  attribute SOFT_HLUTNM of in_scrclr_i_1 : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \sregOut[7]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \sregOut[7]_i_5\ : label is "soft_lutpair14";
begin
\Addr_Clr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/do_scroll\,
      I1 => Addr_Clr(0),
      O => \Addr_Clr[0]_i_1_n_0\
    );
\Addr_Clr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/do_scroll\,
      I1 => Addr_Clr(1),
      I2 => Addr_Clr(0),
      O => \Addr_Clr[1]_i_1_n_0\
    );
\Addr_Clr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE1"
    )
        port map (
      I0 => Addr_Clr(1),
      I1 => Addr_Clr(0),
      I2 => Addr_Clr(2),
      I3 => \i_main_ctrl/i_RAM/do_scroll\,
      O => p_1_in(2)
    );
\Addr_Clr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444441"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/do_scroll\,
      I1 => Addr_Clr(3),
      I2 => Addr_Clr(1),
      I3 => Addr_Clr(0),
      I4 => Addr_Clr(2),
      O => \Addr_Clr[3]_i_1_n_0\
    );
\Addr_Clr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0001"
    )
        port map (
      I0 => Addr_Clr(3),
      I1 => Addr_Clr(1),
      I2 => Addr_Clr(0),
      I3 => Addr_Clr(2),
      I4 => Addr_Clr(4),
      I5 => \i_main_ctrl/i_RAM/do_scroll\,
      O => p_1_in(4)
    );
\Addr_Clr[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55C3"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I1 => \Addr_Clr[5]_i_2_n_0\,
      I2 => Addr_Clr(5),
      I3 => \i_main_ctrl/i_RAM/do_scroll\,
      O => p_1_in(5)
    );
\Addr_Clr[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => Addr_Clr(3),
      I1 => Addr_Clr(1),
      I2 => Addr_Clr(0),
      I3 => Addr_Clr(2),
      I4 => Addr_Clr(4),
      O => \Addr_Clr[5]_i_2_n_0\
    );
\Addr_Clr[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6666F00F"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_RB_reg\(6),
      I2 => \Addr_Clr[7]_i_3_n_0\,
      I3 => Addr_Clr(6),
      I4 => \i_main_ctrl/i_RAM/do_scroll\,
      O => p_1_in(6)
    );
\Addr_Clr[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/do_scroll\,
      I1 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \Addr_Clr[7]_i_1_n_0\
    );
\Addr_Clr[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFC03"
    )
        port map (
      I0 => \Addr_RB[7]_i_2_n_0\,
      I1 => Addr_Clr(6),
      I2 => \Addr_Clr[7]_i_3_n_0\,
      I3 => Addr_Clr(7),
      I4 => \i_main_ctrl/i_RAM/do_scroll\,
      O => p_1_in(7)
    );
\Addr_Clr[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Addr_Clr(4),
      I1 => Addr_Clr(2),
      I2 => Addr_Clr(0),
      I3 => Addr_Clr(1),
      I4 => Addr_Clr(3),
      I5 => Addr_Clr(5),
      O => \Addr_Clr[7]_i_3_n_0\
    );
\Addr_LT[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      O => plusOp(5)
    );
\Addr_LT[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_LT_reg\(6),
      O => plusOp(6)
    );
\Addr_LT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_LT_reg\(6),
      I2 => \i_main_ctrl/i_RAM/Addr_LT_reg\(7),
      O => plusOp(7)
    );
\Addr_RB[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      O => \Addr_RB[5]_i_1_n_0\
    );
\Addr_RB[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_RB_reg\(6),
      O => \Addr_RB[6]_i_1_n_0\
    );
\Addr_RB[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F44444F400000000"
    )
        port map (
      I0 => \Addr_RB[7]_i_3_n_0\,
      I1 => \i_main_ctrl/i_RAM/p_7_in\,
      I2 => \i_main_ctrl/i_RAM/p_3_in\,
      I3 => \i_main_ctrl/i_RAM/L\(5),
      I4 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I5 => \Addr_RB[7]_i_6_n_0\,
      O => \i_main_ctrl/i_RAM/do_scroll\
    );
\Addr_RB[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_RB_reg\(6),
      I2 => \i_main_ctrl/i_RAM/Addr_RB_reg\(7),
      O => \Addr_RB[7]_i_2_n_0\
    );
\Addr_RB[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFFFFFFFFFF"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I5 => \Addr_RB[7]_i_7_n_0\,
      O => \Addr_RB[7]_i_3_n_0\
    );
\Addr_RB[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => Home,
      I1 => NewLine,
      I2 => Goto00,
      I3 => ASCII_WE,
      O => \i_main_ctrl/i_RAM/p_7_in\
    );
\Addr_RB[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => NewLine,
      I1 => Goto00,
      O => \i_main_ctrl/i_RAM/p_3_in\
    );
\Addr_RB[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/L\(6),
      I1 => \i_main_ctrl/i_RAM/Addr_RB_reg\(6),
      I2 => \i_main_ctrl/i_RAM/L\(7),
      I3 => \i_main_ctrl/i_RAM/Addr_RB_reg\(7),
      O => \Addr_RB[7]_i_6_n_0\
    );
\Addr_RB[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      I1 => \i_main_ctrl/i_RAM/L\(5),
      O => \Addr_RB[7]_i_7_n_0\
    );
\Addr_Rd[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FDFF"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      O => Addr_Rd0_out(0)
    );
\Addr_Rd[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      O => Addr_Rd0_out(1)
    );
\Addr_Rd[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6666AA8A"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      O => Addr_Rd0_out(2)
    );
\Addr_Rd[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      O => Addr_Rd0_out(3)
    );
\Addr_Rd[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFD8000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      O => Addr_Rd0_out(4)
    );
\Addr_Rd[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      I1 => \i_main_ctrl/RAM_Goto00\,
      I2 => \Addr_Rd[5]_i_2_n_0\,
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(5),
      O => p_0_in(5)
    );
\Addr_Rd[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000020"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      O => \Addr_Rd[5]_i_2_n_0\
    );
\Addr_Rd[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(6),
      I1 => \i_main_ctrl/RAM_Goto00\,
      I2 => \Addr_Rd[7]_i_3_n_0\,
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(6),
      O => p_0_in(6)
    );
\Addr_Rd[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEAAAAA"
    )
        port map (
      I0 => \i_main_ctrl/RAM_Goto00\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I4 => \i_main_ctrl/cntCol\,
      O => \Addr_Rd[7]_i_1_n_0\
    );
\Addr_Rd[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BBBB888"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(7),
      I1 => \i_main_ctrl/RAM_Goto00\,
      I2 => \Addr_Rd[7]_i_3_n_0\,
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(6),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(7),
      O => p_0_in(7)
    );
\Addr_Rd[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000020000000000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      I4 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I5 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      O => \Addr_Rd[7]_i_3_n_0\
    );
\Addr_Wr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0041"
    )
        port map (
      I0 => NewLine,
      I1 => \Addr_Wr[4]_i_5_n_0\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I3 => Goto00,
      O => \Addr_Wr[0]_i_1_n_0\
    );
\Addr_Wr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004510"
    )
        port map (
      I0 => NewLine,
      I1 => \Addr_Wr[4]_i_5_n_0\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I4 => Goto00,
      O => \Addr_Wr[1]_i_1_n_0\
    );
\Addr_Wr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000551540"
    )
        port map (
      I0 => NewLine,
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I4 => \Addr_Wr[4]_i_5_n_0\,
      I5 => Goto00,
      O => \Addr_Wr[2]_i_1_n_0\
    );
\Addr_Wr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004114"
    )
        port map (
      I0 => NewLine,
      I1 => \Addr_Wr[4]_i_4_n_0\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I3 => \Addr_Wr[4]_i_5_n_0\,
      I4 => Goto00,
      O => \Addr_Wr[3]_i_1_n_0\
    );
\Addr_Wr[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => Home,
      I1 => NewLine,
      I2 => Goto00,
      O => \Addr_Wr[4]_i_1_n_0\
    );
\Addr_Wr[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFC"
    )
        port map (
      I0 => Home,
      I1 => NewLine,
      I2 => Goto00,
      I3 => ASCII_WE,
      O => \Addr_Wr[4]_i_2_n_0\
    );
\Addr_Wr[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001155440"
    )
        port map (
      I0 => NewLine,
      I1 => \Addr_Wr[4]_i_4_n_0\,
      I2 => \Addr_Wr[4]_i_5_n_0\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I5 => Goto00,
      O => \Addr_Wr[4]_i_3_n_0\
    );
\Addr_Wr[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C000C008"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      O => \Addr_Wr[4]_i_4_n_0\
    );
\Addr_Wr[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      O => \Addr_Wr[4]_i_5_n_0\
    );
\Addr_Wr[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888BBBB8"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      I1 => Goto00,
      I2 => NewLine,
      I3 => \Addr_Wr[5]_i_2_n_0\,
      I4 => \i_main_ctrl/i_RAM/L\(5),
      O => \Addr_Wr[5]_i_1_n_0\
    );
\Addr_Wr[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"81000000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      O => \Addr_Wr[5]_i_2_n_0\
    );
\Addr_Wr[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B888BBBB8BBB888"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(6),
      I1 => Goto00,
      I2 => \i_main_ctrl/i_RAM/L\(5),
      I3 => NewLine,
      I4 => \Addr_Wr[6]_i_2_n_0\,
      I5 => \i_main_ctrl/i_RAM/L\(6),
      O => \Addr_Wr[6]_i_1_n_0\
    );
\Addr_Wr[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000080"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/L\(5),
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I5 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      O => \Addr_Wr[6]_i_2_n_0\
    );
\Addr_Wr[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCFE"
    )
        port map (
      I0 => ASCII_WE,
      I1 => Goto00,
      I2 => NewLine,
      I3 => Home,
      O => \Addr_Wr[7]_i_1_n_0\
    );
\Addr_Wr[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_LT_reg\(7),
      I1 => Goto00,
      I2 => \Addr_Wr[7]_i_3_n_0\,
      O => \Addr_Wr[7]_i_2_n_0\
    );
\Addr_Wr[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04F7FFFFFB080000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/L\(5),
      I1 => NewLine,
      I2 => Goto00,
      I3 => \Addr_Wr[6]_i_2_n_0\,
      I4 => \i_main_ctrl/i_RAM/L\(6),
      I5 => \i_main_ctrl/i_RAM/L\(7),
      O => \Addr_Wr[7]_i_3_n_0\
    );
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_IIC_master/p_0_in\,
      I1 => I2C_FIFO_Empty,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[12]\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[20]\,
      O => \FSM_onehot_state[10]_i_1_n_0\
    );
\FSM_onehot_state[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_main_ctrl/cntCol\,
      I1 => \i_main_ctrl/next_state15_out\,
      O => \FSM_onehot_state[13]_i_1_n_0\
    );
\FSM_onehot_state[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => \FSM_onehot_state[13]_i_3_n_0\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[6]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[7]\,
      I4 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      I5 => \i_main_ctrl/next_state2\,
      O => \i_main_ctrl/next_state15_out\
    );
\FSM_onehot_state[13]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[5]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      O => \FSM_onehot_state[13]_i_3_n_0\
    );
\FSM_onehot_state[13]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      O => \i_main_ctrl/next_state2\
    );
\FSM_onehot_state[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[14]\,
      I1 => NACK,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[9]\,
      O => \FSM_onehot_state[15]_i_1_n_0\
    );
\FSM_onehot_state[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[21]\,
      I1 => NACK,
      O => \FSM_onehot_state[17]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      I1 => \i_IIC_master/FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[0]\,
      I1 => NACK,
      O => \FSM_onehot_state[1]_i_1__0_n_0\
    );
\FSM_onehot_state[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => \FSM_onehot_state[22]_i_3_n_0\,
      I1 => \FSM_onehot_state[22]_i_4_n_0\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[0]\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[1]\,
      I4 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[22]\,
      I5 => \FSM_onehot_state[22]_i_5_n_0\,
      O => \FSM_onehot_state[22]_i_1_n_0\
    );
\FSM_onehot_state[22]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[7]\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[17]\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[5]\,
      I3 => \i_main_ctrl/cntCol\,
      O => \FSM_onehot_state[22]_i_10_n_0\
    );
\FSM_onehot_state[22]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E0A"
    )
        port map (
      I0 => \i_main_ctrl/p_5_in\,
      I1 => \i_main_ctrl/next_state1__7\,
      I2 => I2C_FIFO_Full,
      I3 => \i_main_ctrl/p_1_in\,
      O => \FSM_onehot_state[22]_i_11_n_0\
    );
\FSM_onehot_state[22]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => I2C_FIFO_Full,
      I2 => \i_main_ctrl/cnt20b_reg\(9),
      I3 => \i_main_ctrl/cnt20b_reg\(8),
      I4 => \FSM_onehot_state[22]_i_14_n_0\,
      I5 => \FSM_onehot_state[22]_i_15_n_0\,
      O => \FSM_onehot_state[22]_i_12_n_0\
    );
\FSM_onehot_state[22]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[20]\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[7]\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[22]_i_13_n_0\
    );
\FSM_onehot_state[22]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \i_main_ctrl/cnt20b_reg\(2),
      I1 => \i_main_ctrl/cnt20b_reg\(3),
      I2 => \i_main_ctrl/cnt20b_reg\(0),
      I3 => \i_main_ctrl/cnt20b_reg\(1),
      O => \FSM_onehot_state[22]_i_14_n_0\
    );
\FSM_onehot_state[22]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \i_main_ctrl/cnt20b_reg\(6),
      I1 => \i_main_ctrl/cnt20b_reg\(7),
      I2 => \i_main_ctrl/cnt20b_reg\(4),
      I3 => \i_main_ctrl/cnt20b_reg\(5),
      O => \FSM_onehot_state[22]_i_15_n_0\
    );
\FSM_onehot_state[22]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[9]\,
      I1 => NACK,
      O => \FSM_onehot_state[22]_i_2_n_0\
    );
\FSM_onehot_state[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_state[22]_i_6_n_0\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[1]\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      I3 => \i_IIC_master/cntSCL\,
      I4 => \i_main_ctrl/RAM_Goto00\,
      I5 => \FSM_onehot_state[22]_i_7_n_0\,
      O => \FSM_onehot_state[22]_i_3_n_0\
    );
\FSM_onehot_state[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_state[22]_i_8_n_0\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[14]\,
      I2 => \i_main_ctrl/p_0_in2_in\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[12]\,
      I4 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[13]\,
      I5 => \FSM_onehot_state[22]_i_9_n_0\,
      O => \FSM_onehot_state[22]_i_4_n_0\
    );
\FSM_onehot_state[22]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[21]\,
      I1 => \i_main_ctrl/RAM_Goto00\,
      I2 => \i_main_ctrl/cnt20b\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[17]\,
      O => \FSM_onehot_state[22]_i_5_n_0\
    );
\FSM_onehot_state[22]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \i_main_ctrl/cnt20b\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[22]\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      I3 => \i_main_ctrl/p_0_in2_in\,
      O => \FSM_onehot_state[22]_i_6_n_0\
    );
\FSM_onehot_state[22]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEEFEEEEE"
    )
        port map (
      I0 => \FSM_onehot_state[22]_i_10_n_0\,
      I1 => \FSM_onehot_state[22]_i_11_n_0\,
      I2 => \i_main_ctrl/next_state11_in\,
      I3 => I2C_FIFO_Full,
      I4 => \i_main_ctrl/p_3_in\,
      I5 => \FSM_onehot_state[22]_i_12_n_0\,
      O => \FSM_onehot_state[22]_i_7_n_0\
    );
\FSM_onehot_state[22]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[11]\,
      I2 => \i_main_ctrl/cntCol\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[9]\,
      O => \FSM_onehot_state[22]_i_8_n_0\
    );
\FSM_onehot_state[22]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFFFEFEFEFEFE"
    )
        port map (
      I0 => \FSM_onehot_state[22]_i_13_n_0\,
      I1 => \FSM_onehot_state[22]_i_11_n_0\,
      I2 => \FSM_onehot_state[22]_i_12_n_0\,
      I3 => \i_main_ctrl/next_state11_in\,
      I4 => I2C_FIFO_Full,
      I5 => \i_main_ctrl/p_3_in\,
      O => \FSM_onehot_state[22]_i_9_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[13]\,
      I1 => NACK,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_IIC_master/cntBits\,
      I1 => I2C_FIFO_Empty,
      I2 => \i_IIC_master/p_0_in\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[11]\,
      I1 => NACK,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[21]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFEFEFC"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => \i_IIC_master/FSM_onehot_state_reg_n_0_[5]\,
      I2 => \FSM_onehot_state[5]_i_2_n_0\,
      I3 => \i_IIC_master/cntBits\,
      I4 => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => \FSM_onehot_state[5]_i_3_n_0\,
      I2 => \i_IIC_master/p_0_in\,
      I3 => \i_IIC_master/RdNotWr0\,
      O => \FSM_onehot_state[5]_i_2_n_0\
    );
\FSM_onehot_state[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      O => \FSM_onehot_state[5]_i_3_n_0\
    );
\FSM_onehot_state[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_main_ctrl/RAM_Goto00\,
      I1 => \i_main_ctrl/next_state15_out\,
      I2 => \i_main_ctrl/cntCol\,
      O => \FSM_onehot_state[7]_i_1_n_0\
    );
\Mask[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC9FCFFFFFDFCFF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[0]_i_10_n_0\
    );
\Mask[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000404000A008"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(4),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[0]_i_12_n_0\
    );
\Mask[0]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C400090000C01040"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(6),
      O => \Mask[0]_i_13_n_0\
    );
\Mask[0]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEEE7EFFF77D757"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[0]_i_14_n_0\
    );
\Mask[0]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"67DF5FEFEFEFEFEF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(4),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[0]_i_15_n_0\
    );
\Mask[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8FFFFBBB80000"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[0]_i_4_n_0\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \Mask[0]_i_5_n_0\,
      I3 => \Mask_reg[0]_i_6_n_0\,
      I4 => \Mask[7]_i_5_n_0\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[0]_i_7_n_0\,
      O => \Mask[0]_i_2_n_0\
    );
\Mask[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B800B8FFB8FFB8FF"
    )
        port map (
      I0 => \Mask[0]_i_8_n_0\,
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \Mask[0]_i_9_n_0\,
      I3 => \Mask[7]_i_5_n_0\,
      I4 => \Mask[0]_i_10_n_0\,
      I5 => \Mask_reg[0]_i_11_n_0\,
      O => \Mask[0]_i_3_n_0\
    );
\Mask[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2402060400004644"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[0]_i_5_n_0\
    );
\Mask[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"800A000800000400"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[0]_i_8_n_0\
    );
\Mask[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02208AA828AA0000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(0),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[0]_i_9_n_0\
    );
\Mask[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/fontROM[0][5]__183\(1),
      I1 => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(1),
      I2 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I3 => \Mask_reg[1]_i_4_n_0\,
      I4 => \Mask[7]_i_5_n_0\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[1]_i_5_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(1)
    );
\Mask[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200040000800A00"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[1]_i_12_n_0\
    );
\Mask[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8052600002050000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[1]_i_13_n_0\
    );
\Mask[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0600446446046644"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[1]_i_6_n_0\
    );
\Mask[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2044C4801054800"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(0),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[1]_i_7_n_0\
    );
\Mask[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000440004460400"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[1]_i_8_n_0\
    );
\Mask[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80000A2000208020"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[1]_i_9_n_0\
    );
\Mask[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800008800080"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[2]_i_11_n_0\
    );
\Mask[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CA22508974117E88"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(4),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[2]_i_12_n_0\
    );
\Mask[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8109A022002128A"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[2]_i_13_n_0\
    );
\Mask[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C408A80822088808"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[2]_i_14_n_0\
    );
\Mask[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00B6004580000040"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(6),
      O => \Mask[2]_i_15_n_0\
    );
\Mask[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"804CEC9440000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[2]_i_16_n_0\
    );
\Mask[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFACAFFFA0ACA000"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[2]_i_4_n_0\,
      I1 => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(2),
      I2 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I4 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[2]_i_6_n_0\,
      O => \Mask[2]_i_2_n_0\
    );
\Mask[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEFEFE0"
    )
        port map (
      I0 => \Mask[2]_i_7_n_0\,
      I1 => \Mask_reg[2]_i_8_n_0\,
      I2 => \Mask[7]_i_5_n_0\,
      I3 => \Mask[2]_i_9_n_0\,
      I4 => \Mask_reg[2]_i_10_n_0\,
      O => \Mask[2]_i_3_n_0\
    );
\Mask[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004000000000A404"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[2]_i_7_n_0\
    );
\Mask[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20000A0200080A00"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[2]_i_9_n_0\
    );
\Mask[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/fontROM[0][5]__183\(3),
      I1 => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(3),
      I2 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I3 => \Mask[3]_i_4_n_0\,
      I4 => \Mask[7]_i_5_n_0\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[3]_i_5_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(3)
    );
\Mask[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000122002080000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[3]_i_10_n_0\
    );
\Mask[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00003050C08C0C08"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[3]_i_11_n_0\
    );
\Mask[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000910080C30C00"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[3]_i_12_n_0\
    );
\Mask[3]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(0),
      I4 => \i_main_ctrl/ASCII\(1),
      O => \Mask[3]_i_14_n_0\
    );
\Mask[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200028200A0A800"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[3]_i_15_n_0\
    );
\Mask[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"89140A0D41440966"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[3]_i_16_n_0\
    );
\Mask[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \Mask[3]_i_6_n_0\,
      I1 => \Mask[3]_i_7_n_0\,
      I2 => \Mask[3]_i_8_n_0\,
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \Mask[3]_i_9_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][5]__183\(3)
    );
\Mask[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => \Mask[3]_i_10_n_0\,
      I1 => \Mask[3]_i_11_n_0\,
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \Mask[3]_i_12_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(3)
    );
\Mask[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[3]_i_13_n_0\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \Mask[3]_i_14_n_0\,
      I3 => \Mask[3]_i_15_n_0\,
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \Mask[3]_i_16_n_0\,
      O => \Mask[3]_i_4_n_0\
    );
\Mask[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[3]_i_6_n_0\
    );
\Mask[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(6),
      O => \Mask[3]_i_7_n_0\
    );
\Mask[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0AA8088200000288"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[3]_i_8_n_0\
    );
\Mask[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"908A0A200A004540"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[3]_i_9_n_0\
    );
\Mask[4]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"644040A080205080"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(6),
      O => \Mask[4]_i_11_n_0\
    );
\Mask[4]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8044008423888004"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[4]_i_12_n_0\
    );
\Mask[4]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"09A0400000204810"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[4]_i_13_n_0\
    );
\Mask[4]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8510400008500008"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[4]_i_14_n_0\
    );
\Mask[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFACAFFFA0ACA000"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[4]_i_4_n_0\,
      I1 => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(4),
      I2 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I4 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[4]_i_6_n_0\,
      O => \Mask[4]_i_2_n_0\
    );
\Mask[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAEFFFFFEAE0000"
    )
        port map (
      I0 => \Mask[4]_i_7_n_0\,
      I1 => \Mask[4]_i_8_n_0\,
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \Mask[4]_i_9_n_0\,
      I4 => \Mask[7]_i_5_n_0\,
      I5 => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(4),
      O => \Mask[4]_i_3_n_0\
    );
\Mask[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088100010000004"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[4]_i_7_n_0\
    );
\Mask[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0415166400001060"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(2),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[4]_i_8_n_0\
    );
\Mask[4]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA2A6A280508CA08"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[4]_i_9_n_0\
    );
\Mask[5]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(5),
      O => \Mask[5]_i_10_n_0\
    );
\Mask[5]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000808480"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(0),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[5]_i_12_n_0\
    );
\Mask[5]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9422109000A02040"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[5]_i_13_n_0\
    );
\Mask[5]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2995200204802080"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(5),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[5]_i_14_n_0\
    );
\Mask[5]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8040420A00004000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(2),
      I5 => \i_main_ctrl/ASCII\(6),
      O => \Mask[5]_i_15_n_0\
    );
\Mask[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFACAFFFA0ACA000"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[5]_i_4_n_0\,
      I1 => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(5),
      I2 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I4 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[5]_i_6_n_0\,
      O => \Mask[5]_i_2_n_0\
    );
\Mask[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB8FFB8FFB800"
    )
        port map (
      I0 => \Mask[5]_i_7_n_0\,
      I1 => \Mask[5]_i_8_n_0\,
      I2 => \Mask[5]_i_9_n_0\,
      I3 => \Mask[7]_i_5_n_0\,
      I4 => \Mask[5]_i_10_n_0\,
      I5 => \Mask_reg[5]_i_11_n_0\,
      O => \Mask[5]_i_3_n_0\
    );
\Mask[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F73366B14411384C"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(4),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(0),
      O => \Mask[5]_i_7_n_0\
    );
\Mask[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAEAAA"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(2),
      O => \Mask[5]_i_8_n_0\
    );
\Mask[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040004040408840"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[5]_i_9_n_0\
    );
\Mask[6]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(1),
      I3 => \i_main_ctrl/ASCII\(5),
      I4 => \i_main_ctrl/ASCII\(2),
      O => \Mask[6]_i_10_n_0\
    );
\Mask[6]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C8034A000809180"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(6),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[6]_i_12_n_0\
    );
\Mask[6]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F819B5C8C8C8C40"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \i_main_ctrl/ASCII\(3),
      I3 => \i_main_ctrl/ASCII\(4),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \Mask[6]_i_13_n_0\
    );
\Mask[6]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002020202220A0A8"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(3),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(0),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[6]_i_14_n_0\
    );
\Mask[6]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE0E4330DF0372A1"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(0),
      I4 => \i_main_ctrl/ASCII\(1),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[6]_i_15_n_0\
    );
\Mask[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8FFFFBBB80000"
    )
        port map (
      I0 => \i_main_ctrl/i_ROM/Mask_reg[6]_i_4_n_0\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \Mask[6]_i_5_n_0\,
      I3 => \Mask_reg[6]_i_6_n_0\,
      I4 => \Mask[7]_i_5_n_0\,
      I5 => \i_main_ctrl/i_ROM/Mask_reg[6]_i_7_n_0\,
      O => \Mask[6]_i_2_n_0\
    );
\Mask[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB8FFB8FFB800"
    )
        port map (
      I0 => \Mask[6]_i_8_n_0\,
      I1 => \i_main_ctrl/ASCII\(6),
      I2 => \Mask[6]_i_9_n_0\,
      I3 => \Mask[7]_i_5_n_0\,
      I4 => \Mask[6]_i_10_n_0\,
      I5 => \Mask_reg[6]_i_11_n_0\,
      O => \Mask[6]_i_3_n_0\
    );
\Mask[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"10000040050A4040"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(2),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \i_main_ctrl/ASCII\(3),
      O => \Mask[6]_i_5_n_0\
    );
\Mask[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8873404667199444"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(1),
      I1 => \i_main_ctrl/ASCII\(0),
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(4),
      O => \Mask[6]_i_8_n_0\
    );
\Mask[6]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004040000004000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(4),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(0),
      I5 => \i_main_ctrl/ASCII\(2),
      O => \Mask[6]_i_9_n_0\
    );
\Mask[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      O => \Mask[7]_i_1_n_0\
    );
\Mask[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => \Mask[7]_i_3_n_0\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I2 => \Mask[7]_i_4_n_0\,
      I3 => \Mask[7]_i_5_n_0\,
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => g1_b7_n_0,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(7)
    );
\Mask[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000300000300044"
    )
        port map (
      I0 => \Mask[7]_i_6_n_0\,
      I1 => \Mask[7]_i_5_n_0\,
      I2 => \Mask[7]_i_7_n_0\,
      I3 => \i_main_ctrl/ASCII\(2),
      I4 => \i_main_ctrl/ASCII\(3),
      I5 => \i_main_ctrl/ASCII\(1),
      O => \Mask[7]_i_3_n_0\
    );
\Mask[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888000088880000"
    )
        port map (
      I0 => \g1_b7__0_n_0\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \i_main_ctrl/ASCII\(5),
      I3 => \Mask[7]_i_8_n_0\,
      I4 => \i_main_ctrl/ASCII\(6),
      I5 => \Mask[7]_i_9_n_0\,
      O => \Mask[7]_i_4_n_0\
    );
\Mask[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      O => \Mask[7]_i_5_n_0\
    );
\Mask[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(5),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(6),
      I3 => \i_main_ctrl/ASCII\(0),
      O => \Mask[7]_i_6_n_0\
    );
\Mask[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000080"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(6),
      I1 => \i_main_ctrl/ASCII\(5),
      I2 => \i_main_ctrl/ASCII\(0),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      O => \Mask[7]_i_7_n_0\
    );
\Mask[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(3),
      I1 => \i_main_ctrl/ASCII\(4),
      O => \Mask[7]_i_8_n_0\
    );
\Mask[7]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0108A008"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(4),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(1),
      I4 => \i_main_ctrl/ASCII\(3),
      O => \Mask[7]_i_9_n_0\
    );
\Mask_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[0]_i_2_n_0\,
      I1 => \Mask[0]_i_3_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(0),
      S => \i_main_ctrl/cntCol_reg_n_0_[2]\
    );
\Mask_reg[0]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[0]_i_14_n_0\,
      I1 => \Mask[0]_i_15_n_0\,
      O => \Mask_reg[0]_i_11_n_0\,
      S => \i_main_ctrl/ASCII\(0)
    );
\Mask_reg[0]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[0]_i_12_n_0\,
      I1 => \Mask[0]_i_13_n_0\,
      O => \Mask_reg[0]_i_6_n_0\,
      S => \i_main_ctrl/ASCII\(0)
    );
\Mask_reg[1]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[1]_i_12_n_0\,
      I1 => \Mask[1]_i_13_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(1),
      S => \i_main_ctrl/ASCII\(1)
    );
\Mask_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[1]_i_6_n_0\,
      I1 => \Mask[1]_i_7_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][5]__183\(1),
      S => \i_main_ctrl/ASCII\(2)
    );
\Mask_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[1]_i_8_n_0\,
      I1 => \Mask[1]_i_9_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(1),
      S => \i_main_ctrl/ASCII\(3)
    );
\Mask_reg[1]_i_4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(1),
      I1 => \i_main_ctrl/i_ROM/Mask_reg[1]_i_11_n_0\,
      O => \Mask_reg[1]_i_4_n_0\,
      S => \i_main_ctrl/cntCol_reg_n_0_[0]\
    );
\Mask_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[2]_i_2_n_0\,
      I1 => \Mask[2]_i_3_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(2),
      S => \i_main_ctrl/cntCol_reg_n_0_[2]\
    );
\Mask_reg[2]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[2]_i_15_n_0\,
      I1 => \Mask[2]_i_16_n_0\,
      O => \Mask_reg[2]_i_10_n_0\,
      S => \i_main_ctrl/ASCII\(0)
    );
\Mask_reg[2]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[2]_i_11_n_0\,
      I1 => \Mask[2]_i_12_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(2),
      S => \i_main_ctrl/ASCII\(5)
    );
\Mask_reg[2]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[2]_i_13_n_0\,
      I1 => \Mask[2]_i_14_n_0\,
      O => \Mask_reg[2]_i_8_n_0\,
      S => \i_main_ctrl/ASCII\(0)
    );
\Mask_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[4]_i_2_n_0\,
      I1 => \Mask[4]_i_3_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(4),
      S => \i_main_ctrl/cntCol_reg_n_0_[2]\
    );
\Mask_reg[4]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[4]_i_13_n_0\,
      I1 => \Mask[4]_i_14_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][4]__210\(4),
      S => \i_main_ctrl/ASCII\(1)
    );
\Mask_reg[4]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[4]_i_11_n_0\,
      I1 => \Mask[4]_i_12_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(4),
      S => \i_main_ctrl/ASCII\(3)
    );
\Mask_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[5]_i_2_n_0\,
      I1 => \Mask[5]_i_3_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(5),
      S => \i_main_ctrl/cntCol_reg_n_0_[2]\
    );
\Mask_reg[5]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[5]_i_14_n_0\,
      I1 => \Mask[5]_i_15_n_0\,
      O => \Mask_reg[5]_i_11_n_0\,
      S => \i_main_ctrl/ASCII\(3)
    );
\Mask_reg[5]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[5]_i_12_n_0\,
      I1 => \Mask[5]_i_13_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][2]__207\(5),
      S => \i_main_ctrl/ASCII\(1)
    );
\Mask_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[6]_i_2_n_0\,
      I1 => \Mask[6]_i_3_n_0\,
      O => \i_main_ctrl/i_ROM/fontROM[0][0]\(6),
      S => \i_main_ctrl/cntCol_reg_n_0_[2]\
    );
\Mask_reg[6]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[6]_i_14_n_0\,
      I1 => \Mask[6]_i_15_n_0\,
      O => \Mask_reg[6]_i_11_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\Mask_reg[6]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Mask[6]_i_12_n_0\,
      I1 => \Mask[6]_i_13_n_0\,
      O => \Mask_reg[6]_i_6_n_0\,
      S => \i_main_ctrl/ASCII\(0)
    );
NACK_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAEAAAAA"
    )
        port map (
      I0 => NACK,
      I1 => \i_IIC_master/p_2_in\,
      I2 => NACK_i_2_n_0,
      I3 => NACK_i_3_n_0,
      I4 => \i_IIC_master/rSDAin\,
      I5 => \i_IIC_master/FSM_onehot_state_reg_n_0_[5]\,
      O => NACK_i_1_n_0
    );
NACK_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => L(13),
      I1 => L(12),
      I2 => L(14),
      I3 => L(8),
      I4 => L(9),
      I5 => NACK_i_4_n_0,
      O => NACK_i_2_n_0
    );
NACK_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFBFFF"
    )
        port map (
      I0 => \cntSCL[4]_i_2_n_0\,
      I1 => NACK_i_5_n_0,
      I2 => L(5),
      I3 => L(7),
      I4 => L(2),
      I5 => L(6),
      O => NACK_i_3_n_0
    );
NACK_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => L(10),
      I1 => L(11),
      O => NACK_i_4_n_0
    );
NACK_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => L(3),
      I1 => L(4),
      O => NACK_i_5_n_0
    );
RAM_reg_0_15_0_7_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \i_main_ctrl/p_3_in\,
      I1 => \i_main_ctrl/p_1_in\,
      I2 => \i_main_ctrl/I2C_FIFO_DI1__1\,
      I3 => \i_main_ctrl/p_5_in\,
      I4 => \i_main_ctrl/p_1_in3_in\,
      I5 => I2C_FIFO_Full,
      O => RAM_reg_0_15_0_7_i_1_n_0
    );
RAM_reg_0_15_0_7_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_main_ctrl/RAM_Goto00\,
      I1 => \i_main_ctrl/p_0_in2_in\,
      O => \i_main_ctrl/I2C_FIFO_DI1__1\
    );
RAM_reg_0_15_0_7_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005040"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(1),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_11_n_0
    );
RAM_reg_0_15_0_7_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(1),
      I1 => \i_main_ctrl/addrROM_reg\(0),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      O => RAM_reg_0_15_0_7_i_12_n_0
    );
RAM_reg_0_15_0_7_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005040"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(0),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_13_n_0
    );
RAM_reg_0_15_0_7_i_14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"34"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(2),
      I1 => \i_main_ctrl/addrROM_reg\(0),
      I2 => \i_main_ctrl/addrROM_reg\(1),
      O => RAM_reg_0_15_0_7_i_14_n_0
    );
RAM_reg_0_15_0_7_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005040"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(3),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_15_n_0
    );
RAM_reg_0_15_0_7_i_16: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(2),
      I1 => \i_main_ctrl/addrROM_reg\(0),
      I2 => \i_main_ctrl/addrROM_reg\(1),
      O => RAM_reg_0_15_0_7_i_16_n_0
    );
RAM_reg_0_15_0_7_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005040"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(2),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_17_n_0
    );
RAM_reg_0_15_0_7_i_18: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(1),
      I1 => \i_main_ctrl/addrROM_reg\(2),
      I2 => \i_main_ctrl/addrROM_reg\(0),
      O => RAM_reg_0_15_0_7_i_18_n_0
    );
RAM_reg_0_15_0_7_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000540"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(5),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_19_n_0
    );
RAM_reg_0_15_0_7_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b1_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_11_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_12_n_0,
      O => RAM_reg_0_15_0_7_i_2_n_0
    );
RAM_reg_0_15_0_7_i_20: unisim.vcomponents.LUT3
    generic map(
      INIT => X"26"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(2),
      I2 => \i_main_ctrl/addrROM_reg\(1),
      O => RAM_reg_0_15_0_7_i_20_n_0
    );
RAM_reg_0_15_0_7_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005040"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(4),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_21_n_0
    );
RAM_reg_0_15_0_7_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000540"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(7),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_22_n_0
    );
RAM_reg_0_15_0_7_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0540"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => \i_main_ctrl/p_5_in\,
      I2 => Mask(6),
      I3 => RAM_reg_0_15_0_7_i_24_n_0,
      I4 => \i_main_ctrl/p_0_in2_in\,
      I5 => \i_main_ctrl/RAM_Goto00\,
      O => RAM_reg_0_15_0_7_i_23_n_0
    );
RAM_reg_0_15_0_7_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \i_main_ctrl/p_5_in\,
      I1 => RAM_reg_0_15_0_7_i_25_n_0,
      I2 => RAM_reg_0_15_0_7_i_26_n_0,
      I3 => RAM_reg_0_15_0_7_i_27_n_0,
      I4 => \i_main_ctrl/cntBlink_reg\(4),
      O => RAM_reg_0_15_0_7_i_24_n_0
    );
RAM_reg_0_15_0_7_i_25: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(6),
      I1 => \i_main_ctrl/i_RAM/L\(6),
      I2 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(7),
      I3 => \i_main_ctrl/i_RAM/L\(7),
      O => RAM_reg_0_15_0_7_i_25_n_0
    );
RAM_reg_0_15_0_7_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I2 => \i_main_ctrl/i_RAM/L\(5),
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(5),
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I5 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      O => RAM_reg_0_15_0_7_i_26_n_0
    );
RAM_reg_0_15_0_7_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I3 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I5 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      O => RAM_reg_0_15_0_7_i_27_n_0
    );
RAM_reg_0_15_0_7_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b0_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_13_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_14_n_0,
      O => RAM_reg_0_15_0_7_i_3_n_0
    );
RAM_reg_0_15_0_7_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b3_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_15_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_16_n_0,
      O => RAM_reg_0_15_0_7_i_4_n_0
    );
RAM_reg_0_15_0_7_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b2_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_17_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_18_n_0,
      O => RAM_reg_0_15_0_7_i_5_n_0
    );
RAM_reg_0_15_0_7_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b5_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_19_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_20_n_0,
      O => RAM_reg_0_15_0_7_i_6_n_0
    );
RAM_reg_0_15_0_7_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b4_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_21_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_16_n_0,
      O => RAM_reg_0_15_0_7_i_7_n_0
    );
RAM_reg_0_15_0_7_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => g0_b7_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_22_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      O => RAM_reg_0_15_0_7_i_8_n_0
    );
RAM_reg_0_15_0_7_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFB888B8"
    )
        port map (
      I0 => g0_b6_n_0,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => RAM_reg_0_15_0_7_i_23_n_0,
      I3 => \i_main_ctrl/p_1_in\,
      I4 => RAM_reg_0_15_0_7_i_16_n_0,
      O => RAM_reg_0_15_0_7_i_9_n_0
    );
RAM_reg_bram_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => Goto00,
      I1 => NewLine,
      I2 => Home,
      O => RAM_reg_bram_0_i_1_n_0
    );
RAM_reg_bram_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAAAAAAA"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/in_scrclr\,
      I1 => Home,
      I2 => NewLine,
      I3 => Goto00,
      I4 => ASCII_WE,
      I5 => \i_main_ctrl/i_RAM/in_scrclr0\,
      O => RAM_reg_bram_0_i_10_n_0
    );
RAM_reg_bram_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000000000"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/L\(7),
      I1 => Addr_Clr(7),
      I2 => \i_main_ctrl/i_RAM/L\(6),
      I3 => Addr_Clr(6),
      I4 => RAM_reg_bram_0_i_12_n_0,
      I5 => RAM_reg_bram_0_i_13_n_0,
      O => \i_main_ctrl/i_RAM/in_scrclr0\
    );
RAM_reg_bram_0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => Addr_Clr(3),
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      I2 => \i_main_ctrl/i_RAM/L\(5),
      I3 => Addr_Clr(5),
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      I5 => Addr_Clr(4),
      O => RAM_reg_bram_0_i_12_n_0
    );
RAM_reg_bram_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => Addr_Clr(0),
      I1 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      I2 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      I3 => Addr_Clr(2),
      I4 => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      I5 => Addr_Clr(1),
      O => RAM_reg_bram_0_i_13_n_0
    );
RAM_reg_bram_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(7),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(7),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(7)
    );
RAM_reg_bram_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(6),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(6),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(6)
    );
RAM_reg_bram_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(5),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(5),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(5)
    );
RAM_reg_bram_0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(4),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(4)
    );
RAM_reg_bram_0_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(3),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(3)
    );
RAM_reg_bram_0_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(2),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(2)
    );
RAM_reg_bram_0_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(1),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(1)
    );
RAM_reg_bram_0_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Addr_Clr(0),
      I1 => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      I2 => \i_main_ctrl/i_RAM/in_scrclr\,
      O => \i_main_ctrl/i_RAM/Addr_PtB\(0)
    );
SCLout_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F3FFF3F1F0FEC000"
    )
        port map (
      I0 => SCLout_i_2_n_0,
      I1 => SCLout_i_3_n_0,
      I2 => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits\,
      I4 => SCLout_i_4_n_0,
      I5 => \i_IIC_master/SCLout_reg_n_0\,
      O => SCLout_i_1_n_0
    );
SCLout_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \cntSCL[4]_i_4_n_0\,
      I1 => SCLout_i_5_n_0,
      I2 => L(8),
      I3 => L(7),
      I4 => L(0),
      I5 => L(6),
      O => SCLout_i_2_n_0
    );
SCLout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => SCLout_i_6_n_0,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => SCLout_i_3_n_0
    );
SCLout_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => SCLout_i_7_n_0,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => SCLout_i_4_n_0
    );
SCLout_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => L(3),
      I1 => L(5),
      I2 => L(1),
      I3 => L(2),
      O => SCLout_i_5_n_0
    );
SCLout_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => L(8),
      I1 => L(7),
      I2 => SCLout_i_8_n_0,
      I3 => L(6),
      I4 => \cntBits[3]_i_5_n_0\,
      O => SCLout_i_6_n_0
    );
SCLout_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => L(7),
      I1 => L(8),
      I2 => SCLout_i_9_n_0,
      I3 => L(6),
      I4 => \cntBits[3]_i_5_n_0\,
      O => SCLout_i_7_n_0
    );
SCLout_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => L(0),
      I1 => L(1),
      I2 => L(2),
      I3 => L(3),
      I4 => L(5),
      I5 => L(4),
      O => SCLout_i_8_n_0
    );
SCLout_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => L(0),
      I1 => L(1),
      I2 => L(2),
      I3 => L(3),
      I4 => L(5),
      I5 => L(4),
      O => SCLout_i_9_n_0
    );
SDAout_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002A2A2A"
    )
        port map (
      I0 => SDAout_i_2_n_0,
      I1 => \i_IIC_master/cntBits\,
      I2 => SDAout_i_3_n_0,
      I3 => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      I4 => \sregOut[7]_i_6_n_0\,
      O => SDAout_i_1_n_0
    );
SDAout_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => L(4),
      I1 => L(5),
      O => SDAout_i_10_n_0
    );
SDAout_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => L(3),
      I1 => L(1),
      I2 => L(0),
      I3 => L(2),
      I4 => L(5),
      I5 => L(4),
      O => SDAout_i_11_n_0
    );
SDAout_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => L(3),
      I1 => L(0),
      I2 => L(1),
      I3 => L(2),
      I4 => L(4),
      I5 => L(5),
      O => SDAout_i_12_n_0
    );
SDAout_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFAFFC0C0CAC0"
    )
        port map (
      I0 => SDAout_i_4_n_0,
      I1 => SDAout_i_5_n_0,
      I2 => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      I3 => \i_IIC_master/SDAout1__0\,
      I4 => \i_IIC_master/cntBits\,
      I5 => \i_IIC_master/T\,
      O => SDAout_i_2_n_0
    );
SDAout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => SDAout_i_7_n_0,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => SDAout_i_3_n_0
    );
SDAout_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAABAAAA"
    )
        port map (
      I0 => sregOut(7),
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      O => SDAout_i_4_n_0
    );
SDAout_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => SDAout_i_8_n_0,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => SDAout_i_5_n_0
    );
SDAout_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => SDAout_i_9_n_0,
      I1 => SDAout_i_10_n_0,
      I2 => L(6),
      I3 => L(7),
      I4 => NACK_i_2_n_0,
      I5 => \i_IIC_master/p_0_in\,
      O => \i_IIC_master/SDAout1__0\
    );
SDAout_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => L(7),
      I1 => L(8),
      I2 => L(6),
      I3 => SDAout_i_11_n_0,
      I4 => \cntBits[3]_i_5_n_0\,
      O => SDAout_i_7_n_0
    );
SDAout_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => L(8),
      I1 => L(7),
      I2 => SDAout_i_12_n_0,
      I3 => L(6),
      I4 => \cntBits[3]_i_5_n_0\,
      O => SDAout_i_8_n_0
    );
SDAout_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => L(3),
      I1 => L(2),
      I2 => L(1),
      I3 => L(0),
      O => SDAout_i_9_n_0
    );
\addrROM[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      O => \plusOp__0\(0)
    );
\addrROM[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      O => \plusOp__0\(1)
    );
\addrROM[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      O => \addrROM[2]_i_1_n_0\
    );
\addrROM[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(1),
      I1 => \i_main_ctrl/addrROM_reg\(0),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      O => \plusOp__0\(3)
    );
\addrROM[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(2),
      I1 => \i_main_ctrl/addrROM_reg\(0),
      I2 => \i_main_ctrl/addrROM_reg\(1),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => \plusOp__0\(4)
    );
\addrROM[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFEAEAEA"
    )
        port map (
      I0 => \i_main_ctrl/addrROM10_out__0\,
      I1 => \i_main_ctrl/next_state11_in\,
      I2 => \i_main_ctrl/p_3_in\,
      I3 => \i_main_ctrl/next_state1__7\,
      I4 => \i_main_ctrl/p_1_in\,
      I5 => I2C_FIFO_Full,
      O => \addrROM[5]_i_1_n_0\
    );
\addrROM[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in\,
      I1 => \i_main_ctrl/p_3_in\,
      I2 => I2C_FIFO_Full,
      O => \addrROM[5]_i_2_n_0\
    );
\addrROM[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg__0\(3),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(0),
      I3 => \i_main_ctrl/addrROM_reg\(2),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      I5 => \i_main_ctrl/addrROM_reg__0__0\(5),
      O => \plusOp__0\(5)
    );
\addrROM[5]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      O => \i_main_ctrl/addrROM10_out__0\
    );
\addrROM[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg__0__0\(5),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg\(0),
      I4 => \i_main_ctrl/addrROM_reg__0\(3),
      I5 => \i_main_ctrl/addrROM_reg__0\(4),
      O => \i_main_ctrl/next_state11_in\
    );
\addrROM[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg__0\(4),
      I1 => \i_main_ctrl/addrROM_reg__0\(3),
      I2 => \i_main_ctrl/addrROM_reg__0__0\(5),
      I3 => \i_main_ctrl/addrROM_reg\(0),
      I4 => \i_main_ctrl/addrROM_reg\(1),
      I5 => \i_main_ctrl/addrROM_reg\(2),
      O => \i_main_ctrl/next_state1__7\
    );
\addrRd[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/p_1_in\,
      I1 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      O => \addrRd[0]_i_1_n_0\
    );
\addrRd[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      I1 => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      O => \i_IIC_master/i_FIFO/plusOp0_in\(1)
    );
\addrRd[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      I1 => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      I2 => \i_IIC_master/i_FIFO/addrRd_reg\(2),
      O => \i_IIC_master/i_FIFO/plusOp0_in\(2)
    );
\addrRd[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      I1 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      I2 => \i_IIC_master/i_FIFO/addrRd_reg\(2),
      I3 => \i_IIC_master/i_FIFO/addrRd_reg\(3),
      O => \i_IIC_master/i_FIFO/plusOp0_in\(3)
    );
\addrRd_rep[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \i_IIC_master/cntSCL\,
      I1 => \cntBits[3]_i_1_n_0\,
      I2 => \i_IIC_master/p_2_in\,
      I3 => I2C_FIFO_Empty,
      O => \i_IIC_master/i_FIFO/p_1_in\
    );
\addrRd_rep[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      O => \i_IIC_master/i_FIFO/plusOp0_in\(0)
    );
\addrRd_rep[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \i_IIC_master/p_0_in\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      O => \i_IIC_master/p_2_in\
    );
\addrWr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addrWr_reg(0),
      O => \addrWr[0]_i_1_n_0\
    );
\addrWr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => addrWr_reg(0),
      I1 => addrWr_reg(1),
      O => \addrWr[1]_i_1_n_0\
    );
\addrWr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => addrWr_reg(0),
      I1 => addrWr_reg(1),
      I2 => addrWr_reg(2),
      O => \addrWr[2]_i_1_n_0\
    );
\addrWr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => addrWr_reg(1),
      I1 => addrWr_reg(0),
      I2 => addrWr_reg(2),
      I3 => addrWr_reg(3),
      O => \addrWr[3]_i_1_n_0\
    );
\cnt20b[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_main_ctrl/p_1_in3_in\,
      I1 => I2C_FIFO_Full,
      O => \cnt20b[0]_i_1_n_0\
    );
\cnt20b[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/cnt20b_reg\(0),
      O => \cnt20b[0]_i_3_n_0\
    );
\cnt20b_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \cnt20b_reg[0]_i_2_n_0\,
      CO(6) => \cnt20b_reg[0]_i_2_n_1\,
      CO(5) => \cnt20b_reg[0]_i_2_n_2\,
      CO(4) => \cnt20b_reg[0]_i_2_n_3\,
      CO(3) => \cnt20b_reg[0]_i_2_n_4\,
      CO(2) => \cnt20b_reg[0]_i_2_n_5\,
      CO(1) => \cnt20b_reg[0]_i_2_n_6\,
      CO(0) => \cnt20b_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \cnt20b_reg[0]_i_2_n_8\,
      O(6) => \cnt20b_reg[0]_i_2_n_9\,
      O(5) => \cnt20b_reg[0]_i_2_n_10\,
      O(4) => \cnt20b_reg[0]_i_2_n_11\,
      O(3) => \cnt20b_reg[0]_i_2_n_12\,
      O(2) => \cnt20b_reg[0]_i_2_n_13\,
      O(1) => \cnt20b_reg[0]_i_2_n_14\,
      O(0) => \cnt20b_reg[0]_i_2_n_15\,
      S(7 downto 1) => \i_main_ctrl/cnt20b_reg\(7 downto 1),
      S(0) => \cnt20b[0]_i_3_n_0\
    );
\cnt20b_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \cnt20b_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_cnt20b_reg[8]_i_1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \cnt20b_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_cnt20b_reg[8]_i_1_O_UNCONNECTED\(7 downto 2),
      O(1) => \cnt20b_reg[8]_i_1_n_14\,
      O(0) => \cnt20b_reg[8]_i_1_n_15\,
      S(7 downto 2) => B"000000",
      S(1 downto 0) => \i_main_ctrl/cnt20b_reg\(9 downto 8)
    );
\cntBits[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FD"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      O => \cntBits[0]_i_1_n_0\
    );
\cntBits[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      O => \cntBits[1]_i_1_n_0\
    );
\cntBits[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      O => \cntBits[2]_i_1_n_0\
    );
\cntBits[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => \cntBits[3]_i_3_n_0\,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => \cntBits[3]_i_1_n_0\
    );
\cntBits[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA8"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      O => \cntBits[3]_i_2_n_0\
    );
\cntBits[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => L(8),
      I1 => L(7),
      I2 => L(6),
      I3 => \cntBits[3]_i_4_n_0\,
      I4 => \cntBits[3]_i_5_n_0\,
      O => \cntBits[3]_i_3_n_0\
    );
\cntBits[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200000000000000"
    )
        port map (
      I0 => L(0),
      I1 => L(2),
      I2 => L(1),
      I3 => L(3),
      I4 => L(5),
      I5 => L(4),
      O => \cntBits[3]_i_4_n_0\
    );
\cntBits[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => L(11),
      I1 => L(10),
      I2 => L(9),
      O => \cntBits[3]_i_5_n_0\
    );
\cntBlink[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      O => \plusOp__1\(0)
    );
\cntBlink[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      I1 => \i_main_ctrl/cntBlink_reg_n_0_[1]\,
      O => \plusOp__1\(1)
    );
\cntBlink[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      I1 => \i_main_ctrl/cntBlink_reg_n_0_[1]\,
      I2 => \i_main_ctrl/cntBlink_reg_n_0_[2]\,
      O => \plusOp__1\(2)
    );
\cntBlink[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_main_ctrl/cntBlink_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntBlink_reg_n_0_[2]\,
      I3 => \i_main_ctrl/cntBlink_reg_n_0_[3]\,
      O => \plusOp__1\(3)
    );
\cntBlink[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \i_main_ctrl/cntBlink_reg_n_0_[2]\,
      I1 => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntBlink_reg_n_0_[1]\,
      I3 => \i_main_ctrl/cntBlink_reg_n_0_[3]\,
      I4 => \i_main_ctrl/cntBlink_reg\(4),
      O => \plusOp__1\(4)
    );
\cntChar[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cntChar[7]_i_4_n_0\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      O => \cntChar[0]_i_1_n_0\
    );
\cntChar[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I2 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[1]_i_1_n_0\
    );
\cntChar[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A00"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I3 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[2]_i_1_n_0\
    );
\cntChar[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA0000"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I4 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[3]_i_1_n_0\
    );
\cntChar[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA00000000"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I4 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I5 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[4]_i_1_n_0\
    );
\cntChar[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA00000000"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[5]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I3 => \cntChar[5]_i_2_n_0\,
      I4 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      I5 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[5]_i_1_n_0\
    );
\cntChar[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      O => \cntChar[5]_i_2_n_0\
    );
\cntChar[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[6]\,
      I1 => \cntChar[7]_i_3_n_0\,
      I2 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[6]_i_1_n_0\
    );
\cntChar[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \i_main_ctrl/cntCol\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I3 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      O => \i_main_ctrl/cntChar\
    );
\cntChar[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A00"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[7]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[6]\,
      I2 => \cntChar[7]_i_3_n_0\,
      I3 => \cntChar[7]_i_4_n_0\,
      O => \cntChar[7]_i_2_n_0\
    );
\cntChar[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[5]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I4 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I5 => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      O => \cntChar[7]_i_3_n_0\
    );
\cntChar[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[5]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[7]\,
      I4 => \cntChar[7]_i_5_n_0\,
      O => \cntChar[7]_i_4_n_0\
    );
\cntChar[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntChar_reg_n_0_[6]\,
      I2 => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      I3 => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      O => \cntChar[7]_i_5_n_0\
    );
\cntCol[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      O => \cntCol[0]_i_1_n_0\
    );
\cntCol[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"26"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      O => \cntCol[1]_i_1_n_0\
    );
\cntCol[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      I1 => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      I2 => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      O => \cntCol[2]_i_1_n_0\
    );
\cntSCL[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => L(0),
      I1 => \cntBits[3]_i_1_n_0\,
      I2 => \cntSCL[14]_i_3_n_0\,
      I3 => rSCLin,
      O => \i_IIC_master/cntSCL__0\(0)
    );
\cntSCL[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => \cntSCL[10]_i_2_n_0\,
      I2 => L(10),
      I3 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(10)
    );
\cntSCL[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => L(9),
      I1 => L(7),
      I2 => \cntSCL[8]_i_2_n_0\,
      I3 => L(6),
      I4 => L(8),
      O => \cntSCL[10]_i_2_n_0\
    );
\cntSCL[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => \cntSCL[13]_i_2_n_0\,
      I2 => L(11),
      I3 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(11)
    );
\cntSCL[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15400000"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => \cntSCL[13]_i_2_n_0\,
      I2 => L(11),
      I3 => L(12),
      I4 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(12)
    );
\cntSCL[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555400000000000"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(11),
      I2 => \cntSCL[13]_i_2_n_0\,
      I3 => L(12),
      I4 => L(13),
      I5 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(13)
    );
\cntSCL[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => L(10),
      I1 => L(8),
      I2 => L(6),
      I3 => \cntSCL[8]_i_2_n_0\,
      I4 => L(7),
      I5 => L(9),
      O => \cntSCL[13]_i_2_n_0\
    );
\cntSCL[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555400000000000"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(12),
      I2 => \cntSCL[14]_i_2_n_0\,
      I3 => L(13),
      I4 => L(14),
      I5 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(14)
    );
\cntSCL[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => L(11),
      I1 => L(9),
      I2 => L(7),
      I3 => \cntSCL[9]_i_2_n_0\,
      I4 => L(8),
      I5 => L(10),
      O => \cntSCL[14]_i_2_n_0\
    );
\cntSCL[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \cntSCL[14]_i_4_n_0\,
      I1 => \cntSCL[14]_i_5_n_0\,
      I2 => L(6),
      I3 => L(10),
      I4 => L(11),
      I5 => L(5),
      O => \cntSCL[14]_i_3_n_0\
    );
\cntSCL[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF7FFFF"
    )
        port map (
      I0 => \cntSCL[14]_i_6_n_0\,
      I1 => L(7),
      I2 => L(9),
      I3 => L(8),
      I4 => L(4),
      I5 => L(13),
      O => \cntSCL[14]_i_4_n_0\
    );
\cntSCL[14]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => L(12),
      I1 => L(3),
      I2 => L(0),
      I3 => L(14),
      O => \cntSCL[14]_i_5_n_0\
    );
\cntSCL[14]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => L(2),
      I1 => L(1),
      O => \cntSCL[14]_i_6_n_0\
    );
\cntSCL[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF14"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(0),
      I2 => L(1),
      I3 => \cntSCL[4]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(1)
    );
\cntSCL[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1540"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(2),
      I4 => \cntSCL[4]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(2)
    );
\cntSCL[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A6000000A6FFFF"
    )
        port map (
      I0 => L(3),
      I1 => L(2),
      I2 => \cntSCL[4]_i_2_n_0\,
      I3 => \cntBits[3]_i_1_n_0\,
      I4 => \cntSCL[14]_i_3_n_0\,
      I5 => rSCLin,
      O => \i_IIC_master/cntSCL__0\(3)
    );
\cntSCL[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF51550400"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(2),
      I2 => \cntSCL[4]_i_2_n_0\,
      I3 => L(3),
      I4 => L(4),
      I5 => \cntSCL[4]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(4)
    );
\cntSCL[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => L(0),
      I1 => L(1),
      O => \cntSCL[4]_i_2_n_0\
    );
\cntSCL[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \cntSCL[4]_i_4_n_0\,
      I1 => \cntSCL[4]_i_5_n_0\,
      I2 => L(3),
      I3 => L(8),
      I4 => L(5),
      I5 => L(6),
      O => \cntSCL[4]_i_3_n_0\
    );
\cntSCL[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => L(4),
      I1 => \cntSCL[4]_i_6_n_0\,
      I2 => L(10),
      I3 => L(9),
      I4 => L(12),
      I5 => L(11),
      O => \cntSCL[4]_i_4_n_0\
    );
\cntSCL[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFF"
    )
        port map (
      I0 => L(0),
      I1 => L(7),
      I2 => L(1),
      I3 => L(2),
      O => \cntSCL[4]_i_5_n_0\
    );
\cntSCL[4]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => L(13),
      I1 => L(14),
      O => \cntSCL[4]_i_6_n_0\
    );
\cntSCL[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"060006FF"
    )
        port map (
      I0 => L(5),
      I1 => \cntSCL[5]_i_2_n_0\,
      I2 => \cntBits[3]_i_1_n_0\,
      I3 => \cntSCL[14]_i_3_n_0\,
      I4 => rSCLin,
      O => \i_IIC_master/cntSCL__0\(5)
    );
\cntSCL[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => L(4),
      I1 => L(2),
      I2 => L(1),
      I3 => L(0),
      I4 => L(3),
      O => \cntSCL[5]_i_2_n_0\
    );
\cntSCL[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"060006FF"
    )
        port map (
      I0 => L(6),
      I1 => \cntSCL[8]_i_2_n_0\,
      I2 => \cntBits[3]_i_1_n_0\,
      I3 => \cntSCL[14]_i_3_n_0\,
      I4 => rSCLin,
      O => \i_IIC_master/cntSCL__0\(6)
    );
\cntSCL[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"006AFFFF006A0000"
    )
        port map (
      I0 => L(7),
      I1 => L(6),
      I2 => \cntSCL[8]_i_2_n_0\,
      I3 => \cntBits[3]_i_1_n_0\,
      I4 => \cntSCL[14]_i_3_n_0\,
      I5 => rSCLin,
      O => \i_IIC_master/cntSCL__0\(7)
    );
\cntSCL[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555400000000000"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(6),
      I2 => \cntSCL[8]_i_2_n_0\,
      I3 => L(7),
      I4 => L(8),
      I5 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(8)
    );
\cntSCL[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => L(5),
      I1 => L(3),
      I2 => L(0),
      I3 => L(1),
      I4 => L(2),
      I5 => L(4),
      O => \cntSCL[8]_i_2_n_0\
    );
\cntSCL[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555400000000000"
    )
        port map (
      I0 => \cntBits[3]_i_1_n_0\,
      I1 => L(7),
      I2 => \cntSCL[9]_i_2_n_0\,
      I3 => L(8),
      I4 => L(9),
      I5 => \cntSCL[14]_i_3_n_0\,
      O => \i_IIC_master/cntSCL__0\(9)
    );
\cntSCL[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => L(6),
      I1 => L(4),
      I2 => L(2),
      I3 => \cntSCL[4]_i_2_n_0\,
      I4 => L(3),
      I5 => L(5),
      O => \cntSCL[9]_i_2_n_0\
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"012C444C"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b0_n_0
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A8002000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b0__0_n_0\
    );
\g0_b0__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"83EF00D200000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b0__1_n_0\
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0164230C"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b1_n_0
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8325006800000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b1__0_n_0\
    );
\g0_b1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5C120F9A00000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b1__1_n_0\
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01247004"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b2_n_0
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2361045000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b2__0_n_0\
    );
\g0_b2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2C2A0CD200000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b2__1_n_0\
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00240186"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b3_n_0
    );
\g0_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1051280000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b3__0_n_0\
    );
\g0_b3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03C3AC3200000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b3__1_n_0\
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0020430C"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b4_n_0
    );
\g0_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2151044800000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b4__0_n_0\
    );
\g0_b4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC161C5A00000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b4__1_n_0\
    );
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"006D3046"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b5_n_0
    );
\g0_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0169807000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b5__0_n_0\
    );
\g0_b5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5C025F1000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b5__1_n_0\
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002049A8"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b6_n_0
    );
\g0_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b6__0_n_0\
    );
\g0_b6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"836F405200000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g0_b6__1_n_0\
    );
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0004FDCA"
    )
        port map (
      I0 => \i_main_ctrl/addrROM_reg\(0),
      I1 => \i_main_ctrl/addrROM_reg\(1),
      I2 => \i_main_ctrl/addrROM_reg\(2),
      I3 => \i_main_ctrl/addrROM_reg__0\(3),
      I4 => \i_main_ctrl/addrROM_reg__0\(4),
      O => g0_b7_n_0
    );
g1_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000090407F57974"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b0_n_0
    );
\g1_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"900012416C1F86FF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b0__0_n_0\
    );
g1_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000090413EFF9FF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b1_n_0
    );
\g1_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B800100100100200"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b1__0_n_0\
    );
g1_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"87F5690442EFF9FF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b2_n_0
    );
\g1_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC1FD3BE00102A01"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b2__0_n_0\
    );
g1_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C2EFE9FC00E7F9FF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b3_n_0
    );
\g1_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"90003E40159D63E7"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b3__0_n_0\
    );
g1_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"82A7E9BC00A7F9FF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b4_n_0
    );
\g1_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BD88322202960A01"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b4__0_n_0\
    );
g1_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80A5E93E05AFFDFF"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b5_n_0
    );
\g1_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BA833A8002900200"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b5__0_n_0\
    );
g1_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"850D6D0485057976"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b6_n_0
    );
\g1_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9478B23EAE7A96BD"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b6__0_n_0\
    );
g1_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => g1_b7_n_0
    );
\g1_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200048000000000"
    )
        port map (
      I0 => \i_main_ctrl/ASCII\(0),
      I1 => \i_main_ctrl/ASCII\(1),
      I2 => \i_main_ctrl/ASCII\(2),
      I3 => \i_main_ctrl/ASCII\(3),
      I4 => \i_main_ctrl/ASCII\(4),
      I5 => \i_main_ctrl/ASCII\(5),
      O => \g1_b7__0_n_0\
    );
iEmpty_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EAAAAAEA"
    )
        port map (
      I0 => I2C_FIFO_Empty,
      I1 => \i_IIC_master/i_FIFO/p_1_in\,
      I2 => iEmpty_i_2_n_0,
      I3 => addrWr_reg(3),
      I4 => \i_IIC_master/i_FIFO/plusOp0_in\(3),
      I5 => RAM_reg_0_15_0_7_i_1_n_0,
      O => iEmpty_i_1_n_0
    );
iEmpty_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0041820014000082"
    )
        port map (
      I0 => addrWr_reg(0),
      I1 => addrWr_reg(2),
      I2 => \i_IIC_master/i_FIFO/addrRd_reg\(2),
      I3 => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      I4 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      I5 => addrWr_reg(1),
      O => iEmpty_i_2_n_0
    );
iFull_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EAAAAAEA"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => RAM_reg_0_15_0_7_i_1_n_0,
      I2 => iFull_i_2_n_0,
      I3 => \i_IIC_master/i_FIFO/addrRd_reg\(3),
      I4 => \addrWr[3]_i_1_n_0\,
      I5 => \i_IIC_master/i_FIFO/p_1_in\,
      O => iFull_i_1_n_0
    );
iFull_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0041820014000082"
    )
        port map (
      I0 => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      I1 => \i_IIC_master/i_FIFO/addrRd_reg\(2),
      I2 => addrWr_reg(2),
      I3 => addrWr_reg(1),
      I4 => addrWr_reg(0),
      I5 => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      O => iFull_i_2_n_0
    );
\i_IIC_master/FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \i_IIC_master/FSM_onehot_state_reg_n_0_[0]\,
      R => '0'
    );
\i_IIC_master/FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \i_IIC_master/cntSCL\,
      R => '0'
    );
\i_IIC_master/FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \i_IIC_master/p_0_in\,
      R => '0'
    );
\i_IIC_master/FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \i_IIC_master/cntSCL\,
      Q => \i_IIC_master/cntBits\,
      R => '0'
    );
\i_IIC_master/FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => '0',
      Q => \i_IIC_master/FSM_onehot_state_reg_n_0_[5]\,
      R => '0'
    );
\i_IIC_master/IOBUF_SCL\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => OLED_SCL,
      O => \i_IIC_master/SCLin\,
      T => \i_IIC_master/SCLout_reg_n_0\
    );
\i_IIC_master/IOBUF_SDA\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => OLED_SDA,
      O => \i_IIC_master/SDAin\,
      T => \i_IIC_master/T\
    );
\i_IIC_master/NACK_reg\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => NACK_i_1_n_0,
      Q => NACK,
      R => '0'
    );
\i_IIC_master/SCLout_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => SCLout_i_1_n_0,
      Q => \i_IIC_master/SCLout_reg_n_0\,
      R => '0'
    );
\i_IIC_master/SDAout_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => SDAout_i_1_n_0,
      Q => \i_IIC_master/T\,
      R => '0'
    );
\i_IIC_master/cntBits_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntBits[3]_i_1_n_0\,
      D => \cntBits[0]_i_1_n_0\,
      Q => \i_IIC_master/cntBits_reg_n_0_[0]\,
      R => \i_IIC_master/cntBits\
    );
\i_IIC_master/cntBits_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntBits[3]_i_1_n_0\,
      D => \cntBits[1]_i_1_n_0\,
      Q => \i_IIC_master/cntBits_reg_n_0_[1]\,
      R => \i_IIC_master/cntBits\
    );
\i_IIC_master/cntBits_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntBits[3]_i_1_n_0\,
      D => \cntBits[2]_i_1_n_0\,
      Q => \i_IIC_master/cntBits_reg_n_0_[2]\,
      R => \i_IIC_master/cntBits\
    );
\i_IIC_master/cntBits_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntBits[3]_i_1_n_0\,
      D => \cntBits[3]_i_2_n_0\,
      Q => \i_IIC_master/cntBits_reg_n_0_[3]\,
      R => \i_IIC_master/cntBits\
    );
\i_IIC_master/cntSCL_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(0),
      Q => L(0),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(10),
      Q => L(10),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(11),
      Q => L(11),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(12),
      Q => L(12),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(13),
      Q => L(13),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(14),
      Q => L(14),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(1),
      Q => L(1),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(2),
      Q => L(2),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(3),
      Q => L(3),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(4),
      Q => L(4),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(5),
      Q => L(5),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(6),
      Q => L(6),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(7),
      Q => L(7),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(8),
      Q => L(8),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/cntSCL_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/cntSCL__0\(9),
      Q => L(9),
      R => \i_IIC_master/cntSCL\
    );
\i_IIC_master/i_FIFO/RAM_reg_0_15_0_7\: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRA(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRB(4) => '0',
      ADDRB(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRB(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRC(4) => '0',
      ADDRC(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRC(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRD(4) => '0',
      ADDRD(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRD(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRE(4) => '0',
      ADDRE(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRE(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRF(4) => '0',
      ADDRF(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRF(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRG(4) => '0',
      ADDRG(3 downto 1) => \i_IIC_master/i_FIFO/addrRd_reg\(3 downto 1),
      ADDRG(0) => \i_IIC_master/i_FIFO/addrRd\(0),
      ADDRH(4) => '0',
      ADDRH(3 downto 0) => addrWr_reg(3 downto 0),
      DIA(1) => RAM_reg_0_15_0_7_i_2_n_0,
      DIA(0) => RAM_reg_0_15_0_7_i_3_n_0,
      DIB(1) => RAM_reg_0_15_0_7_i_4_n_0,
      DIB(0) => RAM_reg_0_15_0_7_i_5_n_0,
      DIC(1) => RAM_reg_0_15_0_7_i_6_n_0,
      DIC(0) => RAM_reg_0_15_0_7_i_7_n_0,
      DID(1) => RAM_reg_0_15_0_7_i_8_n_0,
      DID(0) => RAM_reg_0_15_0_7_i_9_n_0,
      DIE(1 downto 0) => B"00",
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => DO(1 downto 0),
      DOB(1 downto 0) => DO(3 downto 2),
      DOC(1 downto 0) => DO(5 downto 4),
      DOD(1 downto 0) => DO(7 downto 6),
      DOE(1 downto 0) => \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOE_UNCONNECTED\(1 downto 0),
      DOF(1 downto 0) => \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOF_UNCONNECTED\(1 downto 0),
      DOG(1 downto 0) => \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOG_UNCONNECTED\(1 downto 0),
      DOH(1 downto 0) => \NLW_i_IIC_master/i_FIFO/RAM_reg_0_15_0_7_DOH_UNCONNECTED\(1 downto 0),
      WCLK => Clk_100MHz,
      WE => RAM_reg_0_15_0_7_i_1_n_0
    );
\i_IIC_master/i_FIFO/addrRd_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \addrRd[0]_i_1_n_0\,
      Q => \i_IIC_master/i_FIFO/addrRd_reg\(0),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrRd_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_IIC_master/i_FIFO/p_1_in\,
      D => \i_IIC_master/i_FIFO/plusOp0_in\(1),
      Q => \i_IIC_master/i_FIFO/addrRd_reg\(1),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrRd_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_IIC_master/i_FIFO/p_1_in\,
      D => \i_IIC_master/i_FIFO/plusOp0_in\(2),
      Q => \i_IIC_master/i_FIFO/addrRd_reg\(2),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrRd_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_IIC_master/i_FIFO/p_1_in\,
      D => \i_IIC_master/i_FIFO/plusOp0_in\(3),
      Q => \i_IIC_master/i_FIFO/addrRd_reg\(3),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrRd_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_IIC_master/i_FIFO/p_1_in\,
      D => \i_IIC_master/i_FIFO/plusOp0_in\(0),
      Q => \i_IIC_master/i_FIFO/addrRd\(0),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrWr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => RAM_reg_0_15_0_7_i_1_n_0,
      D => \addrWr[0]_i_1_n_0\,
      Q => addrWr_reg(0),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrWr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => RAM_reg_0_15_0_7_i_1_n_0,
      D => \addrWr[1]_i_1_n_0\,
      Q => addrWr_reg(1),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrWr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => RAM_reg_0_15_0_7_i_1_n_0,
      D => \addrWr[2]_i_1_n_0\,
      Q => addrWr_reg(2),
      R => '0'
    );
\i_IIC_master/i_FIFO/addrWr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => RAM_reg_0_15_0_7_i_1_n_0,
      D => \addrWr[3]_i_1_n_0\,
      Q => addrWr_reg(3),
      R => '0'
    );
\i_IIC_master/i_FIFO/iEmpty_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => iEmpty_i_1_n_0,
      Q => I2C_FIFO_Empty,
      R => '0'
    );
\i_IIC_master/i_FIFO/iFull_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => iFull_i_1_n_0,
      Q => I2C_FIFO_Full,
      R => '0'
    );
\i_IIC_master/rSCLin_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/SCLin\,
      Q => rSCLin,
      R => '0'
    );
\i_IIC_master/rSDAin_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_IIC_master/SDAin\,
      Q => \i_IIC_master/rSDAin\,
      R => '0'
    );
\i_IIC_master/sregOut[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => DO(0),
      I4 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      O => \i_IIC_master/sregOut[0]_i_1_n_0\
    );
\i_IIC_master/sregOut[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[0]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(1),
      O => \i_IIC_master/sregOut[1]_i_1_n_0\
    );
\i_IIC_master/sregOut[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[1]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(2),
      O => \i_IIC_master/sregOut[2]_i_1_n_0\
    );
\i_IIC_master/sregOut[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[2]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(3),
      O => \i_IIC_master/sregOut[3]_i_1_n_0\
    );
\i_IIC_master/sregOut[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[3]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(4),
      O => \i_IIC_master/sregOut[4]_i_1_n_0\
    );
\i_IIC_master/sregOut[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[4]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(5),
      O => \i_IIC_master/sregOut[5]_i_1_n_0\
    );
\i_IIC_master/sregOut[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[5]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(6),
      O => \i_IIC_master/sregOut[6]_i_1_n_0\
    );
\i_IIC_master/sregOut[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000000000"
    )
        port map (
      I0 => \i_main_ctrl/p_0_in2_in\,
      I1 => \i_main_ctrl/RAM_Goto00\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      I3 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      I4 => \i_IIC_master/cntSCL\,
      I5 => \sregOut[7]_i_2_n_0\,
      O => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => \i_IIC_master/sregOut_reg_n_0_[6]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I4 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I5 => DO(7),
      O => \i_IIC_master/sregOut[7]_i_3_n_0\
    );
\i_IIC_master/sregOut_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[0]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[0]\,
      R => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[1]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[1]\,
      R => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[2]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[2]\,
      R => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[3]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[3]\,
      S => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[4]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[4]\,
      S => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[5]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[5]\,
      S => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[6]_i_1_n_0\,
      Q => \i_IIC_master/sregOut_reg_n_0_[6]\,
      S => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_IIC_master/sregOut_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_IIC_master/sregOut[7]_i_3_n_0\,
      Q => sregOut(7),
      R => \i_IIC_master/sregOut[7]_i_1_n_0\
    );
\i_main_ctrl/FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/p_1_in\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[0]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[10]_i_1_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[1]\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[11]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/cnt20b\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[12]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[13]_i_1_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[13]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[17]\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[14]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[15]_i_1_n_0\,
      Q => \i_main_ctrl/p_0_in2_in\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => '0',
      Q => \i_main_ctrl/cnt20b\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[17]_i_1_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[17]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/p_0_in2_in\,
      Q => \i_main_ctrl/p_1_in3_in\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/p_5_in\,
      Q => \i_main_ctrl/cntCol\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[1]_i_1__0_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[1]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[22]\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[20]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/p_1_in3_in\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[21]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[22]_i_2_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[22]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \i_main_ctrl/RAM_Goto00\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      Q => \i_main_ctrl/p_1_in\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[7]\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[5]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[5]\,
      Q => \i_main_ctrl/p_5_in\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \FSM_onehot_state[7]_i_1_n_0\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[7]\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      Q => \i_main_ctrl/p_3_in\,
      R => '0'
    );
\i_main_ctrl/FSM_onehot_state_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[22]_i_1_n_0\,
      D => \i_main_ctrl/p_3_in\,
      Q => \i_main_ctrl/FSM_onehot_state_reg_n_0_[9]\,
      R => '0'
    );
\i_main_ctrl/addrROM_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \plusOp__0\(0),
      Q => \i_main_ctrl/addrROM_reg\(0),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/addrROM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \plusOp__0\(1),
      Q => \i_main_ctrl/addrROM_reg\(1),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/addrROM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \addrROM[2]_i_1_n_0\,
      Q => \i_main_ctrl/addrROM_reg\(2),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/addrROM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \plusOp__0\(3),
      Q => \i_main_ctrl/addrROM_reg__0\(3),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/addrROM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \plusOp__0\(4),
      Q => \i_main_ctrl/addrROM_reg__0\(4),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/addrROM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => \plusOp__0\(5),
      Q => \i_main_ctrl/addrROM_reg__0__0\(5),
      R => \addrROM[5]_i_1_n_0\
    );
\i_main_ctrl/cnt20b_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_15\,
      Q => \i_main_ctrl/cnt20b_reg\(0),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_14\,
      Q => \i_main_ctrl/cnt20b_reg\(1),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_13\,
      Q => \i_main_ctrl/cnt20b_reg\(2),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_12\,
      Q => \i_main_ctrl/cnt20b_reg\(3),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_11\,
      Q => \i_main_ctrl/cnt20b_reg\(4),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_10\,
      Q => \i_main_ctrl/cnt20b_reg\(5),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_9\,
      Q => \i_main_ctrl/cnt20b_reg\(6),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[0]_i_2_n_8\,
      Q => \i_main_ctrl/cnt20b_reg\(7),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[8]_i_1_n_15\,
      Q => \i_main_ctrl/cnt20b_reg\(8),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cnt20b_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cnt20b[0]_i_1_n_0\,
      D => \cnt20b_reg[8]_i_1_n_14\,
      Q => \i_main_ctrl/cnt20b_reg\(9),
      R => \i_main_ctrl/cnt20b\
    );
\i_main_ctrl/cntBlink_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/RAM_Goto00\,
      D => \plusOp__1\(0),
      Q => \i_main_ctrl/cntBlink_reg_n_0_[0]\,
      R => '0'
    );
\i_main_ctrl/cntBlink_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/RAM_Goto00\,
      D => \plusOp__1\(1),
      Q => \i_main_ctrl/cntBlink_reg_n_0_[1]\,
      R => '0'
    );
\i_main_ctrl/cntBlink_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/RAM_Goto00\,
      D => \plusOp__1\(2),
      Q => \i_main_ctrl/cntBlink_reg_n_0_[2]\,
      R => '0'
    );
\i_main_ctrl/cntBlink_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/RAM_Goto00\,
      D => \plusOp__1\(3),
      Q => \i_main_ctrl/cntBlink_reg_n_0_[3]\,
      R => '0'
    );
\i_main_ctrl/cntBlink_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/RAM_Goto00\,
      D => \plusOp__1\(4),
      Q => \i_main_ctrl/cntBlink_reg\(4),
      R => '0'
    );
\i_main_ctrl/cntChar_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[0]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[0]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[1]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[1]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[2]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[2]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[3]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[3]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[4]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[4]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[5]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[5]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[6]_i_1_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[6]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntChar_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntChar\,
      D => \cntChar[7]_i_2_n_0\,
      Q => \i_main_ctrl/cntChar_reg_n_0_[7]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntCol_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntCol\,
      D => \cntCol[0]_i_1_n_0\,
      Q => \i_main_ctrl/cntCol_reg_n_0_[0]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntCol_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntCol\,
      D => \cntCol[1]_i_1_n_0\,
      Q => \i_main_ctrl/cntCol_reg_n_0_[1]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/cntCol_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/cntCol\,
      D => \cntCol[2]_i_1_n_0\,
      Q => \i_main_ctrl/cntCol_reg_n_0_[2]\,
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => \Addr_Clr[0]_i_1_n_0\,
      Q => Addr_Clr(0),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => \Addr_Clr[1]_i_1_n_0\,
      Q => Addr_Clr(1),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => p_1_in(2),
      Q => Addr_Clr(2),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => \Addr_Clr[3]_i_1_n_0\,
      Q => Addr_Clr(3),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => p_1_in(4),
      Q => Addr_Clr(4),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => p_1_in(5),
      Q => Addr_Clr(5),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => p_1_in(6),
      Q => Addr_Clr(6),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Clr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Clr[7]_i_1_n_0\,
      D => p_1_in(7),
      Q => Addr_Clr(7),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_LT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => plusOp(5),
      Q => \i_main_ctrl/i_RAM/Addr_LT_reg\(5),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_LT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => plusOp(6),
      Q => \i_main_ctrl/i_RAM/Addr_LT_reg\(6),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_LT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => plusOp(7),
      Q => \i_main_ctrl/i_RAM/Addr_LT_reg\(7),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_RB_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => \Addr_RB[5]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_RB_reg\(5),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_RB_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => \Addr_RB[6]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_RB_reg\(6),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_RB_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_main_ctrl/i_RAM/do_scroll\,
      D => \Addr_RB[7]_i_2_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_RB_reg\(7),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => Addr_Rd0_out(0),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg\(0),
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => Addr_Rd0_out(1),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg\(1),
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => Addr_Rd0_out(2),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg\(2),
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => Addr_Rd0_out(3),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg\(3),
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => Addr_Rd0_out(4),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg\(4),
      R => \i_main_ctrl/RAM_Goto00\
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => p_0_in(5),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(5),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => p_0_in(6),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(6),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Rd_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Rd[7]_i_1_n_0\,
      D => p_0_in(7),
      Q => \i_main_ctrl/i_RAM/Addr_Rd_reg__0\(7),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[4]_i_2_n_0\,
      D => \Addr_Wr[0]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      R => \Addr_Wr[4]_i_1_n_0\
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[4]_i_2_n_0\,
      D => \Addr_Wr[1]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      R => \Addr_Wr[4]_i_1_n_0\
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[4]_i_2_n_0\,
      D => \Addr_Wr[2]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      R => \Addr_Wr[4]_i_1_n_0\
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[4]_i_2_n_0\,
      D => \Addr_Wr[3]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      R => \Addr_Wr[4]_i_1_n_0\
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[4]_i_2_n_0\,
      D => \Addr_Wr[4]_i_3_n_0\,
      Q => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      R => \Addr_Wr[4]_i_1_n_0\
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[7]_i_1_n_0\,
      D => \Addr_Wr[5]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/L\(5),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[7]_i_1_n_0\,
      D => \Addr_Wr[6]_i_1_n_0\,
      Q => \i_main_ctrl/i_RAM/L\(6),
      R => '0'
    );
\i_main_ctrl/i_RAM/Addr_Wr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \Addr_Wr[7]_i_1_n_0\,
      D => \Addr_Wr[7]_i_2_n_0\,
      Q => \i_main_ctrl/i_RAM/L\(7),
      R => '0'
    );
\i_main_ctrl/i_RAM/RAM_reg_bram_0\: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 4) => \i_main_ctrl/i_RAM/Addr_PtB\(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"00",
      ADDRBWRADDR(11 downto 9) => \i_main_ctrl/i_RAM/L\(7 downto 5),
      ADDRBWRADDR(8) => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[4]\,
      ADDRBWRADDR(7) => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[3]\,
      ADDRBWRADDR(6) => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[2]\,
      ADDRBWRADDR(5) => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[1]\,
      ADDRBWRADDR(4) => \i_main_ctrl/i_RAM/Addr_Wr_reg_n_0_[0]\,
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTA_UNCONNECTED\(15 downto 0),
      CASDOUTB(15 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTB_UNCONNECTED\(15 downto 0),
      CASDOUTPA(1 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTPA_UNCONNECTED\(1 downto 0),
      CASDOUTPB(1 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_CASDOUTPB_UNCONNECTED\(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => Clk_100MHz,
      CLKBWRCLK => Clk_100MHz,
      DINADIN(15 downto 0) => B"0000000000000000",
      DINBDIN(15 downto 7) => B"000000000",
      DINBDIN(6 downto 0) => ASCII(6 downto 0),
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"00",
      DOUTADOUT(15 downto 7) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTADOUT_UNCONNECTED\(15 downto 7),
      DOUTADOUT(6 downto 0) => \i_main_ctrl/ASCII\(6 downto 0),
      DOUTBDOUT(15 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED\(15 downto 0),
      DOUTPADOUTP(1 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED\(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => \NLW_i_main_ctrl/i_RAM/RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED\(1 downto 0),
      ENARDEN => '1',
      ENBWREN => RAM_reg_bram_0_i_1_n_0,
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1) => RAM_reg_bram_0_i_10_n_0,
      WEA(0) => RAM_reg_bram_0_i_10_n_0,
      WEBWE(3 downto 2) => B"00",
      WEBWE(1) => ASCII_WE,
      WEBWE(0) => ASCII_WE
    );
\i_main_ctrl/i_RAM/in_scrclr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => in_scrclr_i_1_n_0,
      Q => \i_main_ctrl/i_RAM/in_scrclr\,
      R => '0'
    );
\i_main_ctrl/i_ROM/Mask_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(0),
      Q => Mask(0),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b0__1_n_0\,
      I1 => \g1_b0__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[0]_i_4_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[0]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b0__0_n_0\,
      I1 => g1_b0_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[0]_i_7_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(1),
      Q => Mask(1),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[1]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b1__1_n_0\,
      I1 => \g1_b1__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[1]_i_11_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[1]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b1__0_n_0\,
      I1 => g1_b1_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[1]_i_5_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(2),
      Q => Mask(2),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[2]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b2__1_n_0\,
      I1 => \g1_b2__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[2]_i_4_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[2]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b2__0_n_0\,
      I1 => g1_b2_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[2]_i_6_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(3),
      Q => Mask(3),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[3]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b3__1_n_0\,
      I1 => \g1_b3__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[3]_i_13_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[3]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b3__0_n_0\,
      I1 => g1_b3_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[3]_i_5_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(4),
      Q => Mask(4),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[4]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b4__1_n_0\,
      I1 => \g1_b4__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[4]_i_4_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[4]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b4__0_n_0\,
      I1 => g1_b4_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[4]_i_6_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(5),
      Q => Mask(5),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b5__1_n_0\,
      I1 => \g1_b5__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[5]_i_4_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[5]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b5__0_n_0\,
      I1 => g1_b5_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[5]_i_6_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(6),
      Q => Mask(6),
      R => \Mask[7]_i_1_n_0\
    );
\i_main_ctrl/i_ROM/Mask_reg[6]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b6__1_n_0\,
      I1 => \g1_b6__0_n_0\,
      O => \i_main_ctrl/i_ROM/Mask_reg[6]_i_4_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[6]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b6__0_n_0\,
      I1 => g1_b6_n_0,
      O => \i_main_ctrl/i_ROM/Mask_reg[6]_i_7_n_0\,
      S => \i_main_ctrl/ASCII\(6)
    );
\i_main_ctrl/i_ROM/Mask_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_main_ctrl/i_ROM/fontROM[0][0]\(7),
      Q => Mask(7),
      R => \Mask[7]_i_1_n_0\
    );
in_scrclr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \i_main_ctrl/i_RAM/in_scrclr0\,
      I1 => \i_main_ctrl/i_RAM/in_scrclr\,
      I2 => \i_main_ctrl/i_RAM/do_scroll\,
      O => in_scrclr_i_1_n_0
    );
\sregOut[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEFFAEAAAAAAAAAA"
    )
        port map (
      I0 => \i_IIC_master/RdNotWr0\,
      I1 => \cntBits[3]_i_1_n_0\,
      I2 => I2C_FIFO_Empty,
      I3 => \sregOut[7]_i_5_n_0\,
      I4 => \sregOut[7]_i_6_n_0\,
      I5 => \i_IIC_master/p_0_in\,
      O => \sregOut[7]_i_2_n_0\
    );
\sregOut[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \i_IIC_master/cntSCL\,
      I1 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[10]\,
      I2 => \i_main_ctrl/FSM_onehot_state_reg_n_0_[4]\,
      I3 => \i_main_ctrl/RAM_Goto00\,
      I4 => \i_main_ctrl/p_0_in2_in\,
      O => \i_IIC_master/RdNotWr0\
    );
\sregOut[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \i_IIC_master/cntBits_reg_n_0_[3]\,
      I1 => \i_IIC_master/cntBits_reg_n_0_[0]\,
      I2 => \i_IIC_master/cntBits_reg_n_0_[2]\,
      I3 => \i_IIC_master/cntBits_reg_n_0_[1]\,
      O => \sregOut[7]_i_5_n_0\
    );
\sregOut[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => L(12),
      I1 => \sregOut[7]_i_7_n_0\,
      I2 => L(11),
      I3 => L(10),
      I4 => L(14),
      I5 => L(13),
      O => \sregOut[7]_i_6_n_0\
    );
\sregOut[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => L(7),
      I1 => L(8),
      I2 => \sregOut[7]_i_8_n_0\,
      I3 => L(6),
      I4 => \cntBits[3]_i_5_n_0\,
      O => \sregOut[7]_i_7_n_0\
    );
\sregOut[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => L(3),
      I1 => L(1),
      I2 => L(0),
      I3 => L(2),
      I4 => L(5),
      I5 => L(4),
      O => \sregOut[7]_i_8_n_0\
    );
end STRUCTURE;
