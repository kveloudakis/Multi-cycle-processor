----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:40 03/25/2019 
-- Design Name: 
-- Module Name:    ALUSTAGE - Behavioral 
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

entity ALUSTAGE is
Port   (	RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
			RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
			Immed : in  STD_LOGIC_VECTOR (31 downto 0);
			ALU_Bin_A_sel : in  STD_LOGIC_VECTOR(1 downto 0);
			ALU_Bin_B_sel : in  STD_LOGIC_VECTOR(1 downto 0);
			ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			ALUzero : out STD_LOGIC;
			ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		   rf_data : in STD_LOGIC_VECTOR (31 downto 0);
			ALUovf : out STD_LOGIC;
			ALUcout : out STD_LOGIC);
end ALUSTAGE;


architecture Behavioral of ALUSTAGE is

component ALU 
port (A : in std_logic_vector (31 downto 0);
		B: in std_logic_vector (31 downto 0);
		Op: in std_logic_vector (3 downto 0);
		Output : out std_logic_vector(31 downto 0);
		Zero : out std_logic;
		Cout : out std_logic;
		Ovf  : out std_logic);
end component;

component ALU_MUX_A is
Port (RF_A : in STD_LOGIC_VECTOR (31 downto 0);
		A_Sel : in STD_LOGIC_VECTOR(1 downto 0);
		ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		rf_data : in STD_LOGIC_VECTOR (31 downto 0);
		MuxOutA : out STD_LOGIC_VECTOR (31 downto 0)); 
end component;

component ALU_MUX_B is
Port (RF_B : in STD_LOGIC_VECTOR (31 downto 0);
		Immed : in STD_LOGIC_VECTOR (31 downto 0);
		ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		rf_data : in STD_LOGIC_VECTOR (31 downto 0);
		ALU_Bin_B_sel : in STD_LOGIC_VECTOR(1 downto 0);
		ALU_Mux_out_B : out STD_LOGIC_VECTOR (31 downto 0)); 
end component;


signal muxoutA0 : STD_LOGIC_VECTOR (31 downto 0); 
signal muxoutB0 : STD_LOGIC_VECTOR (31 downto 0); 

begin
alu0 : ALU
port map(A => muxoutA0,
			B => muxoutB0,
			Op => ALU_func,
			OutPut => ALU_out,
		   Zero => ALUzero,
		   Cout => ALUcout,
		   Ovf => ALUovf);

ALUmuxA : ALU_MUX_A 
port map(RF_A => RF_A,
			rf_data => rf_data,
			ALU_out_mem => ALU_out_mem,
			A_Sel => ALU_Bin_A_sel,
			MuxOutA => muxoutA0);

ALUmuxB : ALU_MUX_B 
port map(RF_B => RF_B,
			Immed => Immed,
			rf_data => rf_data,
			ALU_out_mem => ALU_out_mem,
			ALU_Bin_B_sel => ALU_Bin_B_sel,
			ALU_Mux_out_B => muxoutB0);

end Behavioral;
