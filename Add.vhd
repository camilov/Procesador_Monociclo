----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:17 04/07/2016 
-- Design Name: 
-- Module Name:    Add - V8 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add is
    Port ( Intruccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Sumaout : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture V8 of Add is

begin
	process (Intruccion,Pc_in)
		begin
			Sumaout <= Intruccion + Pc_in;
	end process;

end V8;

