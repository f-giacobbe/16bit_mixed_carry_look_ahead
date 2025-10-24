entity Ripple4CLA is
    Port ( A : in bit_vector (15 downto 0);
           B : in bit_vector (15 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (15 downto 0));
end Ripple4CLA;

-- Architettura di tipo strutturale
architecture Struct of Ripple4CLA is

-- Richiamiamo il componente Carry Look-Ahead a 4-bit
component CLA4b
    Port ( A : in bit_vector (3 downto 0);
           B : in bit_vector (3 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (3 downto 0));
end component;

-- Utilizziamo un vettore di segnali per gestire la propagazione dei riporti da un componente CLA al successivo
signal c_intermedi : bit_vector (2 downto 0);

begin

    -- Istanziamo 4 componenti Carry Look-Ahead a 4-bit andando a mappare le loro porte
    CLA_0 : CLA4b port map (A(3 downto 0), B(3 downto 0), cin, c_intermedi(0), S(3 downto 0));
    CLA_1 : CLA4b port map (A(7 downto 4), B(7 downto 4), c_intermedi(0), c_intermedi(1), S(7 downto 4));
    CLA_2 : CLA4b port map (A(11 downto 8), B(11 downto 8), c_intermedi(1), c_intermedi(2), S(11 downto 8));
    CLA_3 : CLA4b port map (A(15 downto 12), B(15 downto 12), c_intermedi(2), cout, S(15 downto 12));

end Struct;
