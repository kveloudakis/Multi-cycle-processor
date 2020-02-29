----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:00 03/25/2019 
-- Design Name: 
-- Module Name:    SECRETMEM - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SECRETMEM is
Port (clk : in  STD_LOGIC;
      Mem_WrEn : in  STD_LOGIC;
      ALU_MEM_Addr : in  STD_LOGIC_VECTOR (10 downto 0);
      MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
      MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
		inst_addr : in std_logic_vector(10 downto 0);
		inst_dout : out std_logic_vector(31 downto 0));
end SECRETMEM;

architecture Behavioral of SECRETMEM is
--------------------------------------------------------------------------------------------------
component RAM is
Port (clk : in  STD_LOGIC;
      Data_we : in  STD_LOGIC;
		inst_addr : in std_logic_vector(10 downto 0);
		inst_dout : out std_logic_vector(31 downto 0);
      Data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
      Data_din : in  STD_LOGIC_VECTOR (31 downto 0);
      Data_dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--------------------------------------------------------------------------------------------------				
signal tempmem : std_logic_vector (10 downto 0);
--------------------------------------------------------------------------------------------------
begin
SMEM: RAM port map (clk=>clk,
						 data_we=>Mem_WrEn,
						 data_addr=>ALU_MEM_Addr,
						 data_din=>MEM_DataIn,
						 data_dout=>MEM_DataOut,
						 inst_addr=>inst_addr,
						 inst_dout=>inst_dout
						 );
end Behavioral;

