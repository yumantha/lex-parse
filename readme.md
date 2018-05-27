# Lexical Analyzer and Parser

Language Detected: C-

Lexical Conventions of C-

1. The keywords of the language are the following.  
else, if, int, return, void, while  
All keywords are reserved and must be written in lowercase.  

2. Special symbols are as following.  
\+ \- \* / < <= > >= == != = ; , { } ( ) [ ] /* */

3. Other tokens are ID and NUM, defined by the following regular expressions.  
ID = letter letter*  
NUM = digit digit*  
letter = a|..|z|A|..|Z  
digit = 0|..|9  
Lowercase and uppercase letters are distinct.  

4. White space consists of blanks, newlines and tabs. White space is ignored except
that it must separate IDs and NUMs and keywords.

5. Comments are surrounded by the usual C notations /* */. Comments can be placed
anywhere white space can appear and comments cannot be placed within tokens.
Comments may include more than one line, but comments may not be nested.
  
  
Syntax and Semantics of C-

1. program -> declaration-list  
2. declaration-list -> declaration-list declaration | declaration  
3. declaration -> var-declaration | fun-declaration  
4. var-declaration -> type-specifier ID ; | type-specifier ID [ NUM ] ;  
5. type-specifier -> int | void  
6. fun-declaration -> type-specifier ID ( params ) compound-stmt  
7. params -> param-list | VOID  
8. param-list -> param-list , param| param  
9. param -> type-specifier ID | type-specifier ID [ ]  
10. compound-stmt -> { local-declarations statement-list }  
11. local-declarations -> local-declarations var-declaration | empty  
12. statement-list -> statement-list statement | empty  
13. statement -> expression-stmt | compound-stmt | selection-stmt | iteration-stmt | return-stmt  
14. expression-stmt -> expression ; | ;  
15. selection-stmt -> if( expression ) statement | if( expression ) statement else statement  
16. iteration-stmt -> while ( expression ) statement  
17. return-stmt -> return ; | return expression ;  
18. expression -> var = expression | simple-expression  
19. var-> ID | ID [ expression ]  
20. simple-expression -> additive-expression relop additive-expression | additive-expression  
21. relop -> < | <= | > | >= | == | !=  
22. additive-expression -> additive-expression addop term | term   
23. addop -> + | -  
24. term -> term mulop factor | factor  
25. mulop -> * | /  
26. factor -> ( expression ) | var | call | NUM  
27. call -> ID ( args )  
28. args -> arg-list | empty  
29. arg-list -> arg-list , expression | expression  