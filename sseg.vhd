LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

ENTITY sseg IS
	PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds: OUT STD_LOGIC_VECTOR(1 TO 7);
			neg : IN STD_LOGIC;
			leds2: OUT STD_LOGIC_VECTOR(1 TO 7));
END sseg;

ARCHITECTURE Behaviour OF sseg IS
BEGIN
	PROCESS (neg)
	BEGIN
		CASE neg IS        --  abcdefg
			WHEN '0' =>leds2<= NOT"0000000";
			WHEN '1' =>leds2<= NOT"0000001";
		END CASE;
	END PROCESS;
	PROCESS (bcd)
	BEGIN
		CASE bcd IS             --  abcdefg
			WHEN "0000" => leds <= "1000100"; --input "Y"
			WHEN "0001" => leds <= "1101010"; --input "N"
			WHEN OTHERS => leds <= "-------"; 
	
		END CASE;
	END PROCESS;
END Behaviour;