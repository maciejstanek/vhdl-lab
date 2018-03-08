library ieee;
use ieee.std_logic_1164.all;

entity decim_tb is
  generic(
    din: string := "in.txt";
    dout: string := "out.txt");
end entity decim_tb;

architecture default of decim_tb is
  file infile: text open read_mode is din;
  file outfile : text open write_mode is dout;
  constant clk_period : time := 20 ns;
  signal clk_i, data_in_i: std_logic;
  signal data_out_i: integer;
begin 
  uut: entity work.decim(default)
    generic map(osr => 16);
    port map(
      clk => clk_i,
      data_in => data_in_i,
      data_out => data_out_i);
  
  process
		variable text_in, text_out : line;
		variable bit_in, value_out : integer := 0;
	begin
	  while not endfile(infile) loop
	  	readline(infile, text_in);
	  	read(text_in, data_in);
			data_i <= conv_std_logic_vector(data_in, 16);
	  	clk_i <= '0', '1' after 25 ns, '0' after 50 ns; 
			addr_i <= conv_std_logic_vector(address_in, 6);
	  	wait for clk_period;
			address_in := address_in + 1;
    end loop;
		
		we_i <= '0';
		oe_i <= '1';
		clk_i <= '0';
		data_i <= (others => 'Z');
		wait for clk_period;
	  for address_out in 0 to (address_in - 1) loop
			addr_i <= conv_std_logic_vector(address_out, 6);
	  	wait for clk_period;
			data_out := conv_integer(unsigned(data_i));
			write(text_out, data_out);
			writeline(outfile, text_out);
			wait for clk_period;
    end loop;
    
	  assert false severity error;
	end process;
end architecture;