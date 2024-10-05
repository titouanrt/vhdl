----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2024 10:40:29 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           carry : out STD_LOGIC;
           overflow : out STD_LOGIC;
           negative : out STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0));
end alu;

architecture Behavioral of alu is
signal result, a16, b16 : std_logic_vector (15 downto 0);
begin
process(A,B,control)
begin
--passage des signaux d'entrée sur 16 bits
a16 <= "00000000" & A;
b16 <= "00000000" & B;

case control is
when "000" =>
    result <= a16 + b16;
when "001" =>
    result <= a16 - b16;
when "010"=>
    result <= A * B;
when "011" =>
    result <= a16 or b16;
when "100" =>
    result <= a16 and b16;
when "101" =>
    result <= a16 xor b16;
when "110" =>
    result <= not a16;
when "111" =>
    result <= not b16;
when others =>
    result <= (others => '0');
 end case;

end process;

S <= result(7 downto 0);
carry <= '1' when (result(8)='1') else '0';
overflow <= '1' when result(15 downto 8) /= "00000000" else '0';
negative <= result(7);

end Behavioral;
