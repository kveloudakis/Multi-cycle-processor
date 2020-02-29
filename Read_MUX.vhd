----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:23 05/11/2019 
-- Design Name: 
-- Module Name:    Read_MUX - Behavioral 
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

entity Read_MUX is

Port ( Instr_rd : in STD_LOGIC_VECTOR (4 downto 0);
		 Instr_rt : in STD_LOGIC_VECTOR (4 downto 0);
		 RF_B_sel : in STD_LOGIC;
		 Read_register_2 : out STD_LOGIC_VECTOR (4 downto 0));
		 
end Read_MUX;

architecture Behavioral of Read_MUX is

begin

Read_register_2 <= Instr_rd when RF_B_sel='1' else Instr_rt;

end Behavioral;