--contador 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Contador is 
port(RST:in std_logic;CLK:in std_logic;OPC:in std_logic_vector(1 downto 0);Y:out std_logic_vector(3 downto 0));
end entity;
--00:hold,01:increment,10:decrement,11:clear; 
architecture behavior of Contador is 
signal Qp,Qn: std_logic_vector(3 downto 0);
begin 
combinacional: process(Qp,OPC)
begin

case OPC is
	when "00" => Qn<=Qp;
	when "01" => Qn<=Qp+1;
	when "10" => Qn<=Qp-1;
	when "11" => Qn<=(others=>'0');
	end case;
	Y<=Qp;	
		
end process;	


secuencial:process(CLK,RST)
begin 
if(RST='0') then
Qp<=(others=>'0');
elsif(clk'event and clk='1') then
Qp<=Qn;
end if;
end process;

end architecture;
