----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 05:58:02 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
    Port ( clk : in STD_LOGIC;
           led0 : out STD_LOGIC);
end divider_top;


architecture divider_top_arch of divider_top is

component clock_div is
    port (
  clk : in std_logic;
  en  : out std_logic
);
end component clock_div;

component led_reg is
Port ( reg_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           reg_out : out STD_LOGIC);
end component led_reg;
signal clock_div_out : std_logic;
signal led_state : std_logic := '0';


begin

divide_clock : clock_div port map (
    clk => clk,
    en => clock_div_out);
    
load_process : process(clk) begin
    if (rising_edge(clk)) then
        if (clock_div_out = '1') then
            led_state <= not(led_state);
        end if;
    end if;
    led0 <= led_state;
end process load_process;
    

    

end divider_top_arch;
