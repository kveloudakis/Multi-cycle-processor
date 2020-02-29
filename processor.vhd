----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:58 05/12/2019 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
Port (clk   : in std_logic;
	   Reset : in STD_LOGIC);
		 
		
end processor;


architecture Behavioral of processor is

component IFSTAGE
Port ( CLK : in  STD_LOGIC;
	    Reset : in  STD_LOGIC;
		 pc_out : out  STD_LOGIC_VECTOR (31 downto 0);	--pc_out
		 PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
       PC_sel : in  STD_LOGIC;	-- PC_sel
		 PC_LdEn : in  STD_LOGIC);		 
end component;

component Stall
    port (reset : in std_logic;
			 pc_lden	: out std_logic;
			 extrain : in std_logic_vector(31 downto 0);
			 oldinstr_in : in std_logic_vector(31 downto 0);
			 pc_src : out std_logic;
			 wake : in std_logic;
			 instr_in : in std_logic_vector(31 downto 0);
			 extraout : out std_logic_vector(31 downto 0);
          instr_out : out std_logic_vector(31 downto 0));
end component;

component IF_ID
    port (clk         : in std_logic;
			 reset		 : in std_logic;
			 instruction : in std_logic_vector(31 downto 0);
			 rfbsel 		 : out std_logic;
--			 wakeupsignal 		 : out std_logic;
          instr_out   : out std_logic_vector(31 downto 0));
end component;


component control
    Port (instr : in std_logic_vector(31 downto 0);
			 Reset : in std_logic;
			 wb	 : out std_logic_vector(2 downto 0);
			 mem	 : out std_logic;
			 exec	 : out std_logic_vector(3 downto 0));
end component;

component DECSTAGE is
Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
		 Immed : out STD_LOGIC_VECTOR (31 downto 0);
		 Immed_in : in STD_LOGIC_VECTOR (31 downto 0);
		 Wrdt : out STD_LOGIC_VECTOR (31 downto 0);
		 RF_A: out STD_LOGIC_VECTOR (31 downto 0);
		 RF_B: out STD_LOGIC_VECTOR (31 downto 0);
		 ALU_out : in STD_LOGIC_VECTOR (31 downto 0);
		 MEM_out : in STD_LOGIC_VECTOR (31 downto 0);
		 RF_B_sel : in STD_LOGIC;
		 rf_wr_reg : in STD_LOGIC_VECTOR(4 downto 0); 
		 RF_WrData_sel : in STD_LOGIC_VECTOR(1 downto 0);
		 rst : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RF_WrEn : in STD_LOGIC);			 
end component;

component ID_EX is
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
			 instruction : in std_logic_vector(31 downto 0);
			 immed_out : out std_logic_vector(31 downto 0);
			 rfa  : in std_logic_vector(31 downto 0);
			 rfa_out : out std_logic_vector(31 downto 0);
			 rfb  : in std_logic_vector(31 downto 0);
			 rfb_out : out std_logic_vector(31 downto 0);
			 wb_out   : out std_logic_vector(2 downto 0);
			 mem_out  : out std_logic;
			 wakeupsignal 	: out std_logic;
			 exec_out : out std_logic_vector(3 downto 0));
end component;

component ALUSTAGE is
Port ( RF_A  : in STD_LOGIC_VECTOR (31 downto 0);
		 RF_B  : in STD_LOGIC_VECTOR (31 downto 0);
		 Immed : in STD_LOGIC_VECTOR (31 downto 0);
		 ALU_out_mem : in STD_LOGIC_VECTOR (31 downto 0);
		 rf_data : in STD_LOGIC_VECTOR (31 downto 0);
		 ALU_out : out STD_LOGIC_VECTOR (31 downto 0);
		 ALU_Bin_B_sel : in STD_LOGIC_VECTOR(1 downto 0);
		 ALU_Bin_A_sel : in STD_LOGIC_VECTOR(1 downto 0);
		 ALU_func : in STD_LOGIC_VECTOR (3 downto 0));	
end component;

