----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY rp_top IS
  PORT(
    CLK                 : IN  STD_LOGIC;
    BTN                 : IN  STD_LOGIC_VECTOR (1 TO 4);
    SW                  : IN  STD_LOGIC_VECTOR (1 TO 4);
    LED                 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_SEG            : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_DIG            : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END ENTITY rp_top;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF rp_top IS
----------------------------------------------------------------------------------

  COMPONENT seg_disp_driver
  PORT(
    CLK                 : IN  STD_LOGIC;
    DIG_1               : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_2               : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_3               : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_4               : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DP                  : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
    DOTS                : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
    DISP_SEG            : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_DIG            : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
  END COMPONENT seg_disp_driver;

  ------------------------------------------------------------------------------

  COMPONENT btn_in
  GENERIC(
    G_DEB_PERIOD        : POSITIVE := 3
  );
  PORT(
    CLK                 : IN    STD_LOGIC;
    CE                  : IN    STD_LOGIC;
    BTN                 : IN    STD_LOGIC;
    BTN_DEBOUNCED       : OUT   STD_LOGIC;
    BTN_EDGE_POS        : OUT   STD_LOGIC;
    BTN_EDGE_NEG        : OUT   STD_LOGIC;
    BTN_EDGE_ANY        : OUT   STD_LOGIC
  );
  END COMPONENT btn_in;

  ------------------------------------------------------------------------------

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

  ------------------------------------------------------------------------------

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
    CNT_OUT             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
  END COMPONENT;
  
  COMPONENT ila_0
    PORT (
        clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	    probe3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
    END COMPONENT  ;
    
  COMPONENT VIO_PWM
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out8 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out9 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out10 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out11 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
  );
END COMPONENT;

  --------------------------------------------------------------------------------

  SIGNAL ce_100hz           : STD_LOGIC;

  SIGNAL btn_debounced      : STD_LOGIC_VECTOR(1 TO 4);
  SIGNAL btn_edge_pos       : STD_LOGIC_VECTOR(1 TO 4);
  SIGNAL btn_edge_neg       : STD_LOGIC_VECTOR(1 TO 4);
  SIGNAL btn_edge_any       : STD_LOGIC_VECTOR(1 TO 4);

  CONSTANT C_PWM_REF_7      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000001";
  CONSTANT C_PWM_REF_6      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000011";
  CONSTANT C_PWM_REF_5      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000111";
  CONSTANT C_PWM_REF_4      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00001111";
  CONSTANT C_PWM_REF_3      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00011111";
  CONSTANT C_PWM_REF_2      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00111111";
  CONSTANT C_PWM_REF_1      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "01111111";
  CONSTANT C_PWM_REF_0      : STD_LOGIC_VECTOR (7 DOWNTO 0) := "11111111";
  
  SIGNAL pwm_ref_7      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_6      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_5      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_4      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_3      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_2      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_1      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_0      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  
  SIGNAL s_DIG_1      : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_DIG_2      : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_DIG_3      : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_DIG_4      : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');

  SIGNAL pwm_out            : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL cnt_out            : STD_LOGIC_VECTOR (7 DOWNTO 0);

----------------------------------------------------------------------------------
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
  
  ILA_PWM_i : ila_0
    PORT MAP (
        clk => clk,
        probe0 => pwm_out,
        probe1 => cnt_out,
        probe2 => BTN,
	    probe3 => SW
    );
    
  VIO_PWM_i : VIO_PWM
  PORT MAP (
    clk => clk,
    probe_in0 => pwm_out,
    probe_in1 => cnt_out,
    probe_out0 => pwm_ref_0,
    probe_out1 => pwm_ref_1,
    probe_out2 => pwm_ref_2,
    probe_out3 => pwm_ref_3,
    probe_out4 => pwm_ref_4,
    probe_out5 => pwm_ref_5,
    probe_out6 => pwm_ref_6,
    probe_out7 => pwm_ref_7,
    probe_out8 => s_DIG_1,
    probe_out9 => s_DIG_2,
    probe_out10 => s_DIG_3,
    probe_out11 => s_DIG_4
  );

  seg_disp_driver_i : seg_disp_driver
  PORT MAP(
    CLK                 => CLK,
    DIG_1               => s_DIG_1,
    DIG_2               => s_DIG_2,
    DIG_3               => s_DIG_3,
    DIG_4               => s_DIG_4,
    DP                  => "0000",
    DOTS                => "000",
    DISP_SEG            => DISP_SEG,
    DISP_DIG            => DISP_DIG
  );


  --------------------------------------------------------------------------------
  -- 100 Hz clock enable generator

  ce_gen_i : ce_gen
  GENERIC MAP(
    G_DIV_FACT          => 500000
  )
  PORT MAP(
    CLK                 => CLK,
    SRST                => '0',
    CE                  => '1',
    CE_O                => ce_100hz
  );


  --------------------------------------------------------------------------------
  -- button input module

  gen_btn_in: FOR i IN 1 TO 4 GENERATE
    btn_in_i : btn_in
    GENERIC MAP(
      G_DEB_PERIOD        => 5
    )
    PORT MAP(
      CLK                 => CLK,
      CE                  => ce_100hz,
      BTN                 => BTN(i),
      BTN_DEBOUNCED       => btn_debounced(i),
      BTN_EDGE_POS        => btn_edge_pos(i),
      BTN_EDGE_NEG        => btn_edge_neg(i),
      BTN_EDGE_ANY        => btn_edge_any(i)
    );
  END GENERATE gen_btn_in;


  ----------------------------------------------------------------------------------------------------------
  -- PWM driver

  pwm_driver_i : pwm_driver
  PORT MAP(
    CLK                 => CLK,
    PWM_REF_7           => pwm_ref_7,
    PWM_REF_6           => pwm_ref_6,
    PWM_REF_5           => pwm_ref_5,
    PWM_REF_4           => pwm_ref_4,
    PWM_REF_3           => pwm_ref_3,
    PWM_REF_2           => pwm_ref_2,
    PWM_REF_1           => pwm_ref_1,
    PWM_REF_0           => pwm_ref_0,
    PWM_OUT             => pwm_out,
    CNT_OUT             => cnt_out
  );

  --------------------------------------------------------------------------------

  LED <= pwm_out;

----------------------------------------------------------------------------------
END ARCHITECTURE Structural;
----------------------------------------------------------------------------------
