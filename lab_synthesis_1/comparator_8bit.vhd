----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 08:01:10 PM
-- Design Name: 
-- Module Name: comparator_8bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_8bit is
    Port ( in0 : in STD_LOGIC_VECTOR(7 downto 0);
           in1 : in STD_LOGIC_VECTOR(7 downto 0);
           out0 : out STD_LOGIC);
end comparator_8bit;

architecture Behavioral of comparator_8bit is

begin

process(in0)
begin

      if ( in0 = in1 ) then
         out0 <= '1';
      else
         out0 <= '0';
      end if;

end process;


				
				

end Behavioral;
