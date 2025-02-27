library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC;
           Z : out STD_LOGIC);
end simple_adder;

architecture Behavioral of simple_adder is

    SIGNAL a_sig : UNSIGNED (3 DOWNTO 0);
    SIGNAL b_sig : UNSIGNED (3 DOWNTO 0);
    SIGNAL y_sig : UNSIGNED (4 DOWNTO 0);
    --SIGNAL y_sig : UNSIGNED (A'HIGH+1 DOWNTO Y'LOW);
 
begin

    a_sig <= UNSIGNED(A);
    b_sig <= UNSIGNED(B);
    y_sig <= "00000" + a_sig - b_sig; --treba pridat ste jedn bit pretoze sucet 4b je 4b vo VHDL
    Y <= STD_LOGIC_VECTOR(y_sig(3 DOWNTO 0));
    C <= y_sig(4); --neni potreba pretypovat, pretoze UNSIGNED je pole typu STD_LOGIC        
    Z <= '1' WHEN STD_LOGIC_VECTOR(y_sig(3 DOWNTO 0)) = "0000" ELSE '0';

end Behavioral;
