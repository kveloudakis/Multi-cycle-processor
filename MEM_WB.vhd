----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:40 05/12/2019 
-- Design Name: 
-- Module Name:    MEM_WB - Behavioral 
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

entity MEM_WB is
Port (clk  : in std_logic;
		wb   : in std_logic_vector(2 downto 0);
		wb_out : out std_logic_vector(2 downto 0);
		rd : in std_logic_vector(4 downto 0);
		rd_out : out std_logic_vector(4 downto 0);
		immed : in std_logic_vector(31 downto 0);
		immed_out : out std_logic_vector(31 downto 0);
		alu_out : out std_logic_vector(31 downto 0);
		alu : in std_logic_vector(31 downto 0));
end MEM_WB;

architecture Behavioral of MEM_WB is

begin
process
begin

wait until clk'event and clk = '1';

wb_out <= wb;
rd_out <= rd;
immed_out <= immed;
alu_out <= alu;

end process;
end Behavioral;

