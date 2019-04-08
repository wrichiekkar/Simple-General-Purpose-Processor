Library ieee;
use ieee.std_logic_1164.all;

entity latch1 is 
port (A: in std_logic_vector(7 downto 0);
		Resetn, Clock: in std_logic;
		Q: out std_logic_vector(7 downto 0));
		
	end latch1;
	architecture behavior of latch1 is
	begin	
		process (resetn,clock)
		begin
			if Resetn = '0' then
				Q <="00000000";
			elsif clock'event and clock ='1' then
				Q<=A;
			end if;
			end process;
			end behavior;
			