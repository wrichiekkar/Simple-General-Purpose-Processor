library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
entity ALU is
port (Clk : in std_logic;
		A, B : in unsigned(7 downto 0);
		student_id : in unsigned(3 downto 0);
		OP : in unsigned (15 downto 0);
		Neg: out std_logic;
		R1 : out unsigned(3 downto 0);
		R2 : out unsigned(3 downto 0));
end ALU;
architecture calculation of ALU is 
signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others=>'0');
signal Reg4: unsigned(7 downto 0);
begin
Reg1<=A;
reg2<=B;
process(Clk, OP)
begin	
		if(rising_edge(clk)) then
			case OP is
			When "0000000000000001"=> result <= reg1 + reg2;
			when "0000000000000010"=> 
			if (reg1 < reg2) then
			Neg <= '1';
			result <= reg2 - reg1;
			else 
			neg <= '0';
			result <= reg1 - reg2;
			end if;
			when "0000000000000100"=> result <= not reg1;
			neg <='0';
			when "0000000000001000"=> result <= reg1 NAND reg2;
			neg <='0';
			when "0000000000010000"=> result <= reg1 NOR reg2;
			neg <='0';
			when "0000000000100000"=> result <= reg1 AND reg2;
			neg <='0';
			when "0000000001000000"=> result <= reg1 OR reg2;
			neg <='0';
			when "0000000010000000"=> result <= A XOR B;
			neg <='0';
			when "0000000100000000"=> result <= NOT (A XOR B);
			neg <='0';
			when others => null;
		end case;
	end if;

end process;
R1<=Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;
			