----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2024 10:18:18 AM
-- Design Name: 
-- Module Name: testbench_donnees - Behavioral
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

entity testbench_donnees is
end testbench_donnees;

architecture Behavioral of testbench_donnees is

component donnees is
    Port ( aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end component donnees;

signal aDATA : STD_LOGIC_VECTOR (7 downto 0):= (others=>'0');
signal DATA_IN : STD_LOGIC_VECTOR (7 downto 0):= (others=>'0');
signal RW : STD_LOGIC:= '0';
signal RST : STD_LOGIC:= '0';
signal CLK : STD_LOGIC:= '0';
signal DATA_OUT : STD_LOGIC_VECTOR (7 downto 0):= (others=>'0');
constant Clock_period : time := 50 ns;
begin

uut : donnees port map(
aDATA=>aDATA,
DATA_IN=>DATA_IN,
RW=>RW,
RST=>RST,
CLK=>CLK,
DATA_OUT=>DATA_OUT
);

process
begin
CLK <= not(CLK);
wait for Clock_period/2;
end process;

process
begin
RST<='0';
aDATA <= "00000000";


wait for 100 ns;
RST<='1';
DATA_IN <= "10000001";
aDATA <= "11111111";
RW <= '0';

wait for 100 ns;
RW <= '1';

wait for 100 ns;
RST<='1';
DATA_IN <= "11001100";
aDATA <= "10101010";
RW <= '0';

wait for 100 ns;
RW <= '1';

wait for 100 ns;
RST<='0';
end process;


end Behavioral;
