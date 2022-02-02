-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "02/01/2022 20:20:00"

-- 
-- Device: Altera 5CSEMA4U23C6 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lab3 IS
    PORT (
	kpc : BUFFER std_logic_vector(3 DOWNTO 0);
	kpr : IN std_logic_vector(3 DOWNTO 0);
	leds : BUFFER std_logic_vector(7 DOWNTO 0);
	ct : BUFFER std_logic_vector(3 DOWNTO 0);
	LED : BUFFER std_logic_vector(7 DOWNTO 0);
	ADC_CONVST : BUFFER std_logic;
	ADC_SCK : BUFFER std_logic;
	ADC_SDI : BUFFER std_logic;
	ADC_SDO : IN std_logic;
	reset_n : IN std_logic;
	CLOCK_50 : IN std_logic
	);
END lab3;

-- Design Ports Information
-- kpc[0]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpc[1]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpc[2]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpc[3]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[0]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- leds[1]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[2]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[3]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[4]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[5]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[6]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[7]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct[0]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct[1]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct[2]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct[3]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_W15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[1]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[2]	=>  Location: PIN_V16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[3]	=>  Location: PIN_V15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[4]	=>  Location: PIN_AF26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[5]	=>  Location: PIN_AE26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[6]	=>  Location: PIN_Y16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LED[7]	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ADC_CONVST	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ADC_SCK	=>  Location: PIN_V10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ADC_SDI	=>  Location: PIN_AC4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- kpr[0]	=>  Location: PIN_AH2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpr[2]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpr[1]	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- kpr[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADC_SDO	=>  Location: PIN_AD4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF lab3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_kpc : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_kpr : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ct : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ADC_CONVST : std_logic;
SIGNAL ww_ADC_SCK : std_logic;
SIGNAL ww_ADC_SDI : std_logic;
SIGNAL ww_ADC_SDO : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|fb_clkin\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTEN0\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\ : std_logic;
SIGNAL \colseq_0|current.A~0_combout\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \kpr[2]~input_o\ : std_logic;
SIGNAL \kpr[3]~input_o\ : std_logic;
SIGNAL \kpr[0]~input_o\ : std_logic;
SIGNAL \kpr[1]~input_o\ : std_logic;
SIGNAL \colseq_0|Equal0~0_combout\ : std_logic;
SIGNAL \colseq_0|current.A~q\ : std_logic;
SIGNAL \colseq_0|current.B~0_combout\ : std_logic;
SIGNAL \colseq_0|current.B~q\ : std_logic;
SIGNAL \colseq_0|current.C~q\ : std_logic;
SIGNAL \colseq_0|current.D~q\ : std_logic;
SIGNAL \ADC_SDO~input_o\ : std_logic;
SIGNAL \comb_11|state.D~0_combout\ : std_logic;
SIGNAL \comb_11|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \comb_11|next_count[3]~2_combout\ : std_logic;
SIGNAL \comb_11|next_count[0]~0_combout\ : std_logic;
SIGNAL \comb_11|Add0~0_combout\ : std_logic;
SIGNAL \comb_11|Equal0~0_combout\ : std_logic;
SIGNAL \comb_11|state.D~q\ : std_logic;
SIGNAL \comb_11|state.A~0_combout\ : std_logic;
SIGNAL \comb_11|state.A~q\ : std_logic;
SIGNAL \comb_11|state.B~q\ : std_logic;
SIGNAL \comb_11|next_count[2]~1_combout\ : std_logic;
SIGNAL \comb_11|next_state.C~0_combout\ : std_logic;
SIGNAL \comb_11|state.C~q\ : std_logic;
SIGNAL \comb_11|Decoder0~1_combout\ : std_logic;
SIGNAL \comb_11|load[0]~2_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \delayCnt[0]~0_combout\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \digit[0]~0_combout\ : std_logic;
SIGNAL \comb_11|Decoder0~0_combout\ : std_logic;
SIGNAL \comb_11|load[4]~0_combout\ : std_logic;
SIGNAL \comb_11|load[8]~1_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \comb_11|load[2]~8_combout\ : std_logic;
SIGNAL \comb_11|Decoder0~3_combout\ : std_logic;
SIGNAL \comb_11|load[6]~6_combout\ : std_logic;
SIGNAL \comb_11|Decoder0~4_combout\ : std_logic;
SIGNAL \comb_11|load[10]~7_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \comb_11|load[3]~11_combout\ : std_logic;
SIGNAL \comb_11|load[7]~9_combout\ : std_logic;
SIGNAL \comb_11|Decoder0~5_combout\ : std_logic;
SIGNAL \comb_11|load[11]~10_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \comb_11|load[5]~3_combout\ : std_logic;
SIGNAL \comb_11|Decoder0~2_combout\ : std_logic;
SIGNAL \comb_11|load[9]~4_combout\ : std_logic;
SIGNAL \comb_11|load[1]~5_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr6~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr5~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr4~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr3~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr2~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr1~0_combout\ : std_logic;
SIGNAL \decode7_0|WideOr0~0_combout\ : std_logic;
SIGNAL \ShiftLeft0~0_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector3~1_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector3~0_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector3~2_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector2~1_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector2~0_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector2~2_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector1~1_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector1~0_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector1~2_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector1~3_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector0~0_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector0~1_combout\ : std_logic;
SIGNAL \kpdecode_0|Selector0~2_combout\ : std_logic;
SIGNAL \comb_11|ADC_CONVST~0_combout\ : std_logic;
SIGNAL \comb_11|ADC_SCK~0_combout\ : std_logic;
SIGNAL \comb_11|ADC_SDI~0_combout\ : std_logic;
SIGNAL \comb_11|ADC_SDI~1_combout\ : std_logic;
SIGNAL \comb_11|ADC_SDI~q\ : std_logic;
SIGNAL \comb_11|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL digit : std_logic_vector(1 DOWNTO 0);
SIGNAL \comb_11|load\ : std_logic_vector(11 DOWNTO 0);
SIGNAL delayCnt : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_11|ALT_INV_Decoder0~2_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_Decoder0~1_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_Decoder0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL ALT_INV_delayCnt : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_11|ALT_INV_state.C~q\ : std_logic;
SIGNAL \comb_11|ALT_INV_state.A~q\ : std_logic;
SIGNAL \comb_11|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \kpdecode_0|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector1~3_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector1~2_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector3~2_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \decode7_0|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_load\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL ALT_INV_digit : std_logic_vector(1 DOWNTO 0);
SIGNAL \colseq_0|ALT_INV_current.A~q\ : std_logic;
SIGNAL \colseq_0|ALT_INV_current.B~q\ : std_logic;
SIGNAL \colseq_0|ALT_INV_current.C~q\ : std_logic;
SIGNAL \colseq_0|ALT_INV_current.D~q\ : std_logic;
SIGNAL \comb_11|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_ADC_SDO~input_o\ : std_logic;
SIGNAL \ALT_INV_kpr[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_kpr[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_kpr[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_kpr[0]~input_o\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector2~2_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \kpdecode_0|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_ADC_SDI~0_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_state.D~q\ : std_logic;
SIGNAL \comb_11|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_next_count[0]~0_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_Decoder0~5_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_state.B~q\ : std_logic;
SIGNAL \comb_11|ALT_INV_Decoder0~4_combout\ : std_logic;
SIGNAL \comb_11|ALT_INV_Decoder0~3_combout\ : std_logic;

BEGIN

kpc <= ww_kpc;
ww_kpr <= kpr;
leds <= ww_leds;
ct <= ww_ct;
LED <= ww_LED;
ADC_CONVST <= ww_ADC_CONVST;
ADC_SCK <= ww_ADC_SCK;
ADC_SDI <= ww_ADC_SDI;
ww_ADC_SDO <= ADC_SDO;
ww_reset_n <= reset_n;
ww_CLOCK_50 <= CLOCK_50;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH0\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH1\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH2\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH3\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH4\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH5\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH6\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH7\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI0\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(0);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI1\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(1);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI2\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(2);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI3\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(3);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI4\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(4);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI5\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(5);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI6\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(6);
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI7\ <= \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\(7);

\pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \CLOCK_50~input_o\);

\pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_MHI_bus\ <= (\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI7\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI6\ & 
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI5\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI4\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI3\ & 
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI2\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI1\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_MHI0\);

\pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTEN0\ <= \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_SHIFTEN_bus\(0);

\pll0|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH7\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH5\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH4\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH2\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH1\ & \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_VCOPH0\);
\comb_11|ALT_INV_Decoder0~2_combout\ <= NOT \comb_11|Decoder0~2_combout\;
\comb_11|ALT_INV_Decoder0~1_combout\ <= NOT \comb_11|Decoder0~1_combout\;
\comb_11|ALT_INV_Decoder0~0_combout\ <= NOT \comb_11|Decoder0~0_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_delayCnt(3) <= NOT delayCnt(3);
ALT_INV_delayCnt(2) <= NOT delayCnt(2);
ALT_INV_delayCnt(1) <= NOT delayCnt(1);
ALT_INV_delayCnt(0) <= NOT delayCnt(0);
ALT_INV_delayCnt(7) <= NOT delayCnt(7);
ALT_INV_delayCnt(6) <= NOT delayCnt(6);
ALT_INV_delayCnt(5) <= NOT delayCnt(5);
ALT_INV_delayCnt(4) <= NOT delayCnt(4);
\comb_11|ALT_INV_state.C~q\ <= NOT \comb_11|state.C~q\;
\comb_11|ALT_INV_state.A~q\ <= NOT \comb_11|state.A~q\;
\comb_11|ALT_INV_count\(3) <= NOT \comb_11|count\(3);
\comb_11|ALT_INV_count\(2) <= NOT \comb_11|count\(2);
\comb_11|ALT_INV_count\(1) <= NOT \comb_11|count\(1);
\comb_11|ALT_INV_count\(0) <= NOT \comb_11|count\(0);
\kpdecode_0|ALT_INV_Selector0~1_combout\ <= NOT \kpdecode_0|Selector0~1_combout\;
\kpdecode_0|ALT_INV_Selector0~0_combout\ <= NOT \kpdecode_0|Selector0~0_combout\;
\kpdecode_0|ALT_INV_Selector1~3_combout\ <= NOT \kpdecode_0|Selector1~3_combout\;
\kpdecode_0|ALT_INV_Selector1~2_combout\ <= NOT \kpdecode_0|Selector1~2_combout\;
\kpdecode_0|ALT_INV_Selector1~1_combout\ <= NOT \kpdecode_0|Selector1~1_combout\;
\kpdecode_0|ALT_INV_Selector1~0_combout\ <= NOT \kpdecode_0|Selector1~0_combout\;
\kpdecode_0|ALT_INV_Selector3~2_combout\ <= NOT \kpdecode_0|Selector3~2_combout\;
\kpdecode_0|ALT_INV_Selector3~1_combout\ <= NOT \kpdecode_0|Selector3~1_combout\;
\kpdecode_0|ALT_INV_Selector3~0_combout\ <= NOT \kpdecode_0|Selector3~0_combout\;
\ALT_INV_Mux3~1_combout\ <= NOT \Mux3~1_combout\;
\decode7_0|ALT_INV_WideOr0~0_combout\ <= NOT \decode7_0|WideOr0~0_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\comb_11|ALT_INV_load\(3) <= NOT \comb_11|load\(3);
\comb_11|ALT_INV_load\(11) <= NOT \comb_11|load\(11);
\comb_11|ALT_INV_load\(7) <= NOT \comb_11|load\(7);
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\comb_11|ALT_INV_load\(2) <= NOT \comb_11|load\(2);
\comb_11|ALT_INV_load\(10) <= NOT \comb_11|load\(10);
\comb_11|ALT_INV_load\(6) <= NOT \comb_11|load\(6);
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\comb_11|ALT_INV_load\(1) <= NOT \comb_11|load\(1);
\comb_11|ALT_INV_load\(9) <= NOT \comb_11|load\(9);
\comb_11|ALT_INV_load\(5) <= NOT \comb_11|load\(5);
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\comb_11|ALT_INV_load\(0) <= NOT \comb_11|load\(0);
ALT_INV_digit(1) <= NOT digit(1);
\comb_11|ALT_INV_load\(8) <= NOT \comb_11|load\(8);
\comb_11|ALT_INV_load\(4) <= NOT \comb_11|load\(4);
ALT_INV_digit(0) <= NOT digit(0);
\colseq_0|ALT_INV_current.A~q\ <= NOT \colseq_0|current.A~q\;
\colseq_0|ALT_INV_current.B~q\ <= NOT \colseq_0|current.B~q\;
\colseq_0|ALT_INV_current.C~q\ <= NOT \colseq_0|current.C~q\;
\colseq_0|ALT_INV_current.D~q\ <= NOT \colseq_0|current.D~q\;
\comb_11|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \comb_11|count[2]~DUPLICATE_q\;
\pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\ <= NOT \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\;
\ALT_INV_ADC_SDO~input_o\ <= NOT \ADC_SDO~input_o\;
\ALT_INV_kpr[3]~input_o\ <= NOT \kpr[3]~input_o\;
\ALT_INV_kpr[1]~input_o\ <= NOT \kpr[1]~input_o\;
\ALT_INV_kpr[2]~input_o\ <= NOT \kpr[2]~input_o\;
\ALT_INV_kpr[0]~input_o\ <= NOT \kpr[0]~input_o\;
\kpdecode_0|ALT_INV_Selector2~2_combout\ <= NOT \kpdecode_0|Selector2~2_combout\;
\kpdecode_0|ALT_INV_Selector2~1_combout\ <= NOT \kpdecode_0|Selector2~1_combout\;
\kpdecode_0|ALT_INV_Selector2~0_combout\ <= NOT \kpdecode_0|Selector2~0_combout\;
\comb_11|ALT_INV_ADC_SDI~0_combout\ <= NOT \comb_11|ADC_SDI~0_combout\;
\comb_11|ALT_INV_state.D~q\ <= NOT \comb_11|state.D~q\;
\comb_11|ALT_INV_Add0~0_combout\ <= NOT \comb_11|Add0~0_combout\;
\comb_11|ALT_INV_next_count[0]~0_combout\ <= NOT \comb_11|next_count[0]~0_combout\;
\comb_11|ALT_INV_Decoder0~5_combout\ <= NOT \comb_11|Decoder0~5_combout\;
\comb_11|ALT_INV_state.B~q\ <= NOT \comb_11|state.B~q\;
\comb_11|ALT_INV_Decoder0~4_combout\ <= NOT \comb_11|Decoder0~4_combout\;
\comb_11|ALT_INV_Decoder0~3_combout\ <= NOT \comb_11|Decoder0~3_combout\;

-- Location: IOOBUF_X17_Y0_N93
\kpc[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \colseq_0|ALT_INV_current.D~q\,
	devoe => ww_devoe,
	o => ww_kpc(0));

-- Location: IOOBUF_X10_Y0_N76
\kpc[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \colseq_0|ALT_INV_current.C~q\,
	devoe => ww_devoe,
	o => ww_kpc(1));

-- Location: IOOBUF_X12_Y0_N2
\kpc[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \colseq_0|ALT_INV_current.B~q\,
	devoe => ww_devoe,
	o => ww_kpc(2));

-- Location: IOOBUF_X15_Y0_N53
\kpc[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \colseq_0|current.A~q\,
	devoe => ww_devoe,
	o => ww_kpc(3));

-- Location: IOOBUF_X4_Y0_N19
\leds[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(0));

-- Location: IOOBUF_X21_Y0_N53
\leds[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(1));

-- Location: IOOBUF_X19_Y0_N53
\leds[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(2));

-- Location: IOOBUF_X18_Y0_N36
\leds[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(3));

-- Location: IOOBUF_X10_Y0_N93
\leds[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(4));

-- Location: IOOBUF_X15_Y0_N36
\leds[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(5));

-- Location: IOOBUF_X18_Y0_N2
\leds[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decode7_0|ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(6));

-- Location: IOOBUF_X12_Y0_N36
\leds[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_leds(7));

-- Location: IOOBUF_X19_Y0_N19
\ct[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux3~1_combout\,
	devoe => ww_devoe,
	o => ww_ct(0));

-- Location: IOOBUF_X14_Y0_N2
\ct[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~2_combout\,
	devoe => ww_devoe,
	o => ww_ct(1));

-- Location: IOOBUF_X10_Y0_N42
\ct[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ShiftLeft0~0_combout\,
	devoe => ww_devoe,
	o => ww_ct(2));

-- Location: IOOBUF_X14_Y0_N53
\ct[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~3_combout\,
	devoe => ww_devoe,
	o => ww_ct(3));

-- Location: IOOBUF_X68_Y12_N22
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \kpdecode_0|Selector3~2_combout\,
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOOBUF_X68_Y13_N39
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \kpdecode_0|Selector2~2_combout\,
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X68_Y13_N5
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \kpdecode_0|Selector1~3_combout\,
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X68_Y13_N22
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \kpdecode_0|Selector0~2_combout\,
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X68_Y10_N79
\LED[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|load\(8),
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X68_Y10_N96
\LED[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|load\(9),
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X68_Y12_N5
\LED[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|load\(10),
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X68_Y13_N56
\LED[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|load\(11),
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X4_Y0_N2
\ADC_CONVST~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|ADC_CONVST~0_combout\,
	devoe => ww_devoe,
	o => ww_ADC_CONVST);

-- Location: IOOBUF_X6_Y0_N19
\ADC_SCK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|ADC_SCK~0_combout\,
	devoe => ww_devoe,
	o => ww_ADC_SCK);

-- Location: IOOBUF_X6_Y0_N36
\ADC_SDI~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_11|ADC_SDI~q\,
	devoe => ww_devoe,
	o => ww_ADC_SDI);

-- Location: IOIBUF_X15_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y7_N0
\pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: FRACTIONALPLL_X0_Y1_N0
\pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "gclk_far",
	nreset_invert => "true",
	output_clock_frequency => "300.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "fb_1",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 6,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 6,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \pll0|altpll_component|auto_generated|fb_clkin\,
	ecnc1test => \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => GND,
	refclkin => \pll0|altpll_component|auto_generated|generic_pll1~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_UP\,
	cntnen => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll0|altpll_component|auto_generated|fb_clkin\,
	tclk => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y5_N0
\pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_MHI_bus\,
	shift => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_UP\,
	shiften => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y0_N1
\pll0|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 128,
	dprio0_cnt_lo_div => 128,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "1.171875 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 0)
-- pragma translate_on
PORT MAP (
	nen0 => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_SHIFTEN0\,
	tclk0 => \pll0|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll0|altpll_component|auto_generated|generic_pll1~PLL_RECONFIG_O_UP\,
	vco0ph => \pll0|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk\);

-- Location: CLKCTRL_G3
\pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk\,
	outclk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\);

-- Location: LABCELL_X18_Y2_N30
\colseq_0|current.A~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \colseq_0|current.A~0_combout\ = ( !\colseq_0|current.D~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \colseq_0|current.A~0_combout\);

-- Location: IOIBUF_X46_Y0_N35
\reset_n~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: IOIBUF_X21_Y0_N35
\kpr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_kpr(2),
	o => \kpr[2]~input_o\);

-- Location: IOIBUF_X18_Y0_N18
\kpr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_kpr(3),
	o => \kpr[3]~input_o\);

