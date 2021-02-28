# Digital-electronics-1
## **Labs/03-vivado**
### *Dominik Grenčík, 220815*
### [Digital-electronics-1](https://github.com/DomikGrencik/Digital-electronics-1)
------

## 1. Figure or table with connection of 16 slide switches and 16 LEDs on Nexys A7 board



---

## 2. Two-bit wide 4-to-1 multiplexer

* ### **Listing of VHDL architecture from source file mux_2bit_4to1.vhd**
 
 ```vhdl
 architecture Behavioral of mux_2bit_4to1 is
begin

	f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;

end architecture Behavioral;
```

* ### **Listing of VHDL stimulus process from testbench file tb_mux_2bit_4to1.vhd**

```vhdl
 p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_d     <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel   <= "00"; wait for 50 ns;
        
        s_a     <= "01"; wait for 50 ns;
        s_b     <= "01"; wait for 50 ns;
        
        s_sel   <= "01"; wait for 50 ns;
        s_c     <= "00"; wait for 50 ns;
        s_b     <= "11"; wait for 50 ns;
        
        s_d     <= "10"; s_c <= "11"; s_b <= "01"; s_a <= "00"; 
        s_sel   <= "10"; wait for 50 ns;
        
        s_d     <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "01"; 
        s_sel   <= "10"; wait for 50 ns;
        
        s_d     <= "10"; s_c <= "11"; s_b <= "01"; s_a <= "00"; 
        s_sel   <= "11"; wait for 50 ns;
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

* ### **Simulated time waveforms**

![waveform](Images/waveform.png)

---

## 3. Vivado tutorial

