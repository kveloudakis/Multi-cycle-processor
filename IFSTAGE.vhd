----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:52:50 03/25/2019 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  pc_out : out STD_LOGIC_VECTOR(31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is
--------------------------------------------------------------------------------------------------
component PC is
 Port (    PC_LdEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2x1 is
   Port (  ctr : in  STD_LOGIC;
           inA: in  STD_LOGIC_VECTOR (31 downto 0);
           inB: in  STD_LOGIC_VECTOR (31 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
--------------------------------------------------------------------------------------------------
signal mux_out_signal, Increment_out,Addi_out,PCout_sig:STD_LOGIC_VECTOR (31 downto 0);
--------------------------------------------------------------------------------------------------
begin
MyPc:PC
port map (PC_LdEn=>PC_LdEn,
			Clk=>Clk,
			Reset=>Reset,
			Data=>mux_out_signal,
			Dout=>PCout_sig);
			
MyMux2x1:Mux2x1
port map ( ctr =>PC_sel,
           inA=>Addi_out,
           inB=>Increment_out, 
           mux_out=> mux_out_signal);		  
		
Increment_out	<=	PCout_sig+4;
Addi_out			<=	PCout_sig+PC_Immed+4;
pc_out			<=	PCout_sig;

			 
end Behavioral;

