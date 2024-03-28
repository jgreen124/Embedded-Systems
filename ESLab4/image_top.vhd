----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 12:28:25 AM
-- Design Name: 
-- Module Name: image_top - Behavioral
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

entity image_top is
    Port ( clk : in STD_LOGIC;
         vga_hs, vga_vs : out STD_LOGIC;
         vga_r, vga_b : out STD_LOGIC_VECTOR (4 downto 0);
         vga_g : out STD_LOGIC_VECTOR (5 downto 0));
end image_top;

architecture image_top_arch of image_top is


    component clock_div is
        port (
            clk : in std_logic;
            en  : out std_logic
        );
    end component clock_div;

    component picture is
        port(
            clka : in std_logic;
            addra : in std_logic_vector(17 downto 0);
            douta : out std_logic_vector(7 downto 0)
        );
    end component picture;

    component vga_ctrl is
        Port (
            signal clk : in std_logic;
            signal clk_en : in std_logic;
            signal hcount, vcount : out std_logic_vector(9 downto 0) := (others => '0');
            signal vid : out std_logic;
            signal hs, vs  : out std_logic
        );
    end component vga_ctrl;

    component pixel_pusher is
        Port ( clk, clk_en, VS : in STD_LOGIC := '0';
             pixel : in STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
             hcount : in STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
             vid : in STD_LOGIC := '0';
             R, B : out STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
             G : out STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
             addr : out STD_LOGIC_VECTOR (17 downto 0));
    end component pixel_pusher;


    signal en : std_logic;
    signal hcount: std_logic_vector(9 downto 0);
    signal vcount : std_logic_vector(9 downto 0);
    signal vs: std_logic;
    signal vid : std_logic;
    signal dout : std_logic_vector(7 downto 0);
    signal addr : std_logic_vector(17 downto 0);

    
begin
    vga_vs <= vs;
    
    
    U1 : clock_div port map (
            clk => clk,
            en => en
        );

    U2 : vga_ctrl port map (
            clk => clk,
            clk_en => en,
            hcount => hcount,
            vcount => vcount,
            vid => vid,
            hs => vga_hs,
            vs => vs
        );

    U3 : picture port map (
            addra => addr,
            clka => clk,
            douta => dout
        );

    U4 : pixel_pusher port map (
            clk => clk,
            clk_en => en,
            VS => vs,
            pixel => dout,
            hcount => hcount,
            vid => vid,
            R => vga_r,
            B => vga_b,
            G => vga_g,
            addr => addr
        );

end image_top_arch;
