----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2024 09:33:36 PM
-- Design Name: 
-- Module Name: C3Q6 - Behavioral
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

entity C3Q6 is
    Port ( input : in STD_LOGIC_VECTOR(0 to 2);
           output  : out STD_LOGIC_VECTOR(0 to 7));
end C3Q6;

architecture Behavioral of C3Q6 is

begin

    with input select
        output <= "00000001" when "000",
                  "00000010" when "001",
                  "00000100" when "010",
                  "00001000" when "011",
                  "00010000" when "100",
                  "00100000" when "101",
                  "01000000" when "110",
                  "10000000" when "111",
                  "00000000" when others;

        

end Behavioral;
