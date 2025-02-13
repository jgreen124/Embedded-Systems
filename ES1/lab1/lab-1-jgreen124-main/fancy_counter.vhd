


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( clk : in STD_LOGIC; --clock from before, active on rising clock edge
           clk_en : in STD_LOGIC; --clock enable, even if en is 1, nothing changes if clk_en is 0
           dir : in STD_LOGIC; --loads in value from val pin
           en : in STD_LOGIC; --nothing changes when en is 0
           ld : in STD_LOGIC; --if ld is 1, then val pin is loaded value
           rst : in STD_LOGIC; --when rst is 1, cnt will become 0
           updn : in STD_LOGIC; --updn loads in value at dir pin 
           val : in STD_LOGIC_vector(3 downto 0);
           cnt : out STD_LOGIC_vector(3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal current_val : std_logic_vector(3 downto 0) := "1111";
signal current_dir : std_logic;
signal current_cnt : std_logic_vector(3 downto 0);
begin


process(clk, clk_en) 
begin 
if(rising_edge(clk)) then
    if(en = '1' and clk_en = '0') then
        if (rst = '1') then 
            current_cnt <= (others => '0');
        end if;
     
    elsif(en = '1' and clk_en = '1') then 
            if(ld = '1') then
                current_val <= val;
            end if;
           if(updn = '1') then
               current_dir <= dir;
           end if; 
        if (current_dir = '1') then         
            if ( current_cnt = current_val ) then                 
                current_cnt <= (others => '0');                              
            else 
                current_cnt <= std_logic_vector ( unsigned (current_cnt) + 1);                               
            end if;                                         
       else                   
            if(unsigned(current_cnt) > 0) then
                current_cnt <= std_logic_vector (unsigned(current_cnt)- 1);
            else
                current_cnt <=current_val;
            end if;
            --if(unsigned(current_cnt) = 0) then            
            --    current_cnt <= current_val;                                                             
            --else             
                --current_cnt <= std_logic_vector (unsigned(current_cnt)- 1);                
            --end if;                     
       end if;
       if(en = '1') then
           if(rst ='1') then
               current_cnt <= "0000";
           end if;
       end if;                

    end if;
end if;      

cnt <= current_cnt; 
end process; 

end architecture;



