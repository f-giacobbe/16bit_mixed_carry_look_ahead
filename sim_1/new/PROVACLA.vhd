entity PROVACLA is
--  Port ( );
end PROVACLA;

architecture Behavioral of PROVACLA is
component CLA4b
    Port ( A : in bit_vector (3 downto 0);
           B : in bit_vector (3 downto 0);
           cin : in bit;
           cout : out bit;
           S : out bit_vector (3 downto 0));
end component;

signal A : bit_vector (3 downto 0);
signal B : bit_vector (3 downto 0);
signal cin : bit;
signal cout : bit;
signal S : bit_vector (3 downto 0);

begin
    CUT : CLA4b port map (A, B, cin, cout, S);
    
    cin <= '0';
    process begin
        A <= "0000";
        B <= "0010";
        wait for 10ns;
        
        A <= "0001";
    end process;

end Behavioral;
