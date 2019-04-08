library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity merger is
port(x1,x2: in std_logic_vector(7 downto 0);
y: out std_logic_vector(15 downto 0));
end merger;

architecture behaviour of merger is
begin	
	y(7 downto 0) <= x1;
	y(15 downto 8) <= x2;
	
end behaviour;