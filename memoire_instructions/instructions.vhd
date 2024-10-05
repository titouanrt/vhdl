----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/04/2024 03:35:53 PM
-- Design Name:
-- Module Name: banc2registres - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
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
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructions is
    Port ( CLK : in STD_LOGIC;
           aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end instructions;

architecture Behavioral of instructions is
type signalmemory is array(255 downto 0) of std_logic_vector (31 downto 0);
signal ROM : signalmemory := (others => (others => '0')); -- ajouter les instructions désirées

begin
process(CLK) 
begin
if rising_edge(CLK) then
        DATA_OUT <= ROM(to_integer(unsigned(aDATA)));
end if;
end process;
end Behavioral;