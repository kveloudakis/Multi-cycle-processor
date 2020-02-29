----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:18 03/25/2019 
-- Design Name: 
-- Module Name:    regb1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regb1 is
  Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end regb1;

architecture Behavioral of regb1 is

signal result : std_logic_vector(31 downto 0);

--
--begin 
--	process
--		begin
--		
--		wait until clk'event and clk='1';
--		if rst='1' THEN
--			result<="00000000000000000000000000000000";
--		else
--			if (WE='1') THEN
--				result <= Data;
--			else
--				result <= result;
--			end if;
--		end if;
--	end process;
--	
--	
	
begin	
	process
		begin
		wait until clk'event and clk = '1';
	If rst='1' then
			result<="00000000000000000000000000000000";
	else	
			If WE='1' then
			result<=Data;
		else 
			result<= result;
			END IF;
		END IF;	
	END PROCESS;
	
	Dout <= result ;
	
	


end Behavioral;


