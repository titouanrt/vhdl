----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2024 11:23:36 AM
-- Design Name: 
-- Module Name: testbench_instructions - Behavioral
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
entity testbench_instructions is
end testbench_instructions;

architecture Behavioral of testbench_instructions is


component instructions is
    Port ( CLK : in STD_LOGIC;
           aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end component instructions;

signal DATA_OUT : std_logic_vector (31 downto 0) := (others=>'0');
signal aDATA : std_logic_vector (7 downto 0) := (others=>'0');
signal CLK : std_logic := '0';
constant Clock_period : time := 50 ns;

begin
uut : instructions port map(
    DATA_OUT=>DATA_OUT,
    aDATA=>aDATA,
    CLK=>CLK
);

process
begin
CLK <= not(CLK);
wait for Clock_period/2;
end process;

process
begin
aDATA<="00000001";
wait for 50 ns;
aDATA <="10000000";
wait for 50 ns;

end process;


end Behavioral;
