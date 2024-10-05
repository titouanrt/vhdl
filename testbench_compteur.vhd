
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TestCompteur is
end TestCompteur;
architecture Behavioral of TestCompteur is
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT compteur
PORT(
clk : IN std_logic;
rst : IN std_logic;
load : IN std_logic;
sens : IN std_logic;
en : IN std_logic;
din : IN std_logic_vector(7 downto 0);
dout : OUT std_logic_vector(7 downto 0)
);
END COMPONENT;
--Inputs
signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal load : std_logic := '0';
signal sens : std_logic := '0';
signal en : std_logic := '0';
signal din : std_logic_vector(7 downto 0) := (others => '0');
--Outputs
signal dout : std_logic_vector(7 downto 0);
-- Clock period definitions
constant Clock_period : time := 10 ns;
begin
-- Instantiate the Unit Under Test (UUT)
uut: Compteur PORT MAP (
clk => clk,
rst => rst,
load => load,
sens => sens,
en => en,
din => din,
dout => dout
);
-- Clock process definitions
Clock_process :process
begin
clk <= not(clk);
wait for Clock_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
-- insert stimulus here
wait for 20 ns;
sens <= '1';
en <= '1';
wait for 100 ns;
sens <= '0';
wait for 50 ns;
en <= '0';
rst <='1';
wait for 10 ns;
rst <= '0';
din <= "10000000";
wait for 10 ns;
load <= '1';
wait for 20 ns;
en <= '1';
wait for 30 ns;


wait;
end process;
end;