----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2021 20:09:06
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  Port ( 
           CLK100MHZ : in STD_LOGIC;
          
           ja : in STD_LOGIC_VECTOR (8-1 downto 0);     -- sensor in
           jb : out STD_LOGIC_VECTOR (8-1 downto 0);    -- ledbar
           jc : out STD_LOGIC_VECTOR (2-1 downto 0)    -- sensor out, buzzer           
  );
end top;

architecture Behavioral of top is

signal s_outputdistance : integer := 0;
signal s_clk : std_logic;

begin

uut_sensor : entity work.sensor
        port map(
            clk_i     => CLK100MHZ,
            trig_o => jc(0),
            echo_i => ja(0),           
            outputdistace_o => s_outputdistance            
        );
        
uut_led_bar : entity work.led_bar
        port map(
            outputdistance_i => s_outputdistance,
            led_bar_o(0) => jb(0),
            led_bar_o(1) => jb(1),
            led_bar_o(2) => jb(2),
            led_bar_o(3) => jb(3),
            led_bar_o(4) => jb(4),
            led_bar_o(5) => jb(5),
            led_bar_o(6) => jb(6),
            led_bar_o(7) => jb(7)            
        );
        
uut_clock_buzzer : entity work.clock_buzzer
        port map(
            clk_i      => CLK100MHZ,                  
            clk_buzz_o    => s_clk      
        );            
        
uut_buzzer : entity work.buzzer
        port map(
            outputdistance_i => s_outputdistance,                                   
            buzzer_o => jc(1),
            clk_buzz_i => s_clk             
        );
                

end Behavioral;
