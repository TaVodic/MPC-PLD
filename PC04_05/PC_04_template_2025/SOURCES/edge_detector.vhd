
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY edge_detector IS
  PORT(
    CLK                 : IN    STD_LOGIC;
    SIG_IN              : IN    STD_LOGIC;
    EDGE_POS            : OUT   STD_LOGIC;
    EDGE_NEG            : OUT   STD_LOGIC;
    EDGE_ANY            : OUT   STD_LOGIC
  );
END ENTITY edge_detector;

ARCHITECTURE Behavioral OF edge_detector IS

    SIGNAL Btn_delayed : STD_LOGIC;

BEGIN

PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN
        IF SIG_IN = '1' THEN -- reset
            Btn_delayed <= '1';
            EDGE_POS <= '1';
            EDGE_ANY <= '1';
        ELSE
            Btn_delayed <= '0';
            EDGE_NEG <= '1';
            EDGE_ANY <= '1';
        END IF;
        IF SIG_IN = '1' AND Btn_delayed = '1' THEN -- reset
            EDGE_POS <= '0';
            EDGE_ANY <= '0';
        END IF;
        IF SIG_IN = '0' AND Btn_delayed = '0' THEN -- reset
            EDGE_NEG <= '0';
            EDGE_ANY <= '0';
        END IF;        
    END IF;
END PROCESS;


END ARCHITECTURE Behavioral;

