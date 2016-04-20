----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:38 04/13/2016 
-- Design Name: 
-- Module Name:    IM - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; --Permite operar entre los puertos del componente
USE ieee.numeric_std.ALL; -- paquete que proporciona las funciones aritmeticas para los vectores
use std.textio.all; -- Nos permite trabajar con ficheros

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is

	--variable que almacenara una matriz de 32*32
	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
	--funcion que devuelve los mismos resultados siempre y cuando se evalue con los mismos argumentos
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile: text open read_mode is RomFileName; --Abre un archivo de tipo text en modo lectura
		variable RomFileLine :line;  --Variable para capturar cada linea del archivo abierto;
		variable temp_bv : bit_vector(31 downto 0); --Variable que almacena bit a bit el valor de la fila;
		variable temp_mem : rom_type; --variable que almacena todo el fichero en un array;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine); --leyendo cada linea del fichero
				read(RomFileLine,temp_bv); --leyendo y capturando los bits de cada linea
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	
--	int main(){
--	int p= 3, x=1, z=4, w=0;
--	w= (p+40) + (x-z)
--	return 0;
	
	--los datos de la señal de entrada provienen de un archivo almacenado en el sistema
	signal instructions : rom_type := InitRomFromFile("Prueba.data");
begin
	
	process(Rst,Address,instructions)
		begin
			if (Rst = '1')then
				Instruction <= (others => '0');
			else
				Instruction <= instructions(conv_integer(Address(4 downto 0)));-- devuelve la instruccion en la posicion indicada de 0 a 64
			end if;
	end process;


end Behavioral;

