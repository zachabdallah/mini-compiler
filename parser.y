/*
Parser.y file
To generate the parser run: "bison parser.y"
*/

//flex and bison files have 4 sections

/*
%{
//this is the C-section. 
#include "functions.h"
#include "parser.h" //after running Bison on parser.y, a parser.h
    and parser.c file will be produced
#include "lexer.h" //same thing here
// reference the implementation provided in Lexer.l
int yyerror(SExpression **expression, yyscan_t scanner, const char *msg);
//put error functions here too
%}
*/

/*
declare terminal and non-terminal symbols, along with
        their types, and define unions for semantic values
ex:
%token INTEGER
%%
*/

/*
this is the rules section for defining how grammar is parsed
ex:
program: statements
        ;
statements: statements statement
        | statement
        ;
statement: INTEGER '\n'     { printf("%d\n", $1); }
        ;
%%
*/

/*from here you can put additional C-code or even just put main
But lets follow convention and put main in a separate file
int main() {
    yyparse();
    return 0;
}
having this 4th section in Bison should not be here
we should have all of our C-code in separate files
*/