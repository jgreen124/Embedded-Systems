----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 07:57:23 PM
-- Design Name: 
-- Module Name: 2in_1out_mux - Behavioral
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

entity in2_out1_mux is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           sel0 : in STD_LOGIC;
           out0 : out STD_LOGIC);
end in2_out1_mux;

architecture Behavioral of in2_out1_mux is

begin

    out0 <= in1 WHEN sel0 ='1' ELSE
            in0 WHEN sel0 = '0' else
            '0';


				
				

end Behavioral;
