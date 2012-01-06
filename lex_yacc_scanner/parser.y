/* file: parser.y */
/* A parser for the language BLan */
/* Tokens and their codes from the scanner */

/* tokens, using underscores to make unique */
%token t_program	1
%token t_input		2 
%token t_output		3
%token t_end		4
%token t_if		5
%token t_else		6
%token t_loop		7
%token t_times		8
%token t_plus		9
%token t_minus		10
%token t_star		11
%token t_slash		12
%token t_percent	13
%token t_equal		14
%token not_equal	15
%token less_than	16
%token less_or_equal	17
%token greater_than	18
%token great_or_equal	19
%token lparen		20
%token rparen		21
%token comma		22
%token semicolon	23
%token id		24
%token intconst		25
%token t_float		26

%start START /* Start symbol of the grammar */
%%
START : t_program id STMTLIST t_end semicolon	/* rule 1 */
	;
STMTLIST : STMT MORE				/* rule 2 */
	;
MORE : 				/* epsilon */ 	/* rule 3 */
	| STMTLIST 				/* rule 4 */
	;
STMT : ASSIGN					/* rule 5 */
	| IO					/* rule 6 */
	| IFELSE				/* rule 7 */
	| LOOP					/* rule 8 */
	;
IO : t_input id semicolon			/* rule 7 */
	| t_output id semicolon 		/* rule 8 */
	;
ASSIGN : id t_equal EXP semicolon 		/* rule 9 */
	;
IFELSE: t_if lparen EXP t_equal EXP rparen STMTLIST t_else STMTLIST t_end semicolon		/* rule 10 */
	|t_if lparen EXP not_equal EXP rparen STMTLIST t_else STMTLIST t_end semicolon		/* rule 11 */
	|t_if lparen EXP less_than EXP rparen STMTLIST t_else STMTLIST t_end semicolon		/* rule 12 */
	|t_if lparen EXP greater_than EXP rparen STMTLIST t_else STMTLIST t_end semicolon	/* rule 13 */
	|t_if lparen EXP great_or_equal EXP rparen STMTLIST t_else STMTLIST t_end semicolon	/* rule 14 */
	|t_if lparen EXP less_or_equal EXP rparen STMTLIST t_else STMTLIST t_end semicolon	/* rule 15 */
	;
LOOP: t_loop EXP t_times STMTLIST t_end semicolon		/* rule 16 */
	;
EXP : EXP t_plus TERM			/* rule 17 */
	| EXP t_minus TERM		/* rule 18 */
	| TERM 				/* rule 19 */
	;
TERM : TERM t_star FACTOR 		/* rule 20 */
	| TERM t_slash FACTOR 		/* rule 21 */
	| TERM t_percent FACTOR		/* rule 22 */
	| FACTOR			/* rule 23 */
	;
FACTOR : lparen EXP rparen 		/* rule 24 */
	| id 				/* rule 25 */
	| intconst 			/* rule 26 */
	| t_float			/* rule 27 */
	;
%%

/* Parser */
#include "lex.yy.c" /* scanner from lex */
int main()
{
yyparse(); /* begin parsing */
}
/*************************************/
int yyerror(char *msg)
{
fprintf(stderr, "%s near %s\n", msg, yytext);
}
/*************************************/
int yywrap()
{
printf("Parsing complete, no syntax errors! \n");
}
/*************************************/
