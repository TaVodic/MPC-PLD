----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY rp_top IS
  PORT(
    CLK             : IN  STD_LOGIC;
    BTN             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    SW              : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    LED             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_SEG        : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_DIG        : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END ENTITY rp_top;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF rp_top IS
----------------------------------------------------------------------------------

  
  COMPONENT pwm_driver
  PORT (
    CLK                 : IN  STD_LOGIC;
    PWM_REF_7           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_6           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_5           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_4           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_3           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_2           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_1           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_0           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_OUT             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    CNT_OUT             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    CE                  : IN STD_LOGIC
  );
  END COMPONENT;
  
  COMPONENT ce_gen
  GENERIC (
    G_DIV_FACT          : POSITIVE := 2
  );
  PORT (
    CLK                 : IN  STD_LOGIC;
    SRST                : IN  STD_LOGIC;
    CE                  : IN  STD_LOGIC;
    CE_O                : OUT STD_LOGIC 
  );
  END COMPONENT ce_gen;
  
  SIGNAL pwm_ref_7      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_6      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_5      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_4      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_3      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_2      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_1      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_0      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');

  SIGNAL pwm_out        : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL cnt_out        : STD_LOGIC_VECTOR (7 DOWNTO 0);
  
  SIGNAL ce_div         : STD_LOGIC := '0';

BEGIN
----------------------------------------------------------------------------------

  --------------------------------------------------------------------------------
  -- display driver
  --
  --       DIG 1       DIG 2       DIG 3       DIG 4
  --                                       L3
  --       -----       -----       -----   o   -----
  --      |     |     |     |  L1 |     |     |     |
  --      |     |     |     |  o  |     |     |     |
  --       -----       -----       -----       -----
  --      |     |     |     |  o  |     |     |     |
  --      |     |     |     |  L2 |     |     |     |
  --       -----  o    -----  o    -----  o    -----  o
  --             DP1         DP2         DP3         DP4
  --
  --------------------------------------------------------------------------------

  pwm_driver_i : pwm_driver
  PORT MAP(
    CLK                 => clk,
    PWM_REF_7           => pwm_ref_7,
    PWM_REF_6           => pwm_ref_6,
    PWM_REF_5           => pwm_ref_5,
    PWM_REF_4           => pwm_ref_4,
    PWM_REF_3           => pwm_ref_3,
    PWM_REF_2           => pwm_ref_2,
    PWM_REF_1           => pwm_ref_1,
    PWM_REF_0           => pwm_ref_0,
    PWM_OUT             => pwm_out,
    CNT_OUT             => cnt_out,
    CE                  => ce_div
  );
  
  ce_gen_i : ce_gen
  GENERIC MAP(
    G_DIV_FACT                  => 5000000 --5000000
  )
  PORT MAP(
    clk                         => clk,
    srst                        => '0',
    ce                          => '1',
    ce_o                        => ce_div
  );
  
  -- initialize PWM references
    pwm_ref_0 <= "00000000";
    pwm_ref_1 <= "00000001";
    pwm_ref_2 <= "00000011";
    pwm_ref_3 <= "00000111";
    pwm_ref_4 <= "00011111";
    pwm_ref_5 <= "00111111";
    pwm_ref_6 <= "01111111";
    pwm_ref_7 <= "11111111";
                    
  --------------------------------------------------------------------------------
  -- LED connection

  LED <= pwm_out;

----------------------------------------------------------------------------------
END ARCHITECTURE Structural;
----------------------------------------------------------------------------------
