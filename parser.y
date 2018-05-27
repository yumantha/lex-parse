%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdarg.h>
  int yylex();
  int yyerror();
  int yyerror (char *s);
%}

%token ELSE_KEYWORD
%token IF_KEYWORD
%token INT_KEYWORD
%token RETURN_KEYWORD
%token VOID_KEYWORD
%token WHILE_KEYWORD
%token PLUS
%token MINUS
%token MULT
%token DIV
%token LCHEVRON_EQ
%token LCHEVRON
%token RCHEVRON_EQ
%token RCHEVRON
%token DBL_EQ
%token NEQ
%token EQ
%token SCOLON
%token COMMA
%token LBRACE
%token RBRACE
%token LPAREN
%token RPAREN
%token LBRACK
%token RBRACK
%token ID
%token NUM

%%

program             : declaration_list;
declaration_list    : declaration_list declaration | declaration;
declaration         : var_declaration | fun_declaration;
var_declaration     : type_specifier ID SCOLON | type_specifier ID LBRACK NUM RBRACK;
type_specifier  	  : INT_KEYWORD | VOID_KEYWORD;
fun_declaration     : type_specifier ID LPAREN params RPAREN compound_stmt;
params              : param_list | VOID_KEYWORD;
param_list          : param_list COMMA param | param;
param               : type_specifier ID | type_specifier ID LBRACK RBRACK;
compound_stmt       : LBRACE local_declarations statement_list RBRACE;
local_declarations  : local_declarations var_declaration | %empty;
statement_list      : statement_list statement | %empty;
statement           : expression_stmt | compound_stmt | selection_stmt | iteration_stmt | return_stmt;
expression_stmt     : expression SCOLON | SCOLON;
selection_stmt      : IF_KEYWORD LPAREN expression RPAREN statement | IF_KEYWORD LPAREN expression RPAREN statement ELSE_KEYWORD statement;
iteration_stmt      : WHILE_KEYWORD LPAREN expression RPAREN statement;
return_stmt         : RETURN_KEYWORD SCOLON | RETURN_KEYWORD expression SCOLON;
expression          : var EQ expression | simple_expression;
var                 : ID | ID LBRACK expression RBRACK;
simple_expression   : additive_expression relop additive_expression | additive_expression;
relop               : LCHEVRON | LCHEVRON_EQ | RCHEVRON | RCHEVRON_EQ | DBL_EQ | NEQ;
additive_expression : additive_expression addop term | term;
addop               : PLUS | MINUS;
term                : term mulop factor | factor;
mulop               : MULT | DIV;
factor              : LPAREN expression RPAREN | var | call | NUM;
call                : ID LPAREN args RPAREN;
args                : arg_list | %empty;
arg_list            : arg_list COMMA expression | expression;

%%

int main (void) {
  yyparse();
}

int yyerror (char *s) {
  fprintf (stderr, "%s\n", s);
}
