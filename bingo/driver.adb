-- Ashim Ghimire - Prog Lang/Compilers CS4223 Spring 2011
-- driver.adb : main program for bingo, shows a random bingo card, 
--      and asks the user to mark cells.



with ada.text_io, ada.integer_text_io, bingo;
use ada.text_io,ada.integer_text_io,bingo;

procedure driver is
	use bingo;
	bcard: cardType;
	col_char: character;
	row: integer;
	counter: integer:=1;
begin
	put_line("Hello, Welcome to Bingo.");
	
	create(bcard);		-- Create a new unmarked bingo card.
	print_card(bcard);	-- Print the generated card.
	put_line(" ");

	-- Marking the card
	put_line("Mark the card cells.");
	
	while counter <= 5 loop
		put("Enter the column character: ");
		get(col_char);
		put("Enter the row number: ");
		get(row);
		mark(bcard, col_char, row);
		counter:=counter + 1;
	end loop;
	print_card(bcard);
end driver;
