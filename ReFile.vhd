----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:43 04/14/2016 
-- Design Name: 
-- Module Name:    ReFile - Behavioral 
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

entity ReFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Dwr : in  STD_LOGIC(31 downto 0);
           Srs1 : out  STD_LOGIC(31 downto 0);
           Srs2 : out  STD_LOGIC(31 downto 0));
end ReFile;

architecture Behavioral of ReFile is

	type RF is array(0 to 39) of std_logic_vector(31 downto 0);
	signal RF_SIGNAL : RF:=(others=>x"000000000");
	
begin
	process(Rs1,Rs2,Rd,Rst,Dwr,Clk,RF_SIGNAL)
	
begin
	if(RST ='1')then
		Srs1<=(others =>'0');
		Srs2<=(others =>'0');
		
		RF_SIGNAL <= (others =>x"000000000");
	else
		Srs1 <= RF_SIGNAL(conv_integer(Rs1));-- asignara el registro fuente 1 en la alu
		Srs2 <= RF_SIGNAL(conv_integer(Rs2));-- debera ir al multiplexor para compararse con el inmediato
		if(Rd /= "000000" and Clk ='1')then
			RF_SIGNAL(conv_integer(RD))<= Dwr;
			RF_SIGNAL(0) <= "00000000000000000000000000000000";
		end if;
	end if;
	end process;
end Behavioral;

