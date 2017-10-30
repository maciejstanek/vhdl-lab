library ieee;
use ieee.std_logic_1164.all;

entity counter_bcd_2digits is
  port(clk: in std_logic;
       digit_1: out std_logic_vector(6 downto 0)
       --digit_10: out std_logic_vector(6 downto 0)
       );
end entity counter_bcd_2digits;

architecture struct of counter_bcd_2digits is
  signal num_1 : std_logic_vector(3 downto 0);
  --signal num_10 : std_logic_vector(3 downto 0);
begin
  counter_1: entity work.licznik_u(behav)
    port map(num_1, '0', '1', clk);
  sseg_1: entity work.seven_seg(synteza)
    port map(num_1, digit_1);  
end architecture struct;    
