%{
#include <stdio.h>
int yywrap(void);
#include "lex.yy.c"
#define YY_DECL int yylex(void)
#include "y.tab.h"
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
%}
%token INTEGER
%%
program: statements
        ;
statements: statements statement
        | statement
        ;
statement: INTEGER '\n'     { printf("%d\n", $1); }
        ;
%%

int main() {
    yyparse();
    return 0;
}