----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2021 15:43:23
-- Design Name: 
-- Module Name: tb_sensor - Behavioral
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

entity tb_sensor is
--  Port ( );
end tb_sensor;

architecture Behavioral of tb_sensor is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    constant c_60ms : time := 60 ms;
    constant c_10us : time := 10 us;    

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_echo : std_logic;    
    signal s_time : time := 23200us;    
    
begin

    uut_sensor : entity work.sensor
        port map(
            clk_i   => s_clk_100MHz,
            echo_i  => s_echo                                          
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 4000 ms loop   -- 4 sec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
          
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
    s_echo <= '0';
    wait for c_60ms;
    while now < 4000 ms loop   -- 4 sec of simulation
            s_echo <= '0';
            wait for c_10us;
            s_echo <= '1';
            wait for s_time;            
            s_echo <= '0';
            wait for c_60ms - s_time;
            s_time <= s_time - 2400 us;
        end loop;
        wait;

    end process p_stimulus;

end Behavioral;
