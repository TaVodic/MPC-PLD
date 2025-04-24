--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Thu Apr 24 08:49:54 2025
--Host        : PC-075 running 64-bit major release  (build 9200)
--Command     : generate_target rp_zynq_wrapper.bd
--Design      : rp_zynq_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity rp_zynq_wrapper is
  port (
    -- DDR interface 
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    -- fixed IO of processor
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    
    -- PL FPGA programable logic IOs
    --UART_0_0_rxd : in STD_LOGIC;
    --UART_0_0_txd : out STD_LOGIC;
    --gpio_rtl_0_tri_io : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    
    BTN             : IN  STD_LOGIC_VECTOR (1 TO 4);
    SW              : IN  STD_LOGIC_VECTOR (1 TO 4);
    LED             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    UART_TXD        : OUT  STD_LOGIC;
    UART_RXD        : IN  STD_LOGIC
  );
end rp_zynq_wrapper;

architecture STRUCTURE of rp_zynq_wrapper is
  component rp_zynq is
  port (
    gpio_rtl_0_tri_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_rtl_0_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_rtl_0_tri_t : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    UART_0_0_txd : out STD_LOGIC;
    UART_0_0_rxd : in STD_LOGIC
  );
  end component rp_zynq;
  
  SIGNAL gpio_rtl_0_tri_i : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL gpio_rtl_0_tri_o : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
begin

rp_zynq_i: component rp_zynq
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      -- UART
      UART_0_0_rxd => UART_RXD,
      UART_0_0_txd => UART_TXD,
      -- GPIO
      gpio_rtl_0_tri_i => gpio_rtl_0_tri_i,
      gpio_rtl_0_tri_o => gpio_rtl_0_tri_o,
      gpio_rtl_0_tri_t => OPEN
    );
    
    -- GPIO inputs
    gpio_rtl_0_tri_i(3 DOWNTO 0) <= SW;
    gpio_rtl_0_tri_i(7 DOWNTO 4) <= BTN;
    gpio_rtl_0_tri_i(31 DOWNTO 8) <= (OTHERS => '0');
    
    -- GPIO outputs
    LED <= gpio_rtl_0_tri_o(15 DOWNTO 8);    
    
end STRUCTURE;
