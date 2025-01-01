----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2024 10:28:17 AM
-- Design Name: 
-- Module Name: testbench_global - Behavioral
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

entity testbench_global is
end testbench_global;

architecture Behavioral of testbench_global is
component global
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal CLK : std_logic:='0';
signal RST : std_logic;
signal INS : std_logic_vector (7 downto 0);
signal Q : std_logic_vector (7 downto 0);

constant Clock_period : time := 50 ns;

begin
uut : global port map(
    CLK=>CLK,
    RST=>RST,
    INS=>INS,
    Q=>Q
);

process
begin
CLK <= not(CLK);
wait for Clock_period/2;
end process;


process
begin
-- à chaque fois qu'une instruction a besoin de la valeur d'un registre écrit dans l'instruction précédente 
--il faut attendre que le pipeline précédent soit terminé complètement, 
--sinon on va lire les anciennes valeurs de registres
RST <= '1';
INS <= x"00";
wait for 50 ns;
INS <= x"01";
wait for 200 ns;
INS <= x"02";
wait for 200 ns;
INS <= x"03";
wait for 50 ns;
INS <= x"04";
wait for 200 ns;
INS <= x"05";
wait for 400 ns;
RST<= '0';
wait for 100 ns;
end process;

end Behavioral;
