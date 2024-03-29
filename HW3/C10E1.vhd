----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:22:31 PM
-- Design Name: 
-- Module Name: C10E1 - Behavioral
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

entity C10E1 is
Port ( A : in std_logic_vector(7 downto 0);
       B : in std_logic_vector(7 downto 0);
       SEL : in std_logic;
       LDA : in std_logic;
       clk : in std_logic;
       F : out std_logic_vector(7 downto 0)
        
);
end C10E1;

architecture Behavioral of C10E1 is

component reg8 is
    port( reg_in : in std_logic_vector(7 downto 0);
          ld : in std_logic;
          clk : in std_logic;
          reg_out : out std_logic_vector(7 downto 0));
end component reg8;

component mux2i1o is
    port( in1, in2 : in std_logic_vector(7 downto 0);
          sel : in std_logic;
          out1 : out std_logic_vector(7 downto 0));
end component mux2i1o;


signal muxout : std_logic_vector(7 downto 0);
begin

mux :   mux2i1o port map (
                    in1 => B,
                    in2 => A,
                    sel => SEL,
                    out1 => muxout);
                    
reg:    reg8 port map (
                    reg_in => muxout,
                    ld => LDA,
                    clk => clk,
                    reg_out => F);
                    

end Behavioral;
