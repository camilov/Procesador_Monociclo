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
    Port ( Op : in  STD_LOGIC_VECTOR(2 downto 0);
           Op3 : in  STD_LOGIC_VECTOR(6 downto 0);
           Rts : in  STD_LOGIC;
           AluOp : out  STD_LOGIC_VECTOR(6 downto 0));
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
					when "000010" =>--AND
					AluOp <= "000100";
					when "000101" =>--ANDN
					AluOp <= "000101";
					when "000110" =>--ORN
					AluOp <= "000110";
					when "000011" =>--XOR
					AluOp <= "000111";
					when "000111" =>--XNOR
					AluOp <= "000011";
					when "010000" =>--ADDcc
					AluOp <= "001001";
					when "001000" =>--ADDx
					AluOp <= "000011";
					when "011000" =>--ADDXcc
					AluOp <= "001011";
					when "010100" =>--SUBcc
					AluOp <= "001100";
					when "001100" =>--SUBx
					AluOp <= "000011";
					when "011100" =>--SUBXcc
					AluOp <= "001110";
					when "010001" =>--ANDcc
					AluOp <= "001111";
					when "010101" =>--ANDNcc
					AluOp <= "010000";
					when "010010" =>--ORcc
					AluOp <= "010001";
					when "010110" =>--ORNcc
					AluOp <= "010010";
					when "010011" =>--XORcc
					AluOp <= "010011";
					when "010111" =>--XNORcc
					AluOp <= "010100";
					when "100110" =>--SRL
					AluOp <= "010101";
					when "100101" =>--SLL
					AluOp <= "010110";
					
					when others => --not
					AluOp <="000000";
				end case;
			else
				AluOp <= "111111";
			end if;
		end process;
end Behavioral;