component Forward is
    port (forwardA : out std_logic_vector(1 downto 0);
			 forwardB : out std_logic_vector(1 downto 0);
			 OpCode : in std_logic_vector(5 downto 0);
			 EXMEM_RegWrite : in std_logic;
			 MEMWB_RegWrite : in std_logic;
			 EXMEM_rd : in std_logic_vector(4 downto 0);
			 IDEX_rs : in std_logic_vector(4 downto 0);
			 IDEX_rt : in std_logic_vector(4 downto 0);
			 MEMWB_rd : in std_logic_vector(4 downto 0));
end component;

component EX_MEM
    Port (clk  : in std_logic;
			 wb   : in std_logic_vector(2 downto 0);
			 mem  : in std_logic;
			 wb_out : out std_logic_vector(2 downto 0);
			 mem_out : out std_logic;
			 rd : in std_logic_vector(4 downto 0);
			 rd_out : out std_logic_vector(4 downto 0);
			 immed : in std_logic_vector(31 downto 0);
			 immed_out : out std_logic_vector(31 downto 0);
			 rfb  : in std_logic_vector(31 downto 0);
			 rfb_out : out std_logic_vector(31 downto 0);
			 alu_out : out std_logic_vector(31 downto 0);
			 alu : in std_logic_vector(31 downto 0));
end component;

component extrareg 
Port (     clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


COMPONENT SECRETMEM is
    PORT(
         clk : IN  std_logic;
         Mem_WrEn : IN  std_logic;
         ALU_MEM_Addr : IN  std_logic_vector(10 downto 0);
         MEM_DataIn : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0);
			inst_addr : in std_logic_vector(10 downto 0);	-- apo stall
			inst_dout : out std_logic_vector(31 downto 0));	--
    END COMPONENT;

component MEM_WB
    Port (clk  : in std_logic;
			 wb   : in std_logic_vector(2 downto 0);
			 wb_out : out std_logic_vector(2 downto 0);
			 rd : in std_logic_vector(4 downto 0);
			 rd_out : out std_logic_vector(4 downto 0);
			 immed : in std_logic_vector(31 downto 0);
			 immed_out : out std_logic_vector(31 downto 0);
			 alu_out : out std_logic_vector(31 downto 0);
			 alu : in std_logic_vector(31 downto 0));
end component;

signal memout,aluout_memadd, imd, rfb_mem, instrIF, instrIFout, instrID,dummy2, rfaIDEX, rfbIDEX, immed1, immed2, immed3, immed4, rfa_alu, rfb_alu, aluout, aluout1, aluout2, aluout_mem,testme,testmeresult, memout1, wd,memoryreach : STD_LOGIC_VECTOR (31 downto 0);
signal mem_ctrl, pcsrc, memwren, mrfb, rfbsel, mem1, mem2, pclden ,wakeupsignals: STD_LOGIC;
signal wb1, wb2, wb3, wb4, wb_ctrl : STD_LOGIC_VECTOR (2 downto 0);
signal rd1, rd2, rd3, rd4, rs, rt : STD_LOGIC_VECTOR (4 downto 0);
signal exec, exec1, exec_ctrl : STD_LOGIC_VECTOR (3 downto 0);
signal fwdA, fwdB : STD_LOGIC_VECTOR (1 downto 0);
signal opcd : STD_LOGIC_VECTOR (5 downto 0);

begin
aluout_memadd<=aluout_mem + "10000000000"; 
dummy2 <= instrID after 5 ns;
IF_ST0 : IFSTAGE 
	port map( CLK => CLK,
				 Reset => Reset,
				 pc_out => memoryreach,  --instrIF tha vgazei h mnhmh apo memoryreach(12 downto 2)
				 PC_sel => pcsrc,
				 PC_LdEn => pclden,
				 PC_Immed => "00000000000000000000000000000000");
	
stall0 : Stall 
	port map( reset => reset,
				 pc_lden => pclden,
				 pc_src => pcsrc,
				 extrain => testmeresult,
				 extraout => testme, --gia ton extra reg 
				 oldinstr_in =>dummy2,
				 wake=> wakeupsignals,
				 instr_in => instrIF,
				 instr_out => instrIFout);

