-- Ashim Ghimire - Prog Lang/Compilers CS4223 Spring 2011
-- bingo.adb : package body implementaion, i.e, elaboration of the procedures


with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io;

package body bingo is
	
	-- Procedure to create a random bingo card, takes an empty
	-- 	card and fills in random numbers in cells.

	procedure create(card: out cardType) is
		i,j:integer:=1;
		package rand_pkg is new ada.numerics.discrete_random(integer);
		use rand_pkg;
		gen:generator;
	
		begin
		while i<= 5 loop
			reset(gen);
			while j<=5 loop
				card(j,i).value:= i*(1+random(gen)mod 15);
				j:=j+1;
			end loop;
		i:=i+1;
		j:=1;
		end loop;
		card(3,3).marked:=True;
		end create;

	-- Procedure to mark the given cell in the bingo card with input of the bingo card, column letter, and row number.
	procedure mark(card: in out cardType; col:in character; num:in integer) is
		column: integer :=0;	-- column number integer variable.
	begin
		-- Finding the column number from the letter given.
		case col is
			when 'b'|'B' => column:=1;
			when 'i'|'I' => column:=2;
			when 'n'|'N' => column:=3;
			when 'g'|'G' => column:=4;
			when 'o'|'O' => column:=5;
			when others => column:=6;
					Put("Invalid column letter");
					-- Any other character is invalid.
		end case;
	
		-- Mark the given row number 'num' and column by setting marked to true.
		-- mark only if the input character is valid.
		if column in 1 .. 5 and num in 1 .. 5 then
			card(num,column).marked:=True;
		end if;

	end mark;

	-- Procedure to Print the given bingo card.
	procedure print_card(card: in cardType) is
		i,j:integer:=1;
	begin
		put_line("          B          I          N          G          O");
		put_line("       ----------------------------------------------------");
		while i <= 5 loop
			while j<=5 loop
				put(card(i, j).value);
				if card(i,j).marked then
					put("*");
				end if;
				j:=j+1;
			end loop;
		put_line(" ");
		i:=i+1;
		j:=1;
		end loop;
	end print_card;
end bingo;
