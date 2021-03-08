----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2021 21:45:48
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

    signal s_hex : std_logic_vector(4 - 1 downto 0);
    signal s_LED : std_logic_vector (8 - 1 downto 0);
    signal s_AN : std_logic_vector (8 - 1 downto 0);


begin

    uut_top : entity work.top
        port map(
            SW          => s_hex,
            LED         => s_LED,
            AN          => s_AN
        );
    
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_hex     <= "0000";  wait for 100 ns; 
        
        s_hex     <= "0001";  wait for 100 ns;
         
        s_hex     <= "0010";  wait for 100 ns; 
        
        s_hex     <= "0011";  wait for 100 ns; 
        
        s_hex     <= "0100";  wait for 100 ns; 
        
        s_hex     <= "0101";  wait for 100 ns;
        
        s_hex     <= "0110";  wait for 100 ns; 
        
        s_hex     <= "0111";  wait for 100 ns;
        
        s_hex     <= "1000";  wait for 100 ns;
        
        s_hex     <= "1001";  wait for 100 ns; 
        
        s_hex     <= "1010";  wait for 100 ns;
        
        s_hex     <= "1011";  wait for 100 ns;  
        
        s_hex     <= "1100";  wait for 100 ns; 
        
        s_hex     <= "1101";  wait for 100 ns; 
        
        s_hex     <= "1110";  wait for 100 ns;  
        
        s_hex     <= "1111";  wait for 100 ns;  
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
