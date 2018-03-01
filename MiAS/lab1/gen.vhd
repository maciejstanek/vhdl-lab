library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity gen is port(
  clk:	out std_logic;
  s1: out std_logic;
  s2: out std_logic;
  s3: out std_logic_vector(1 downto 0);
  s4: out integer);
end entity;

architecture default of gen is
signal clkgen: std_logic := '0';
begin
  clkgen <= not clkgen after 20 ns;
  clk <= clkgen;
  
  s1 <= '1', '0' after 10 ns, '1' after 20 ns;
  s2 <= '1', '0' after 10 ns, '1' after 30 ns, '0' after 50 ns;
  s3 <= "01", "00" after 10 ns, "11" after 20 ns;
  s4 <= 0, 2 after 10 ns, 5 after 20 ns;
end architecture;

architecture empty of gen is
begin
end architecture;