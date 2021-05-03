----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2021 20:45:39
-- Design Name: 
-- Module Name: tb_led_bar - Behavioral
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

entity tb_led_bar is
--  Port ( );
end tb_led_bar;

architecture Behavioral of tb_led_bar is

    signal s_outputdistance : integer;

begin

uut_led_bar : entity work.led_bar
        port map(
            outputdistance_i   => s_outputdistance                                          
        );
        
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        s_outputdistance <= 425;
        wait for 200ms;
        s_outputdistance <= 400;
        wait for 200ms;
        s_outputdistance <= 375;
        wait for 200ms;
        s_outputdistance <= 350;
        wait for 200ms;
        s_outputdistance <= 325;
        wait for 200ms;
        s_outputdistance <= 300;
        wait for 200ms;
        s_outputdistance <= 275;
        wait for 200ms;
        s_outputdistance <= 250;
        wait for 200ms;
        s_outputdistance <= 225;
        wait for 200ms;
        s_outputdistance <= 200;
        wait for 200ms;
        s_outputdistance <= 175;
        wait for 200ms;
        s_outputdistance <= 150;
        wait for 200ms;
        s_outputdistance <= 125;
        wait for 200ms;
        s_outputdistance <= 100;
        wait for 200ms;
        s_outputdistance <= 75;
        wait for 200ms;
        s_outputdistance <= 50;
        wait for 200ms;
        s_outputdistance <= 25;
   
        
        wait;

    end process p_stimulus;
   

end Behavioral;
