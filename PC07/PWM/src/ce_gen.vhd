
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ce_gen IS
  GENERIC (
    G_DIV_FACT : POSITIVE := 2
  );
  PORT (
    CLK : IN STD_LOGIC;
    SRST : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    CE_O : OUT STD_LOGIC
  );
END ENTITY ce_gen;

ARCHITECTURE Behavioral OF ce_gen IS
  SIGNAL cnt : POSITIVE RANGE 1 TO G_DIV_FACT := 1;
BEGIN

  clk_en_gen : PROCESS (CLK) BEGIN
    IF rising_edge(CLK) THEN
      IF cnt = G_DIV_FACT THEN
        cnt <= 1;
        CE_O <= '1';
      ELSE
        cnt <= cnt + 1;
        CE_O <= '0';
      END IF;
    END IF;
  END PROCESS clk_en_gen;
  
END ARCHITECTURE Behavioral;