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
    DISP_DIG            : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    UART_TXD            : OUT STD_LOGIC;
    UART_RXD            : IN  STD_LOGIC
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

  COMPONENT embedded_kcpsm6
  PORT (
    port_id             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    write_strobe        : OUT STD_LOGIC;
    k_write_strobe      : OUT STD_LOGIC;
    read_strobe         : OUT STD_LOGIC;
    out_port            : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    in_port             : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    interrupt           : IN  STD_LOGIC;
    clk                 : IN  STD_LOGIC
  );
  END COMPONENT embedded_kcpsm6;
  
  
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
  
  COMPONENT ce_gen
  GENERIC (
    G_DIV_FACT : POSITIVE := 2
  );
  PORT (
    CLK : IN STD_LOGIC;
    SRST : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    CE_O : OUT STD_LOGIC
  );
  END COMPONENT ce_gen;
  
  COMPONENT uart_tx
    PORT(
        CLK : IN STD_LOGIC;
        TX_START : IN STD_LOGIC;
        CLK_EN : IN STD_LOGIC;
        DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        TX_BUSY : OUT STD_LOGIC;
        TX_DATA_OUT : OUT STD_LOGIC
    );
  END COMPONENT uart_tx;


  ------------------------------------------------------------------------------
  -- PicoBlaze interface signals
  ------------------------------------------------------------------------------

  SIGNAL port_id            : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL write_strobe       : STD_LOGIC;
  SIGNAL k_write_strobe     : STD_LOGIC;
  SIGNAL read_strobe        : STD_LOGIC;
  SIGNAL out_port           : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL in_port            : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL interrupt          : STD_LOGIC;
  SIGNAL interrupt_ack      : STD_LOGIC;


  ------------------------------------------------------------------------------
  -- PicoBlaze registers
  ------------------------------------------------------------------------------

  SIGNAL led_reg            : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"00";

  SIGNAL dig_1_reg          : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dig_2_reg          : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dig_3_reg          : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dig_4_reg          : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dp_reg             : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dots_reg           : STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');
  
  
  SIGNAL pwm_ref_7      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_6      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_5      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_4      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_3      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_2      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_1      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_0      : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_out        : STD_LOGIC_VECTOR (7 DOWNTO 0);
  
  SIGNAL ce_baud           : STD_LOGIC;
  SIGNAL uart_data         : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL tx_start          : STD_LOGIC;
  SIGNAL tx_busy           : STD_LOGIC;


  --------------------------------------------------------------------------------
  -- PicoBlaze address space definition
  ------------------------------------------------------------------------------

  CONSTANT ID_BTN           : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"00";
  CONSTANT ID_SW            : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"01";
  CONSTANT ID_LED           : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"02";
  CONSTANT ID_7SEG_DIG_1    : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"03";
  CONSTANT ID_7SEG_DIG_2    : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"04";
  CONSTANT ID_7SEG_DIG_3    : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"05";
  CONSTANT ID_7SEG_DIG_4    : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"06";
  CONSTANT ID_7SEG_DP       : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"07";
  CONSTANT ID_7SEG_DOTS     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"08";
  
  CONSTANT ID_PWM_REF_7     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"09";
  CONSTANT ID_PWM_REF_6     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"10";
  CONSTANT ID_PWM_REF_5     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"11";
  CONSTANT ID_PWM_REF_4     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"12";
  CONSTANT ID_PWM_REF_3     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"13";
  CONSTANT ID_PWM_REF_2     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"14";  
  CONSTANT ID_PWM_REF_1     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"15";
  CONSTANT ID_PWM_REF_0     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"16";
  
  CONSTANT ID_UART_DATA     : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"17";
  CONSTANT ID_TX_START      : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"18";
  CONSTANT ID_TX_BUSY       : STD_LOGIC_VECTOR( 7 DOWNTO 0) := X"19";
  

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

  seg_disp_driver_i : seg_disp_driver
  PORT MAP(
    CLK                 => CLK,
    DIG_1               => dig_1_reg,
    DIG_2               => dig_2_reg,
    DIG_3               => dig_3_reg,
    DIG_4               => dig_4_reg,
    DP                  => dp_reg,
    DOTS                => dots_reg,
    DISP_SEG            => DISP_SEG,
    DISP_DIG            => DISP_DIG
  );


  --------------------------------------------------------------------------------
  -- PicoBlaze (KCPSM6 core) with its program memory
  --------------------------------------------------------------------------------

  embedded_kcpsm6_i : embedded_kcpsm6
  PORT MAP (
    port_id         => port_id,
    write_strobe    => write_strobe,
    k_write_strobe  => k_write_strobe,
    read_strobe     => read_strobe,
    out_port        => out_port,
    in_port         => in_port,
    interrupt       => '0',
    clk             => CLK
  );
  
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
    PWM_OUT             => pwm_out
  );
  
  -- clock enable generator
  ce_gen_baud_i : ce_gen
    GENERIC MAP   ( G_DIV_FACT => 434)
    PORT MAP      ( CLK => CLK,
                    SRST => '0',
                    CE => '1',
                    CE_O => ce_baud);
               
   -- stopwatch control FSM
  uart_tx_i : uart_tx
  PORT MAP(
    CLK                         => CLK,
    TX_START                    => tx_start,
    CLK_EN                      => ce_baud,
    DATA_IN                     => uart_data,
    TX_BUSY                     => tx_busy,
    TX_DATA_OUT                 => UART_TXD      
  );

  --------------------------------------------------------------------------------
  -- Input port MUX
  --------------------------------------------------------------------------------

  input_ports: PROCESS(clk)
  BEGIN
    IF rising_edge(clk) THEN

      CASE port_id IS
        WHEN ID_BTN                 =>  in_port <= "0000" & BTN;
        WHEN ID_SW                  =>  in_port <= "0000" & SW;

        WHEN ID_LED                 =>  in_port <= led_reg;

        WHEN ID_7SEG_DIG_1          =>  in_port <= "0000" & dig_1_reg;
        WHEN ID_7SEG_DIG_2          =>  in_port <= "0000" & dig_2_reg;
        WHEN ID_7SEG_DIG_3          =>  in_port <= "0000" & dig_3_reg;
        WHEN ID_7SEG_DIG_4          =>  in_port <= "0000" & dig_4_reg;
        WHEN ID_7SEG_DP             =>  in_port <= "0000" & dp_reg;
        WHEN ID_7SEG_DOTS           =>  in_port <= "00000" & dots_reg;
        
        WHEN ID_TX_BUSY             =>  in_port <= "0000000" & tx_busy; 

        -- To ensure minimum logic implementation when defining a multiplexer always
        -- use don't care for any of the unused cases
        WHEN OTHERS                 =>  in_port <= "XXXXXXXX";
      END CASE;
    END IF;
  END PROCESS input_ports;


  --------------------------------------------------------------------------------
  -- Output port MUX
  --------------------------------------------------------------------------------

  output_ports: PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN

      IF write_strobe = '1' THEN
        CASE port_id IS
          WHEN ID_LED               =>           led_reg <= out_port;

          WHEN ID_7SEG_DIG_1        =>         dig_1_reg <= out_port(3 DOWNTO 0);
          WHEN ID_7SEG_DIG_2        =>         dig_2_reg <= out_port(3 DOWNTO 0);
          WHEN ID_7SEG_DIG_3        =>         dig_3_reg <= out_port(3 DOWNTO 0);
          WHEN ID_7SEG_DIG_4        =>         dig_4_reg <= out_port(3 DOWNTO 0);
          WHEN ID_7SEG_DP           =>            dp_reg <= out_port(3 DOWNTO 0);
          WHEN ID_7SEG_DOTS         =>          dots_reg <= out_port(2 DOWNTO 0);
          
          WHEN ID_PWM_REF_7         =>          pwm_ref_7 <= out_port;
          WHEN ID_PWM_REF_6         =>          pwm_ref_6 <= out_port;
          WHEN ID_PWM_REF_5         =>          pwm_ref_5 <= out_port;
          WHEN ID_PWM_REF_4         =>          pwm_ref_4 <= out_port;
          WHEN ID_PWM_REF_3         =>          pwm_ref_3 <= out_port;
          WHEN ID_PWM_REF_2         =>          pwm_ref_2 <= out_port;
          WHEN ID_PWM_REF_1         =>          pwm_ref_1 <= out_port;
          WHEN ID_PWM_REF_0         =>          pwm_ref_0 <= out_port;          
          
          WHEN ID_UART_DATA         =>          uart_data <= out_port;
          WHEN ID_TX_START          =>          tx_start  <= out_port(0);

          WHEN OTHERS               =>  NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS output_ports;


  --------------------------------------------------------------------------------

  LED       <= pwm_out;

----------------------------------------------------------------------------------
END ARCHITECTURE Structural;
----------------------------------------------------------------------------------