-- Location: IOIBUF_X18_Y0_N52
\kpr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_kpr(0),
	o => \kpr[0]~input_o\);

-- Location: IOIBUF_X19_Y0_N35
\kpr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_kpr(1),
	o => \kpr[1]~input_o\);

-- Location: LABCELL_X21_Y2_N57
\colseq_0|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \colseq_0|Equal0~0_combout\ = ( \kpr[1]~input_o\ & ( (\kpr[2]~input_o\ & (\kpr[3]~input_o\ & \kpr[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datac => \ALT_INV_kpr[3]~input_o\,
	datad => \ALT_INV_kpr[0]~input_o\,
	dataf => \ALT_INV_kpr[1]~input_o\,
	combout => \colseq_0|Equal0~0_combout\);

-- Location: FF_X18_Y2_N32
\colseq_0|current.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \colseq_0|current.A~0_combout\,
	clrn => \reset_n~input_o\,
	ena => \colseq_0|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \colseq_0|current.A~q\);

-- Location: LABCELL_X18_Y2_N33
\colseq_0|current.B~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \colseq_0|current.B~0_combout\ = ( !\colseq_0|current.A~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \colseq_0|ALT_INV_current.A~q\,
	combout => \colseq_0|current.B~0_combout\);

-- Location: FF_X21_Y2_N47
\colseq_0|current.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	asdata => \colseq_0|current.B~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \colseq_0|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \colseq_0|current.B~q\);

-- Location: FF_X21_Y2_N41
\colseq_0|current.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	asdata => \colseq_0|current.B~q\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \colseq_0|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \colseq_0|current.C~q\);

-- Location: FF_X21_Y2_N35
\colseq_0|current.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	asdata => \colseq_0|current.C~q\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \colseq_0|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \colseq_0|current.D~q\);

