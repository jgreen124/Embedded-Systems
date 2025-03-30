----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 10:48:51 PM
-- Design Name: 
-- Module Name: hdmi_top_tb - hdmi_top_tb_arch
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

entity hdmi_top_tb is
--  Port ( );
end hdmi_top_tb;

architecture hdmi_top_tb_arch of hdmi_top_tb is
component hdmi_top is                                              
    Port ( clk : in STD_LOGIC;
--         vga_hs, vga_vs : out STD_LOGIC;
--         vga_r, vga_b : out STD_LOGIC_VECTOR (4 downto 0);
--         vga_g : out STD_LOGIC_VECTOR (5 downto 0);
         hdmi_tx_clk_n, hdmi_tx_clk_p, hdmi_tx_hpd, hdmi_tx_scl : out std_logic;
--         hdmi_out_en, hdmi_tx_cec : std_logic;
        hdmi_tx_p, hdmi_tx_n : out std_logic_vector(2 downto 0)

        );             
end component hdmi_top;                                                   
                                                                 
signal clk, vga_hs, vga_vs : std_logic;
signal vga_r, vga_b : std_logic_vector(4 downto 0);
signal vga_g : std_logic_vector(5 downto 0);
signal hdmi_tx_clk_n, hdmi_tx_clk_p, hdmi_tx_hpd, hdmi_tx_scl :  std_logic;
--         hdmi_out_en, hdmi_tx_cec : std_logic;
signal hdmi_tx_p, hdmi_tx_n :  std_logic_vector(2 downto 0);

begin




dut : hdmi_top port map(
    clk => clk,
    hdmi_tx_clk_n => hdmi_tx_clk_n,
    hdmi_tx_clk_p => hdmi_tx_clk_p,
    hdmi_tx_hpd => hdmi_tx_hpd,
    hdmi_tx_scl => hdmi_tx_scl,
    hdmi_tx_p => hdmi_tx_p,
    hdmi_tx_n => hdmi_tx_n
    
);

clock_gen : process begin
    clk <= '1';
    wait for 4 ns;
    clk <= '0';
    wait for 4 ns;
end process clock_gen;

end hdmi_top_tb_arch;
