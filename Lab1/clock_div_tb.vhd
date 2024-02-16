--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clock_div_tb is
end clock_div_tb;

architecture testbench of clock_div_tb is

    signal tb_clk : std_logic := '0';
    signal tb_en  : std_logic;
    signal button_press: std_logic;
    signal button_output : std_logic;
    
    component clock_div is
        port(
        
            clk  : in std_logic;        -- 125 Mhz clock
            en   : out std_logic

        );
    end component;
    
    component debouncer is
        port (
            in0 : in std_logic;
            clk : in std_logic;
            out0 : out std_logic);
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
    button_hold_proc : process
    begin
        button_press <= '0';
        wait for 50 ms;
        button_press <= '1';
        wait for 50 ms;
        button_press <= '0';
        wait for 50 ms;
        button_press <= '1';
        wait for 10 ms;
        button_press <= '0';
        wait for 100 ms;
    end process button_hold_proc;
    -- flip the switch high after 1ms
    --switch_proc: process
    --begin
    
      --  wait for 1 ms;
      --  tb_sw0 <= '1';
    
    --end process switch_proc;
    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : debouncer
    port map (
    
        clk  => tb_clk,
        in0 => button_press,
        out0 => button_output
    
    );

    
end testbench; 
