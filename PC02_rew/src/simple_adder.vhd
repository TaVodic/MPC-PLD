----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2025 15:44:15
-- Design Name: 
-- Module Name: simple_adder - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           C : OUT STD_LOGIC;
           Z : OUT STD_LOGIC);
end simple_adder;

architecture Behavioral of simple_adder is

    SIGNAL result : unsigned(4 DOWNTO 0);

begin

    result <= "0" & UNSIGNED(A) + UNSIGNED(B);
    Y <= STD_LOGIC_VECTOR(result(3 DOWNTO 0));
    C <= result(4);    
    Z <= '1' WHEN result = "00000" ELSE '0';

end Behavioral;
