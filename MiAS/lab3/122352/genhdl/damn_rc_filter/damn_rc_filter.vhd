-- genhdl\damn_rc_filter/damn_rc_filter.vhd
-- Generated by SystemVision VHDL Netlister 5.10.3 Update-1 (Build 2014.06.24)
-- File created Thu Apr 05 15:47:51 2018

library ieee;
library edulib;
library svlib;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.mechanical_systems.all;
use ieee.fluidic_systems.all;
use ieee.thermal_systems.all;
use ieee.radiant_systems.all;
use work.all;

entity DAMN_RC_FILTER is
end entity DAMN_RC_FILTER;

architecture arch_DAMN_RC_FILTER of DAMN_RC_FILTER is
   terminal VIN: ELECTRICAL;
   terminal VOUT: ELECTRICAL;

begin

   V_PULSE1 : entity EDULIB.V_PULSE(IDEAL)
      generic map ( PERIOD => 2 MS,
                    PULSE => 5.0,
                    WIDTH => 1 MS )
      port map ( POS => VIN,
                NEG => ELECTRICAL_REF );

   R1 : entity EDULIB.RESISTOR(IDEAL)
      generic map ( RES => 5.0E3 )
      port map ( P1 => VIN,
                P2 => VOUT );

   R2 : entity EDULIB.RESISTOR(IDEAL)
      generic map ( RES => 50.0 )
      port map ( P1 => ELECTRICAL_REF,
                P2 => VOUT );

   C1 : entity EDULIB.CAPACITOR(IDEAL)
      generic map ( CAP => 1.0E-6 )
      port map ( P1 => ELECTRICAL_REF,
                P2 => VOUT );

end architecture arch_DAMN_RC_FILTER;

