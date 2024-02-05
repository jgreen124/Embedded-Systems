----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 08:07:30 PM
-- Design Name: 
-- Module Name: encoder_4bit - Behavioral
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

entity encoder_4bit is
    Port ( in0 : in STD_LOGIC_VECTOR(0 to 3);
           rst : in std_logic;
           out0 : out STD_LOGIC_VECTOR(0 to 1));
end encoder_4bit;

architecture Behavioral of encoder_4bit is

begin


process(in0)
begin
   --if ( in0'event and (in0(0) = '1' or in0(0)='0')) then

         case in0 is
            when "0001" => out0 <= "00";
            when "0010" => out0 <= "01";
            when "0100" => out0 <= "10";
            when "1000" => out0 <= "11";
            when others => out0 <= "00";
         end case;
   --end if;
end process;



				
				
end Behavioral;
