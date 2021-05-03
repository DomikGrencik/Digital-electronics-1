----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2021 15:25:23
-- Design Name: 
-- Module Name: sensor - Behavioral
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
use     ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sensor is
    Port ( 
           trig_o : out STD_LOGIC;          --signal that will trigger the sensor
           echo_i : in STD_LOGIC;           --signal from the sensor
           clk_i  : in std_LOGIC;           --clock
           outputdistace_o : out integer       --real value of distance
                 
           );
end sensor;

architecture Behavioral of sensor is

type   t_state_echo is (WAIT_TRIG, SEND_TRIG);      --state machine
signal s_state_echo  : t_state_echo;                --signal of state machine


signal   s_cnt  : unsigned(24 - 1 downto 0):= b"0000_0000_0000_0000_0000_0000";         --counter for state machine
constant c_DELAY_60ms : unsigned(24 - 1 downto 0) := b"0101_1011_1000_1101_1000_0000";  --constant 60ms
constant c_DELAY_10us : unsigned(24 - 1 downto 0) := b"0000_0000_0000_0011_1110_1000";  --constant 10us
constant c_ZERO       : unsigned(24 - 1 downto 0) := b"0000_0000_0000_0000_0000_0000";  --constant zero


signal s_count : integer := 0;          --counter of echo signal width
signal s_outputdistance : integer := 0;  --signal of outputdistace_o

begin

p_send_trig : process (clk_i)
begin

if rising_edge (clk_i) then
    
    case (s_state_echo) is
                    when WAIT_TRIG =>
                        
                        if (s_cnt < c_DELAY_60ms) then
                            s_cnt <= s_cnt + 1;
                            trig_o <= '0';
                        else
                            s_state_echo <= SEND_TRIG;
                            s_cnt <= c_ZERO;
                        end if;    
                        
                    when SEND_TRIG => 
                    
                        if (s_cnt < c_DELAY_10us) then
                            s_cnt <= s_cnt + 1;
                            trig_o <= '1';
                        else
                            s_cnt <= c_ZERO;                            
                            s_state_echo <= WAIT_TRIG;
                        end if; 
    end case; 
end if;

end process p_send_trig;

p_get_echo : process (clk_i, echo_i)
begin

if echo_i = '1' then
    if rising_edge (clk_i) then    
        s_count <= s_count +1;
    end if;
end if;

if rising_edge (echo_i) then
    s_count <= 0;
end if;

if echo_i = '0' then    
    s_outputdistance <= s_count/5800;  
end if;

end process p_get_echo;

outputdistace_o <= s_outputdistance;


end Behavioral;
