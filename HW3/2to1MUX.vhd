----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:05:27 PM
-- Design Name: 
-- Module Name: 2to1MUX - Behavioral
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

entity MUX2to1 is
    Port ( muxIn0 : in STD_LOGIC;
           muxIn1 : in STD_LOGIC;
           muxSelect : in STD_LOGIC;
           muxOut : out STD_LOGIC);
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin

with muxSelect select
    muxOut <= muxIn0 when '0',
              muxIn1 when '1',
              '0' when others;     
end Behavioral;
