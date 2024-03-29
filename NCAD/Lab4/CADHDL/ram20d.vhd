--
-- one port RAM, asynchronous read.
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram20d is
  generic (Tpd : time := 3 ns);
    port (clk : in std_logic;
           we  : in std_logic;
           oe  : in std_logic;
           addr: in std_logic_vector(5 downto 0);
           data: inout std_logic_vector(15 downto 0));
end entity ram20d;

architecture behav of ram20d is
   type ram_type is array (63 downto 0) of std_logic_vector (15 downto 0);
   signal RAM : ram_type;
   signal data_from_ram: std_logic_vector(15 downto 0);
   
begin
    write_process: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (we='1' and oe='0') then
                RAM(to_integer(unsigned(addr))) <= data after Tpd;
            end if;
        end if;
    end process write_process;

   data_from_ram <= RAM(to_integer(unsigned(addr)));
   data <= data_from_ram after Tpd when oe='1' else (others => 'Z') after Tpd;

end behav;
