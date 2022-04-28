Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AR_TRC is
port ( clk : in std_logic;
		addrb : out std_logic_vector (10 downto 0)
	 );
end AR_TRC;

architecture AR_ATRC of AR_TRC is
signal adrts : std_logic_vector (10 downto 0) :="00000000000" ;
signal four : integer :=4;
begin
process (clk, adrts, four)
begin
if (clk 'event and clk='1') then
	if (adrts="11100001000") then
		if (four=0) then null;
		else adrts <= "00000000000";
			 four <= four - 1;
		end if;
	else adrts <= adrts + "00000000001";
	end if;
end if;
end process ;

addrb <= adrts;

end AR_ATRC;
