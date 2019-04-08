Library IEEE; 
USE ieee.std_logic_1164.all ; 
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all; 

ENTITY ALU3 IS 
PORT (CLOCK: IN std_logic; 
		A, B: IN UNSIGNED (7 DOWNTO 0); 
		OP: IN UNSIGNED (15 DOWNTO 0);
		Neg: OUT std_logic; 
		R1: OUT UNSIGNED (3 DOWNTO 0); 
		R2: OUT UNSIGNED (3 DOWNTO 0));
END ALU3; 

ARCHITECTURE calculation OF ALU3 IS 
	signal Reg1: UNSIGNED (3 DOWNTO 0);
	signal Reg2: UNSIGNED(3 DOWNTO 0);
	signal Result: UNSIGNED(7 DOWNTO 0);

BEGIN  	
	Reg1(3) <= A(7);
	Reg1(2) <= A(6); 
	Reg1(1) <= A(5); 
	Reg1(0) <= A(4); 
	Reg2(3) <= A(3); 
	Reg2(2) <= A(2); 
	Reg2(1) <= A(1); 
	Reg2(0) <= A(0);
	Process (CLOCK, OP)
BEGIN  
	IF (Clock'EVENT AND Clock = '1')THEN 
		CASE OP IS 
	  when "0000000000000001" =>
		if ((Reg1 > "0110") or (Reg2 > "0110")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000000000010" => 
		if ((Reg1 > "0000") or (Reg2 > "0000")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000000000100" => 
		if ((Reg1 > "0000") or (Reg2 > "0000")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000000001000" => 
		if ((Reg1 > "1000") or (Reg2 > "1000")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000000010000" =>
		if ((Reg1 > "0011") or (Reg2 > "0011")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000000100000" =>
		if ((Reg1 > "0000") or (Reg2 > "0000")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000001000000" => 
		if ((Reg1 > "0001") or (Reg2 > "0001")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000000100000000" => 
		if ((Reg1 > "0010") or (Reg2 > "0010")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when "0000001000000000" =>
		if ((Reg1 > "0110") or (Reg2 > "0110")) then
		Result <= "00000000" ;
		else Result <= "00000001";
		end if;
	  when others =>
		END CASE; 
	END IF; 
END PROCESS; 
R1 <= Result (3 DOWNTO 0); 
R2 <= Result (7 DOWNTO 4); 

END calculation; 


   

			