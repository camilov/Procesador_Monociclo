----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:25 04/14/2016 
-- Design Name: 
-- Module Name:    Uc - Behavioral 
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

entity Uc is
    Port ( Op : in  STD_LOGIC_VECTOR(1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR(5 downto 0);
           Rts : in  STD_LOGIC;
           AluOp : out  STD_LOGIC_VECTOR(5 downto 0));
end Uc;

architecture Behavioral of Uc is

begin
	process(Op, Op3)
		begin
			if (Op= "10")then
				case Op3 is
					when "000000" =>--ADD
					AluOp <= "000001";
					when "000100" =>--SUB
					AluOp <= "000010";
					when "000001" =>--AND
					AluOp <= "000011";
					when "000010" =>--OR
					AluOp <= "000100";
					when "000101" =>--ANDN
					AluOp <= "000101";
					when "000110" =>--ORN
					AluOp <= "000110";
					when "000011" =>--XOR
					AluOp <= "000111";
					when "000111" =>--XNOR
					AluOp <= "001000";
					
					when others => --not
					AluOp <="000000";
				end case;
			else
				AluOp <= "111111";
			end if;
		end process;
end Behavioral;

