
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sixBitAdder is
    Port ( A6 : in std_logic_vector (5 downto 0);
           B6 : in STD_LOGIC_vector (5 downto 0);
           S6 : out std_logic_vector (5 downto 0);
           Ci : in STD_LOGIC;
           C5 : out STD_LOGIC);
end sixBitAdder;



architecture Structural of sixBitAdder is

    component fullAdder
    port ( A0,B0,Cin : in STD_LOGIC;
           SOUT, COUT : out STD_LOGIC);
    end component;
    
    signal c : std_logic_vector (6 downto 0);
    
    
    begin
        c(0) <= Ci;
        
        GEN_REG:
        for I in 0 to 5 generate
           F: fullAdder port map(A0 => A6(I), B0 => B6(I), Cin => C(I), SOUT=>S6(I), COUT => c(I+1));
        end generate GEN_REG;
       
        C5 <= c(6);

end Structural;
