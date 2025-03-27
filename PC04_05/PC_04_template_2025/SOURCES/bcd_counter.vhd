----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
ENTITY bcd_counter IS
  PORT (
    CLK : IN STD_LOGIC; -- clock signal
    CE_100HZ : IN STD_LOGIC; -- 100 Hz clock enable
    CNT_RESET : IN STD_LOGIC; -- counter reset
    CNT_ENABLE : IN STD_LOGIC; -- counter enable
    DISP_ENABLE : IN STD_LOGIC; -- enable display update
    CNT_0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY bcd_counter;

ARCHITECTURE Behavioral OF bcd_counter IS

  SIGNAL cnt_0_reg : UNSIGNED (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_1_reg : UNSIGNED (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_2_reg : UNSIGNED (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_3_reg : UNSIGNED (3 DOWNTO 0) := (OTHERS => '0');

BEGIN

  -- BCD counter
  BCD_counter : PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN
      IF CNT_RESET = '1' THEN
        cnt_0_reg <= (OTHERS => '0');
        cnt_1_reg <= (OTHERS => '0');
        cnt_2_reg <= (OTHERS => '0');
        cnt_3_reg <= (OTHERS => '0');
      ELSE
        IF CE_100HZ = '1' AND CNT_ENABLE = '1' THEN
          IF cnt_0_reg = X"9" THEN
            cnt_0_reg <= (OTHERS => '0');
            cnt_1_reg <= cnt_1_reg + 1;
          ELSE
            cnt_0_reg <= cnt_0_reg + 1;
          END IF;

          IF cnt_1_reg = X"9" AND cnt_0_reg = X"9" THEN
            cnt_1_reg <= (OTHERS => '0');
            cnt_2_reg <= cnt_2_reg + 1;
          END IF;

          IF cnt_2_reg = X"9" AND cnt_1_reg = X"9" AND cnt_0_reg = X"9" THEN
            cnt_2_reg <= (OTHERS => '0');
            cnt_3_reg <= cnt_3_reg + 1;
          END IF;

          IF cnt_3_reg = X"9" AND cnt_2_reg = X"9" AND cnt_1_reg = X"9" AND cnt_0_reg = X"9" THEN
            cnt_3_reg <= (OTHERS => '0');
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS BCD_counter;

  -- Output (display) register
  BCD_counter_REG : PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN
      IF DISP_ENABLE = '1' THEN
        CNT_0 <= STD_LOGIC_VECTOR(cnt_0_reg);
        CNT_1 <= STD_LOGIC_VECTOR(cnt_1_reg);
        CNT_2 <= STD_LOGIC_VECTOR(cnt_2_reg);
        CNT_3 <= STD_LOGIC_VECTOR(cnt_3_reg);
      END IF;
    END IF;
  END PROCESS BCD_counter_REG;

END ARCHITECTURE Behavioral;