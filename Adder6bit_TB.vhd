
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Adder6bit_TB is
end Adder6bit_TB;

architecture Behavioral of Adder6bit_TB is

component sixBitAdder
    port ( A6,B6 : in std_logic_vector (5 downto 0);
           Ci : in STD_LOGIC;
           S6 : out std_logic_vector (5 downto 0);
           C5 : out STD_LOGIC);
    end component;

signal num1, num2, sum : STD_LOGIC_VECTOR (5 downto 0);
signal Cout  : STD_LOGIC;

signal clock : STD_LOGIC := '0';
signal clk_period : TIME := 20 ns;

begin

    uut: sixBitAdder Port Map ( A6 => num1,
                              B6 => num2,
                              Ci => '0',
                              S6  => sum,
                              C5 => Cout );
                              
    clk_process: process
    begin
        clock <= '1';
        wait for clk_period / 2;
        clock <= '0';
        wait for clk_period / 2;
    end process clk_process;

                              
    test_bench : process
    begin
        num1 <= "000001";
        num2 <= "000001";
        wait for clk_period;
        assert (sum = "000010") AND (Cout = '0');
        
        num1 <= "000001";
        num2 <= "100000";
        wait for clk_period;
        assert (sum = "100001") AND (Cout = '0');
        
        num1 <= "001010";
        num2 <= "011110";
        wait for clk_period;
        assert (sum = "101000") AND (Cout = '0');
        
        num1 <= "001001";
        num2 <= "000010";
        wait for clk_period;
        assert (sum = "001011") AND (Cout = '0');
        
        num1 <= "111111";
        num2 <= "000001";
        wait for clk_period;
        assert (sum = "000000") AND (Cout = '1');
        
        num1 <= "111111";
        num2 <= "111111";
        wait for clk_period;
        assert (sum = "111110") AND (Cout = '1');
        
        wait;
    end process;

end Behavioral;


