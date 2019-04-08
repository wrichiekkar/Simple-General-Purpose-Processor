library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decod is
Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
En : IN STD_LOGIC;
y : out STD_LOGIC_VECTOR (7 downto 0));
end decod;

architecture Behavioral of decod is
SIGNAL Enw : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
Enw <= En & s;
with Enw select
y<="00000001" when "0000",
"00000010" when "0001",
"00000100" when "0010",
"00001000" when "0011",
"00010000" when "0100",
"00100000" when "0101",
"01000000" when "0110",
"10000000" when "0111",
"00000000" when others;
end Behavioral;

