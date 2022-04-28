Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AR_MRC is
port ( clk : in std_logic;
		 addra : out std_logic_vector (12 downto 0)
	 );
end AR_MRC;

Architecture AR_AMRC of AR_MRC is
signal adrms : std_logic_vector (12 downto 0) :="0000000000000" ;
begin
process (clk, adrms)
begin
if (clk 'event and clk='1')then
	if (adrms="1110000100000")then
	null; 
	else adrms <= adrms + "0000000000001";
	end if;
end if;
end process;

addra <= adrms;

end AR_AMRC;
