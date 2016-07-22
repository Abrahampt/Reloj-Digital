library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity FSMDisplay is 
port(
RST: in std_logic;
clk: in std_logic;
T: in std_logic;
C:in std_logic_vector(3 downto 0);
Opc: out std_logic_vector(1 downto 0);
T0: out std_logic);
end FSMDisplay;

architecture behavior of FSMDisplay is 
signal Qp,Qn: std_logic_vector(1 downto 0);
begin

combinacional: process(T,C,Qp)
begin
	case Qp is 
	when "00" =>
		OPC<="11";
		T0<='0';
		Qn<="10";
		
	when "01" =>
		OPC<="01";
		T0<='0';
		Qn<="10";
	
	when "10" =>
		OPC<="00";
		T0<='0';
	if(T='1' and C="1001") then 
	  Qn<="11";
	elsif(T='1') then
		Qn<="01";
	else
		Qn<=Qp;
	end if;
	
	when others => 
	OPC<="11";
	T0<='1';
	Qn<="10";
 end case;
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

