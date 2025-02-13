----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 09:18:13 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
    Port ( btn : in STD_LOGIC_vector(3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_vector(3 downto 0);
           led : out STD_LOGIC_vector(3 downto 0));
end counter_top;



architecture counter_top_arch of counter_top is

component fancy_counter is
    Port ( clk : in STD_LOGIC; --clock from before, active on rising clock edge
           clk_en : in STD_LOGIC; --clock enable, even if en is 1, nothing changes if clk_en is 0
           dir : in STD_LOGIC; --loads in value from val pin
           en : in STD_LOGIC; --nothing changes when en is 0
           ld : in STD_LOGIC; --if ld is 1, then val pin is loaded value
           rst : in STD_LOGIC; --when rst is 1, cnt will become 0
           updn : in STD_LOGIC; --updn loads in value at dir pin 
           val : in STD_LOGIC_vector(3 downto 0);
           cnt : out STD_LOGIC_vector(3 downto 0));
end component;

component divider_top is
    Port ( clk : in STD_LOGIC;
           led0 : out STD_LOGIC);
end component;

component debouncer is
        Port ( in0 : in STD_LOGIC;
           out0 : out STD_LOGIC := '0';
           clk : in STD_LOGIC);
end component;
 
component clock_div is
port (
  clk : in std_logic;
  en  : out std_logic
);
end component;
 
signal clock_div_out : std_logic := '0';
signal buttonThreeOut: std_logic;
signal buttonTwoOut: std_logic;
signal buttonOneOut: std_logic;
signal buttonZeroOut: std_logic;

begin

u4 : debouncer port map(
    in0 => btn(3),
    out0 => buttonThreeOut,
    clk => clk);
    
u3 : debouncer port map(
    in0 => btn(2),
    out0 => buttonTwoOut,
    clk => clk);
    

u2 : debouncer port map(
    in0 => btn(1),
    out0 => buttonOneOut,
    clk => clk);

u1 : debouncer port map(
    in0 => btn(0),
    out0 => buttonZeroOut,
    clk => clk);
    
    
u5 : clock_div port map(
    clk => clk,
    en => clock_div_out);
    
cool_counter : fancy_counter port map(

    clk => clk,
    clk_en => clock_div_out,
    dir => sw(0),
    en => buttonOneOut,
    ld => buttonThreeOut,
    rst => buttonZeroOut,
    updn => buttonTwoOut,
    val => sw,
    cnt => led);
end counter_top_arch;
