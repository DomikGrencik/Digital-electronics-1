----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2021 20:56:39
-- Design Name: 
-- Module Name: tb_buzzer - Behavioral
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

entity tb_buzzer is
--  Port ( );
end tb_buzzer;

architecture Behavioral of tb_buzzer is

    constant c_buzz_freq : time := 525 us;
    signal s_outputdistance : integer;
    signal s_clk_buzz : std_logic;

begin

    uut_buzzer : entity work.buzzer
        port map(
            outputdistance_i   => s_outputdistance,
            clk_buzz_i   => s_clk_buzz
        );
        
    p_clkbuzz : process
    begin
        while now < 4000 ms loop   -- 4 sec of simulation
            s_clk_buzz <= '0';
            wait for c_buzz_freq;
            s_clk_buzz <= '1';
            wait for c_buzz_freq;
        end loop;
        wait;
    end process p_clkbuzz;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        s_outputdistance <= 425;
        wait for 2ms;
        s_outputdistance <= 400;
        wait for 2ms;
        s_outputdistance <= 375;
        wait for 2ms;
        s_outputdistance <= 350;
        wait for 2ms;
        s_outputdistance <= 325;
        wait for 2ms;
        s_outputdistance <= 300;
        wait for 5ms;
        s_outputdistance <= 275;
        wait for 5ms;
        s_outputdistance <= 250;
        wait for 5ms;
        s_outputdistance <= 225;
        wait for 5ms;
        s_outputdistance <= 200;
        wait for 5ms;
        s_outputdistance <= 175;
        wait for 5ms;
        s_outputdistance <= 150;
        wait for 5ms;
        s_outputdistance <= 125;
        wait for 5ms;
        s_outputdistance <= 100;
        wait for 5ms;
        s_outputdistance <= 75;
        wait for 5ms;
        s_outputdistance <= 50;
        wait for 5ms;
        s_outputdistance <= 25; 
    
        
        wait;

    end process p_stimulus;
    


end Behavioral;
