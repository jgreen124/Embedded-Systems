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

entity led_reg is
    Port ( reg_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           reg_out : out STD_LOGIC);
end led_reg;

architecture Behavioral of led_reg is
    
begin

load_process : process(clk) begin
    if (rising_edge(clk)) then
        if (clk_en = '1') then
            reg_out <= reg_in;
        end if;
    end if;
end process load_process;
    

end Behavioral;
