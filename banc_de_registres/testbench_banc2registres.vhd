----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/04/2024 05:09:11 PM
-- Design Name:
-- Module Name: testbench_registres - Behavioral
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

entity testbench_registres is
end testbench_registres;
architecture Behavioral of testbench_registres is

component banc2registres is
    Port ( aA : in STD_LOGIC_VECTOR (3 downto 0);
           aB : in STD_LOGIC_VECTOR (3 downto 0);
           aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end component banc2registres;
signal aA : std_logic_vector (3 downto 0) := (others=>'0');
signal aB : std_logic_vector (3 downto 0) := (others=>'0');
signal aW : std_logic_vector (3 downto 0) := (others=>'0');
signal W : std_logic := '0';
signal DATA : std_logic_vector (7 downto 0) := (others=>'0');
signal RST : std_logic := '1';
signal CLK : std_logic := '0';
signal QA : std_logic_vector (7 downto 0) := (others=>'0');
signal QB : std_logic_vector (7 downto 0) := (others=>'0');

constant Clock_period : time := 50 ns;

begin
uut : banc2registres port map(
    aA => aA,
    aB => aB,
    aW => aW,
    W=>W,
    DATA=>DATA,
    RST=>RST,
    CLK=>CLK,
    QA=>QA,
    QB=>QB
);
process
begin
CLK <= not(CLK);
wait for Clock_period/2;
end process;

process
begin
DATA <= "00000001";
aW <= "1000";
wait for 50 ns;
W <= '1';
DATA <= "00000010";
aW <= "0111";
aA <= "1000";
aB <= "0111";
wait for 50 ns;
W<= '0';
RST <= '0';
aA <= "1000";
aB <= "0111";
wait for 50 ns;
RST <= '1';
W='1'
DATA <= "11111111";
aW <= "0110";
wait for 50 ns;

end process;


end Behavioral;

