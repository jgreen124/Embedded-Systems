----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:59:16 PM
-- Design Name: 
-- Module Name: encoder1to2 - Behavioral
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

entity decoder1to2 is
    Port ( in1 : in STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC);
end decoder1to2;

architecture Behavioral of decoder1to2 is

begin

out1 <= not(in1);
out2 <= in1;
end Behavioral;
