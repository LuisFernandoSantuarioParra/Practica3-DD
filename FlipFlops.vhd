library ieee;
use ieee.std_logic_1164.all;

ENTITY FlipsPorts is

		PORT(
		T,R,S,D,CLK,CLR,J,K: in std_logic;
		SEL: in std_logic;
		DISPLAY : out std_logic_vector(6 downto 0)
		);

END ENTITY FlipsPorts;

ARCHITECTURE PROGRAMAFFP of FlipsPorts is
SIGNAL QD,QJK,QT,QSR,SALIDA:STD_LOGIC;
BEGIN

		PFFD:PROCESS(CLK,CLR)
		BEGIN
				IF(CLR='1')THEN
				QD<='0';
				ELSIF(CLK'EVENT AND CLK='1')THEN
				QD<=D;
				END IF;
				
		END PROCESS PFFD;
		
		PFFJK:PROCESS(CLK,CLR)
		BEGIN
				IF(CLR='1')THEN
				QJK<='0';
				ELSIF(CLK'EVENT AND CLK='1')THEN
				QJK<=(NOT K AND QJK) OR (J AND NOT QJK);
				END IF;
		END PROCESS PFFJK;
		
		
		PFFRS:PROCESS(CLK,CLR)
		BEGIN
				IF(CLR='1')THEN
				QJK<='0';
				ELSIF(CLK'EVENT AND CLK='1')THEN
				QJK<=(NOT K AND QJK) OR (J AND NOT QJK);
				END IF;
		END PROCESS PFFRS;

		PFFT:PROCESS(CLK,CLR)
		BEGIN
				IF(CLR='1')THEN
				QJK<='0';
				ELSIF(CLK'EVENT AND CLK='1')THEN
				QJK<=(NOT K AND QJK) OR (J AND NOT QJK);
				END IF;
		END PROCESS PFFT;

		
		


END PROGRAMAFFP;