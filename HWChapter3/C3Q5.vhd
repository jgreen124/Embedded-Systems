----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2024 06:50:33 PM
-- Design Name: 
-- Module Name: C3Q5 - Behavioral
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

entity C3Q5 is
    Port (
            input0, input1, input2, input3, input4, input5, input6, input7 : in STD_LOGIC;
           output : out STD_LOGIC;
           sel    : in STD_LOGIC_VECTOR(0 to 2));
end C3Q5;

architecture Behavioral of C3Q5 is

begin

    with sel select
    output <= input0 when "000",
              input1 when "001",
              input2 when "010",
              input3 when "011",
              input4 when "100",
              input5 when "101",
              input6 when "110",
              input7 when "111",
              '0' when others;
    

end Behavioral;
