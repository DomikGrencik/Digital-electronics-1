----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2021 20:10:39
-- Design Name: 
-- Module Name: buzzer - Behavioral
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

entity buzzer is
Port ( 
           outputdistance_i : in integer;          --real value of distance              
           clk_buzz_i : in std_LOGIC := '0';    --transformed clock input
           buzzer_o : out std_logic             --buzzer output
                 
           );
end buzzer;

architecture Behavioral of buzzer is

signal s_buzzer : std_logic := '0';             --signal of buzzer output
signal s_buzzer_freq : time := 0ms;             --time variable for buzzer frquency

begin

buzzer : process (clk_buzz_i)
begin

if rising_edge(clk_buzz_i) then
    if(s_buzzer_freq /= 0us) then
        s_buzzer <= '0';
        s_buzzer <= '1' after s_buzzer_freq;
    end if;
end if;

end process buzzer;

buzzer_freq : process(outputdistance_i)
begin

if (outputdistance_i < 400 AND outputdistance_i > 350) then
    s_buzzer_freq <= 1050us;
elsif (outputdistance_i < 350 AND outputdistance_i > 300) then
    s_buzzer_freq <= 900us;
elsif (outputdistance_i < 300 AND outputdistance_i > 250) then
    s_buzzer_freq <= 750us;
elsif (outputdistance_i < 250 AND outputdistance_i > 200) then
    s_buzzer_freq <= 600us;
elsif (outputdistance_i < 200 AND outputdistance_i > 150) then
    s_buzzer_freq <= 450us;
elsif (outputdistance_i < 150 AND outputdistance_i > 100) then
    s_buzzer_freq <= 300us;
elsif (outputdistance_i < 100 AND outputdistance_i > 50) then
    s_buzzer_freq <= 150us;
elsif (outputdistance_i < 50 AND outputdistance_i > 0) then
    s_buzzer_freq <= 0us;
end if;

end process buzzer_freq;

buzzer_o <= s_buzzer;

end Behavioral;
