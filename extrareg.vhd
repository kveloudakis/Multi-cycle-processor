----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:44:46 05/14/2019 
-- Design Name: 
-- Module Name:    extrareg - Behavioral 
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

entity extrareg is
Port (clk : in  STD_LOGIC;
      Data : in  STD_LOGIC_VECTOR (31 downto 0);
      Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end extrareg;

architecture Behavioral of extrareg is
signal result : std_logic_vector(31 downto 0);

begin	
process
begin

wait until clk'event and clk = '1';

result <= Data;
		
END PROCESS;
Dout <= result ;

end Behavioral;

