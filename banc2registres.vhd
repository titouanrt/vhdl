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

entity banc2registres is
    Port ( aA : in STD_LOGIC_VECTOR (3 downto 0);
           aB : in STD_LOGIC_VECTOR (3 downto 0);
           aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end banc2registres;

architecture Behavioral of banc2registres is
type signal16 is array(15 downto 0) of std_logic_vector (7 downto 0);
signal registers : signal16 := (others => (others => '0'));
signal temp : std_logic_vector(7 downto 0);
--signal R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15 : std_logic_vector (7 downto 0);
begin

QA <= registers(to_integer(unsigned(aA)));
QB <= registers(to_integer(unsigned(aB)));

process(CLK) --ecriture
begin
if rising_edge(CLK) then
    if RST='0' then
        registers <= (others => (others => '0'));
    end if;
    if W = '1' then --ecriture
        registers(to_integer(unsigned(aW))) <= DATA;
    end if;
end if;

end process;
end Behavioral;