----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:49:59 PM
-- Design Name: 
-- Module Name: C10E2 - Behavioral
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

entity C10E2 is
    Port ( DS : in STD_LOGIC;
           X, Y, Z : in std_logic_vector(7 downto 0);
           MS : in STD_LOGIC_vector(1 downto 0);
           CLK : in STD_LOGIC;
           RB : inout std_logic_vector(7 downto 0);
           RA : inout std_logic_vector(7 downto 0));
end C10E2;

architecture Behavioral of C10E2 is

component mux4i1o is
    Port ( in1 : in std_logic_vector(7 downto 0);
           in2 : in std_logic_vector(7 downto 0);
           in3 : in std_logic_vector(7 downto 0);
           in4 : in std_logic_vector(7 downto 0);
           sel : in std_logic_vector(1 downto 0);
           out1 : out std_logic_vector(7 downto 0));
end component mux4i1o;

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


signal LDA : std_logic;
signal LDB : std_logic;
signal muxOut : std_logic_vector(7 downto 0);

begin

decoder : decoder1to2 port map(
            in1 => DS,
            out1 => LDA,
            out2 => LDB);
        
mux : mux4i1o port map (
            in1 => X, 
            in2 => Y, 
            in3 => Z,
            in4 => RB,
            sel => MS,
            out1 => muxOut);

register_a : reg8 port map(
            reg_in => muxOut,
            clk => clk,
            ld => LDA,
            reg_out => RA);
            
register_b : reg8 port map(
            reg_in => RA,
            clk => clk,
            ld => LDB,
            reg_out => RB);                        

end Behavioral;
