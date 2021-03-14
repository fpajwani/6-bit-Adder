
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity sevenSeg is
    Port ( clock : in std_logic ;
           d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector (3 downto 0);
           segs : out std_logic_vector (6 downto 0);
           sl : out std_logic_vector (7 downto 0));
end sevenSeg;

architecture Behavioral of sevenSeg is

    signal CLK_CNT : unsigned(31 downto 0);

    function decode (
    bits : in STD_LOGIC_VECTOR (3 downto 0))
    return STD_LOGIC_VECTOR is 
    variable Q : STD_LOGIC_VECTOR(6 downto 0);
   
    begin
        case bits is
            when "0000" => Q := "0000001"; -- 0
            when "0001" => Q := "1001111"; -- 1
            when "0010" => Q := "0010010"; -- 2 
            when "0011" => Q := "0000110"; --3
            when "0100" => Q := "1001100"; --4
            when "0101" => Q := "0100100"; --5
            when "0110" => Q := "0100000"; --6
            when "0111" => Q := "0001111"; --7
            when "1000" => Q := "0000000"; --8
            when "1001" => Q := "0000100"; --9
            when "1010" => Q := "0001000"; --A
            when "1011" => Q := "1100000"; --B
            when "1100" => Q := "1110010"; --C
            when "1101" => Q := "1000010"; --D
            when "1110" => Q := "0110000"; --E
            when "1111" => Q := "0111000"; --F
    
            when others => Q := "1111111";
            
        end case; 
        
        return STD_LOGIC_VECTOR(Q);
    end;

begin

    COUNT_PROC : process(clock)
    begin
      if rising_edge(clock) then
        if clk_cnt >= 8000 then
          clk_cnt <= (others => '0');
           
        else
          clk_cnt <= clk_cnt + 1;
           
        end if;
      end if;
    end process;


    process
    begin
    
        if rising_edge(clock) then
            if(clk_cnt < 1000) then
                sl <= "11111110";
                segs <= decode(d0);
            elsif(clk_cnt < 2000) then
                sl <= "11111101";
                segs <= decode(d1);
            elsif(clk_cnt < 3000) then
                sl <= "11111011";
                segs <= decode(d2);
            elsif(clk_cnt < 4000) then
                sl <= "11110111";
                segs <= decode(d3);
            
            elsif(clk_cnt < 5000) then
                sl <= "11101111";
                segs <= decode(d4);
                
            elsif(clk_cnt < 6000) then
                sl <= "11011111";
                segs <= decode(d5);
                
            elsif(clk_cnt < 7000) then
                sl <= "10111111";
                segs <= decode(d6);
                
            elsif(clk_cnt < 8000) then
                sl <= "01111111";
                segs <= decode(d7);
            end if;
        end if;
    end process;


end Behavioral;
