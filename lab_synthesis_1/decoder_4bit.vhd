----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 08:34:31 PM
-- Design Name: 
-- Module Name: decoder_4bit - Behavioral
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

entity decoder_4bit is
    Port ( in0 : in STD_LOGIC_VECTOR(0 to 1);
           out0 : out STD_LOGIC_VECTOR(0 to 3));
end decoder_4bit;

architecture Behavioral of decoder_4bit is

begin

process(in0)
begin

   if ( in0(0)'event and (in0(0) ='1' and in0(0)='0')) then
         case in0 is
            when "00" => out0 <= "0001";
            when "01" => out0 <= "0010";
            when "10" => out0 <= "0100";
            when "11" => out0 <= "1000";
            when others => out0 <= "0000";
         end case;
   end if;
end process;

				
				

end Behavioral;
