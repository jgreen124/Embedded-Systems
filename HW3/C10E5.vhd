----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 12:18:16 AM
-- Design Name: 
-- Module Name: C10E5 - Behavioral
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

entity C10E5 is
    Port ( A, B, C : in STD_LOGIC_vector(7 downto 0);
           SL1, SL2 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RAX, RBX : out STD_LOGIC_vector(7 downto 0));
end C10E5;

architecture Behavioral of C10E5 is

component mux2i1o is
    Port ( in1, in2 : std_logic_vector(7 downto 0);
           sel : in std_logic;
           out1 : out std_logic_vector(7 downto 0));
end component mux2i1o;

component decoder1to2 is
    Port ( in1 : in STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC);
end component decoder1to2;

component reg8 is
    Port ( reg_in : in STD_LOGIC_VECTOR(7 downto 0);
           clk : in STD_LOGIC;
           ld : in STD_LOGIC;
           reg_out : out STD_LOGIC_VECTOR(7 downto 0));
end component reg8;

signal regbLoad, regaLoad : std_logic;
signal muxOut : std_logic_vector(7 downto 0);
begin

decoder : decoder1to2 port map (
    in1 => sl1,
    out1 => regbLoad,
    out2 => regaLoad);
    
mux : mux2i1o port map (
    in1 => C,
    in2 => B,
    sel => SL2,
    out1 => muxOut);
    
rega : reg8 port map (
    reg_in => A,
    clk => clk,
    ld => regaLoad,
    reg_out => RAX);

regb : reg8 port map (
    reg_in => muxOut,
    clk => clk,
    ld => regbLoad,
    reg_out => RBX);

end Behavioral;
