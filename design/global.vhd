----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2024 04:42:21 PM
-- Design Name: 
-- Module Name: global - Behavioral
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

entity global is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end global;

architecture Behavioral of global is
    component alu
           Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           carry : out STD_LOGIC;
           overflow : out STD_LOGIC;
           negative : out STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0));
      end component;
      
      component instructions
           Port ( CLK : in STD_LOGIC;
           aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0));
       end component;
       
       component banc2registres
           Port ( aA : in STD_LOGIC_VECTOR (3 downto 0);
           aB : in STD_LOGIC_VECTOR (3 downto 0);
           aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
        end component;
        
        component donnees
           Port ( aDATA : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
        end component;
        
        component pipe_gate
           Port ( CLK : in STD_LOGIC;
           OP_in : in STD_LOGIC_VECTOR (7 downto 0);
           A_in : in STD_LOGIC_VECTOR (7 downto 0);
           B_in : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out STD_LOGIC_VECTOR (7 downto 0);
           A_out : out STD_LOGIC_VECTOR (7 downto 0);
           B_out : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC_VECTOR (7 downto 0));
         end component;
         
         component Decodeur
            Port ( OP_bus : in STD_LOGIC_VECTOR (7 downto 0);
            W : out STD_LOGIC);
         end component;
          
         --signaux alu
           signal A_alu : STD_LOGIC_VECTOR (7 downto 0);
           signal B_alu : STD_LOGIC_VECTOR (7 downto 0);
           signal control_alu : STD_LOGIC_VECTOR (2 downto 0);
           signal carry_alu : STD_LOGIC;
           signal overflow_alu : STD_LOGIC;
           signal negative_alu : STD_LOGIC;
           signal S_alu : STD_LOGIC_VECTOR (7 downto 0);
           
           --signaux instructions
           signal DATA_OUT_inst : std_logic_vector (31 downto 0);
           signal aDATA_inst : std_logic_vector (7 downto 0);
           
           --signaux banc2registres
           signal aA_b2r : std_logic_vector (3 downto 0);
           signal aB_b2r : std_logic_vector (3 downto 0);
           signal aW_b2r : std_logic_vector (3 downto 0);
           signal W_b2r : std_logic;
           signal DATA_b2r : std_logic_vector (7 downto 0);
           signal QA_b2r : std_logic_vector (7 downto 0);
           signal QB_b2r : std_logic_vector (7 downto 0);
           
           --signaux donnees
           signal aDATA_don : STD_LOGIC_VECTOR (7 downto 0);
           signal DATA_IN_don : STD_LOGIC_VECTOR (7 downto 0);
           signal RW_don : STD_LOGIC;
           signal DATA_OUT_don : STD_LOGIC_VECTOR (7 downto 0);
           
           --signaux pipe_gate 1
           signal OP_pipe_1 : STD_LOGIC_VECTOR (7 downto 0);
           signal A_pipe_1 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_1 : STD_LOGIC_VECTOR (7 downto 0);
           signal C_pipe_1 : STD_LOGIC_VECTOR (7 downto 0);

           --signaux pipe_gate 2
           signal OP_pipe_2 : STD_LOGIC_VECTOR (7 downto 0);
           signal A_pipe_2 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_2_in : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_2 : STD_LOGIC_VECTOR (7 downto 0);
           signal C_pipe_2 : STD_LOGIC_VECTOR (7 downto 0);
           signal C_pipe_2_in : STD_LOGIC_VECTOR (7 downto 0);

           --signaux pipe_gate 3
           signal OP_pipe_3 : STD_LOGIC_VECTOR (7 downto 0);
           signal A_pipe_3 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_3 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_3_in : STD_LOGIC_VECTOR (7 downto 0);
           signal C_pipe_3 : STD_LOGIC_VECTOR (7 downto 0);
        
           --signaux pipe_gate 4
           signal OP_pipe_4 : STD_LOGIC_VECTOR (7 downto 0);
           signal A_pipe_4 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_4 : STD_LOGIC_VECTOR (7 downto 0);
           signal B_pipe_4_in : STD_LOGIC_VECTOR (7 downto 0);
           signal C_pipe_4 : STD_LOGIC_VECTOR (7 downto 0);
           
           signal aDonnee : std_logic_vector(7 downto 0);   
           signal RWdata : std_logic;
           signal Wb2r : std_logic;   
   
           signal alu_ctrl_in : STD_LOGIC_VECTOR (2 downto 0);

begin
U_alu : alu port map(
    A=>B_pipe_2,
    B=>C_pipe_2,
    control=>alu_ctrl_in,
    carry=>carry_alu,
    overflow=>overflow_alu,
    negative=>negative_alu,
    S=>S_alu
);

U_inst : instructions port map(

    CLK=>CLK,
    aDATA=>INS,
    DATA_OUT=>DATA_OUT_inst
);

U_b2r : banc2registres port map(
    aA=>B_pipe_1(3 downto 0),
    aB=>C_pipe_1(3 downto 0),
    aW=>A_pipe_4(3 downto 0),
    W=> Wb2r,
    DATA=>B_pipe_4,
    RST=>RST,
    CLK=>CLK,
    QA=>QA_b2r,
    QB=>C_pipe_2_in
);

U_don : donnees port map(
    aDATA=>aDonnee,
    DATA_IN=>B_pipe_3,
    RW=>RWdata,
    RST=>RST,
    CLK=>CLK,
    DATA_OUT=>DATA_OUT_don
);


U_pipe_1 : pipe_gate port map(
    CLK=>CLK,
    OP_in=>DATA_OUT_inst(31 downto 24),
    A_in=>DATA_OUT_inst(23 downto 16),
    B_in=>DATA_OUT_inst(15 downto 8),
    C_in=>DATA_OUT_inst(7 downto 0),
    OP_out=>OP_pipe_1,
    A_out=>A_pipe_1,
    B_out=>B_pipe_1,
    C_out=>C_pipe_1
);

U_pipe_2 : pipe_gate port map(
    CLK=>CLK,
    OP_in=>OP_pipe_1,
    A_in=>A_pipe_1,
    B_in=>B_pipe_2_in,
    C_in=>C_pipe_2_in,
    OP_out=>OP_pipe_2,
    A_out=>A_pipe_2,
    B_out=>B_pipe_2,
    C_out=>C_pipe_2
);

U_pipe_3 : pipe_gate port map(
    CLK=>CLK,
    OP_in=>OP_pipe_2,
    A_in=>A_pipe_2,
    B_in=>B_pipe_3_in,
    C_in=>C_pipe_2,
    OP_out=>OP_pipe_3,
    A_out=>A_pipe_3,
    B_out=>B_pipe_3,
    C_out=>C_pipe_3
);
    
U_pipe_4 : pipe_gate port map(
    CLK=>CLK,
    OP_in=>OP_pipe_3,
    A_in=>A_pipe_3,
    B_in=>B_pipe_4_in,
    C_in=>C_pipe_3,
    OP_out=> OP_pipe_4,
    A_out=>A_pipe_4,
    B_out=>B_pipe_4,
    C_out=>C_pipe_4
);


    
B_pipe_2_in <= QA_b2r when (OP_pipe_1 = x"05" or OP_pipe_1 = x"08" or OP_pipe_1 = x"01" or OP_pipe_1 = x"02" or OP_pipe_1 = x"03") else
      B_pipe_1;
    
     
B_pipe_3_in <= S_alu when (OP_pipe_2 = x"01" or OP_pipe_2 = x"02" or OP_pipe_2 = x"03") else
    B_pipe_2;

aDonnee <= A_pipe_3 when (OP_pipe_3 = x"08") else
    B_pipe_3;


B_pipe_4_in <= DATA_OUT_don when (OP_pipe_3 = x"07") else
    B_pipe_3;

           
alu_ctrl_in <= "000" when OP_pipe_2 = x"01" 
else "010" when OP_pipe_2 = x"02"
else "001" when OP_pipe_2 = x"03"
else "000";

RWdata <= '0' when OP_pipe_3 = x"08"
else '1';

Wb2r <= '1' when (OP_pipe_4 = x"05" or OP_pipe_4 = x"07" or OP_pipe_4 = x"06" or OP_pipe_4 = x"01" or OP_pipe_4 = x"02" or OP_pipe_4 = x"03")
else '0';


end Behavioral;
