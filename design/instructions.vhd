----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2024 11:18:32 AM
-- Design Name: 
-- Module Name: instructions - Behavioral
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
signal ADD : std_logic_vector(7 downto 0) := x"01";
signal MUL : std_logic_vector(7 downto 0) := x"02";
signal SOU : std_logic_vector(7 downto 0) := x"03";
signal COP : std_logic_vector(7 downto 0) := x"05";
signal AFC : std_logic_vector(7 downto 0) := x"06";
signal LDR : std_logic_vector(7 downto 0) := x"07";
signal STR : std_logic_vector(7 downto 0) := x"08";

begin        -- A       B       C
ROM(0) <= AFC & x"01" & x"28" & x"00"; --ok
ROM(1) <= AFC & x"02" & x"9A" & x"00"; --ok
ROM(2) <= COP & x"03" & x"02" & x"00"; --
ROM(3) <= STR & x"0F" & x"03" & x"00";
ROM(4) <= LDR & x"04" & x"0F" & x"00";
ROM(5) <= ADD & x"05" & x"01" & x"04";



process(CLK) 
begin
if rising_edge(CLK) then
        DATA_OUT <= ROM(to_integer(unsigned(aDATA)));
end if;
end process;
end Behavioral;