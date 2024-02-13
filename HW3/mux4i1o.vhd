----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2024 07:53:24 PM
-- Design Name: 
-- Module Name: mux4i1o - Behavioral
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

entity mux4i1o is
    Port ( in1 : in std_logic_vector(7 downto 0);
           in2 : in std_logic_vector(7 downto 0);
           in3 : in std_logic_vector(7 downto 0);
           in4 : in std_logic_vector(7 downto 0);
           sel : in std_logic_vector(1 downto 0);
           out1 : out std_logic_vector(7 downto 0));
end mux4i1o;

architecture Behavioral of mux4i1o is

begin
    with sel select
        out1 <= in4 when "00",
                in3 when "01",
                in2 when "10",
                in1 when "11",
                (others => '0') when others;
                
                

end Behavioral;
