----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/01/2024 12:48:36 PM
-- Design Name:
-- Module Name: compteur - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           sens : in STD_LOGIC;
           en : in STD_LOGIC;
           load : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end compteur;

architecture Behavioral of compteur is

signal bus_out : std_logic_vector (7 downto 0) := (others=>'0');

begin
process(clk)

begin
if rising_edge(clk) then
    if rst = '1' then
        bus_out <= "00000000";
    elsif load = '1' then
        bus_out <= din;
    elsif en = '1'  and sens = '1' then
        bus_out <= bus_out + '1';
    elsif en = '1' and sens = '0' then
        bus_out <= bus_out - '1';
    end if;
end if;
end process;
dout <= bus_out;
end Behavioral;
