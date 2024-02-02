----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 10:07:02 PM
-- Design Name: 
-- Module Name: DFF_synch_active_low_ce - Behavioral
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

entity DFF_synch_active_low_ce is
    Port ( in0 : in STD_LOGIC;
           clock : in STD_LOGIC;
           clock_enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           out0 : out STD_LOGIC);
end DFF_synch_active_low_ce;

architecture Behavioral of DFF_synch_active_low_ce is

begin

process (clock)
begin
   if clock'event and clock='1' then
      if reset='0' then
         out0 <= '0';
      elsif clock_enable ='1' then
         out0 <= in0;
      end if;
   end if;
end process;



						
					

end Behavioral;
