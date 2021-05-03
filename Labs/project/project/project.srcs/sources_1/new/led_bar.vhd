----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2021 20:10:01
-- Design Name: 
-- Module Name: led_bar - Behavioral
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

entity led_bar is
Port ( 
           outputdistance_i : in integer;                          --real value of distance
           led_bar_o : out std_logic_vector(8 - 1 downto 0)     --BUS for led bar                 
                 
           );
end led_bar;

architecture Behavioral of led_bar is

signal s_led_bar : std_logic_vector(8 - 1 downto 0);            --signal of led_bar_o

begin

set_led_bar : process(outputdistance_i)
begin

if (outputdistance_i < 400 AND outputdistance_i >= 350) then
    s_led_bar <= "00000001";
elsif (outputdistance_i < 350 AND outputdistance_i >= 300) then
    s_led_bar <= "00000011";
elsif (outputdistance_i < 300 AND outputdistance_i >= 250) then
    s_led_bar <= "00000111";
elsif (outputdistance_i < 250 AND outputdistance_i >= 200) then
    s_led_bar <= "00001111";
elsif (outputdistance_i < 200 AND outputdistance_i >= 150) then
    s_led_bar <= "00011111";
elsif (outputdistance_i < 150 AND outputdistance_i >= 100) then
    s_led_bar <= "00111111";
elsif (outputdistance_i < 100 AND outputdistance_i >= 50) then
    s_led_bar <= "01111111";
elsif (outputdistance_i < 50 AND outputdistance_i > 0) then
    s_led_bar <= "11111111";
else 
s_led_bar <= "00000000";
end if;

end process set_led_bar;

led_bar_o <= s_led_bar;


end Behavioral;
