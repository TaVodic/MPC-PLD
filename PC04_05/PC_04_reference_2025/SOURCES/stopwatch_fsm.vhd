--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY stopwatch_fsm IS
  PORT (
    CLK                 : IN    STD_LOGIC;
    BTN_S_S             : IN    STD_LOGIC;
    BTN_L_C             : IN    STD_LOGIC;
    CNT_RESET           : OUT   STD_LOGIC;
    CNT_ENABLE          : OUT   STD_LOGIC;
    DISP_ENABLE         : OUT   STD_LOGIC
  );
END ENTITY stopwatch_fsm;
--------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF stopwatch_fsm IS
--------------------------------------------------------------------------------

  TYPE t_state IS (ST_IDLE, ST_RUN, ST_LAP, ST_REFRESH, ST_STOP);
  SIGNAL pres_state     : t_state := ST_IDLE;
  SIGNAL next_state     : t_state;

  SIGNAL cnt_enable_i   : STD_LOGIC := '0';
  SIGNAL cnt_reset_i    : STD_LOGIC := '0';
  SIGNAL disp_enable_i  : STD_LOGIC := '0';

--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------


  ------------------------------------------------------------------------------
  -- FSM next state logic
  ------------------------------------------------------------------------------

  proc_fsm_next_state_logic: PROCESS (pres_state, BTN_S_S, BTN_L_C) BEGIN

    next_state <= pres_state;       -- default assignment (= latch prevention)

    CASE pres_state IS
      WHEN ST_IDLE    =>  IF BTN_S_S = '1' THEN next_state <= ST_RUN;     END IF;

      WHEN ST_RUN     =>  IF BTN_S_S = '1' THEN next_state <= ST_STOP;    END IF;
                          IF BTN_L_C = '1' THEN next_state <= ST_LAP;     END IF;

      WHEN ST_STOP    =>  IF BTN_S_S = '1' THEN next_state <= ST_RUN;     END IF;
                          IF BTN_L_C = '1' THEN next_state <= ST_IDLE;    END IF;

      WHEN ST_LAP     =>  IF BTN_S_S = '1' THEN next_state <= ST_RUN;     END IF;
                          IF BTN_L_C = '1' THEN next_state <= ST_REFRESH; END IF;

      WHEN ST_REFRESH =>                        next_state <= ST_LAP;

    END CASE;
  END PROCESS proc_fsm_next_state_logic;


  ------------------------------------------------------------------------------
  -- FSM state register
  ------------------------------------------------------------------------------

  proc_state_reg: PROCESS (CLK) BEGIN
    IF rising_edge(CLK) THEN
      pres_state <= next_state;
    END IF;
  END PROCESS proc_state_reg;


  ------------------------------------------------------------------------------
  -- FSM output logic (decoder)
  ------------------------------------------------------------------------------

  proc_output_logic: PROCESS (pres_state) BEGIN
    CASE pres_state IS
        WHEN ST_IDLE    =>  cnt_enable_i  <= '0';
                            cnt_reset_i   <= '1';
                            disp_enable_i <= '1';

        WHEN ST_RUN     =>  cnt_enable_i  <= '1';
                            cnt_reset_i   <= '0';
                            disp_enable_i <= '1';

        WHEN ST_STOP    =>  cnt_enable_i  <= '0';
                            cnt_reset_i   <= '0';
                            disp_enable_i <= '1';

        WHEN ST_LAP     =>  cnt_enable_i  <= '1';
                            cnt_reset_i   <= '0';
                            disp_enable_i <= '0';

        WHEN ST_REFRESH =>  cnt_enable_i  <= '1';
                            cnt_reset_i   <= '0';
                            disp_enable_i <= '1';
    END CASE;
  END PROCESS proc_output_logic;


  ------------------------------------------------------------------------------
  -- FSM output register
  ------------------------------------------------------------------------------

  proc_output_reg: PROCESS (CLK) BEGIN
    IF rising_edge(CLK) THEN
      cnt_enable  <= cnt_enable_i;
      cnt_reset   <= cnt_reset_i;
      disp_enable <= disp_enable_i;
    END IF;
  END PROCESS proc_output_reg;


--------------------------------------------------------------------------------
END ARCHITECTURE Behavioral;
--------------------------------------------------------------------------------
