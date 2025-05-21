----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
ENTITY bcd_counter IS
  PORT(
    CLK                 : IN    STD_LOGIC;      -- clock signal
    CE_100HZ            : IN    STD_LOGIC;      -- 100 Hz clock enable
    CNT_RESET           : IN    STD_LOGIC;      -- counter reset
    CNT_ENABLE          : IN    STD_LOGIC;      -- counter enable
    DISP_ENABLE         : IN    STD_LOGIC;      -- enable display update
    CNT_0               : OUT   STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_1               : OUT   STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_2               : OUT   STD_LOGIC_VECTOR(3 DOWNTO 0);
    CNT_3               : OUT   STD_LOGIC_VECTOR(3 DOWNTO 0);
    LED                 : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END ENTITY bcd_counter;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF bcd_counter IS
----------------------------------------------------------------------------------

  SIGNAL cnt_0_uns      : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_1_uns      : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_2_uns      : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_3_uns      : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');

  SIGNAL cnt_0_reg      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_1_reg      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_2_reg      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_3_reg      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------
  -- BCD counter

  proc_bcd_counter: PROCESS (CLK) BEGIN
    IF rising_edge(CLK) THEN

      -- synchronous reset
      IF CNT_RESET = '1' THEN
        cnt_0_uns  <= (OTHERS => '0');
        cnt_1_uns  <= (OTHERS => '0');
        cnt_2_uns  <= (OTHERS => '0');
        cnt_3_uns  <= (OTHERS => '0');
      ELSE

        -- clock enable
        IF CE_100HZ = '1' AND CNT_ENABLE = '1' THEN

          cnt_0_uns <= cnt_0_uns + 1;
          IF cnt_0_uns = X"9" THEN
            cnt_0_uns <= X"0";

            cnt_1_uns <= cnt_1_uns + 1;
            IF cnt_1_uns = X"9" THEN
              cnt_1_uns <= X"0";

              cnt_2_uns <= cnt_2_uns + 1;
              IF cnt_2_uns = X"9" THEN
                cnt_2_uns <= X"0";

                cnt_3_uns <= cnt_3_uns + 1;
                IF cnt_3_uns = X"5" THEN
                  cnt_3_uns <= X"0";

                END IF;
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS proc_bcd_counter;

  --------------------------------------------------------------------------------
  -- Output (display) register

  proc_display_reg: PROCESS (CLK) BEGIN
    IF rising_edge(CLK) THEN
      IF DISP_ENABLE = '1' THEN
        cnt_0_reg <= STD_LOGIC_VECTOR(cnt_0_uns);
        cnt_1_reg <= STD_LOGIC_VECTOR(cnt_1_uns);
        cnt_2_reg <= STD_LOGIC_VECTOR(cnt_2_uns);
        cnt_3_reg <= STD_LOGIC_VECTOR(cnt_3_uns);
      END IF;
    END IF;
  END PROCESS proc_display_reg;

  CNT_0 <= cnt_0_reg;
  CNT_1 <= cnt_1_reg;
  CNT_2 <= cnt_2_reg;
  CNT_3 <= cnt_3_reg;

  --------------------------------------------------------------------------------

  LED <= STD_LOGIC_VECTOR(cnt_3_uns & cnt_2_uns);

----------------------------------------------------------------------------------
END ARCHITECTURE Behavioral;
----------------------------------------------------------------------------------
