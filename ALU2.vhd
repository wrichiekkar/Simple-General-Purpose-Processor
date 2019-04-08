Library IEEE; 
USE ieee.std_logic_1164.all ; 
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all; 

ENTITY ALU2 IS 
PORT (CLOCK: IN std_logic; 
		A, B: IN unsigned (7 DOWNTO 0); 
		OP: IN unsigned (15 DOWNTO 0);
		Neg: OUT std_logic; 
		R1: OUT unsigned (3 DOWNTO 0); 
		R2: OUT unsigned (3 DOWNTO 0));
END ALU2; 

ARCHITECTURE calculation OF ALU2 IS 
	signal Reg1, Reg2, Result: UNSIGNED (7 DOWNTO 0):= (others => '0');

BEGIN 
	Reg1 <= A; 
	Reg2 <= B; 
	Process (CLOCK, OP)

BEGIN 
	IF (Clock'EVENT AND Clock = '1')THEN 
		CASE OP IS 
			when "0000000000000001" => -- 1
				Result <= shift_right(unsigned(Reg1), 2); 
			when "0000000000000010" => -- 2
				Result <= ((Reg1 - Reg2) +4);
			when "0000000000000100" => -- 3 
				IF (Reg1 > Reg2) THEN
					Result<= Reg1;
				ELSE Result <= Reg2;
				END IF;
			when "0000000000001000" => -- 4
				Result(0) <= (Reg1(0));
				Result(1) <= (Reg1(1));
				Result(2) <= (Reg1(2));
				Result(3) <= (Reg1(3));
				Result(4) <= (Reg2(0));
				Result(5) <= (Reg2(1));
				Result(6) <= (Reg2(2));
				Result(7) <= (Reg2(3));
			when "0000000000010000" => -- 5
				Result <= (Reg1 +1);
			when "0000000000100000" => -- 6
				Result <= (Reg1 AND Reg2);
			when "0000000001000000" => -- 7
				Result(0) <= NOT(Reg1(0));
				Result(1) <= NOT(Reg1(1));
				Result(2) <= NOT(Reg1(2));
				Result(3) <= NOT(Reg1(3));
				Result(4) <= (Reg1(4));
				Result(5) <= (Reg1(5));
				Result(6) <= (Reg1(6));
				Result(7) <= (Reg1(7));
			when "0000000010000000" => --  8 IDK 3 BITS
				Result <= (Reg2 rol 3);
			WHEN "0000000100000000" =>  -- 9
				Result <= null;
			WHEN OTHERS => 
					--Don't care, do nothing 
		END CASE; 
	END IF; 

END PROCESS; 
	R1 <= Result (3 DOWNTO 0); 
	R2 <= Result (7 DOWNTO 4); 
END calculation;