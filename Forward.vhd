----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:15 05/12/2019 
-- Design Name: 
-- Module Name:    Forward - Behavioral 
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


entity Forward is
port (forwardA : out std_logic_vector(1 downto 0);
		forwardB : out std_logic_vector(1 downto 0);
		OpCode : in std_logic_vector(5 downto 0);
		EXMEM_RegWrite : in std_logic;
		MEMWB_RegWrite : in std_logic;
		EXMEM_rd : in std_logic_vector(4 downto 0);
		IDEX_rs : in std_logic_vector(4 downto 0);
		IDEX_rt : in std_logic_vector(4 downto 0);
		MEMWB_rd : in std_logic_vector(4 downto 0));
end Forward;

architecture Behavioral of Forward is
begin

forwardA <= "01" when (EXMEM_RegWrite = '1' and EXMEM_rd /= "00000" and EXMEM_rd = IDEX_rs) else  
				"10" when ((MEMWB_RegWrite = '1' and MEMWB_rd /= "00000" and MEMWB_rd = IDEX_rs)) else 
				"00"; 
					
forwardB <= "01" when (EXMEM_RegWrite = '1' and EXMEM_rd /= "00000" and EXMEM_rd = IDEX_rt) else 
				"10" when (MEMWB_RegWrite = '1' and MEMWB_rd /= "00000" and MEMWB_rd = IDEX_rt) else 
				"11" when (OpCode = "111000" or OpCode = "011111" or OpCode = "001111") else 
				"00"; 
					
end Behavioral;