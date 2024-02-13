----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 10:32:12 PM
-- Design Name: 
-- Module Name: C10E4 - Behavioral
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

entity C10E4 is
    Port ( LDB : in STD_LOGIC;
           X, Y : in STD_LOGIC_vector(7 downto 0);
           S1 : in STD_LOGIC;
           LDA : in STD_LOGIC;
           RD : in STD_LOGIC;
           S0 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RB, RA : inout STD_LOGIC_vector(7 downto 0));
end C10E4;

architecture Behavioral of C10E4 is

component mux2i1o is
    Port ( in1, in2 : std_logic_vector(7 downto 0);
           sel : in std_logic;
           out1 : out std_logic_vector(7 downto 0));
end component mux2i1o;

component reg8_fallingEdge is 
    Port ( reg_in : in STD_LOGIC_VECTOR(7 downto 0);
           clk : in STD_LOGIC;
           ld : in STD_LOGIC;
           reg_out : out STD_LOGIC_VECTOR(7 downto 0));
end component reg8_fallingEdge;

signal inputMuxOut, secondMuxOut : std_logic_vector(7 downto 0);
signal and1Out, and2Out : std_logic;

begin
and1Out <= LDB and not(RD);
and2Out <= RD and LDA;
inputMux : mux2i1o port map (
    in1 => Y,
    in2 => X,
    Sel => s1,
    out1 => inputMuxOut);

registerMux : mux2i1o port map (
    out1 => secondMuxOut,
    in2 => RB,
    in1 => Y,
    sel => S0);
 
regb : reg8_fallingEdge port map (
    clk => clk,
    reg_in => inputMuxOut,
    ld =>  and1Out,
    reg_out => RB);

rega : reg8_fallingEdge port map (
    ld => and2Out,
    reg_in => secondMuxOut,
    clk => clk,
    reg_out => RA);
end Behavioral;
