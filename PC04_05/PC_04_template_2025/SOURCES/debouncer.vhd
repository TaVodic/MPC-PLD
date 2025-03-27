
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY debouncer IS
  GENERIC(
    G_DEB_PERIOD        : POSITIVE := 3
  );    
  PORT( 
    CLK                 : IN    STD_LOGIC;
    CE                  : IN    STD_LOGIC;
    BTN_IN              : IN    STD_LOGIC;
    BTN_OUT             : OUT   STD_LOGIC
  );
END ENTITY debouncer;

ARCHITECTURE Behavioral OF debouncer IS

  SIGNAL shreg : STD_LOGIC_VECTOR(5 DOWNTO 0);

BEGIN
  
  PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN
      IF CE = '1' THEN
        shreg <= shreg (4 DOWNTO 0) & BTN_IN;
      END IF;
    END IF;
  END PROCESS;


  PROCESS (CLK) BEGIN
    IF rising_edge(clk) THEN
      IF shreg = "111111" THEN
        BTN_OUT <= '1';
      END IF;
      IF shreg = "000000" THEN
        BTN_OUT <= '0';
      END IF;
    END IF;
  END PROCESS;
  
END ARCHITECTURE Behavioral;

