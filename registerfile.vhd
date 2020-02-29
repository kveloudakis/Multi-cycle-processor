----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:44 03/25/2019 
-- Design Name: 
-- Module Name:    registerfile - Behavioral 
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

entity registerfile is
Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC; 
           CLK : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerfile;

architecture Behavioral of registerfile is

component decoder5to32 is
Port (Awr : in  STD_LOGIC_VECTOR (4 downto 0);
      Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
component regb1 is	
Port (clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
      WE : in  STD_LOGIC;
      Data : in  STD_LOGIC_VECTOR (31 downto 0);
      Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX is
Port (R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10,
		R11, R12, R13, R14, R15, R16, R17,R18, R19, R20,
		R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31 : in  STD_LOGIC_VECTOR (31 downto 0);
      SEL : in  STD_LOGIC_VECTOR (4 downto 0);
      Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal decout, regout0, regout1, regout2, regout3, regout4, regout5, regout6, regout7, regout8, regout9, regout10,
		 regout11, regout12, regout13, regout14, regout15, regout16, regout17, regout18, regout19, regout20,
		 regout21, regout22, regout23, regout24, regout25, regout26, regout27, regout28, regout29, regout30, regout31 :  STD_LOGIC_VECTOR (31 downto 0);

signal sel, select_we :std_logic_vector(31 downto 0);
		 
begin
	select_we <= WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE & WE;
	sel <= select_we  and decout;
	
	dec: decoder5to32 port map( Awr=>Awr,
										 Outp=>decout);
										 
	reg0: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>'1',
								Data=>"00000000000000000000000000000000",
								Dout=>regout0);

	reg1: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(1),
								Data=>Din,
								Dout=>regout1);

	reg2: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(2),
								Data=>Din,
								Dout=>regout2);

	reg3: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(3),
								Data=>Din,
								Dout=>regout3);

	reg4: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(4),
								Data=>Din,
								Dout=>regout4);

	reg5: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(5),
								Data=>Din,
								Dout=>regout5);

	reg6: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(6),
								Data=>Din,
								Dout=>regout6);

	reg7: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(7),
								Data=>Din,
								Dout=>regout7);

	reg8: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(8),
								Data=>Din,
								Dout=>regout8);

	reg9: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(9),
								Data=>Din,
								Dout=>regout9);

	reg10: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(10),
								Data=>Din,
								Dout=>regout10);

	reg11: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(11),
								Data=>Din,
								Dout=>regout11);

	reg12: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(12),
								Data=>Din,
								Dout=>regout12);

	reg13: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(13),
								Data=>Din,
								Dout=>regout13);

	reg14: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(14),
								Data=>Din,
								Dout=>regout14);

	reg15: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(15),
								Data=>Din,
								Dout=>regout15);

	reg16: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(16),
								Data=>Din,
								Dout=>regout16);

	reg17: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(17),
								Data=>Din,
								Dout=>regout17);

	reg18: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(18),
								Data=>Din,
								Dout=>regout18);

	reg19: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(19),
								Data=>Din,
								Dout=>regout19);

	reg20: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(20),
								Data=>Din,
								Dout=>regout20);

	reg21: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(21),
								Data=>Din,
								Dout=>regout21);

	reg22: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(22),
								Data=>Din,
								Dout=>regout22);

	reg23: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(23),
								Data=>Din,
								Dout=>regout23);

	reg24: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(24),
								Data=>Din,
								Dout=>regout24);

	reg25: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(25),
								Data=>Din,
								Dout=>regout25);

	reg26: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(26),
								Data=>Din,
								Dout=>regout26);

	reg27: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(27),
								Data=>Din,
								Dout=>regout27);

	reg28: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(28),
								Data=>Din,
								Dout=>regout28);

	reg29: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(29),
								Data=>Din,
								Dout=>regout29);

	reg30: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(30),
								Data=>Din,
								Dout=>regout30);

	reg31: regb1 port map(clk=>CLK,
								rst=>rst,
								WE=>sel(31),
								Data=>Din,
								Dout=>regout31);
								
	mux1: mux port map(  SEL=>Ard1,
								Dout=>Dout1,
								R0=>regout0,
								R1=>regout1,
								R2=>regout2,
								R3=>regout3,
								R4=>regout4,
								R5=>regout5,
								R6=>regout6,
								R7=>regout7,
								R8=>regout8,
								R9=>regout9,
								R10=>regout10,
								R11=>regout11,
								R12=>regout12,
								R13=>regout13,
								R14=>regout14,
								R15=>regout15,
								R16=>regout16,
								R17=>regout17,
								R18=>regout18,
								R19=>regout19,
								R20=>regout20,
								R21=>regout21,
								R22=>regout22,
								R23=>regout23,
								R24=>regout24,
								R25=>regout25,
								R26=>regout26,
								R27=>regout27,
								R28=>regout28,
								R29=>regout29,
								R30=>regout30,
								R31=>regout31);
								
	mux2: mux port map(  SEL=>Ard2,
								Dout=>Dout2,
								R0=>regout0,
								R1=>regout1,
								R2=>regout2,
								R3=>regout3,
								R4=>regout4,
								R5=>regout5,
								R6=>regout6,
								R7=>regout7,
								R8=>regout8,
								R9=>regout9,
								R10=>regout10,
								R11=>regout11,
								R12=>regout12,
								R13=>regout13,
								R14=>regout14,
								R15=>regout15,
								R16=>regout16,
								R17=>regout17,
								R18=>regout18,
								R19=>regout19,
								R20=>regout20,
								R21=>regout21,
								R22=>regout22,
								R23=>regout23,
								R24=>regout24,
								R25=>regout25,
								R26=>regout26,
								R27=>regout27,
								R28=>regout28,
								R29=>regout29,
								R30=>regout30,
								R31=>regout31);
								
								
								


end Behavioral;




