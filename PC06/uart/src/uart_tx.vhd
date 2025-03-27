----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 08:27:16 AM
-- Design Name: 
-- Module Name: uart_tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


ENTITY uart_tx IS
    PORT(
        CLK : IN STD_LOGIC;
        TX_START : IN STD_LOGIC;
        CLK_EN : IN STD_LOGIC;
        DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        TX_BUSY : OUT STD_LOGIC;
        TX_DATA_OUT : OUT STD_LOGIC
    );
END uart_tx;

architecture Behavioral of uart_tx is

    TYPE t_state IS (st_Idle, st_waitEn, st_data, st_stop_b);
    SIGNAL pres_st : t_state := st_Idle;
    SIGNAL tx_data_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL cnt_reg : UNSIGNED (7 DOWNTO 0) := (OTHERS => '0');

begin

-- next state must be? NO
-- implement TX_BUSY

PROCESS (CLK) BEGIN
    IF rising_edge(clk) THEN  
        IF pres_st = st_Idle AND TX_START = '1' THEN
            pres_st <= st_waitEn;
            tx_data_reg <= DATA_IN;                     
        END IF;
        
        IF CLK_EN = '1' THEN
            CASE pres_st IS
                WHEN st_waitEn => 
                    TX_DATA_OUT <= '0';
                    pres_st <= st_data;
                    TX_BUSY <= '1';   
                WHEN st_data =>                     
                    TX_DATA_OUT <= tx_data_reg(to_integer(cnt_reg));
                    cnt_reg <= cnt_reg + 1;
                    IF cnt_reg = 7 THEN
                        cnt_reg <= (OTHERS => '0');
                        pres_st <= st_stop_b;
                    END IF;
                WHEN st_stop_b =>
                    TX_DATA_OUT <= '1';
                    pres_st <= st_Idle;
                WHEN st_Idle =>
                    TX_DATA_OUT <= '1'; 
                    TX_BUSY <= '0';                    
            END CASE; 
        END IF;             
    END IF;
END PROCESS;

end Behavioral;
