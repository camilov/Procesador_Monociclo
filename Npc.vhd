----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:44 04/11/2016 
-- Design Name: 
-- Module Name:    NpC - Behavioral 
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

entity NpC is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : out  STD_LOGIC);
end NpC;

architecture Behavioral of NpC is

begin
	process(Din, Reset, Clk)
		begin
			if(rising_edge(Clk))then
				if(Reset = '1')then
					Dout <= "0000000000000000000000000000000";
				else
					Dout <= Din;
				end if;
			end if;
	end process;
end Behavioral;

