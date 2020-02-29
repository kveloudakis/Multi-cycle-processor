----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:46 05/12/2019 
-- Design Name: 
-- Module Name:    ID_EX - Behavioral 
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

entity ID_EX is
    Port (clk  : in std_logic;
			 wb   : in std_logic_vector(2 downto 0);
			 mem  : in std_logic;
			 exec : in std_logic_vector(3 downto 0);
			 opcd_in : in std_logic_vector(5 downto 0);
			 opcd_out : out std_logic_vector(5 downto 0);
			 rd : in std_logic_vector(4 downto 0);
			 rd_out : out std_logic_vector(4 downto 0);
			 rs : in std_logic_vector(4 downto 0);
			 rs_out : out std_logic_vector(4 downto 0);
			 rt : in std_logic_vector(4 downto 0);
			 rt_out : out std_logic_vector(4 downto 0);			 
			 immed : in std_logic_vector(31 downto 0);
			 immed_out : out std_logic_vector(31 downto 0);
			 rfa  : in std_logic_vector(31 downto 0);
			 instruction  : in std_logic_vector(31 downto 0);
			 rfa_out : out std_logic_vector(31 downto 0);
			 rfb  : in std_logic_vector(31 downto 0);
			 rfb_out : out std_logic_vector(31 downto 0);
			 wb_out   : out std_logic_vector(2 downto 0);
			 mem_out  : out std_logic;
			 wakeupsignal 		 : out std_logic;
			 exec_out : out std_logic_vector(3 downto 0));
end ID_EX;

architecture Behavioral of ID_EX is

begin
process
		begin
		wait until clk'event and clk = '1';
			wb_out <= wb;
			mem_out <= mem;
			exec_out <= exec;
			rfa_out <= rfa;
			rfb_out <= rfb;
			immed_out <= immed;
			rd_out <= rd;
			rs_out <= rs;
			rt_out <= rt;
			opcd_out <= opcd_in;
   end process;
	
process
begin	

		wait until clk'event and clk = '1';
		if(instruction(31 downto 26) = "001111") then
				wakeupsignal <= '1'; 
		else
				wakeupsignal <= '0'; 
		end if;	
		
end process;
end Behavioral;

