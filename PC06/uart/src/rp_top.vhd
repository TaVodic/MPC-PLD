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
    DISP_DIG        : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    UART_TXD        : OUT  STD_LOGIC
  );
END ENTITY rp_top;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF rp_top IS
----------------------------------------------------------------------------------

  COMPONENT seg_disp_driver
  PORT(
    CLK             : IN  STD_LOGIC;
    DIG_1           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_2           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_3           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DIG_4           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    DP              : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
    DOTS            : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
    DISP_SEG        : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_DIG        : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
  END COMPONENT seg_disp_driver;
  
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

  SIGNAL cnt_0              : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_1              : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_2              : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_3              : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL ce_baud           : STD_LOGIC;
  SIGNAL ce_100hz           : STD_LOGIC;
  SIGNAL btn_W_sig            : STD_LOGIC;

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
    DIG_1               => "0000",
    DIG_2               => "0000",
    DIG_3               => "0000",
    DIG_4               => "0000",
    DP                  => "0000",
    DOTS                => "011",
    DISP_SEG            => DISP_SEG,
    DISP_DIG            => DISP_DIG
  );

  --------------------------------------------------------------------------------
  -- clock enable generator
  ce_gen_baud_i : ce_gen
    GENERIC MAP   ( G_DIV_FACT => 434)
    PORT MAP      ( CLK => CLK,
                    SRST => '0',
                    CE => '1',
                    CE_O => ce_baud);
                    
  ce_gen_100_Hz_i : ce_gen
    GENERIC MAP   ( G_DIV_FACT => 500000)
    PORT MAP      ( CLK => CLK,
                    SRST => '0',
                    CE => '1',
                    CE_O => ce_100hz);                
                
  --------------------------------------------------------------------------------
  -- button input module
  btn_W_i : btn_in
    GENERIC MAP   ( G_DEB_PERIOD => 3)
    PORT MAP      ( CLK => CLK,
                    CE => ce_100hz,
                    BTN => BTN(0),
                    BTN_EDGE_POS => btn_W_sig,
                    BTN_EDGE_NEG => open );
                                  
  --------------------------------------------------------------------------------

  --------------------------------------------------------------------------------
  -- stopwatch control FSM
   uart_tx_i : uart_tx
  PORT MAP(
    CLK                         => clk,
    TX_START                    => btn_W_sig,
    CLK_EN                      => ce_baud,
    DATA_IN                     => X"41",
    TX_BUSY                     => open,
    TX_DATA_OUT                 => UART_TXD      
  );
                    
  --------------------------------------------------------------------------------
  -- LED connection

----------------------------------------------------------------------------------
END ARCHITECTURE Structural;
----------------------------------------------------------------------------------
