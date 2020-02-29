----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:28 03/25/2019 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
  Port (   Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  rf_wr_reg : in STD_LOGIC_VECTOR(4 downto 0); 
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  Immed : out  STD_LOGIC_VECTOR (31 downto 0);
			  Immed_in : in STD_LOGIC_VECTOR (31 downto 0);
			  Wrdt : out STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
end DECSTAGE;



architecture Behavioral of DECSTAGE is
--------------------------------------------------------------------------------------------------------

component Read_MUX
Port ( Instr_rd : in STD_LOGIC_VECTOR (4 downto 0);
		 Instr_rt : in STD_LOGIC_VECTOR (4 downto 0);
		 RF_B_sel : in STD_LOGIC;
		 Read_register_2 : out STD_LOGIC_VECTOR (4 downto 0));
end component;
		 
component Write_MUX		 
Port ( ALU_out : in STD_LOGIC_VECTOR (31 downto 0);
		 MEM_out : in STD_LOGIC_VECTOR (31 downto 0);
		 Immed_out : in STD_LOGIC_VECTOR (31 downto 0);
		 RF_WrData_sel : in STD_LOGIC_VECTOR(1 downto 0);
		 Write_data : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component registerfile is
   Port (  Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC; 
           CLK : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component  Extenter is
    Port ( Instr : in  STD_LOGIC_VECTOR (15 downto 0);
           Op : in  STD_LOGIC_VECTOR (5 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
--------------------------------------------------------------------------------------------------------
signal Wr_data, imm : STD_LOGIC_VECTOR (31 downto 0);
signal radr2 : STD_LOGIC_VECTOR (4 downto 0);
--------------------------------------------------------------------------------------------------------
begin

R_MUX : Read_MUX 	port map (Instr_rd => Instr(20 downto 16),
									 Instr_rt => Instr(15 downto 11),
									 RF_B_sel => RF_B_sel,
									 Read_register_2 => radr2);
									 
W_MUX : Write_MUX  port map (ALU_out => ALU_out,
									  MEM_out => MEM_out,
									  Immed_out => Immed_in,
									  RF_WrData_sel => RF_WrData_sel,
									  Write_data => Wr_data );
							 
RF: registerfile	port map  (Ard1=>Instr(25 downto 21),
                             Ard2=>radr2,
                             Awr=>rf_wr_reg,
                             Dout1=>RF_A,
                             Dout2=>RF_B,
                             Din=>Wr_data,
                             WE=>RF_WrEn,
                             Clk=>Clk,
			                    rst=>rst);	

			  
Extenter16to32: Extenter	port map	(Instr=> Instr(15 downto 0), 		  
												Op=>Instr(31 downto 26),
												Immed=>Immed);
												
Wrdt <= Wr_data;
							 
end Behavioral;