-- Location: IOIBUF_X6_Y0_N52
\ADC_SDO~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADC_SDO,
	o => \ADC_SDO~input_o\);

-- Location: MLABCELL_X14_Y3_N15
\comb_11|state.D~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|state.D~0_combout\ = !\comb_11|state.C~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.C~q\,
	combout => \comb_11|state.D~0_combout\);

-- Location: FF_X14_Y3_N44
\comb_11|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|next_count[2]~1_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|count[2]~DUPLICATE_q\);

-- Location: MLABCELL_X14_Y3_N45
\comb_11|next_count[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|next_count[3]~2_combout\ = ( \comb_11|count\(1) & ( \comb_11|count\(3) ) ) # ( !\comb_11|count\(1) & ( (!\comb_11|count\(0) & (((\comb_11|state.B~q\ & !\comb_11|count[2]~DUPLICATE_q\)) # (\comb_11|count\(3)))) # (\comb_11|count\(0) & 
-- ((!\comb_11|count[2]~DUPLICATE_q\ $ (\comb_11|count\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000011001111011100001100111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.B~q\,
	datab => \comb_11|ALT_INV_count\(0),
	datac => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \comb_11|ALT_INV_count\(3),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|next_count[3]~2_combout\);

-- Location: FF_X14_Y3_N46
\comb_11|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|next_count[3]~2_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|count\(3));

-- Location: MLABCELL_X14_Y3_N30
\comb_11|next_count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|next_count[0]~0_combout\ = ( \comb_11|count[2]~DUPLICATE_q\ & ( !\comb_11|count\(0) ) ) # ( !\comb_11|count[2]~DUPLICATE_q\ & ( (!\comb_11|count\(0) & (((\comb_11|count\(1)) # (\comb_11|count\(3))) # (\comb_11|state.B~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100000000011111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.B~q\,
	datab => \comb_11|ALT_INV_count\(3),
	datac => \comb_11|ALT_INV_count\(1),
	datad => \comb_11|ALT_INV_count\(0),
	dataf => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \comb_11|next_count[0]~0_combout\);

-- Location: FF_X14_Y3_N32
\comb_11|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|next_count[0]~0_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|count\(0));

-- Location: MLABCELL_X14_Y3_N6
\comb_11|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Add0~0_combout\ = !\comb_11|count\(0) $ (!\comb_11|count\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100001100111100110000110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_11|ALT_INV_count\(0),
	datad => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|Add0~0_combout\);

-- Location: FF_X14_Y3_N8
\comb_11|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|Add0~0_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|count\(1));

-- Location: MLABCELL_X14_Y3_N51
\comb_11|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Equal0~0_combout\ = ( !\comb_11|count[2]~DUPLICATE_q\ & ( (!\comb_11|count\(1) & (!\comb_11|count\(3) & !\comb_11|count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(1),
	datac => \comb_11|ALT_INV_count\(3),
	datad => \comb_11|ALT_INV_count\(0),
	dataf => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \comb_11|Equal0~0_combout\);

-- Location: FF_X14_Y3_N17
\comb_11|state.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|state.D~0_combout\,
	clrn => \reset_n~input_o\,
	ena => \comb_11|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|state.D~q\);

-- Location: MLABCELL_X14_Y3_N48
\comb_11|state.A~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|state.A~0_combout\ = !\comb_11|state.D~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_11|ALT_INV_state.D~q\,
	combout => \comb_11|state.A~0_combout\);

-- Location: FF_X14_Y3_N49
\comb_11|state.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|state.A~0_combout\,
	clrn => \reset_n~input_o\,
	ena => \comb_11|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|state.A~q\);

