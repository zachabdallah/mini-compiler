%{
#include "y.tab.h"
%}
%%
[0-9]+          { yylval = atoi(yytext); return INTEGER; }
[ \t\n]         ;
.               return *yytext;
%%
int yywrap() {
    return 1;
}