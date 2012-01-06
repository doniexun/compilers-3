/**
*** Ashim Ghimire - Prog Lang/Compilers CS4223 Spring 2011
*** Scanner.lex file for the Lex tool.
*** file created by lex: lex.yy.c
*** yylex() scanner function
*** yytext token string
**/

/* Lex Program for Lex

/* DEFINITIONS */
letter [a-zA-Z]
digit [0-9]
identifier {letter}({letter}|{digit})*
integer {digit}+
float {integer}"."({integer})*
space [ \t\n]+
comment1 "--".*$
comment2 "//".*$

/* RULES */
%%
{space}		; /* Ignore white spaces */
{comment1}	; /* Ignore comments */
{comment2}	; /* Ignore comments */
"program" 	return(1); /* Token codes */
"input" 	return(2);
"output" 	return(3);
"end" 		return(4);
"if"		return(5);
"else"		return(6);
"loop"		return(7);
"times"		return(8);
"+"		return(9);
"-"		return(10);
"*"		return(11);
"/"		return(12);
"%"		return(13);
"="		return(14);
"#"		return(15);
"<"		return(16);
"<="		return(17);
">"		return(18);
">="		return(19);
"("		return(20);
")"		return(21);
","		return(22);
";"		return(23);
{identifier} 	return(24);
{integer} 	return(25);
{float}		return(26);
		
.		printf ("ERROR at input char %s \n", yytext);

%%
/* Display an error msg on any other input char. */
/* yytext is the token string. */