regpipe1 : IF_ID --Register between IF_Stage and DEC_Stage ..
	port map( clk => CLK,
				 reset => reset,
				 instruction => instrIFout,
				 rfbsel => rfbsel,
--				 wakeupsignal => wakeupsignals,
				 instr_out => instrID);
				 
DEC_ST0 : DECSTAGE 
	port map( Instr => instrID,
			    Immed => imd,
		       Immed_in => immed3,
				 Wrdt => wd,
			    RF_A => rfaIDEX,
			    RF_B => rfbIDEX,
			    ALU_out => aluout1,
			    MEM_out => memout,
			    rf_wr_reg => rd3,
				 RF_B_sel => rfbsel,
				 RF_WrData_sel => wb3(1 downto 0),
				 rst => Reset,
				 CLK => CLK,
				 RF_WrEn => wb3(2));			 
				 
				 
ctrl0 : control -- Asynchronous control ..
	port map( instr => instrID,
				 Reset => Reset,
				 wb => wb_ctrl,
				 mem => mem_ctrl,
				 exec	=> exec_ctrl);  
  
regpipe2 : ID_EX -- Register between DEC_Stage and ALU_Stage ..
	port map( clk => clk,
				 wb => wb_ctrl,
				 mem => mem_ctrl,
				 exec => exec_ctrl,
				 wb_out => wb1,
			    opcd_in => instrID(31 downto 26),
				 opcd_out => opcd,
				 rs => instrID(25 downto 21),
				 rs_out => rs,
				 rt => instrID(15 downto 11),
				 rt_out => rt,
				 mem_out => mem1,
				 exec_out => exec1,
				 wakeupsignal => wakeupsignals,
				 rd => instrID(20 downto 16),
				 rd_out => rd1,
				 immed => imd,
				 immed_out => immed1,
				 rfa => rfaIDEX,
				 rfa_out => rfa_alu,
				 rfb => rfbIDEX,
				 instruction =>instrID,
				 rfb_out => rfb_alu);
				 
ALU_ST : ALUSTAGE 
	port map( RF_A => rfa_alu,
				 RF_B => rfb_alu,
				 Immed => immed1,
				 ALU_out => aluout,
				 ALU_out_mem => aluout_mem,
				 rf_data => wd,
				 ALU_Bin_B_sel => fwdB,
				 ALU_Bin_A_sel => fwdA,
				 ALU_func => exec1);

regpipe3 : EX_MEM 
	port map( clk => clk,
				 wb => wb1,
				 wb_out => wb2,
				 mem => mem1,
				 mem_out => mem2,
				 rd => rd1,
				 rd_out => rd2,
				 immed => immed1,
				 immed_out => immed2,
				 rfb => rfb_alu,
				 rfb_out => rfb_mem,
			    alu_out => aluout_mem,
				 alu => aluout);
				 
fwd : Forward -- Component for avoiding hazards ..
	port map( forwardA => fwdA,
				 forwardB => fwdB,
				 Opcode => opcd,
				 EXMEM_RegWrite => wb2(2),
				 MEMWB_RegWrite => wb3(2),
				 EXMEM_rd => rd2,
				 IDEX_rs => rs,
				 IDEX_rt => rt,
				 MEMWB_rd =>rd3); 


MEM_ST: SECRETMEM
	port map( ALU_MEM_Addr => aluout_memadd(10 downto 0),
				 MEM_DataIn => rfb_mem,
		       MEM_DataOut => memout,
		       Mem_WrEn => mem2,
				 inst_addr=>memoryreach(12 downto 2),
				 inst_dout=>instrIF,
				 CLK => CLK);
				 
regpipe4 : MEM_WB 
	port map( clk => clk,
				 wb => wb2,
				 wb_out => wb3,
				 rd => rd2,
				 rd_out => rd3,							 
				 immed => immed2,
				 immed_out => immed3,									 
				 alu_out => aluout1,
			    alu => aluout_mem);

extrastallreg : extrareg 
		port map ( clk =>clk,
						Data=>testme,
						Dout=>testmeresult);
end Behavioral;

