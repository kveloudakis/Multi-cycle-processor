----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:13 05/11/2019 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
Port (instr : in std_logic_vector(31 downto 0);
		Reset : in std_logic;
		wb	 : out std_logic_vector(2 downto 0);
		mem	 : out std_logic;
		exec	 : out std_logic_vector(3 downto 0));
end Control;

architecture behavioral of Control is
    
signal Control_vector : std_logic_vector(3 downto 0) := (others => '0');
	 
begin

Control_vector <= "0000" when Reset = '1' else
						"0001" when instr(31 downto 26) = "100000" else 
						"0101" when instr(31 downto 26) = "001111" else 
						"0010" when instr(31 downto 26) = "011111" else 
						"1001" when instr(31 downto 26) = "111000" else 
						"0000" when instr = "00000000000000000000000000000000" else 
						Control_vector;

mem <= Control_vector(1); 								
exec <= "0000";											
wb(1 downto 0) <= Control_vector(3 downto 2);	
wb(2) <= Control_vector(0); 							

end behavioral;