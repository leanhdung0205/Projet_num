library IEEE ;
use IEEE.std_logic_1164.ALL ;

entity arbiter is
port (	clk 	: in std_logic ;
	resetn	: in std_logic ;
	R	: in std_logic_vector(1 to 3) ;
	ACK	: out std_logic_vector(1 to 3) );
end arbiter ;


architecture behaviour of arbiter is

type state_arbiter is (Idle, Proc1, Proc2, Proc3) ;
signal current_state : state_arbiter ;
signal next_state : state_arbiter ;

begin
P_state : process (clk, resetn)

begin

-- a completer !

end process P_state ;


P_Next_State_output : process (--a completer !)
begin

-- a completer !

end process Next_State_output ;

end behaviour ;
