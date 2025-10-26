entity TestRipple4CLA is
end TestRipple4CLA;

architecture sim of TestRipple4CLA is

component Ripple4CLAv2
    Port ( A : in bit_vector (31 downto 0);
           B : in bit_vector (31 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (31 downto 0));
end component;

signal A : bit_vector (31 downto 0);
signal B : bit_vector (31 downto 0);
signal cin : bit;
signal cout : bit;
signal S : bit_vector (31 downto 0);

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
        A <= "00000000000000000000000001111100";
        B <= "00000000000000000000000000001000";
        wait for 10ns;

        A <= "10110101010101001111000011001111";
        B <= "11100011001100111011010101010100";
        wait for 10ns;

        A <= "00000000000000011111000000011111";
        B <= "00000000000000011111000000011111";
        wait for 10ns;

        A <= "00101010101111001111100110101001";
        B <= "11111001101010010010101010111100";
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
        A <= "00000000000000000000000001111100";
        B <= "00000000000000000000000000001000";
        wait for 10ns;

        A <= "10110101010101001111000011001111";
        B <= "11100011001100111011010101010100";
        wait for 10ns;

        A <= "00000000000000011111000000011111";
        B <= "00000000000000011111000000011111";
        wait for 10ns;

        A <= "00101010101111001111100110101001";
        B <= "11111001101010010010101010111100";
        wait for 30ns;
    end process;

    CUT : Ripple4CLAv2 port map (A, B, cin, cout, S);
end sim;
