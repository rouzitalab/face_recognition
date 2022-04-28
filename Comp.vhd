--Alireza Rouzitalab
--8823056
--Final Project

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AR_C is
port (clk : in std_logic;
		addra : in std_logic_vector (12 downto 0);
		douta, doutb : in std_logic_vector (7 downto 0); 
		targ : out std_logic_vector (3 downto 0)
	 );
end AR_C;

architecture AR_AC of AR_C is
signal diff1 : integer :=0 ;
signal diff2 : integer :=0 ;
signal diff3 : integer :=0 ;
signal diff4 : integer :=0 ;
signal subint : integer ;
signal sub : std_logic_vector (7 downto 0);
begin
pr1:process (clk, douta, doutb)
begin
if (clk 'event and clk='1')then
	sub <= douta - doutb;
	if (sub(7)='1')then
		sub <= (not sub) + 1;	--We want to make sure that 'sub' is absolute of (douta - doutb)
	else null;
	end if;
end if;
end process pr1;
pr2:process (sub)
begin
subint <= to_integer(unsigned(sub));	--Here we convert 'std_logic_vector sub' to 'integer subint'
end process pr2;
pr3:process (addra, subint)
begin
	if (addra < "11100001001") then		-- If the mainR is representing the first picture
		diff1 <= diff1 + subint;
	elsif (addra < "11000010001") then		-- If the mainR is representing the second picture
		diff2 <= diff2 + subint;
	elsif (addra < "1010100011001") then		-- If the mainR is representing the third picture
		diff3 <= diff3 + subint;
	else diff4 <= diff4 + subint;				-- If the mainR is representing the fourth picture
	end if;
end process pr3;
pr4: process (diff1, diff2, diff3, diff4)
begin
if (diff1 < diff2 and diff1 < diff3 and diff1 < diff4) then		--the first picture has the lowest diffrence to the target picture
	targ <= "0001";
elsif (diff2 < diff1 and diff2 < diff3 and diff2 < diff4) then		--the second picture has the lowest diffrence to the target picture
	targ <= "0010";
elsif (diff3 < diff1 and diff3 < diff2 and diff3 < diff4) then		--the third picture has the lowest diffrence to the target picture
	targ <= "0100";
elsif (diff4 < diff1 and diff4 < diff2 and diff4 < diff3) then		--the fourth picture has the lowest diffrence to the target picture
	targ <= "1000";
else null;
end if;
end process pr4;

end AR_AC;