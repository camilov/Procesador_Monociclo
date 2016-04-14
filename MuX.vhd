----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:03 04/14/2016 
-- Design Name: 
-- Module Name:    MuX - Behavioral 
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

entity MuX is
    Port ( Rf : in  STD_LOGIC_VECTOR (5 downto 0);
           SeUin : in  STD_LOGIC_VECTOR (5 downto 0);
           Comp : in  STD_LOGIC;
           OutALu : out  STD_LOGIC_VECTOR (5 downto 0));
end MuX;

architecture Behavioral of MuX is

begin
	process(Rf,SeUin,Comp)
		begin
			if(Comp = '0')then -- Indicando que si mi variable llamada Comp es un '0' 
				OutAlu <= Rf; -- Deje pasar la variable Rf que haria referencia a la varible RS2 de mi Modulo Register file
			else
				OutAlu <=SeUin; ---- Indicando que si mi variable llamada Comp es un '1' , Deje pasar el Inmediato  de 13 bits que proviene del modulo Seu 
			end if;
	end process;

end Behavioral;

