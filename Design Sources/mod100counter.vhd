library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity mod100counter is
    Port (
        clk_100MHz : in STD_LOGIC;
        steuerung : in STD_LOGIC;
        reset : in STD_LOGIC;
        ANODES : out STD_LOGIC_VECTOR(7 downto 0) := "11111110";
        CATHODES : out STD_LOGIC_VECTOR(6 downto 0));
end mod100counter;

architecture Behavioral of mod100counter is
    signal Output : STD_LOGIC;
    signal INTcounter : INTEGER := 0;
    signal INTZahl : INTEGER range 0 to 9;
    
    signal refresh_counter : INTEGER range 0 to 50000;
    signal digit_count : STD_LOGIC_VECTOR(0 downto 0) := "0";
begin

    process(clk_100MHz, steuerung)
        begin
            if(steuerung = '1' AND clk_100MHz = '0') then Output <= '0';
            elsif(steuerung = '1' AND clk_100MHz = '1') then Output <= '0';
            elsif(steuerung = '0' AND clk_100MHz = '0') then Output <= '1';
            elsif(steuerung = '0' AND clk_100MHz = '1') then Output <= '1';
            end if;
        end process;
    
    process(Output, reset)
        begin
            if(Output'EVENT AND Output = '1') then INTcounter <= INTcounter + 1;
                if(INTcounter > 99) then
                    INTcounter <= 0;
                    --INTZahl <= 0;
                end if;
            end if;
            if(INTcounter > 99 OR reset = '1') then
                INTcounter <= 0;
                --INTZahl <= 0;
            end if;
        end process;
    
    process(INTZahl)
        begin
            if(INTZahl = 0) then CATHODES <= "0000001";
            elsif(INTZahl = 1) then CATHODES <= "1001111";
            elsif(INTZahl = 2) then CATHODES <= "0010010";
            elsif(INTZahl = 3) then CATHODES <= "0000110";
            elsif(INTZahl = 4) then CATHODES <= "1001100";
            elsif(INTZahl = 5) then CATHODES <= "0100100";
            elsif(INTZahl = 6) then CATHODES <= "0100000";
            elsif(INTZahl = 7) then CATHODES <= "0001111";
            elsif(INTZahl = 8) then CATHODES <= "0000000";
            elsif(INTZahl = 9) then CATHODES <= "0000100";
            end if;
        end process;
     
     process(clk_100MHz)
            begin
                if(rising_edge(clk_100MHz)) then
                    refresh_counter <= refresh_counter +1;
                    if(refresh_counter = 50000) then
                        refresh_counter <= 0;
                        digit_count <= digit_count + '1';
                        if(INTCounter > 9) then
                            case digit_count is
                                when "0" =>
                                    ANODES <= "11111110";
                                    INTZahl <= INTcounter - ((INTcounter / 10) * 10);
                                when "1" =>
                                    ANODES <= "11111101";
                                    INTZahl <= INTcounter / 10;
                                when others =>
                                    ANODES <= "11111111";
                            end case;
                        elsif(INTCounter < 10) then
                            ANODES <= "11111110";
                            INTZahl <= INTcounter;
                        end if;
                    end if;
                end if;   
            end process;
        
end Behavioral;