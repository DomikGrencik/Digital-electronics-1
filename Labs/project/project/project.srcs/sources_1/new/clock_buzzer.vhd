----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2021 19:38:26
-- Design Name: 
-- Module Name: clock_buzzer - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_buzzer is
port(
        clk_i      : in  std_logic;     --original clock input     
        clk_buzz_o   : out std_logic    --transformed clock output
    );
end clock_buzzer;

architecture Behavioral of clock_buzzer is

signal s_cnt : unsigned(16 - 1 downto 0):= b"0000_0000_0000_0000";      --counter
signal s_clk : std_logic := '0';                                        --signal of clk_buzz_o
    
constant c_freq : unsigned(16 - 1 downto 0):= b"1100_1101_0001_0100";   --constant (52500)

begin

p_clock_buzzer : process(clk_i)
    begin
    
    if s_cnt = c_freq then
        s_clk <= not(s_clk);
        s_cnt <= (others => '0');
    end if;
    
    if rising_edge(clk_i) then        
        s_cnt <= s_cnt + 1;       
    end if;
    
end process p_clock_buzzer;
    
    clk_buzz_o <= s_clk;

end Behavioral;
