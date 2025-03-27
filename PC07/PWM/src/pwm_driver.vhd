----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2025 08:28:09 AM
-- Design Name: 
-- Module Name: pwm_driver - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_driver is
    Port (  CLK                 : IN  STD_LOGIC;
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
end pwm_driver;

architecture Behavioral of pwm_driver is

    SIGNAL s_counter    : UNSIGNED (0 TO 7) := (OTHERS => '0');
    SIGNAL s_pwm_out    : STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_shift      : UNSIGNED (0 TO 4) := (OTHERS => '0');
    SIGNAL s_dir        : STD_LOGIC := '0';

begin

    process (clk) begin
        if rising_edge(clk) then
            s_counter <= s_counter + 1;
            if s_counter = 254 then
                s_counter <= (others => '0');
            end if;      
        end if;       
    end process;   
    
    seq: process (clk) begin
        if rising_edge(clk) then
            if CE = '1' then
                if s_dir = '0' then
                    s_shift <= s_shift + 1;
                else
                    s_shift <= s_shift - 1;
                end if;                
            end if;   
        end if;       
    end process;   
    
    com_1: process (s_shift) begin
        if s_shift = 8 then
            s_dir <= '1';
        end if;   
        if s_shift = 1 then
            s_dir <= '0';
        end if;
    end process;
    
    com_2: process (s_shift, s_dir, s_counter) begin       
        s_pwm_out <= (others => '0');
        if s_dir = '0' then
            if s_counter < UNSIGNED(PWM_REF_7) then s_pwm_out(to_integer(s_shift+7)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+7)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_6) then s_pwm_out(to_integer(s_shift+6)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+6)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_5) then s_pwm_out(to_integer(s_shift+5)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+5)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_4) then s_pwm_out(to_integer(s_shift+4)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+4)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_3) then s_pwm_out(to_integer(s_shift+3)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+3)) <= '0'; 
            end if;  
            if s_counter < UNSIGNED(PWM_REF_2) then s_pwm_out(to_integer(s_shift+2)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+2)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_1) then s_pwm_out(to_integer(s_shift+1)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+1)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_0) then s_pwm_out(to_integer(s_shift+0)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+0)) <= '0'; 
            end if;  
        end if;
        ----------
        if s_dir = '1' then
            if s_counter < UNSIGNED(PWM_REF_7) then s_pwm_out(to_integer(s_shift+5)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+5)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_6) then s_pwm_out(to_integer(s_shift+6)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+6)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_5) then s_pwm_out(to_integer(s_shift+7)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+7)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_4) then s_pwm_out(to_integer(s_shift+8)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+8)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_3) then s_pwm_out(to_integer(s_shift+9)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+9)) <= '0'; 
            end if;   
            if s_counter < UNSIGNED(PWM_REF_2) then s_pwm_out(to_integer(s_shift+10)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+10)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_1) then s_pwm_out(to_integer(s_shift+11)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+11)) <= '0'; 
            end if;
            if s_counter < UNSIGNED(PWM_REF_0) then s_pwm_out(to_integer(s_shift+12)) <= '1'; 
            else s_pwm_out(to_integer(s_shift+12)) <= '0'; 
            end if;
        end if;   
    end process; 
    
    --s_pwm_out(to_integer(s_shift)) <= '1' when s_counter < UNSIGNED(PWM_REF_4) else '0';
    
    
    --process (s_counter) begin
        --if s_counter < UNSIGNED(PWM_REF_0) then
           -- s_pwm_out <= '0';
     --   else
      --      s_pwm_out <= '1';
    --    end if;    
  --  end process;  
    
    --s_pwm_out(0) <= '1' when s_counter < UNSIGNED(PWM_REF_0) else '0';   
    --s_pwm_out(1) <= '1' when s_counter < UNSIGNED(PWM_REF_1) else '0';    
    --s_pwm_out(2) <= '1' when s_counter < UNSIGNED(PWM_REF_2) else '0';
    --s_pwm_out(3) <= '1' when s_counter < UNSIGNED(PWM_REF_3) else '0'; 
    --s_pwm_out(4) <= '1' when s_counter < UNSIGNED(PWM_REF_4) else '0'; 
    --s_pwm_out(5) <= '1' when s_counter < UNSIGNED(PWM_REF_5) else '0'; 
    --s_pwm_out(6) <= '1' when s_counter < UNSIGNED(PWM_REF_6) else '0'; 
    --s_pwm_out(7) <= '1' when s_counter < UNSIGNED(PWM_REF_7) else '0';      
    CNT_OUT <= STD_LOGIC_VECTOR(s_counter);    
    
    process (clk) begin
        if rising_edge(clk) then
            PWM_OUT <= s_pwm_out(14 DOWNTO 7);      
        end if;       
    end process;          
    
end Behavioral;
