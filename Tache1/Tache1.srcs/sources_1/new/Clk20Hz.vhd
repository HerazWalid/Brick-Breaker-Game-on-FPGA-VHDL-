library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk20Hz is
port(
reset : in std_logic;
Clk100 : in std_logic;
Clk20 : out std_logic
);
end entity clk20Hz;

architecture archi of clk20Hz is

constant MAX_COUNT : integer := 2499999;

signal counter : integer range 0 to MAX_COUNT := 0;
signal clk_temp : std_logic := '0';

begin

process(Clk100, reset)
begin

if reset = '0' then
counter <= 0;
clk_temp <= '0';

elsif rising_edge(Clk100) then
if counter = MAX_COUNT then
counter <= 0;
clk_temp <= not clk_temp;
else
counter <= counter + 1;
end if;
end if;
end process;

Clk20 <= clk_temp;

end architecture archi;