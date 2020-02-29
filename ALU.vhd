----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:18 03/25/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);  
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	signal result : std_logic_vector(31 downto 0);
	signal first : std_logic_vector(32 downto 0);

begin
WITH Op SELECT 
	result <=   A+B 				when "0000",	--sum
					A-B 				when "0001",	--sub
					A nand B 			when "0010",	--logical and
					A or B 			when "0011",	--logical or
					not A				when "0100",			
					A(31) & A(31 downto 1)	when "1000",	--shift right arithmetic 1 position
					'0' & A(31 downto 1)		when "1001",	--shift right logical 1 position
					A(30 downto 0) & '0'		when "1010",	--shift left logical 1 position
					A(30 downto 0) & A(31) 	when "1100",	--shift left rotate 1 position
					A(0) & A(31 downto 1)		when "1101",	--shift right rotate 1 position		
					result 			when others;
					
WITH Op SELECT		
	first	<=	('0'&A)+('0'&B) when "0000" ,
				('0'&A)-('0'&B) when "0001" ,
				first when others;
				
WITH Op SELECT	
	Cout	<=	first(32) when "0000" ,
				first(32) when "0001" ,
				'0'	when others;
				
WITH Op SELECT	
	Ovf	<=	result(31) xor A(31) xor B(31) xor first(32) when "0000" ,
				result(31) xor A(31) xor B(31) xor first(32) when "0001" ,
				'0'	when others;
						
Zero <= '1' WHEN result=0  ELSE '0';
Output <=result ;

end Behavioral;



