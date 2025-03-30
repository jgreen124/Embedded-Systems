----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 12:28:25 AM
-- Design Name: 
-- Module Name: hdmi_top - hdmi_top_arch
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

entity hdmi_top is
    Port ( clk : in STD_LOGIC;
--         vga_hs, vga_vs : out STD_LOGIC;
--         vga_r, vga_b : out STD_LOGIC_VECTOR (4 downto 0);
--         vga_g : out STD_LOGIC_VECTOR (5 downto 0);
         hdmi_tx_clk_n, hdmi_tx_clk_p, hdmi_tx_hpd, hdmi_tx_scl : out std_logic;
--         hdmi_out_en, hdmi_tx_cec : std_logic;
        hdmi_tx_p, hdmi_tx_n : out std_logic_vector(2 downto 0)

        );
end hdmi_top;

architecture hdmi_top_arch of hdmi_top is

    

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

    component hdmi_pixel_pusher is
        Port ( clk, clk_en, VS : in STD_LOGIC := '0';
             pixel : in STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
             hcount : in STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
             vid : in STD_LOGIC := '0';
--             R, B : out STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
--             G : out STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
             addr : out STD_LOGIC_VECTOR (17 downto 0);
             hdmiOut : out std_logic_vector(23 downto 0));
    end component hdmi_pixel_pusher;

    component rgb2dvi_0 is
        PORT (
            TMDS_Clk_p : OUT STD_LOGIC;
            TMDS_Clk_n : OUT STD_LOGIC;
            TMDS_Data_p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            TMDS_Data_n : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            aRst : IN STD_LOGIC;
            vid_pData : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
            vid_pVDE : IN STD_LOGIC;
            vid_pHSync : IN STD_LOGIC;
            vid_pVSync : IN STD_LOGIC;
            PixelClk : IN STD_LOGIC;
            SerialClk : IN std_logic
        );

    END component rgb2dvi_0;

    signal en : std_logic;
    signal hcount: std_logic_vector(9 downto 0);
    signal vcount : std_logic_vector(9 downto 0);
    signal vs: std_logic;
    signal vid : std_logic;
    signal dout : std_logic_vector(7 downto 0);
    signal addr : std_logic_vector(17 downto 0);
    signal hdmiOut : std_logic_vector(23 downto 0);
    signal hs : std_logic;
    


begin
--vga_vs <= vs;
--vga_hs <= hs;
--Hdmi_out_en  <= '1';


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
        hs => hs,
        vs => vs
    );

U3 : picture port map (
        addra => addr,
        clka => clk,
        douta => dout
    );

U4 : hdmi_pixel_pusher port map (
        clk => clk,
        clk_en => en,
        VS => vs,
        pixel => dout,
        hcount => hcount,
        vid => vid,
--        R => vga_r,
--        B => vga_b,
--        G => vga_g,
        addr => addr,
        hdmiOut => hdmiOut
    );
U5 : rgb2dvi_0 port map(
        vid_pData => hdmiOut,
        vid_pHsync => hs,
        vid_pVSync => vs,
        vid_pVDE => vid,
        aRst => '0',
        pixelClk => en,
        TMDS_clk_p => hdmi_tx_clk_p,
        tmds_clk_n => hdmi_tx_clk_n,
        tmds_data_p => hdmi_tx_p,
        tmds_data_n => hdmi_tx_n,
        serialClk => clk
);

end hdmi_top_arch;