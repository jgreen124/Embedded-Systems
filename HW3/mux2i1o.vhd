----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:14:07 PM
-- Design Name: 
-- Module Name: REGISTER - Behavioral
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

entity mux2i1o is
    Port ( in1, in2 : std_logic_vector(7 downto 0);
           sel : in std_logic;
           out1 : out std_logic_vector(7 downto 0));
end mux2i1o;

architecture Behavioral of mux2i1o is
    
begin

with sel select
    out1 <= in1 when '0',
            in2 when '1',
            (others =>'0') when others;

end Behavioral;
