----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:40 05/12/2019 
-- Design Name: 
-- Module Name:    Stall - Behavioral 
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

entity Stall is
    port (reset : in std_logic;
			 pc_lden	: out std_logic;
			 pc_src : out std_logic;
			 wake : in std_logic;
			 instr_in : in std_logic_vector(31 downto 0);
			 oldinstr_in : in std_logic_vector(31 downto 0);
			 extrain : in std_logic_vector(31 downto 0);
			 extraout : out std_logic_vector(31 downto 0);
          instr_out : out std_logic_vector(31 downto 0));
end Stall;

architecture Behavioral of Stall is

signal oldInstr, temp,test,test2 : std_logic_vector(31 downto 0);
signal fock,fork : std_logic;
signal oldrd : std_logic_vector(4 downto 0) := (others => '0'); 

begin
fock <= wake after 5 ns;
fork <= fock after 10ns;
	my_proc : process(instr_in,reset,fock)
		begin
			if(reset= '1') then
				pc_lden <= '0';
				pc_src <= '0';
				instr_out <= "00000000000000000000000000000000";			
				elsif( (instr_in(15 downto 11)= oldinstr_in(20 downto 16) or  instr_in(25 downto 21)= oldinstr_in(20 downto 16)) 
				and oldinstr_in(31 downto 26) = "001111") then 
					pc_lden <= '0'; 
					pc_src <= '0';
					fock<='1';
					extraout <= instr_in; 
					instr_out <= "00000000000000000000000000000000";
				elsif(fork ='1' ) then
					instr_out <= instr_in;
					pc_lden <= '1';
					pc_src <= '1';	
				else
					pc_lden <= '1';
					pc_src <= '1';
					instr_out <= instr_in;
					oldInstr <= instr_in;
				end if;
	
	end process;	
	
end Behavioral;