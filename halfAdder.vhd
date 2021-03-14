
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    Port( HA,HB : in STD_LOGIC;
          HS, HC : OUT STD_LOGIC);
end halfAdder;

architecture DataFlow of halfAdder is

begin

    HS <= HA XOR HB;
    HC <= HA AND HB;


end DataFlow;
