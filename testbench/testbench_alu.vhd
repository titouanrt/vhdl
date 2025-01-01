----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2024 03:52:52 PM
-- Design Name: 
-- Module Name: testbench_alu - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_alu is
end testbench_alu;

architecture Behavioral of testbench_alu is

component alu is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           carry : out STD_LOGIC;
           overflow : out STD_LOGIC;
           negative : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component alu;
           signal A : STD_LOGIC_VECTOR (7 downto 0);
           signal B : STD_LOGIC_VECTOR (7 downto 0);
           signal control : STD_LOGIC_VECTOR (2 downto 0);
           signal carry : STD_LOGIC;
           signal overflow : STD_LOGIC;
           signal negative : STD_LOGIC;
           signal S : STD_LOGIC_VECTOR (7 downto 0);

begin
uut : alu port map(
    A=>A,
    B=>B,
    control=>control,
    carry=>carry,
    overflow=>overflow,
    negative=>negative,
    S=>S
);
process
begin
--S <= "00000000";
--carry <= '0';
--overflow <= '0';
--negative <= '0';
A <= "10000001";
B <= "10000000";
control <= "000";
wait for 100 ns;
control <= "001" after 100 ns;
wait for 100 ns;
control <= "010" after 100 ns;
wait for 100 ns;
control <= "011" after 100 ns;
wait for 100 ns;
control <= "100" after 100 ns;
wait for 100 ns;
control <= "101" after 100 ns;
wait for 100 ns;
control <= "110" after 100 ns;
wait for 100 ns;
control <= "111" after 100 ns;
wait for 100 ns;

A <= "00000001";
B <= "00000010";
control <= "000";
wait for 100 ns;
control <= "001" after 100 ns;
wait for 100 ns;
control <= "010" after 100 ns;
wait for 100 ns;
control <= "011" after 100 ns;
wait for 100 ns;
control <= "100" after 100 ns;
wait for 100 ns;
control <= "101" after 100 ns;
wait for 100 ns;
control <= "110" after 100 ns;
wait for 100 ns;
control <= "111" after 100 ns;
wait for 100 ns;


end process;

end Behavioral;
