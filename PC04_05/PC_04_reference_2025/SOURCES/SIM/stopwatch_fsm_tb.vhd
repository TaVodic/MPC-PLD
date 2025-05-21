----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
entity stopwatch_fsm_tb is
end stopwatch_fsm_tb;
----------------------------------------------------------------------------------
architecture Behavioral of stopwatch_fsm_tb is
----------------------------------------------------------------------------------

  COMPONENT stopwatch_fsm
  PORT (
    CLK             : IN  STD_LOGIC;
    BTN_S_S         : IN  STD_LOGIC;
    BTN_L_C         : IN  STD_LOGIC;
    CNT_RESET       : OUT STD_LOGIC;
    CNT_ENABLE      : OUT STD_LOGIC;
    DISP_ENABLE     : OUT STD_LOGIC
  );
  END COMPONENT;

  --------------------------------------------------------------------------------

  CONSTANT C_CLK_PERIOD       : TIME := 10 ns;

  -- UUT inputs
  SIGNAL clk                : STD_LOGIC := '0';
  SIGNAL btn_s_s            : STD_LOGIC := '0';
  SIGNAL btn_l_c            : STD_LOGIC := '0';

  -- UUT outputs
  SIGNAL cnt_reset          : STD_LOGIC;
  SIGNAL cnt_enable         : STD_LOGIC;
  SIGNAL disp_enable        : STD_LOGIC;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  stopwatch_fsm_i : stopwatch_fsm
  PORT MAP(
    CLK             => clk,
    BTN_S_S         => btn_s_s,
    BTN_L_C         => btn_l_c,
    CNT_RESET       => cnt_reset,
    CNT_ENABLE      => cnt_enable,
    DISP_ENABLE     => disp_enable
  );

  --------------------------------------------------------------------------------

  proc_clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR C_CLK_PERIOD/2;
    clk <= '1';
    WAIT FOR C_CLK_PERIOD/2;
  END PROCESS proc_clk_gen;

  --------------------------------------------------------------------------------

  proc_fsm_input_emulator: PROCESS
  BEGIN

    btn_s_s <= '0';
    btn_l_c <= '0';
    WAIT FOR C_CLK_PERIOD * 100;

    -- stay in IDLE
    btn_s_s <= '0'; btn_l_c <= '1'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to RUN
    btn_s_s <= '1'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to STOP
    btn_s_s <= '1'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to RUN
    btn_s_s <= '1'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to LAP
    btn_s_s <= '0'; btn_l_c <= '1'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to REFRESH
    btn_s_s <= '0'; btn_l_c <= '1'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to RUN
    btn_s_s <= '1'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to STOP
    btn_s_s <= '1'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;

    -- go to IDLE
    btn_s_s <= '0'; btn_l_c <= '1'; WAIT FOR C_CLK_PERIOD * 1; btn_s_s <= '0'; btn_l_c <= '0'; WAIT FOR C_CLK_PERIOD * 1000;




    REPORT CR &
           "================================================================" & CR &
           "Simulation finished! (not a failure)" & CR &
           "================================================================" SEVERITY FAILURE;

  END PROCESS proc_fsm_input_emulator;

----------------------------------------------------------------------------------
end Behavioral;
----------------------------------------------------------------------------------
