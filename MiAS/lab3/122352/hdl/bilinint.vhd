library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity bilinint is
  generic(
    initial : real := 0.0;
    clk_edge : std_logic := '1');
  port(
    input: in real;
    clk: in std_logic;
    output: out real := initial);
end entity;

architecture default of bilinint is
begin
  process(clk)
    variable integral : real := initial;
    variable last_input : real := initial;
  begin
    if clk'event and clk = clk_edge then
      integral := integral + input + last_input;
      last_input := input;
      output <= integral;
    end if;
  end process;
end architecture;
