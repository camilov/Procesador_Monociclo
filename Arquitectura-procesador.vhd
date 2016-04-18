----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:45 04/14/2016 
-- Design Name: 
-- Module Name:    Arquitectura-procesador - Behavioral 
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

entity Arquitectura_procesador is
end Arquitectura_procesador;

architecture Behavioral of Arquitectura_procesador is
COMPONENT Npc
	PORT(
		Din : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;
		Clk : IN std_logic;          
		Dout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Pc
	PORT(
		Din : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;
		Clk : IN std_logic;          
		Dout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Sumador32
	PORT(
		Entra1 : IN std_logic_vector(31 downto 0);
		Entra2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
COMPONENT IM
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;          
		Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Seu
	PORT(
		Entrada : IN std_logic_vector(12 downto 0);          
		Salida : OUT std_logic_vector(12 downto 0)
		);
	END COMPONENT;


COMPONENT MuX
	PORT(
		Rf : IN std_logic_vector(5 downto 0);
		SeUin : IN std_logic_vector(5 downto 0);
		Comp : IN std_logic;          
		OutALu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
COMPONENT Uc
	PORT(
		Op : IN std_logic_vector(2 downto 0);
		Op3 : IN std_logic_vector(6 downto 0);
		Rts : IN std_logic;          
		AluOp : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
begin

	Inst_Npc: Npc PORT MAP(
		Din => ResultNpc,
		Dout => DoutX,
		Rst => Rst,
		Clk => Clk
	);
	
	Inst_Pc: Pc PORT MAP(
		Din => DoutX,
		Dout => DoutM,
		Rst => Rst,
		Clk => Clk
	);

	
	Inst_Sumador32: Sumador32 PORT MAP(
		Entra1 ="00000000000000000000000000000001"> ,
		Entra2 => DoutX,
		Result => ResultNpc
	);
	
		Inst_IM: IM PORT MAP(
		Address => DoutM ,
		Rst => Rst,
		Instruction => DoutRegister 
	);
	
	Inst_Seu: Seu PORT MAP(
		Entrada => DoutRegister(12 downto 0),
		Salida => DoutImm
	);

	
	Inst_MuX: MuX PORT MAP(
		Rf => ,
		SeUin =>DoutImm ,
		Comp => ,
		OutALu => DoutAlu 
	);
	
	
	Inst_Uc: Uc PORT MAP(
		Op => DoutRegister(31 downto 30),
		Op3 => DoutRegister(24 downto 19),
		Rts => Rst,
		AluOp =>DoutAluOp 
	);

end Behavioral;

