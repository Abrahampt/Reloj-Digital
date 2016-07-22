library ieee;
use ieee.std_logic_1164.all;

entity Decodificador is 
port(A: in std_logic_vector(3 downto 0);Y:out std_logic_vector(0 to 6));
end Decodificador;

architecture behavior of Decodificador is 
begin 

process(A)
begin 

case A is 

			when "0000" => Y <= "0000001";
			when "0001" => Y <= "1001111";
			when "0010" => Y <= "0010010";
			when "0011" => Y <= "0000110";
			when "0100" => Y <= "1001100";
			when "0101" => Y <= "0100100";
			when "0110" => Y <= "0100000";
			when "0111" => Y <= "0001101";
			when "1000" => Y <= "0000000";
			when "1001" => Y <= "0000100";
			when "1010" => Y <= "0001000";
			when "1011" => Y <= "1100000";
			when "1100" => Y <= "0110001";
			when "1101" => Y <= "1000010";
			when "1110" => Y <= "0110000";
			when others => Y <= "0111000";
		end case;
end process; 

end architecture;
