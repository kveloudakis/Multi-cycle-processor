----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:33 03/25/2019 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( PC_LdEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is


signal temp : STD_LOGIC_VECTOR (31 downto 0);

begin

	PROCESS(Clk,Reset)
	
	BEGIN
	If Reset='1' then
			temp<="00000000000000000000000000000000";
	elsif falling_edge(clk) then
		
			If PC_LdEn='1' then
			temp<=Data;
		else 
			temp<= temp;
			END IF;
		END IF;	
	END PROCESS;
	
	Dout<=temp;

end Behavioral;



