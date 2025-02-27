----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2025 08:36:34 AM
-- Design Name: 
-- Module Name: simple_adder_tb - Behavioral
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

entity simple_adder_tb is
end simple_adder_tb;

architecture Behavioral of simple_adder_tb is

    COMPONENT simple_adder
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0);
               C : out STD_LOGIC;
               Z : out STD_LOGIC);
    end COMPONENT simple_adder;
    
    SIGNAL a_sig : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0'); --"0000"
    SIGNAL b_sig : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL y_sig : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL c_sig : STD_LOGIC;
    SIGNAL z_sig : STD_LOGIC;
    
    SIGNAL y_ref : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL c_ref : STD_LOGIC;
    SIGNAL z_ref : STD_LOGIC;

begin

  -- DUT instantiation
  -- simple_adder_inst : ENTITY work.simple_adder --in this case you dont neet to declare the component above
    simple_adder_inst : simple_adder --in 
        PORT MAP ( 
               A => a_sig,
               B => b_sig,
               Y => y_sig,
               C => c_sig,
               Z => z_sig
        ); 
    
    process    
    begin   
        
        FOR i IN 0 TO 15 LOOP
            a_sig <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 4));
            FOR k IN 0 TO 15 LOOP
                b_sig <= STD_LOGIC_VECTOR(TO_UNSIGNED(k, 4));
                WAIT FOR 10ns; 
            END LOOP;
        END LOOP;
        
        REPORT "Simulation finished!" SEVERITY failure;
        
    end process;
    
    
    process    
    begin
        WAIT FOR 5ns;        
        LOOP
            y_ref <= STD_LOGIC_VECTOR(UNSIGNED(a_sig) + UNSIGNED(b_sig));
            WAIT FOR 0ns;
            --ASSERT (y_ref = y_sig) REPORT "Error in addition!" SEVERITY error;
            
            ASSERT (y_sig = y_ref) REPORT
             "Error!!! a=" & INTEGER'image(TO_INTEGER(UNSIGNED(a_sig))) &
                     " b=" & INTEGER'image(TO_INTEGER(UNSIGNED(b_sig))) &
                     " actual y=" & INTEGER'image(TO_INTEGER(UNSIGNED(y_sig))) &
                     " expected y=" & INTEGER'image(TO_INTEGER(UNSIGNED(y_ref)))
            SEVERITY error;
            
            --IF NOT (y_ref = y_sig) THEN
                --REPORT "Error in addition!" SEVERITY ERROR;        
            --END IF;
            
            WAIT FOR 10ns;
        END LOOP;        
    end process; 
end Behavioral;
