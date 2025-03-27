
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_tx_tb is
end uart_tx_tb;

architecture Behavioral of uart_tx_tb is  

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

  CONSTANT C_CLK_PERIOD         : TIME := 20 ns;

  SIGNAL simulation_finished    : BOOLEAN := FALSE;

  SIGNAL clk                    : STD_LOGIC := '0';
  SIGNAL ce_baud                : STD_LOGIC;
  SIGNAL btn                    : STD_LOGIC := '0';
  SIGNAL btn_debounced          : STD_LOGIC;
  SIGNAL btn_edge_pos           : STD_LOGIC;
  SIGNAL btn_edge_neg           : STD_LOGIC;
  SIGNAL btn_edge_any           : STD_LOGIC;
  SIGNAL tx_busy                : STD_LOGIC;
  SIGNAL tx_out                 : STD_LOGIC;
  

BEGIN

  proc_clk_gen: PROCESS BEGIN
    clk <= '0'; WAIT FOR C_CLK_PERIOD/2;
    clk <= '1'; WAIT FOR C_CLK_PERIOD/2;
    IF simulation_finished THEN
      WAIT;
    END IF;
  END PROCESS proc_clk_gen;    

  ce_gen_i : ce_gen
  GENERIC MAP(
    G_DIV_FACT                  => 10
  )
  PORT MAP(
    CLK                         => clk,
    SRST                        => '0',
    CE                          => '1',
    CE_O                        => ce_baud
  );  
  
  btn_in_i : btn_in
  GENERIC MAP(
    G_DEB_PERIOD                => 2
  )
  PORT MAP(
    CLK                         => clk,
    CE                          => clk,
    BTN                         => btn,
    BTN_DEBOUNCED               => btn_debounced,
    BTN_EDGE_POS                => btn_edge_pos,
    BTN_EDGE_NEG                => btn_edge_neg,
    BTN_EDGE_ANY                => btn_edge_any
  );
  
  uart_tx_i : uart_tx
  PORT MAP(
    CLK                         => clk,
    TX_START                    => btn_edge_pos,
    CLK_EN                      => ce_baud,
    DATA_IN                     => X"00",
    TX_BUSY                     => tx_busy,
    TX_DATA_OUT                 => tx_out      
  );

  proc_stim : PROCESS
  BEGIN
    
    -- reset of the counter
    btn <= '0';
    WAIT FOR C_CLK_PERIOD * 20;
    btn <= '1';
    WAIT FOR C_CLK_PERIOD * 50;
    btn <= '0';
    

    
    -- place your own stimuli below
      
    
    --WAIT FOR C_CLK_PERIOD * 10000;
    --WAIT UNTIL cnt_1 = X"9";
    --cnt_enable <= '0';
    --WAIT FOR C_CLK_PERIOD * 12;
    --disp_enable <= '1';
    --WAIT UNTIL cnt_3 = X"9";    

    
    -- end of simulation
    
    WAIT FOR C_CLK_PERIOD * 10000;
    simulation_finished <= TRUE;
    WAIT;
  END PROCESS proc_stim;


end Behavioral;

