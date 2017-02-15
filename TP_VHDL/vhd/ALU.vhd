library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;

entity ALU is
	port(	A,B		: in STD_LOGIC_VECTOR(7 downto 0) ;
		CMD		: in STD_LOGIC_VECTOR(2 downto 0) ;
		Zero		: out std_logic;
		S		: out STD_LOGIC_VECTOR(7 downto 0)) ;
		
end ALU;

architecture A of ALU is

signal result: unsigned (8 downto 0);
signal a_u: unsigned (7 downto 0);
signal b_u: unsigned (7 downto 0);

begin

zero<= '1' when result(7 downto 0) = "00000000" else '0';

S<= std_logic_vector(result(7 downto 0));
a_u<= unsigned(a);
b_u<= unsigned(b);


with CMD select result<= "000000000" when "000",
			 ('0' & a_u) + ('0' & b_u ) when "011", 			
   			 ('0' & a_u) - ('0' & b_u ) when "010",
			 ('0' & b_u) - ('0' & a_u ) when "001",
			 ('0' & a_u) XOR ('0' & b_u ) when "100",
			 ('0' & a_u) AND ('0' & b_u ) when "110",
			 ('0' & a_u) OR ('0' & b_u ) when "101",
    			 "111111111" when others;
end A;
    
    

