----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:34 03/25/2019 
-- Design Name: 
-- Module Name:    decoder5to32 - Behavioral 
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

entity decoder5to32 is
    Port ( Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end decoder5to32;

architecture Behavioral of decoder5to32 is

		signal result : std_logic_vector(31 downto 0);

begin

--result(0) <= (not awr(2)) and (not awr(1)) and (not awr(0)) and (not awr(3)) and (not awr(4));
--result(1) <= (not awr(2)) and (not awr(1)) and awr(0) and (not awr(3)) and (not awr(4));
--result(2) <= (not awr(2)) and awr(1) and (not awr(0)) and (not awr(3)) and (not awr(4));
--result(3) <= (not awr(2)) and awr(1) and awr(0) and (not awr(3)) and (not awr(4));
--result(4) <= awr(2) and (not awr(1)) and (not awr(0)) and (not awr(3)) and (not awr(4));
--result(5) <= awr(2) and (not awr(1)) and awr(0) and (not awr(3)) and (not awr(4));
--result(6) <= awr(2) and awr(1) and (not awr(0)) and (not awr(3)) and (not awr(4));
--result(7) <= awr(2) and awr(1) and awr(0) and (not awr(3)) and (not awr(4));
--
--result(8) <= (not awr(2)) and (not awr(1)) and (not awr(0)) and (not awr(3)) and awr(4);
--result(9) <= (not awr(2)) and (not awr(1)) and awr(0) and (not awr(3))and awr(4);
--result(10) <= (not awr(2)) and awr(1) and (not awr(0)) and (not awr(3)) and awr(4);
--result(11) <= (not awr(2)) and awr(1) and awr(0) and (not awr(3)) and awr(4);
--result(12)<= awr(2) and (not awr(1)) and (not awr(0)) and (not awr(3)) and awr(4);
--result(13) <= awr(2) and (not awr(1)) and awr(0) and (not awr(3)) and awr(4);
--result(14) <= awr(2) and awr(1) and (not awr(0)) and (not awr(3)) and awr(4);
--result(15) <= awr(2) and awr(1) and awr(0) and (not awr(3)) and awr(4);
--
--result(16) <= (not awr(2)) and (not awr(1)) and (not awr(0)) and awr(3) and (not awr(4));
--result(17) <= (not awr(2)) and (not awr(1)) and awr(0)and awr(3) and (not awr(4));
--result(18) <= (not awr(2)) and awr(1) and (not awr(0))and awr(3)and (not awr(4));
--result(19) <= (not awr(2)) and awr(1) and awr(0) and awr(3) and (not awr(4));
--result(20) <= awr(2) and (not awr(1)) and (not awr(0)) and awr(3) and (not awr(4));
--result(21) <= awr(2) and (not awr(1)) and awr(0) and awr(3) and (not awr(4));
--result(22) <= awr(2) and awr(1) and (not awr(0)) and awr(3) and (not awr(4));
--result(23) <= awr(2) and awr(1) and awr(0) and awr(3) and (not awr(4));
--
--result(24) <= (not awr(2)) and (not awr(1)) and (not awr(0)) and awr(3) and awr(4);
--result(25) <= (not awr(2)) and (not awr(1)) and awr(0) and awr(3) and awr(4);
--result(26) <= (not awr(2)) and awr(1) and (not awr(0)) and awr(3) and awr(4);
--result(27) <= (not awr(2)) and awr(1) and awr(0) and awr(3) and awr(4);
--result(28) <= awr(2) and (not awr(1)) and (not awr(0)) and awr(3) and awr(4);
--result(29) <= awr(2) and (not awr(1)) and awr(0)and awr(3) and awr(4);
--result(30) <= awr(2) and awr(1) and (not awr(0)) and awr(3) and awr(4);
--result(31) <= awr(2) and awr(1) and awr(0) and awr(3) and awr(4);
--


WITH Awr SELECT
	result <=  	  "00000000000000000000000000000001" when "00000",
					  "00000000000000000000000000000010" when "00001",
					  "00000000000000000000000000000100" when "00010",
					  "00000000000000000000000000001000" when "00011",
					  "00000000000000000000000000010000" when "00100",
					  "00000000000000000000000000100000" when "00101",
					  "00000000000000000000000001000000" when "00110",
					  "00000000000000000000000010000000" when "00111",
					  "00000000000000000000000100000000" when "01000",
					  "00000000000000000000001000000000" when "01001",
					  "00000000000000000000010000000000" when "01010",
					  "00000000000000000000100000000000" when "01011",
					  "00000000000000000001000000000000" when "01100",
					  "00000000000000000010000000000000" when "01101",
					  "00000000000000000100000000000000" when "01110",
					  "00000000000000001000000000000000" when "01111",
					  "00000000000000010000000000000000" when "10000",
					  "00000000000000100000000000000000" when "10001",
					  "00000000000001000000000000000000" when "10010",
					  "00000000000010000000000000000000" when "10011",
					  "00000000000100000000000000000000" when "10100",
					  "00000000001000000000000000000000" when "10101",
					  "00000000010000000000000000000000" when "10110",
					  "00000000100000000000000000000000" when "10111",
					  "00000001000000000000000000000000" when "11000",
					  "00000010000000000000000000000000" when "11001",
					  "00000100000000000000000000000000" when "11010",
					  "00001000000000000000000000000000" when "11011",
					  "00010000000000000000000000000000" when "11100",
					  "00100000000000000000000000000000" when "11101",
					  "01000000000000000000000000000000" when "11110",
					  "10000000000000000000000000000000" when others;
 
--end Behavioral;

					  
Outp <=result after 5 ns;
 
end Behavioral;