-- Location: FF_X14_Y3_N55
\comb_11|state.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	asdata => \comb_11|state.A~q\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \comb_11|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|state.B~q\);

-- Location: MLABCELL_X14_Y3_N42
\comb_11|next_count[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|next_count[2]~1_combout\ = ( \comb_11|count\(1) & ( \comb_11|count\(2) ) ) # ( !\comb_11|count\(1) & ( (!\comb_11|count\(0) & (((\comb_11|state.B~q\ & !\comb_11|count\(3))) # (\comb_11|count\(2)))) # (\comb_11|count\(0) & 
-- (((!\comb_11|count\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001111001100011100111100110000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.B~q\,
	datab => \comb_11|ALT_INV_count\(0),
	datac => \comb_11|ALT_INV_count\(3),
	datad => \comb_11|ALT_INV_count\(2),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|next_count[2]~1_combout\);

-- Location: FF_X14_Y3_N43
\comb_11|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|next_count[2]~1_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|count\(2));

-- Location: MLABCELL_X14_Y3_N24
\comb_11|next_state.C~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|next_state.C~0_combout\ = ( \comb_11|state.C~q\ & ( \comb_11|count\(3) ) ) # ( \comb_11|state.C~q\ & ( !\comb_11|count\(3) & ( (((\comb_11|count\(0)) # (\comb_11|state.B~q\)) # (\comb_11|count\(1))) # (\comb_11|count\(2)) ) ) ) # ( 
-- !\comb_11|state.C~q\ & ( !\comb_11|count\(3) & ( (!\comb_11|count\(2) & (!\comb_11|count\(1) & (\comb_11|state.B~q\ & !\comb_11|count\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000011111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(2),
	datab => \comb_11|ALT_INV_count\(1),
	datac => \comb_11|ALT_INV_state.B~q\,
	datad => \comb_11|ALT_INV_count\(0),
	datae => \comb_11|ALT_INV_state.C~q\,
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|next_state.C~0_combout\);

-- Location: FF_X14_Y3_N26
\comb_11|state.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|next_state.C~0_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|state.C~q\);

-- Location: MLABCELL_X14_Y3_N39
\comb_11|Decoder0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~1_combout\ = ( !\comb_11|count[2]~DUPLICATE_q\ & ( (\comb_11|state.C~q\ & (\comb_11|count\(0) & \comb_11|count\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.C~q\,
	datac => \comb_11|ALT_INV_count\(0),
	datad => \comb_11|ALT_INV_count\(1),
	dataf => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \comb_11|Decoder0~1_combout\);

-- Location: LABCELL_X15_Y3_N33
\comb_11|load[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[0]~2_combout\ = ( \comb_11|count\(3) & ( \comb_11|load\(0) ) ) # ( !\comb_11|count\(3) & ( (!\comb_11|Decoder0~1_combout\ & ((\comb_11|load\(0)))) # (\comb_11|Decoder0~1_combout\ & (\ADC_SDO~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_Decoder0~1_combout\,
	datad => \comb_11|ALT_INV_load\(0),
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|load[0]~2_combout\);

-- Location: FF_X15_Y3_N35
\comb_11|load[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(0));

-- Location: LABCELL_X15_Y2_N30
\Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = ( digit(0) & ( !digit(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_digit(1),
	dataf => ALT_INV_digit(0),
	combout => \Mux3~2_combout\);

-- Location: LABCELL_X15_Y2_N51
\delayCnt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \delayCnt[0]~0_combout\ = ( !delayCnt(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_delayCnt(0),
	combout => \delayCnt[0]~0_combout\);

-- Location: FF_X15_Y2_N53
\delayCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \delayCnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(0));

-- Location: LABCELL_X15_Y2_N0
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( delayCnt(1) ) + ( delayCnt(0) ) + ( !VCC ))
-- \Add0~18\ = CARRY(( delayCnt(1) ) + ( delayCnt(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_delayCnt(0),
	datad => ALT_INV_delayCnt(1),
	cin => GND,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X15_Y2_N2
\delayCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(1));

-- Location: LABCELL_X15_Y2_N3
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( delayCnt(2) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( delayCnt(2) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(2),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X15_Y2_N5
\delayCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(2));

-- Location: LABCELL_X15_Y2_N6
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( delayCnt(3) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( delayCnt(3) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(3),
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X15_Y2_N8
\delayCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(3));

-- Location: LABCELL_X15_Y2_N9
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( delayCnt(4) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~2\ = CARRY(( delayCnt(4) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(4),
	cin => \Add0~26\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X15_Y2_N10
\delayCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(4));

-- Location: LABCELL_X15_Y2_N12
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( delayCnt(5) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( delayCnt(5) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(5),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X15_Y2_N14
\delayCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(5));

-- Location: LABCELL_X15_Y2_N15
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( delayCnt(6) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( delayCnt(6) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(6),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X15_Y2_N17
\delayCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(6));

-- Location: LABCELL_X15_Y2_N18
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( delayCnt(7) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_delayCnt(7),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\);

-- Location: FF_X15_Y2_N20
\delayCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delayCnt(7));

-- Location: LABCELL_X15_Y2_N54
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !delayCnt(2) & ( !delayCnt(3) & ( (!delayCnt(0) & !delayCnt(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_delayCnt(0),
	datac => ALT_INV_delayCnt(1),
	datae => ALT_INV_delayCnt(2),
	dataf => ALT_INV_delayCnt(3),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X15_Y2_N24
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !delayCnt(6) & ( (!delayCnt(7) & (!delayCnt(5) & (\Equal0~0_combout\ & !delayCnt(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_delayCnt(7),
	datab => ALT_INV_delayCnt(5),
	datac => \ALT_INV_Equal0~0_combout\,
	datad => ALT_INV_delayCnt(4),
	dataf => ALT_INV_delayCnt(6),
	combout => \Equal0~1_combout\);

-- Location: FF_X15_Y2_N32
\digit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \Mux3~2_combout\,
	ena => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit(1));

-- Location: LABCELL_X15_Y2_N33
\Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = ( digit(1) ) # ( !digit(1) & ( digit(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_digit(0),
	dataf => ALT_INV_digit(1),
	combout => \Mux3~1_combout\);

-- Location: LABCELL_X15_Y2_N27
\digit[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \digit[0]~0_combout\ = ( !\Mux3~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Mux3~1_combout\,
	combout => \digit[0]~0_combout\);

-- Location: FF_X15_Y2_N28
\digit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \digit[0]~0_combout\,
	ena => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit(0));

-- Location: MLABCELL_X14_Y3_N36
\comb_11|Decoder0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~0_combout\ = (\comb_11|state.C~q\ & (\comb_11|count[2]~DUPLICATE_q\ & !\comb_11|count\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000000000100010000000000010001000000000001000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.C~q\,
	datab => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|Decoder0~0_combout\);

-- Location: LABCELL_X15_Y3_N30
\comb_11|load[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[4]~0_combout\ = ( \comb_11|count\(1) & ( (!\comb_11|Decoder0~0_combout\ & (((\comb_11|load\(4))))) # (\comb_11|Decoder0~0_combout\ & ((!\comb_11|count\(0) & ((\comb_11|load\(4)))) # (\comb_11|count\(0) & (\ADC_SDO~input_o\)))) ) ) # ( 
-- !\comb_11|count\(1) & ( \comb_11|load\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111110110000000111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_Decoder0~0_combout\,
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_count\(0),
	datad => \comb_11|ALT_INV_load\(4),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|load[4]~0_combout\);

-- Location: FF_X15_Y3_N32
\comb_11|load[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(4));

-- Location: LABCELL_X15_Y3_N9
\comb_11|load[8]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[8]~1_combout\ = ( \comb_11|load\(8) & ( \comb_11|count\(3) & ( (!\comb_11|Decoder0~1_combout\) # (\ADC_SDO~input_o\) ) ) ) # ( !\comb_11|load\(8) & ( \comb_11|count\(3) & ( (\comb_11|Decoder0~1_combout\ & \ADC_SDO~input_o\) ) ) ) # ( 
-- \comb_11|load\(8) & ( !\comb_11|count\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000101000001011010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_Decoder0~1_combout\,
	datac => \ALT_INV_ADC_SDO~input_o\,
	datae => \comb_11|ALT_INV_load\(8),
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|load[8]~1_combout\);

-- Location: FF_X15_Y3_N11
\comb_11|load[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(8));

-- Location: LABCELL_X15_Y3_N42
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \comb_11|load\(8) & ( (!digit(1) & ((!digit(0) & (!\comb_11|load\(0))) # (digit(0) & ((!\comb_11|load\(4)))))) ) ) # ( !\comb_11|load\(8) & ( (!digit(0) & ((!\comb_11|load\(0)) # ((digit(1))))) # (digit(0) & (((!digit(1) & 
-- !\comb_11|load\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011110010001100101111001000110010110000100000001011000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_load\(0),
	datab => ALT_INV_digit(0),
	datac => ALT_INV_digit(1),
	datad => \comb_11|ALT_INV_load\(4),
	dataf => \comb_11|ALT_INV_load\(8),
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X15_Y3_N36
\comb_11|load[2]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[2]~8_combout\ = ( \comb_11|count\(0) & ( (!\comb_11|count\(1) & ((!\comb_11|Decoder0~0_combout\ & ((\comb_11|load\(2)))) # (\comb_11|Decoder0~0_combout\ & (\ADC_SDO~input_o\)))) # (\comb_11|count\(1) & (((\comb_11|load\(2))))) ) ) # ( 
-- !\comb_11|count\(0) & ( \comb_11|load\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100111101110000010011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ADC_SDO~input_o\,
	datab => \comb_11|ALT_INV_count\(1),
	datac => \comb_11|ALT_INV_Decoder0~0_combout\,
	datad => \comb_11|ALT_INV_load\(2),
	dataf => \comb_11|ALT_INV_count\(0),
	combout => \comb_11|load[2]~8_combout\);

-- Location: FF_X15_Y3_N38
\comb_11|load[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(2));

-- Location: MLABCELL_X14_Y3_N18
\comb_11|Decoder0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~3_combout\ = ( \comb_11|state.C~q\ & ( (!\comb_11|count[2]~DUPLICATE_q\ & \comb_11|count\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \comb_11|ALT_INV_count\(3),
	dataf => \comb_11|ALT_INV_state.C~q\,
	combout => \comb_11|Decoder0~3_combout\);

-- Location: LABCELL_X15_Y3_N39
\comb_11|load[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[6]~6_combout\ = ( \comb_11|Decoder0~3_combout\ & ( (!\comb_11|count\(1) & ((!\comb_11|count\(0) & ((\comb_11|load\(6)))) # (\comb_11|count\(0) & (\ADC_SDO~input_o\)))) # (\comb_11|count\(1) & (((\comb_11|load\(6))))) ) ) # ( 
-- !\comb_11|Decoder0~3_combout\ & ( \comb_11|load\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100111101110000010011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ADC_SDO~input_o\,
	datab => \comb_11|ALT_INV_count\(1),
	datac => \comb_11|ALT_INV_count\(0),
	datad => \comb_11|ALT_INV_load\(6),
	dataf => \comb_11|ALT_INV_Decoder0~3_combout\,
	combout => \comb_11|load[6]~6_combout\);

-- Location: FF_X15_Y3_N40
\comb_11|load[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(6));

-- Location: MLABCELL_X14_Y3_N21
\comb_11|Decoder0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~4_combout\ = ( \comb_11|state.C~q\ & ( (\comb_11|count[2]~DUPLICATE_q\ & \comb_11|count\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datac => \comb_11|ALT_INV_count\(3),
	dataf => \comb_11|ALT_INV_state.C~q\,
	combout => \comb_11|Decoder0~4_combout\);

-- Location: LABCELL_X15_Y3_N12
\comb_11|load[10]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[10]~7_combout\ = ( \comb_11|count\(1) & ( \comb_11|load\(10) ) ) # ( !\comb_11|count\(1) & ( (!\comb_11|count\(0) & (((\comb_11|load\(10))))) # (\comb_11|count\(0) & ((!\comb_11|Decoder0~4_combout\ & ((\comb_11|load\(10)))) # 
-- (\comb_11|Decoder0~4_combout\ & (\ADC_SDO~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111011000000011111101100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(0),
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_Decoder0~4_combout\,
	datad => \comb_11|ALT_INV_load\(10),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|load[10]~7_combout\);

-- Location: FF_X15_Y3_N14
\comb_11|load[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[10]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(10));

-- Location: LABCELL_X15_Y3_N18
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \comb_11|load\(10) & ( (!digit(1) & ((!digit(0) & (!\comb_11|load\(2))) # (digit(0) & ((!\comb_11|load\(6)))))) ) ) # ( !\comb_11|load\(10) & ( (!digit(1) & ((!digit(0) & (!\comb_11|load\(2))) # (digit(0) & ((!\comb_11|load\(6)))))) # 
-- (digit(1) & (!digit(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110011011000100111001101100010010100010100000001010001010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_digit(1),
	datab => ALT_INV_digit(0),
	datac => \comb_11|ALT_INV_load\(2),
	datad => \comb_11|ALT_INV_load\(6),
	dataf => \comb_11|ALT_INV_load\(10),
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X15_Y3_N54
\comb_11|load[3]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[3]~11_combout\ = ( \comb_11|count\(1) & ( \comb_11|load\(3) ) ) # ( !\comb_11|count\(1) & ( (!\comb_11|count\(0) & ((!\comb_11|Decoder0~0_combout\ & ((\comb_11|load\(3)))) # (\comb_11|Decoder0~0_combout\ & (\ADC_SDO~input_o\)))) # 
-- (\comb_11|count\(0) & (((\comb_11|load\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011110111000000101111011100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(0),
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_Decoder0~0_combout\,
	datad => \comb_11|ALT_INV_load\(3),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|load[3]~11_combout\);

-- Location: FF_X15_Y3_N55
\comb_11|load[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(3));

-- Location: LABCELL_X15_Y3_N57
\comb_11|load[7]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[7]~9_combout\ = ( \comb_11|Decoder0~3_combout\ & ( (!\comb_11|count\(0) & ((!\comb_11|count\(1) & (\ADC_SDO~input_o\)) # (\comb_11|count\(1) & ((\comb_11|load\(7)))))) # (\comb_11|count\(0) & (((\comb_11|load\(7))))) ) ) # ( 
-- !\comb_11|Decoder0~3_combout\ & ( \comb_11|load\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100100000011111110010000001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(0),
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_count\(1),
	datad => \comb_11|ALT_INV_load\(7),
	dataf => \comb_11|ALT_INV_Decoder0~3_combout\,
	combout => \comb_11|load[7]~9_combout\);

-- Location: FF_X15_Y3_N59
\comb_11|load[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(7));

-- Location: MLABCELL_X14_Y3_N33
\comb_11|Decoder0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~5_combout\ = ( \comb_11|state.C~q\ & ( (\comb_11|count\(3) & \comb_11|count[2]~DUPLICATE_q\) ) ) # ( !\comb_11|state.C~q\ & ( (\comb_11|state.B~q\ & (!\comb_11|count\(3) & !\comb_11|count[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000010000000100000000000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.B~q\,
	datab => \comb_11|ALT_INV_count\(3),
	datac => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	dataf => \comb_11|ALT_INV_state.C~q\,
	combout => \comb_11|Decoder0~5_combout\);

-- Location: LABCELL_X15_Y3_N15
\comb_11|load[11]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[11]~10_combout\ = ( \comb_11|count\(1) & ( \comb_11|load\(11) ) ) # ( !\comb_11|count\(1) & ( (!\comb_11|count\(0) & ((!\comb_11|Decoder0~5_combout\ & ((\comb_11|load\(11)))) # (\comb_11|Decoder0~5_combout\ & (\ADC_SDO~input_o\)))) # 
-- (\comb_11|count\(0) & (((\comb_11|load\(11))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011110111000000101111011100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(0),
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_Decoder0~5_combout\,
	datad => \comb_11|ALT_INV_load\(11),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|load[11]~10_combout\);

-- Location: FF_X15_Y3_N17
\comb_11|load[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[11]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(11));

-- Location: LABCELL_X15_Y3_N21
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \comb_11|load\(11) & ( (!digit(1) & ((!digit(0) & (!\comb_11|load\(3))) # (digit(0) & ((!\comb_11|load\(7)))))) ) ) # ( !\comb_11|load\(11) & ( (!digit(1) & ((!digit(0) & (!\comb_11|load\(3))) # (digit(0) & ((!\comb_11|load\(7)))))) # 
-- (digit(1) & (!digit(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110011011000100111001101100010010100010100000001010001010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_digit(1),
	datab => ALT_INV_digit(0),
	datac => \comb_11|ALT_INV_load\(3),
	datad => \comb_11|ALT_INV_load\(7),
	dataf => \comb_11|ALT_INV_load\(11),
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X15_Y3_N48
\comb_11|load[5]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[5]~3_combout\ = ( \comb_11|count\(1) & ( (!\comb_11|Decoder0~0_combout\ & (((\comb_11|load\(5))))) # (\comb_11|Decoder0~0_combout\ & ((!\comb_11|count\(0) & (\ADC_SDO~input_o\)) # (\comb_11|count\(0) & ((\comb_11|load\(5)))))) ) ) # ( 
-- !\comb_11|count\(1) & ( \comb_11|load\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010000101111110001000010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_Decoder0~0_combout\,
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_count\(0),
	datad => \comb_11|ALT_INV_load\(5),
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|load[5]~3_combout\);

-- Location: FF_X15_Y3_N49
\comb_11|load[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(5));

-- Location: MLABCELL_X14_Y3_N12
\comb_11|Decoder0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|Decoder0~2_combout\ = ( !\comb_11|count[2]~DUPLICATE_q\ & ( (\comb_11|state.C~q\ & (\comb_11|count\(1) & !\comb_11|count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_state.C~q\,
	datac => \comb_11|ALT_INV_count\(1),
	datad => \comb_11|ALT_INV_count\(0),
	dataf => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \comb_11|Decoder0~2_combout\);

-- Location: LABCELL_X15_Y3_N27
\comb_11|load[9]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[9]~4_combout\ = ( \comb_11|load\(9) & ( \comb_11|count\(3) & ( (!\comb_11|Decoder0~2_combout\) # (\ADC_SDO~input_o\) ) ) ) # ( !\comb_11|load\(9) & ( \comb_11|count\(3) & ( (\comb_11|Decoder0~2_combout\ & \ADC_SDO~input_o\) ) ) ) # ( 
-- \comb_11|load\(9) & ( !\comb_11|count\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000101000001011010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_Decoder0~2_combout\,
	datac => \ALT_INV_ADC_SDO~input_o\,
	datae => \comb_11|ALT_INV_load\(9),
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|load[9]~4_combout\);

-- Location: FF_X15_Y3_N29
\comb_11|load[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[9]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(9));

-- Location: LABCELL_X15_Y3_N51
\comb_11|load[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|load[1]~5_combout\ = ( \comb_11|count\(3) & ( \comb_11|load\(1) ) ) # ( !\comb_11|count\(3) & ( (!\comb_11|Decoder0~2_combout\ & ((\comb_11|load\(1)))) # (\comb_11|Decoder0~2_combout\ & (\ADC_SDO~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ADC_SDO~input_o\,
	datac => \comb_11|ALT_INV_Decoder0~2_combout\,
	datad => \comb_11|ALT_INV_load\(1),
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|load[1]~5_combout\);

-- Location: FF_X15_Y3_N53
\comb_11|load[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|load[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|load\(1));

-- Location: LABCELL_X15_Y3_N3
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \comb_11|load\(9) & ( \comb_11|load\(1) & ( (!digit(1) & (!\comb_11|load\(5) & digit(0))) ) ) ) # ( !\comb_11|load\(9) & ( \comb_11|load\(1) & ( (!digit(1) & (!\comb_11|load\(5) & digit(0))) # (digit(1) & ((!digit(0)))) ) ) ) # ( 
-- \comb_11|load\(9) & ( !\comb_11|load\(1) & ( (!digit(1) & ((!\comb_11|load\(5)) # (!digit(0)))) ) ) ) # ( !\comb_11|load\(9) & ( !\comb_11|load\(1) & ( (!digit(0)) # ((!digit(1) & !\comb_11|load\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100011111000101010001010100001011000010110000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_digit(1),
	datab => \comb_11|ALT_INV_load\(5),
	datac => ALT_INV_digit(0),
	datae => \comb_11|ALT_INV_load\(9),
	dataf => \comb_11|ALT_INV_load\(1),
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X18_Y2_N9
\decode7_0|WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr6~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux3~0_combout\ & (!\Mux1~0_combout\ $ (\Mux0~0_combout\))) # (\Mux3~0_combout\ & (!\Mux1~0_combout\ & \Mux0~0_combout\)) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux3~0_combout\ & (\Mux1~0_combout\ & 
-- !\Mux0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000010100000010110101010000001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	datac => \ALT_INV_Mux1~0_combout\,
	datad => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr6~0_combout\);

-- Location: LABCELL_X18_Y2_N42
\decode7_0|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr5~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux1~0_combout\ & (!\Mux0~0_combout\ $ (!\Mux3~0_combout\))) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux3~0_combout\ & (!\Mux0~0_combout\)) # (\Mux3~0_combout\ & ((!\Mux1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010110010101100101011001010110001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_Mux1~0_combout\,
	datac => \ALT_INV_Mux3~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr5~0_combout\);

-- Location: LABCELL_X18_Y2_N21
\decode7_0|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr4~0_combout\ = ( \Mux2~0_combout\ & ( (\Mux3~0_combout\ & (!\Mux1~0_combout\ & !\Mux0~0_combout\)) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux1~0_combout\ & ((!\Mux0~0_combout\))) # (\Mux1~0_combout\ & (\Mux3~0_combout\ & \Mux0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000101111100000000010101010000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	datac => \ALT_INV_Mux1~0_combout\,
	datad => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr4~0_combout\);

-- Location: LABCELL_X18_Y2_N24
\decode7_0|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr3~0_combout\ = ( \Mux2~0_combout\ & ( (\Mux0~0_combout\ & (!\Mux1~0_combout\ $ (!\Mux3~0_combout\))) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux1~0_combout\ & ((!\Mux3~0_combout\))) # (\Mux1~0_combout\ & (!\Mux0~0_combout\ & \Mux3~0_combout\)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001011000010110000101100001000010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_Mux1~0_combout\,
	datac => \ALT_INV_Mux3~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr3~0_combout\);

-- Location: LABCELL_X18_Y2_N3
\decode7_0|WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr2~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux1~0_combout\ & ((\Mux0~0_combout\))) # (\Mux1~0_combout\ & (!\Mux3~0_combout\)) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux3~0_combout\ & \Mux0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001010111110100000101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	datac => \ALT_INV_Mux1~0_combout\,
	datad => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr2~0_combout\);

-- Location: LABCELL_X18_Y2_N36
\decode7_0|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr1~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux3~0_combout\ & (!\Mux0~0_combout\ $ (\Mux1~0_combout\))) ) ) # ( !\Mux2~0_combout\ & ( (\Mux0~0_combout\ & ((!\Mux3~0_combout\) # (\Mux1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000101010001010100010101000110010000100100001001000010010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_Mux1~0_combout\,
	datac => \ALT_INV_Mux3~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr1~0_combout\);

-- Location: LABCELL_X18_Y2_N15
\decode7_0|WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decode7_0|WideOr0~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux1~0_combout\ & ((!\Mux3~0_combout\) # (\Mux0~0_combout\))) # (\Mux1~0_combout\ & ((!\Mux0~0_combout\))) ) ) # ( !\Mux2~0_combout\ & ( ((!\Mux0~0_combout\) # (\Mux1~0_combout\)) # 
-- (\Mux3~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101011111111111110101111110101111111100001010111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	datac => \ALT_INV_Mux1~0_combout\,
	datad => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \decode7_0|WideOr0~0_combout\);

-- Location: LABCELL_X15_Y2_N36
\ShiftLeft0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ShiftLeft0~0_combout\ = ( !digit(0) & ( digit(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_digit(1),
	dataf => ALT_INV_digit(0),
	combout => \ShiftLeft0~0_combout\);

-- Location: LABCELL_X15_Y2_N45
\Mux3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = ( digit(0) & ( digit(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_digit(1),
	dataf => ALT_INV_digit(0),
	combout => \Mux3~3_combout\);

-- Location: LABCELL_X21_Y2_N54
\kpdecode_0|Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector3~1_combout\ = (\kpr[2]~input_o\ & (!\colseq_0|current.D~q\ & !\colseq_0|current.B~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000001010000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datac => \colseq_0|ALT_INV_current.D~q\,
	datad => \colseq_0|ALT_INV_current.B~q\,
	combout => \kpdecode_0|Selector3~1_combout\);

-- Location: LABCELL_X21_Y2_N51
\kpdecode_0|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector3~0_combout\ = ( \colseq_0|current.D~q\ & ( (!\colseq_0|current.B~q\ & (!\kpr[2]~input_o\ $ (!\kpr[0]~input_o\))) ) ) # ( !\colseq_0|current.D~q\ & ( (!\kpr[2]~input_o\ & (\kpr[0]~input_o\ & \colseq_0|current.B~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \colseq_0|ALT_INV_current.B~q\,
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \kpdecode_0|Selector3~0_combout\);

-- Location: LABCELL_X21_Y2_N36
\kpdecode_0|Selector3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector3~2_combout\ = ( \kpr[3]~input_o\ & ( \kpr[1]~input_o\ & ( (!\colseq_0|current.C~q\ & (((\kpdecode_0|Selector3~0_combout\)))) # (\colseq_0|current.C~q\ & (\kpdecode_0|Selector3~1_combout\ & (!\kpr[0]~input_o\))) ) ) ) # ( 
-- !\kpr[3]~input_o\ & ( \kpr[1]~input_o\ & ( (\kpdecode_0|Selector3~1_combout\ & \kpr[0]~input_o\) ) ) ) # ( \kpr[3]~input_o\ & ( !\kpr[1]~input_o\ & ( (\kpdecode_0|Selector3~1_combout\ & \kpr[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100010001000100010001000100010000111101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \kpdecode_0|ALT_INV_Selector3~1_combout\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \kpdecode_0|ALT_INV_Selector3~0_combout\,
	datad => \colseq_0|ALT_INV_current.C~q\,
	datae => \ALT_INV_kpr[3]~input_o\,
	dataf => \ALT_INV_kpr[1]~input_o\,
	combout => \kpdecode_0|Selector3~2_combout\);

-- Location: LABCELL_X21_Y2_N24
\kpdecode_0|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector2~1_combout\ = ( \kpr[3]~input_o\ & ( !\colseq_0|current.D~q\ & ( (\kpr[1]~input_o\ & (!\colseq_0|current.B~q\ & (!\kpr[2]~input_o\ $ (!\kpr[0]~input_o\)))) ) ) ) # ( !\kpr[3]~input_o\ & ( !\colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ 
-- & (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & !\colseq_0|current.B~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000001100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \ALT_INV_kpr[1]~input_o\,
	datad => \colseq_0|ALT_INV_current.B~q\,
	datae => \ALT_INV_kpr[3]~input_o\,
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \kpdecode_0|Selector2~1_combout\);

-- Location: LABCELL_X21_Y2_N18
\kpdecode_0|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector2~0_combout\ = ( \kpr[3]~input_o\ & ( \colseq_0|current.D~q\ & ( (!\kpr[2]~input_o\ & (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & !\colseq_0|current.B~q\))) ) ) ) # ( !\kpr[3]~input_o\ & ( \colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ & 
-- (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & !\colseq_0|current.B~q\))) ) ) ) # ( \kpr[3]~input_o\ & ( !\colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ & (!\colseq_0|current.B~q\ & (!\kpr[0]~input_o\ $ (!\kpr[1]~input_o\)))) ) ) ) # ( !\kpr[3]~input_o\ & ( 
-- !\colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ & (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & \colseq_0|current.B~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000101000000000000000001000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \ALT_INV_kpr[1]~input_o\,
	datad => \colseq_0|ALT_INV_current.B~q\,
	datae => \ALT_INV_kpr[3]~input_o\,
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \kpdecode_0|Selector2~0_combout\);

-- Location: LABCELL_X21_Y2_N9
\kpdecode_0|Selector2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector2~2_combout\ = ( \kpdecode_0|Selector2~0_combout\ & ( (!\colseq_0|current.C~q\) # (\kpdecode_0|Selector2~1_combout\) ) ) # ( !\kpdecode_0|Selector2~0_combout\ & ( (\kpdecode_0|Selector2~1_combout\ & \colseq_0|current.C~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \kpdecode_0|ALT_INV_Selector2~1_combout\,
	datab => \colseq_0|ALT_INV_current.C~q\,
	dataf => \kpdecode_0|ALT_INV_Selector2~0_combout\,
	combout => \kpdecode_0|Selector2~2_combout\);

-- Location: LABCELL_X21_Y2_N0
\kpdecode_0|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector1~1_combout\ = ( \colseq_0|current.D~q\ & ( (!\kpr[1]~input_o\ & (!\colseq_0|current.B~q\ & \kpr[2]~input_o\)) ) ) # ( !\colseq_0|current.D~q\ & ( (!\kpr[1]~input_o\ & (!\colseq_0|current.B~q\ & \kpr[2]~input_o\)) # (\kpr[1]~input_o\ & 
-- (\colseq_0|current.B~q\ & !\kpr[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100000011000000110000001100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[1]~input_o\,
	datab => \colseq_0|ALT_INV_current.B~q\,
	datac => \ALT_INV_kpr[2]~input_o\,
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \kpdecode_0|Selector1~1_combout\);

-- Location: LABCELL_X21_Y2_N48
\kpdecode_0|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector1~0_combout\ = ( \colseq_0|current.C~q\ & ( (!\colseq_0|current.D~q\ & (!\kpr[2]~input_o\ $ (!\kpr[0]~input_o\))) ) ) # ( !\colseq_0|current.C~q\ & ( (!\kpr[2]~input_o\ & (\kpr[0]~input_o\ & !\colseq_0|current.D~q\)) # 
-- (\kpr[2]~input_o\ & (!\kpr[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010001100100011001000110010001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \colseq_0|ALT_INV_current.D~q\,
	dataf => \colseq_0|ALT_INV_current.C~q\,
	combout => \kpdecode_0|Selector1~0_combout\);

-- Location: LABCELL_X21_Y2_N3
\kpdecode_0|Selector1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector1~2_combout\ = (\kpr[1]~input_o\ & (!\colseq_0|current.B~q\ & \kpr[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000100000001000000010000000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[1]~input_o\,
	datab => \colseq_0|ALT_INV_current.B~q\,
	datac => \ALT_INV_kpr[3]~input_o\,
	combout => \kpdecode_0|Selector1~2_combout\);

-- Location: LABCELL_X21_Y2_N30
\kpdecode_0|Selector1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector1~3_combout\ = ( \kpdecode_0|Selector1~2_combout\ & ( \colseq_0|current.C~q\ & ( \kpdecode_0|Selector1~0_combout\ ) ) ) # ( \kpdecode_0|Selector1~2_combout\ & ( !\colseq_0|current.C~q\ & ( ((\kpdecode_0|Selector1~1_combout\ & 
-- (\kpr[0]~input_o\ & \kpr[3]~input_o\))) # (\kpdecode_0|Selector1~0_combout\) ) ) ) # ( !\kpdecode_0|Selector1~2_combout\ & ( !\colseq_0|current.C~q\ & ( (\kpdecode_0|Selector1~1_combout\ & (\kpr[0]~input_o\ & \kpr[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000011110001111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \kpdecode_0|ALT_INV_Selector1~1_combout\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \kpdecode_0|ALT_INV_Selector1~0_combout\,
	datad => \ALT_INV_kpr[3]~input_o\,
	datae => \kpdecode_0|ALT_INV_Selector1~2_combout\,
	dataf => \colseq_0|ALT_INV_current.C~q\,
	combout => \kpdecode_0|Selector1~3_combout\);

-- Location: LABCELL_X21_Y2_N42
\kpdecode_0|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector0~0_combout\ = ( \kpr[3]~input_o\ & ( \colseq_0|current.D~q\ & ( (!\kpr[2]~input_o\ & (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & !\colseq_0|current.C~q\))) ) ) ) # ( !\kpr[3]~input_o\ & ( \colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ & 
-- (\kpr[0]~input_o\ & (\kpr[1]~input_o\ & !\colseq_0|current.C~q\))) ) ) ) # ( \kpr[3]~input_o\ & ( !\colseq_0|current.D~q\ & ( (\kpr[2]~input_o\ & (\colseq_0|current.C~q\ & (!\kpr[0]~input_o\ $ (!\kpr[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001010000000001000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_kpr[2]~input_o\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \ALT_INV_kpr[1]~input_o\,
	datad => \colseq_0|ALT_INV_current.C~q\,
	datae => \ALT_INV_kpr[3]~input_o\,
	dataf => \colseq_0|ALT_INV_current.D~q\,
	combout => \kpdecode_0|Selector0~0_combout\);

-- Location: LABCELL_X21_Y2_N6
\kpdecode_0|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector0~1_combout\ = (!\colseq_0|current.C~q\ & (\kpr[2]~input_o\ & \kpr[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000110000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \colseq_0|ALT_INV_current.C~q\,
	datac => \ALT_INV_kpr[2]~input_o\,
	datad => \ALT_INV_kpr[3]~input_o\,
	combout => \kpdecode_0|Selector0~1_combout\);

-- Location: LABCELL_X21_Y2_N12
\kpdecode_0|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \kpdecode_0|Selector0~2_combout\ = ( \colseq_0|current.B~q\ & ( \kpdecode_0|Selector0~1_combout\ & ( (!\colseq_0|current.D~q\ & (\kpr[0]~input_o\ & !\kpr[1]~input_o\)) ) ) ) # ( !\colseq_0|current.B~q\ & ( \kpdecode_0|Selector0~1_combout\ & ( 
-- ((!\kpr[0]~input_o\ & ((\kpr[1]~input_o\))) # (\kpr[0]~input_o\ & (\colseq_0|current.D~q\ & !\kpr[1]~input_o\))) # (\kpdecode_0|Selector0~0_combout\) ) ) ) # ( !\colseq_0|current.B~q\ & ( !\kpdecode_0|Selector0~1_combout\ & ( 
-- \kpdecode_0|Selector0~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000011100111111110010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \colseq_0|ALT_INV_current.D~q\,
	datab => \ALT_INV_kpr[0]~input_o\,
	datac => \ALT_INV_kpr[1]~input_o\,
	datad => \kpdecode_0|ALT_INV_Selector0~0_combout\,
	datae => \colseq_0|ALT_INV_current.B~q\,
	dataf => \kpdecode_0|ALT_INV_Selector0~1_combout\,
	combout => \kpdecode_0|Selector0~2_combout\);

-- Location: MLABCELL_X14_Y3_N9
\comb_11|ADC_CONVST~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|ADC_CONVST~0_combout\ = ( !\comb_11|count\(1) & ( (!\comb_11|count[2]~DUPLICATE_q\ & (!\comb_11|count\(0) & (!\comb_11|count\(3) & \comb_11|state.A~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datab => \comb_11|ALT_INV_count\(0),
	datac => \comb_11|ALT_INV_count\(3),
	datad => \comb_11|ALT_INV_state.A~q\,
	dataf => \comb_11|ALT_INV_count\(1),
	combout => \comb_11|ADC_CONVST~0_combout\);

-- Location: LABCELL_X13_Y3_N33
\comb_11|ADC_SCK~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|ADC_SCK~0_combout\ = ( GLOBAL(\pll0|altpll_component|auto_generated|wire_generic_pll1_outclk~CLKENA0_outclk\) & ( \comb_11|state.C~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_11|ALT_INV_state.C~q\,
	dataf => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	combout => \comb_11|ADC_SCK~0_combout\);

-- Location: MLABCELL_X14_Y3_N57
\comb_11|ADC_SDI~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|ADC_SDI~0_combout\ = ( \comb_11|state.B~q\ & ( \comb_11|count\(3) & ( (\comb_11|state.C~q\ & (((!\comb_11|count\(0)) # (\comb_11|count[2]~DUPLICATE_q\)) # (\comb_11|count\(1)))) ) ) ) # ( !\comb_11|state.B~q\ & ( \comb_11|count\(3) & ( 
-- (\comb_11|state.C~q\ & (((!\comb_11|count\(0)) # (\comb_11|count[2]~DUPLICATE_q\)) # (\comb_11|count\(1)))) ) ) ) # ( \comb_11|state.B~q\ & ( !\comb_11|count\(3) & ( (!\comb_11|count\(1) & (!\comb_11|count[2]~DUPLICATE_q\ & ((!\comb_11|count\(0)) # 
-- (\comb_11|state.C~q\)))) ) ) ) # ( !\comb_11|state.B~q\ & ( !\comb_11|count\(3) & ( (!\comb_11|count\(1) & (\comb_11|count\(0) & (!\comb_11|count[2]~DUPLICATE_q\ & \comb_11|state.C~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000100000001010000000000000110111110000000011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_count\(1),
	datab => \comb_11|ALT_INV_count\(0),
	datac => \comb_11|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \comb_11|ALT_INV_state.C~q\,
	datae => \comb_11|ALT_INV_state.B~q\,
	dataf => \comb_11|ALT_INV_count\(3),
	combout => \comb_11|ADC_SDI~0_combout\);

-- Location: MLABCELL_X14_Y3_N0
\comb_11|ADC_SDI~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_11|ADC_SDI~1_combout\ = ( \kpdecode_0|Selector2~2_combout\ & ( \comb_11|Add0~0_combout\ & ( (\comb_11|ADC_SDI~0_combout\ & ((!\comb_11|next_count[0]~0_combout\ & ((\kpdecode_0|Selector3~2_combout\))) # (\comb_11|next_count[0]~0_combout\ & 
-- (\kpdecode_0|Selector1~3_combout\)))) ) ) ) # ( !\kpdecode_0|Selector2~2_combout\ & ( \comb_11|Add0~0_combout\ & ( (\comb_11|ADC_SDI~0_combout\ & ((!\comb_11|next_count[0]~0_combout\ & ((\kpdecode_0|Selector3~2_combout\))) # 
-- (\comb_11|next_count[0]~0_combout\ & (\kpdecode_0|Selector1~3_combout\)))) ) ) ) # ( \kpdecode_0|Selector2~2_combout\ & ( !\comb_11|Add0~0_combout\ & ( \comb_11|ADC_SDI~0_combout\ ) ) ) # ( !\kpdecode_0|Selector2~2_combout\ & ( !\comb_11|Add0~0_combout\ & 
-- ( (\comb_11|next_count[0]~0_combout\ & \comb_11|ADC_SDI~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001001100110011001100000001001000110000000100100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_11|ALT_INV_next_count[0]~0_combout\,
	datab => \comb_11|ALT_INV_ADC_SDI~0_combout\,
	datac => \kpdecode_0|ALT_INV_Selector1~3_combout\,
	datad => \kpdecode_0|ALT_INV_Selector3~2_combout\,
	datae => \kpdecode_0|ALT_INV_Selector2~2_combout\,
	dataf => \comb_11|ALT_INV_Add0~0_combout\,
	combout => \comb_11|ADC_SDI~1_combout\);

-- Location: FF_X14_Y3_N1
\comb_11|ADC_SDI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll0|altpll_component|auto_generated|ALT_INV_wire_generic_pll1_outclk~CLKENA0_outclk\,
	d => \comb_11|ADC_SDI~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_11|ADC_SDI~q\);

-- Location: LABCELL_X30_Y17_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


