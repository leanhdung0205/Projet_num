library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;
library lib_COMP ;
use lib_COMP.ALU;
--library lib_SYNTH ;
--use lib_SYNTH.ALU;


entity test_ALU is end test_ALU ;

architecture test1 of test_ALU is

	component ALU
	port(	A,B		: in STD_LOGIC_VECTOR(7 downto 0) ;
		CMD		: in STD_LOGIC_VECTOR(2 downto 0) ;
		Zero		: out std_logic;
		S		: out STD_LOGIC_VECTOR(7 downto 0)) ;
		
	end component ;

signal sig_A, sig_B, sig_S	: unsigned (7 downto 0) ;
signal sig_CMD	: unsigned(2 downto 0) := "000";
signal sig_As, sig_Bs, sig_Ss	: STD_LOGIC_VECTOR (7 downto 0) ;
signal sig_CMDs	: STD_LOGIC_VECTOR(2 downto 0) := "000";
signal sig_zero: std_logic;

begin

    ALU1: ALU port map (sig_As, sig_Bs, sig_CMDs, sig_zero, sig_Ss);     --instanciation

    sig_As<=std_logic_vector(sig_A);
    sig_Bs<=std_logic_vector(sig_B);
    sig_CMDs<=std_logic_vector(sig_CMD);
    sig_S<=unsigned(sig_Ss);
    
    process
    constant delay: time :=10 ns;
   
    begin
		
	sig_A <= "00001110";
	sig_B <= "00001111";		 
	sig_CMD <= "010";			-- case 1: Substraction A-B		   
	wait for delay;
	assert sig_S = 16#ff# report "ALU test sig_out SUB" severity note;
	assert sig_zero = '0' report "ALU TEST FLAG" severity note;
	
	sig_A <= to_unsigned(10,8);
	sig_B <= to_unsigned (15,8);		 
	sig_CMD <= "011";			-- case 2: Addition		   
	wait for delay;
	assert sig_S = 25 report "ALU test sig_out ADD" severity note;
	assert sig_zero = '0' report "ALU TEST FLAG" severity note;
	
	
	sig_A <= "00000001";
	sig_B <= "11111111";		 
	sig_CMD <= "011";			-- case 1: Addition		   
	wait for delay;
	assert sig_S = 16#00# report "ALU test sig_out ADD" severity note;
	assert sig_zero = '1' report "ALU TEST FLAG" severity note;
	
	sig_A <= "01010101";
	sig_B <= "00110011";		 
	sig_CMD <= "110";			-- case 1: AND		   
	wait for delay;
	assert sig_S = "00010001" report "ALU test sig_out AND" severity note;
	assert sig_zero = '0' report "ALU TEST FLAG" severity note;
		
   
	sig_A <= "01010101";
	sig_B <= "00110011";		 
	sig_CMD <= "101";			-- case 1: OR		   
	wait for delay;
	assert sig_S = "01110111" report "ALU test sig_out OR" severity note;
	assert sig_zero = '0' report "ALU TEST FLAG" severity note;
	
	
	assert false report " FIN DE LA SIMULATION" severity failure;
		
		
    end process;

end test1;

