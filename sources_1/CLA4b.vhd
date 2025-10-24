entity CLA4b is
    Port ( A : in bit_vector (3 downto 0);
           B : in bit_vector (3 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (3 downto 0));
end CLA4b;

architecture Behavioral of CLA4b is

-- Segnali interni di riporto, generazione e propagazione.
signal p,g : bit_vector (3 downto 0);
signal c : bit_vector (4 downto 0);

begin
    c(0) <= cin;
    
    -- Calcolo parallelo dei bit propagate e generate
    p <= A xor B;
    g <= A and B;
    
    c(1) <= g(0) or (p(0) and c(0));
    c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and c(0));
    c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c(0));
    c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and c(0));
    
    cout <= c(4);
    S <= p xor c(3 downto 0);
end Behavioral;
