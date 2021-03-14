library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity passthrough is
    Port ( SW : in STD_LOGIC_VECTOR (15 downto 0);
           CLK : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);     
           sel : out STD_LOGIC_VECTOR (7 downto 0); --sel controls which one is on used to be called an
           seg : out STD_LOGIC_VECTOR (6 downto 0); -- seg controls which seg is active, used to be called cn
           DP : out STD_LOGIC);
end passthrough;

architecture Behavioral of passthrough is
    signal N0,N1,N2,N3,N4,N5,N6,N7,Z : STD_LOGIC_VECTOR (3 downto 0); -- storage vectors to package data and send to 7 seg
    signal SUM : std_logic_vector (5 downto 0);
    signal carry : std_logic; 
     
    component sevenSeg
    port ( clock : in std_logic ;
           d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector (3 downto 0);
           segs : out std_logic_vector (6 downto 0);
           sl : out std_logic_vector (7 downto 0));
    end component;
    
    component sixBitAdder
    port ( A6,B6 : in std_logic_vector (5 downto 0);
           Ci : in STD_LOGIC;
           S6 : out std_logic_vector (5 downto 0);
           C5 : out STD_LOGIC);
    end component;
    
begin 
    Z <= "0000"; -- simple 0 vector for printing 0
    N0 <= SW(3 downto 0);
    N1 <= "00"&SW(5)&SW(4); --n0 and n1 combined are the 6 bits for A
    N2 <= SW(9 downto 6); 
    N3 <= "00"&SW(11)&SW(10); -- n2 and n3 combined are the 6 bits for B

    add6 : sixBitAdder port map(A6 => SW( 5 downto 0), B6 => SW(11 downto 6), S6 => SUM, Ci => '0', C5 => carry);
    
    N4 <= SUM(3 downto 0);
    N5 <= '0'&carry&SUM(5)&SUM(4); -- n4 and n5 together represent the output of the 6 bit adder
    
    seg7 : sevenSeg port map(clock => CLK, d0=>N0, d1=>N1, d2=>N2, d3=>N3, d4=>N4, d5=>N5, d6=>Z, d7=>Z, segs => seg, sl=>sel);

end Behavioral;

