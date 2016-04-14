----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:23 04/14/2016 
-- Design Name: 
-- Module Name:    Seu - Behavioral 
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

entity Seu is
    Port ( Entrada : in  STD_LOGIC_VECTOR (12 downto 0);
           Salida : out  STD_LOGIC_VECTOR (12 downto 0));
end Seu;

architecture Behavioral of Seu is

begin
	process(Entrada)
		begin
			if Entrada(12)= '1' then --Verifica si es numero ingresado es negativo
					Salida(31 downto 13)<="1111111111111111111"; --Complementa el numero con unos por el hecho de ser negativo
					Salida(12 downto 0) <= Entrada;
			else
					Salida(31 downto 13)<="0000000000000000000";-- en el caso de no ser negativo complementa el numero con ceros
					Salida(12 downto 0)<= Entrada;
			end if;
	end process;
end Behavioral;

