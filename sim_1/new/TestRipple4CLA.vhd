entity TestRipple4CLA is
end TestRipple4CLA;

architecture sim of TestRipple4CLA is

component Ripple4CLAv2
    Port ( A : in bit_vector (15 downto 0);
           B : in bit_vector (15 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (15 downto 0));
end component;

signal A : bit_vector (15 downto 0);
signal B : bit_vector (15 downto 0);
signal cin : bit;
signal cout : bit;
signal S : bit_vector (15 downto 0);

begin
    process begin
        cin <= '0';
        
        -- Test di riporto in uscita
        A <= (others => '0');
        A(0) <= '1';
        B <= (others => '1');
        wait for 10ns;
        
        -- Somma di zeri
        A <= (others => '0');
        B <= (others => '0');
        wait for 10ns;
        
        -- Somma di entrambi gli addendi pari al massimo valore unsigned
        A <= (others => '1');
        B <= (others => '1');
        wait for 10ns;
        
        -- Altri test con valori casuali
        A <= "0000000001111100";
        B <= "0000000000001000";
        wait for 10ns;
        
        A <= "1011010101010100";
        B <= "1110001100110011";
        wait for 10ns;
        
        A <= "0000011111000001";
        B <= "0000011111000001";
        wait for 10ns;
        
        A <= "0010101010111100";
        B <= "1111100110101001";
        wait for 30ns;
        
        
        
        -- Ripetiamo gli stessi test, ma con il riporto in entrata pari a 1
        cin <= '1';
        
        -- Test di riporto in uscita
        A <= (others => '0');
        A(0) <= '1';
        B <= (others => '1');
        wait for 10ns;
        
        -- Somma di zeri
        A <= (others => '0');
        B <= (others => '0');
        wait for 10ns;
        
        -- Somma di entrambi gli addendi pari al massimo valore unsigned
        A <= (others => '1');
        B <= (others => '1');
        wait for 10ns;
        
        -- Altri test con valori casuali
        A <= "0000000001111100";
        B <= "0000000000001000";
        wait for 10ns;
        
        A <= "1011010101010100";
        B <= "1110001100110011";
        wait for 10ns;
        
        A <= "0000011111000001";
        B <= "0000011111000001";
        wait for 10ns;
        
        A <= "0010101010111100";
        B <= "1111100110101001";
        wait for 30ns;
    end process;
    
    CUT : Ripple4CLAv2 port map (A, B, cin, cout, S);
end sim;
