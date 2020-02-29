----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:01 05/11/2019 
-- Design Name: 
-- Module Name:    ALU_MUX_B - Behavioral 
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

entity ALU_MUX_B is
 Port ( RF_B : in STD_LOGIC_VECTOR (31 downto 0);
		  Immed : in STD_LOGIC_VECTOR (31 downto 0);
		  ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		  rf_data : in STD_LOGIC_VECTOR (31 downto 0);		  
		  ALU_Bin_B_sel : in STD_LOGIC_VECTOR (1 downto 0);
		  ALU_Mux_out_B : out STD_LOGIC_VECTOR (31 downto 0)); 
end ALU_MUX_B;

architecture Behavioral of ALU_MUX_B is

begin

ALU_Mux_out_B	<=	RF_B 			when ALU_Bin_B_sel="00" else
						Immed 		when ALU_Bin_B_sel="11" else
						rf_data 		when ALU_Bin_B_sel="10" else
			 			ALU_out_mem when ALU_Bin_B_sel="01";

end Behavioral;