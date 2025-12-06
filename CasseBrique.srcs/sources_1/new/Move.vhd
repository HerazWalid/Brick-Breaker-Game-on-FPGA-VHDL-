library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity move is
    Port ( Clk25 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Qa : in STD_LOGIC;
           Qb : in STD_LOGIC;
           Rot_Left : out STD_LOGIC;
           Rot_Right : out STD_LOGIC);
end move;

architecture Behavioral of move is
type etat is (S0,S1,S2,S3,S4,S5);
signal EP ,EF :etat;
begin
process(Clk25,Reset)
begin
if Reset ='0' then EP<= S0 ;
elsif rising_edge(Clk25) then EP <= EF ;
end if ;
end process ;
process(EP , Qa ,Qb)
begin
case(EP)is
  when S0 => if Qa='1' and Qb='0' then EF <= S1 ; elsif Qb='1' and Qa='1' then EF<=S2 ;else EF <= S0; end if ;
  when S1 =>  EF <= S3 ;
  when S2 =>  EF <= S3 ;
  when S3 => if Qa='0' and Qb='0' then EF <= S5 ; elsif Qb='1' and Qa='0' then EF <= S4 ;else EF <= S3; end if;
  when S4 =>  EF <= S0 ;
  when S5 =>  EF <= S0 ;
  when others => EF <= S0;
end case ;
end process ;
process(EP)
begin
        case (EP) is
            when S0 => Rot_Left <= '0'; Rot_Right <= '0';
            when S1 => Rot_Left <= '1'; Rot_Right <= '0';
            when S2 => Rot_Left <= '0'; Rot_Right <= '1';
            when S3 => Rot_Left <= '0'; Rot_Right <= '0';
            when S4 => Rot_Left <= '1'; Rot_Right <= '0';
            when S5 => Rot_Left <= '0'; Rot_Right <= '1';
        end case;

end process;
end Behavioral;
