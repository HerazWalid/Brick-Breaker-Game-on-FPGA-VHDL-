Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ClkDiv is
port(reset: in std_logic;
Clk100: in std_logic;
Clk25: out std_logic
);
end entity ClkDiv;
architecture archi of ClkDiv is
signal state : std_logic_vector(1 downto 0) := (others => '0');
signal clk_sortie : std_logic := '0';
begin
process(Clk100)
begin
if reset = '0' then state <= (others => '0');
elsif rising_edge(Clk100) then
if state = "01" then state <= (others => '0');
clk_sortie <= not clk_sortie;
else state <= state + 1;
end if;
end if;
end process;
Clk25 <= clk_sortie;
end architecture archi;