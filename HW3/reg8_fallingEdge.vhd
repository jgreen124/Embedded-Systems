----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 03:43:16 PM
-- Design Name: 
-- Module Name: reg8_fallingEdge - Behavioral
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

entity reg8_fallingEdge is
    Port ( reg_in : in STD_LOGIC_VECTOR(7 downto 0);
           clk : in STD_LOGIC;
           ld : in STD_LOGIC;
           reg_out : out STD_LOGIC_VECTOR(7 downto 0));
end reg8_fallingEdge;

architecture Behavioral of reg8_fallingEdge is
    
begin

load_process : process(clk) begin
    if (falling_edge(clk)) then
        if (ld = '1') then
            reg_out <= reg_in;
        end if;
    end if;
end process load_process;
    

end Behavioral;
