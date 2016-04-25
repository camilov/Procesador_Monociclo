--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:54:23 04/25/2016
-- Design Name:   
-- Module Name:   C:/.Xilinx/Procesador_Mono/TbPc.vhd
-- Project Name:  Procesador_Mono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Pc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TbPc IS
END TbPc;
 
ARCHITECTURE behavior OF TbPc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Pc
    PORT(
         Din : IN  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0);
         Rst : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Pc PORT MAP (
          Din => Din,
          Dout => Dout,
          Rst => Rst,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		Rst <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Rst <= '0';
		Dout <= "0000000000000000000000000000101";
      wait for 100 ns;
		Dout <= "0000000000000000000000000101101";
		wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
