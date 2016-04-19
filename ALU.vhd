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
    Port ( Oprs1 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
           AluoP : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Result : out  STD_LOGIC);
end ALU;


architecture Behavioral of ALU is

begin

	process(Oprs1, Op2, AluoP)
		begin
			if(Rst = '0')then
			case(AluoP) is
				when "000001" => --add
					Result <= Oprs1 + Op2;
				when "001001" => --addcc
					Result <= Oprs1 + Op2;
				when "000010" => --sub
					Result <= Oprs1 - Op2;
				when "001100" => --subcc
					Result <= Oprs1 - Op2;
				when "000011" => --and
					Result <= Oprs1 and Op2;
				when "001111" => --andcc
					Result <= Oprs1 and Op2;
				when "000100" => --or
					Result <= Oprs1 or Op2;
				when "010001" => --orcc
					Result <= Oprs1 or Op2;
				when "000101" => --nand
					Result <= not(Oprs1 and Op2);
				when "010000" => --nandcc
					Result <= not(Oprs1 and Op2);
				when "000111" => -- xor 
					Result <= Oprs1 xor Op2;
				when "010011" => -- xorcc
					Result <= Oprs1 xor Op2;
				when "001000" => -- xnor 
					Result <= not(Oprs1 xor Op2);
				when "010100" => -- xnorcc
					Result <= not(Oprs1 xor Op2);
				
				when "001010" => -- addx 
				Result <= Oprs1 + Op2;
				when "001011" => -- addxcc
				Result <= Oprs1 + Op2;
				
				when "001101" => -- subx 
				Result <= Oprs1 - Op2;
				when "001110" => -- subxcc
				Result <= Oprs1 - Op2;
				
				when "010101" => -- SLL
				Result <= to_stdlogicvector(to_bitvector(Oprs1) sll conv_integer(Op2));
				when "010110" => -- SRL
				Result <= to_stdlogicvector(to_bitvector(Oprs1) srl conv_integer(Op2));
				when "010111" => -- SRA
				Result <= to_stdlogicvector(to_bitvector(Oprs1) sra conv_integer(Op2));
		
				
				when others => -- Cae el nop
				Result <= (others=>'0');
		end case;
		
		else
			Result <= (others =>'0');
		end if;
	end process;
end Behavioral;

