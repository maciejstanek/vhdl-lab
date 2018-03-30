library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity decim_tb is
  generic(
    din: string := "0.in.txt";
    dout: string := "0.out.txt");
end entity decim_tb;

architecture default of decim_tb is
  file infile: text open read_mode is din;
  file outfile: text open write_mode is dout;
  constant clk_period: time := 20 ns;
  signal clk_i, data_in_i: std_logic;
  signal data_out_i: integer;
begin
  uut: entity work.decim(default)
    generic map(osr => 32)
    port map(
      clk => clk_i,
      data_in => data_in_i,
      data_out => data_out_i);

  process
    variable text_in, text_out: line;
    variable value_out: integer := 0;
  begin
    clk_i <= '0';
    wait for clk_period;
    while not endfile(infile) loop
      readline(infile, text_in);
      if text_in(1) = '#' then
        -- Do not analyze comments, just pass them through.
        writeline(outfile, text_in);
      else
        for i in text_in'range loop
          if text_in(i) = '1' then
            data_in_i <= '1';
          elsif text_in(i) = '0' then
            data_in_i <= '0';
          end if;
          clk_i <= '1';
          wait for clk_period;
          clk_i <= '0';
          wait for clk_period;
        end loop;
        write(text_out, data_out_i);
        writeline(outfile, text_out);
      end if;
    end loop;
    assert false severity error;
  end process;
end architecture;
