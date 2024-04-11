%{
#include <stdio.h>
%}

DIGIT               [0-9]
LETTER              [a-zA-Z]
IDENT               {LETTER}({LETTER}|{DIGIT})*
INTEGER             {DIGIT}+
FLOAT               {DIGIT}+(\.{DIGIT}+)?
STRING              \"([^\"\\]|\\.)*\"
OPERATOR            [\+\-\*\/\%\^\&]
ASSIGNMENT          (\=|\+\=|\-\=)
RELATIONAL          (==|!=|<=|>=|<|>)
SPACE               [ \t\n]
COMMENT             ("//"(.*)|"/\*"(.*?)"\*/")          

%%
IDENT               {yylval.str = strdup(yytext); return IDENTIFIER;}
INTEGER             {yylval.num_int = atoi(yytext); return INTEGER;}
FLOAT               {yylval.num_float = atof(yytext); return FLOAT_NUM;}
STRING              {yylval.str = strdup(yytext); return STRING}
"true"              {yylval.boolean = 1; return BOOLEAN;}
"false"             {yylval.boolean = 0; return BOOLEAN;}
"int"               {return INT_TYPE;}
"float"             {return FLOAT_TYPE;}
"char"              {return CHAR_TYPE;}
"string"            {return STRING_TYPE;}
"void"              {return VOID_TYPE;}
"bool"              {return BOOL_TYPE;}
"if"                {return IF;}
"for"               {return FOR;}
"while"             {return WHILE;}
"("                 {return LEFT_PAREN;}
")"                 {return RIGHT_PAREN;}
"{"                 {return LEFT_BRACE;}
"}"                 {return RIGHT_BRACE;}
";"                 {return SEMICOLON;}
","                 {return COMMA;}
"."                 {return DOT;}
"="                 {return ASSIGNMENT;}
"++"                {return INCREMENT;}
"--"                {return DECREMENT;}
OPERATOR            {yylval.str = strdup(yytext); return OPERATOR;}
RELATIONAL          {yylval.str = strdup(yytext); return RELATIONAL;}
SPACE #not_finished
COMMENT #not_finished
. #no match, show error
%%
