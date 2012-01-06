// Ashim Ghimire - Project 1 - CS4223 Programming Lang/Compilers spring 2011

// A lexical analyzer(scanner) for the experimental language LanEx.
// FSA-based lexical analyzer to extract tokens from program.
// It takes a program code and gives all tokens and their identification codes.

#include <iostream>
#include <cctype> // for isalpha(), isdigit()
#include <iomanip> // for setw(), left

using namespace std;

// Functions

void Scan(string &token, int &code);
// Scanner function. Input from stdin and gives next token with its code.

int Index(char ch);
// Finding the column of the character in the transition table.

void doAction(char ch, int state, string& token, int &code);
// Perform action when a state is reached.

int main()
{
	string token;
	int code;
	do
	{
		Scan(token, code);
		if (code == 0) break;
		cout << setw(15) << left << token <<"\t"<< code << endl;
	} while(true);
}

//**********************************************************************
void Scan(string &token, int &code)
{
const int ROWS = 7; // size of the transition table
const int COLS = 16;
int transitionTable[ROWS][COLS] = {
{ 0,  0,  7,  8,  9, 10, 11, 12,  1, 14, 15, 16, 20,  3,  4, 20},
{13, 13, 13, 13, 13, 13, 13, 13,  2, 13, 13, 13, 13, 13, 13, 13},
{ 2,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2},
{17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17,  3,  3, 17},
{19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19,  5, 19, 19, 19},
{20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,  6, 20},
{18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,  6, 18}
};

int state = 0;
char ch;
int col; // column index of a character in transition table
code = 0;
token = "";

while(state <= 6) // keep going until you reach a final state(7-20)
{
	cin.get(ch);
	if(cin.eof())
	break;
	col = Index(ch);
	state = transitionTable[state][col];
	doAction(ch, state, token, code);
}

}
// finding which column of the transition table the char belongs to.
int Index(char ch)
{
	if(ch == ' ' || ch == '\t') return 0;
	if(ch == '\n') return 1;
	if(ch == ';') return 2;
	if(ch == ',') return 3;
	if(ch == '=') return 4;
	if(ch == '+') return 5;
	if(ch == '-') return 6;
	if(ch == '*') return 7;
	if(ch == '/') return 8;
	if(ch == '%') return 9;
	if(ch == '(') return 10;
	if(ch == ')') return 11;
	if(ch == '.') return 12;
	if(isalpha(ch))return 13;
	if(isdigit(ch))return 14;
	return 15;	// any other character
}


// Perform action according to the state.
void doAction(char ch, int state, string& token, int &code)
{
switch(state)
{
	case 0 : // no action in states 0-2
	case 1 :
	case 2 : break;
	case 3 : token = token + ch; // add character ch to token
		break;
	case 4 : token = token + ch;
		break;
	case 5 : token = token + '.';
		break;
	case 6 : token = token + ch;
		break;
	case 7 : token = ";";
		code = 18;
		break;
	case 8 : token = ",";
		code = 17;
		break;
	case 9 : token = "=";
		code = 14;
		break;
	case 10 : token = "+";
		code = 9;
		break;
	case 11 : token = "-";
		code = 10;
		break;
	case 12 : token = "*";
		code = 11;
		break;
	case 13: token = "/";
		cin.putback(ch); // undo the last cin.get(ch)
		code = 12;
		break;
	case 14: token = "%";
		code = 13;
		break;
	case 15: token = "(";
		code = 15;
		break;
	case 16: token = ")";
		code = 16;
		break;
	case 17: cin.putback(ch);
		code = 19;
		if(token == "program")code = 1;
		if(token == "input") code = 2;
		if(token == "output") code = 3;
		if(token == "end") code = 4;
		if(token == "if") code = 5;
		if(token == "else") code = 6;
		if(token == "loop") code = 7;
		if(token == "times") code = 8;
		break;
	case 18: cin.putback(ch);
		code = 21;
		break;
	case 19: cin.putback(ch);
		code = 20;
		break;

	case 20: token = token + ch + " ERROR";
		code = -1;
	}
}
