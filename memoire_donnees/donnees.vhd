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

entity donnees is
    Port ( aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end donnees;

architecture Behavioral of donnees is
type signalmemory is array(255 downto 0) of std_logic_vector (7 downto 0);
signal RAM : signalmemory := (others => (others => '0'));

begin
process(CLK) 
begin
if rising_edge(CLK) then
    if RST='0' then
        RAM <= (others => (others => '0'));
    end if;
    if RW = '1' then --ecriture
        RAM(to_integer(unsigned(aDATA))) <= DATA_IN;
    else
        DATA_OUT <= RAM(to_integer(unsigned(aDATA)));
    end if;
end if;
end process;
end Behavioral;