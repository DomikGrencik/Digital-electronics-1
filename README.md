# Digital-electronics-1
## CV1
### Dominik Grenčík
------
*this text is italic*

**this text is bold**   
- pes
- macka
- mys

1. pes
2. macka
3. mys

[VUTBR](https://www.vutbr.cz/)

Mesto | Počet obyvateľov
----- | ----------------
Banská Bystrica | 80000
Brno | 380000

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ledc8x8 is
port (
   ROW: out std_logic_vector (0 to 7);
   LED: out std_logic_vector (0 to 7);
   SMCLK: in std_logic;
   RESET: in std_logic
);
end ledc8x8;

architecture main of ledc8x8 is
   signal counter : std_logic_vector (11 downto 0) := "000000000000";
   signal chg_state : std_logic_vector (20 downto 0) := "000000000000000000000";
   signal rows : std_logic_vector (7 downto 0);
   signal leds : std_logic_vector (7 downto 0);
   signal leds2 : std_logic_vector (7 downto 0);
   signal enable : std_logic_vector (1 downto 0);
   signal ce : std_logic;
begin

--Nastavi premennu ce na 1 ked counter napocita do SMCLK/256/8 = 3600 = 111000010000.
   clock_divider: process (SMCLK, RESET)
   begin
      if RESET ='1' then
         counter <= "000000000000";
      elsif rising_edge (SMCLK) then
         counter <= counter + 1;
         if counter = "111000010000" then
            ce <= '1';
         else
            ce <= '0';
         end if;
      end if;
   end process clock_divider;

-- Rotuje premennu enable medzi stavami 00, 01, 10, 11 tak, aby kazdy z nich trval 1/4 sekundy.
   initials_rotation: process (SMCLK, RESET)
   begin
      if RESET ='1' then
         chg_state <= "000000000000000000000";
      elsif rising_edge (SMCLK) then
         chg_state <= chg_state + 1;
         if chg_state = "111000010000000000000" then
            enable <= enable + 1;
            if enable = "11" then
               enable <= "00";
            end if;
         end if;
      end if;
   end process initials_rotation;

-- Rotuje zapinanie jednotlivych riadkov frekvenciou SMCLK/256/8 = 3600Hz.
   rows_rotation: process (SMCLK, RESET, ce)
   begin
      if RESET = '1' then
         rows <= "10000000";
      elsif (rising_edge (SMCLK) and ce = '1') then
         rows <= rows (0) & rows (7 downto 1);
      end if;
   end process rows_rotation;

-- Pre jednotlive aktivovane riadky zapina prislusne stlpce lediek, aby vznikli pismena R a G.
   rows_decoder: process (rows)
   begin
      -- Vznika pismeno R.
      case rows is
         when "10000000" => leds <= "00001111";
         when "01000000" => leds <= "01110111";
         when "00100000" => leds <= "01110111";
         when "00010000" => leds <= "01110111";
         when "00001000" => leds <= "00001111";
         when "00000100" => leds <= "01011111";
         when "00000010" => leds <= "01101111";
         when "00000001" => leds <= "01110111";
         when others =>     leds <= "11111111";
      end case;

      -- Vznika pismeno G.
      case rows is
         when "10000000" => leds2 <= "11000111";
         when "01000000" => leds2 <= "10111011";
         when "00100000" => leds2 <= "01111111";
         when "00010000" => leds2 <= "01111111";
         when "00001000" => leds2 <= "01100011";
         when "00000100" => leds2 <= "01111011";
         when "00000010" => leds2 <= "10111011";
         when "00000001" => leds2 <= "11000111";
         when others =>     leds2 <= "11111111";
      end case;
   end process rows_decoder;

-- Aktivuje zobrazenie stavov (R, nic, G, nic) na displeji.
   show_on_display: process (enable)
   begin
      if enable = "00" then
         LED <= leds;
      elsif enable = "10" then
         LED <= leds2;
      else
         LED <= "11111111";
      end if;
      ROW <= rows;
   end process show_on_display;

end main;
```
