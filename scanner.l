%{
#include "parser.tab.h"
%}
%option nounput yylineno

%%
"/*".*"*/"		;
[ \t\n]				;

"else"				return ELSE_KEYWORD;
"if"					return IF_KEYWORD;
"int"					return INT_KEYWORD;
"return"			return RETURN_KEYWORD;
"void"				return VOID_KEYWORD;
"while"				return WHILE_KEYWORD;

"+"					return PLUS;
"-"					return MINUS;
"*"					return MULT;
"/"					return DIV;
"<="				return LCHEVRON_EQ;
"<" 				return LCHEVRON;
">="				return RCHEVRON_EQ;
">" 				return RCHEVRON;
"=="				return DBL_EQ;
"!=" 				return NEQ;
"="					return EQ;
";"					return SCOLON;
","					return COMMA;
"{" 				return LBRACE;
"}" 				return RBRACE;
"(" 				return LPAREN;
")" 				return RPAREN;
"[" 				return LBRACK;
"]" 				return RBRACK;


[a-zA-Z]+			return ID;
[0-9]+				return NUM;
.							return yytext[0];

%%

int yywrap(void)
{
	return 1;
}
