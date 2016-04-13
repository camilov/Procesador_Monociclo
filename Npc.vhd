----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:43 04/13/2016 
-- Design Name: 
-- Module Name:    Npc - Behavioral 
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

entity Npc is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end Npc;

architecture Behavioral of Npc is

begin
	process(Din,Rst,Clk)
		begin
			if (Rst='1')then
				Dout <=(others => '0'); --devuelve ceros a la salida
			else
				if(rising_edge(Clk))then 
					Dout <= Din;
				end if;
			end if;
	end process;


end Behavioral;

