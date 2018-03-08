library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity decim is
  generic(osr: integer := 32);
  port(clk: in std_logic;
    data_in: in std_logic;
    data_out: out integer);
end entity;

architecture default of decim is
begin
  process(clk)
    variable progress: integer := 0;
    variable result: integer := osr;
  begin
    if data_in = '1' then
      result := result + 1;
    end if;
    if data_in = '0' then
      result := result - 1;
    end if;

    if progress = osr then
      progress := 0;
      data_out <= result;
      result := osr;
    else
      progress := progress + 1;
    end if;
  end process;
end architecture;