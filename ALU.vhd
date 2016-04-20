----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:55 04/19/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Oprs1 : in  STD_LOGIC_VECTOR(31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR(31 downto 0);
           AluoP : in  STD_LOGIC_VECTOR(5 downto 0);
           Rst : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR(31 downto 0));
end ALU;


architecture Behavioral of ALU is

begin

process(Oprs1, Op2, AluoP)
		begin
			if(Rst = '0')then
			case(AluoP) is
				when "000001" => --add
					Result <= (Oprs1 + Op2);
				when "000010" => --sub
					Result <= Oprs1 - Op2;
				when "000011" => --And
					Result <= Oprs1 and Op2;
				when "000100" => --Or
					Result <= Oprs1 or Op2;
				when "000101" => --Nand
					Result <= not(Oprs1 and Op2);
				when "000110" => --Nor
					Result <= not(Oprs1 or Op2);
				when "000111" => -- Xor
					Result <= Oprs1 xor Op2;
				when "001000" => --Xnor
					Result <= not(Oprs1 xor Op2);
				
								
				when others => 
				Result <= (others=>'0');
		end case;
		
		else
			Result <= (others =>'0');
		end if;
	end process;
end Behavioral;

