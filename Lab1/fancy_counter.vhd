----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 08:08:11 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( clk : in STD_LOGIC; --clock from before, active on rising clock edge
           clk_en : in STD_LOGIC; --clock enable, even if en is 1, nothing changes if clk_en is 0
           dir : in STD_LOGIC; --loads in value from val pin
           en : in STD_LOGIC; --nothing changes when en is 0
           ld : in STD_LOGIC; --if ld is 1, then val pin is loaded value
           rst : in STD_LOGIC; --when rst is 1, cnt will become 0
           updn : in STD_LOGIC; --updn loads in value at dir pin 
           val : in STD_LOGIC_vector(3 downto 0);
           cnt : out STD_LOGIC_vector(3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal current_val : std_logic_vector(3 downto 0);
signal current_updn : std_logic;
signal current_rst : std_logic;
signal current_ld : std_logic;
signal current_en : std_logic;
signal current_dir : std_logic;
signal current_cnt : std_logic_vector(3 downto 0) := "0000";
begin


clock : process(clk)
begin
    --On the clock rising edge, unless en is 1, nothing will change in the circuit.
--• Even if en is 1, if clk_en is 0 nothing can change the circuit except rst
--• When rst is asserted the cnt value will become 0.

--• It can count either up or down depending on the value of a “direction�? register, which is updated
--at the clock rising edge with the value present at dir when updn is 1.

--• On the clock rising edge, if ld is 1, the value present at val will be loaded into the “value�? register.

--• If counting up, it will count until the number in a 4-bit “value�? register has been reached, at
--which point it will roll over to 0000. If counting down, it will go from 0000 to value when it
--underflows.

    if(rising_edge(clk)) then --clock cycles
    
        if (en = '1') then
            if (rst = '1') then
                --cnt <= "0000";
                current_cnt <= "0000"; --reset counter
            end if;
            if (clk_en = '1') then
                if (updn = '1') then
                    current_dir <= dir;
                end if;
                if (current_dir = '1') then
                    if (current_cnt = current_val) then
                        --cnt <= "0000";
                        current_cnt <= "0000";
                    else
                        --cnt <=std_logic_vector(unsigned(current_cnt) + 1);
                        current_cnt <=std_logic_vector(unsigned(current_cnt) + 1);
                    end if;
                else
                    if (unsigned(current_cnt) = 0) then
                        --cnt <=current_val;
                        current_cnt <= current_val;
                    else
                        --cnt <= std_logic_vector(unsigned(current_cnt)-1);
                        current_cnt <= std_logic_vector(unsigned(current_cnt)-1);
                    end if;
                end if;
                if (ld = '1') then
                    current_val <= val;
                end if;
            end if;
        end if;
    end if;
    cnt <= current_cnt;
  
                
end process;

end Behavioral;
