library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Standard package for arithmetic

entity Moving_Colors is
port(
reset : in std_logic ;
clksys : in std_logic;
red_out , green_out , blue_out : out std_logic_vector(3 downto 0));
end entity Moving_Colors;

architecture archi of Moving_Colors is
-- Change signals to unsigned for arithmetic operations
signal r : unsigned(4 downto 0) := "11111"; -- 15 (initial Red)
signal g : unsigned(4 downto 0) := "00000" ; -- 0 (initial Green)
signal b : unsigned(4 downto 0) := "00000" ; -- 0 (initial Blue)
signal clk20 : std_logic;

-- State Machine
type etat is(S0,S1,S2);
signal EP, EF: etat; 


constant MAX_VAL : unsigned(4 downto 0) := "11111";

begin


mondiv: entity work.clk20Hz(archi)
port map (Clk100 => clksys , Clk20 => clk20, reset=> reset);



process(clksys, reset)
begin
    
    if reset='0' then
        EP <= S0;
    elsif rising_edge(clksys) then
        EP <= EF;
    end if;
end process;


-- 2. Next State Logic (Combinational)
process(EP, r, g, b)
begin
    -- Default next state (Stay in current state)
    EF <= EP; 
    
    case (EP) is
        when S0 => -- Red decreases, Green increases
            if g = MAX_VAL then -- Transition when Green reaches max
                EF <= S1;
            end if;
        when S1 => -- Green decreases, Blue increases
            if b = MAX_VAL then -- Transition when Blue reaches max
                EF <= S2;
            end if;
        when S2 => -- Blue decreases, Red increases
            if r = MAX_VAL then -- Transition when Red reaches max
                EF <= S0;
            end if;
    end case;
end process;


-- 3. Color Update Logic (Synchronous on clk20)
process(clk20, reset) -- Only clock and reset in sensitivity list
begin
    -- Check for asynchronous reset
    if reset = '0' then
        r <= MAX_VAL; -- Reset R to Max
        g <= (others => '0'); -- Reset G to 0
        b <= (others => '0'); -- Reset B to 0
    elsif rising_edge(clk20) then
        case (EP) is
            when S0 => 
                g <= g + 1; 
                r <= r - 1; 
                b <= b;     
            when S1 => 
                g <= g - 1; 
                r <= r;     
                b <= b + 1;
            when S2 => 
                g <= g;    
                r <= r + 1; 
                b <= b - 1; 
        end case;
    end if;
end process;


red_out <= std_logic_vector(r(4 downto 1));
green_out <= std_logic_vector(g(4 downto 1));
blue_out <= std_logic_vector(b(4 downto 1));

end architecture;