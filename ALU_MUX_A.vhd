----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:39 05/11/2019 
-- Design Name: 
-- Module Name:    ALU_MUX_A - Behavioral 
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

entity ALU_MUX_A is
 Port ( RF_A : in STD_LOGIC_VECTOR (31 downto 0);
		  A_Sel : in STD_LOGIC_VECTOR (1 downto 0);
		  ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		  rf_data : in STD_LOGIC_VECTOR (31 downto 0);
		  MuxOutA : out STD_LOGIC_VECTOR (31 downto 0));
end ALU_MUX_A;

architecture Behavioral of ALU_MUX_A is

begin

MuxOutA	<=	RF_A 			when A_Sel = "00" else
				ALU_out_mem when A_Sel = "01" else
				rf_data 		when A_Sel = "10";

end Behavioral;

