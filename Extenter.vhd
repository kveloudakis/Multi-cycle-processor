----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:56 03/25/2019 
-- Design Name: 
-- Module Name:    Extenter - Behavioral 
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

entity Extenter is
    Port ( Instr : in  STD_LOGIC_VECTOR (15 downto 0);
           Op : in  STD_LOGIC_VECTOR (5 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0));
end Extenter;

architecture Behavioral of Extenter is

signal temp:STD_LOGIC_VECTOR (31 downto 0);

begin
		 
	temp<=	Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr
       when (Op="111000" OR Op="110000" OR Op="000011" OR Op="000111" OR Op="001111" OR Op="011111") else
		 
		 Instr & "0000000000000000" 
		 when Op="111001" else
		 
		 "0000000000000000" & Instr 
		 when (Op="110010" Or Op="110011") else
		 
		 Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)&Instr(15)& Instr &"00" 
		 when (Op="111111" Or Op="000000" OR Op="000001") else
		
		 temp;


Immed<= temp;

end Behavioral;


