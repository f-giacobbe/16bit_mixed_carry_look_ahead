entity Ripple4CLAv2 is
    Port ( A : in bit_vector (15 downto 0);
           B : in bit_vector (15 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (15 downto 0));
end Ripple4CLAv2;

-- Architettura di tipo strutturale
architecture Struct of Ripple4CLAv2 is

-- Richiamiamo il componente Carry Look-Ahead a 4-bit
component CLA4b
    Port ( A : in bit_vector (3 downto 0);
           B : in bit_vector (3 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (3 downto 0));
end component;

-- Utilizziamo un vettore di segnali per gestire la propagazione dei riporti da un componente CLA al successivo
signal c : bit_vector (4 downto 0);

begin
    c(0) <= cin;
    cout <= c(4);
    
    -- Istanziamo 4 componenti Carry Look-Ahead a 4-bit andando a mappare le loro porte utilizzando il FOR GENERATE
    submodules : for i in 0 to 3 generate
        CLA_i : CLA4b port map (A(4*i + 3 downto 4*i), B(4*i + 3 downto 4*i), c(i), c(i+1), S(4*i + 3 downto 4*i));
    end generate;
end Struct;
