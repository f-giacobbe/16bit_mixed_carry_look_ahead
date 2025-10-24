library IEEE;
use ieee.numeric_bit.all;
-- Import necessari per convertire integer (generato dal for-loop) a bit_vector, utilizzabile come ingresso


entity ExhaustiveTest is
end ExhaustiveTest;

architecture sim of ExhaustiveTest is

component Ripple4CLA
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
    CUT : Ripple4CLA port map (A, B, cin, cout, S);
    
    process begin
        cin <= '0';
        -- Utilizziamo il for-loop per effettuare un test esaustivo di tutte le possibili combinazioni degli ingressi
        for i in 0 to 65535 loop
            A <= bit_vector(TO_UNSIGNED(i,16));
            for j in 0 to 65535 loop
                B <= bit_vector(TO_UNSIGNED(j,16));
                wait for 5ns;
            end loop;
        end loop;
        
        cin <= '1';
        for i in 0 to 65535 loop
            A <= bit_vector(TO_UNSIGNED(i,16));
            for j in 0 to 65535 loop
                B <= bit_vector(TO_UNSIGNED(j,16));
                wait for 5ns;
            end loop;
        end loop;
            
            
    end process;
end sim;
