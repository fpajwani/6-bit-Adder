

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( A0,B0,Cin : in STD_LOGIC;
           SOUT, COUT : out STD_LOGIC);
end fullAdder;

architecture Structural of fullAdder is

component halfAdder
port(HA,HB : in STD_LOGIC;
HS: out STD_LOGIC;
HC: out STD_LOGIC);
end component;

signal S0 : std_logic;
signal C0 : std_logic;
signal C1 : std_logic;

begin
h0: halfAdder port map(HA=>A0, HB=>B0, HS=>S0, HC=>C0);
h1: halfAdder port map(HA=>S0, HB=>Cin, HS=>SOUT, HC=>C1);
COUT <= C0 OR C1;

end Structural;
