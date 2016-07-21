library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BaseT is 
generic(W:integer:=500000;n: integer:=26);
port(RST:in std_logic;CLK:in std_logic;OPC:in std_logic;T:out std_logic);
end entity;
--00:hold,01:increment,10:decrement,11:load; 
architecture behavior of BaseT is 
signal Qp,Qn: std_logic_vector(n-1 downto 0);
begin 
combinacional: process(Qp,OPC)
begin
	if(OPC='0') then
	 Qn<=Qp;
	else 
	 Qn<=Qp-1;
	end if;
	
	if(Qp=0) then
	T<='1';
	Qn<=conv_std_logic_vector(W-1,n);
	else
	T<='0';
	end if;
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
