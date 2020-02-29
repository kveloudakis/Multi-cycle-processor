----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:49 05/12/2019 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

entity IF_ID is
    port (clk         : in std_logic;
			 reset		 : in std_logic;
			 instruction : in std_logic_vector(31 downto 0);
			 rfbsel 		 : out std_logic;
			-- wakeupsignal 		 : out std_logic;
          instr_out   : out std_logic_vector(31 downto 0));
end IF_ID;

architecture behavioral of IF_ID is

begin	
	process
		begin
		wait until clk'event and clk = '1';
			if(reset = '1') then
				instr_out <= "00000000000000000000000000000000";
			else
				if(instruction(31 downto 26) = "011111") then
					rfbsel <= '1'; 
				else
					rfbsel <= '0'; 
				end if;
				instr_out <= instruction;			
			end if;
	end process;
	
end behavioral;
