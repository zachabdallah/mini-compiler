%{
#include <stdio.h>
// #include <parser.tab.h>

char *yylval;
%}

DIGIT               [0-9]
LETTER              [a-zA-Z]
IDENT               {LETTER}({LETTER}|{DIGIT})*
INT                 {DIGIT}+
NUM_FLOAT           {DIGIT}+(\.{DIGIT}+)?
STRING              \"([^\"\\]|\\.)*\"
OPERATOR            [\+\-\*\/\%\^\&]
RELATIONAL          (==|!=|<=|>=|<|>)
SPACE               [ \t\n]
COMMENT             ("//"(.*)|"/\*"(.*?)"\*/")

%%
IDENT               {yylval.strval = strdup(yytext); return IDENTIFIER;}
INT                 {yylval.num_int = atoi(yytext); return INTEGER;}
NUM_FLOAT           {yylval.num_float = atof(yytext); return FLOAT;}
CHAR                {yylval.str = strdup(yytext); return CHAR}
"true"              {yylval.boolean = 1; return BOOLEAN;}
"false"             {yylval.boolean = 0; return BOOLEAN;}
"int"               {return INT_TYPE;}
"float"             {return FLOAT_TYPE;}
"char"              {return CHAR_TYPE;}
"void"              {return VOID_TYPE;}
"bool"              {return BOOL_TYPE;}
"if"                {return IF;}
"else if"           {return ELSE_IF;}
"else"              {return ELSE;}
"return"            {return RETURN;}
"break"             {return BREAK;}
"continue"          {return CONTINUE}
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
[ \t\n]             ; //ignore
"sin"               {return SIN;}
"cos"               {return COS;}
"tan"               {return TAN;}
"arcsin"            {return ARCSIN;}
"arccos"            {return ARCCOS;}
"arctan"            {return ARCTAN;}
"printf"            {return PRINTF;}
OPERATOR            {yylval.str = strdup(yytext); return OPERATOR;}
RELATIONAL          {yylval.str = strdup(yytext); return RELATIONAL;}
SPACE               {}
COMMENT             {}
.                   {return ERROR;}
%%

/*
lets look at the first line for IDENT
{} means perform an action
for the following paragraphs, know that IDENT is not a token, it is a regex. Now, when IDENT is matched to your input text, it triggers the associated action: "{yylval.str = strdup(yytext); return IDENTIFIER;}". Let's break that down

yylval or "yy lexical value" is is a predefined "union data type" variable in Lex that holds the value associated with a token. It is not a lexeme, though. yytext is the lexeme. the difference between yytext and yylval is that yytext straight up just contains the text matched by some regex, and it is a lexeme, whereas yylval holds additional information associated with it like values, types, or attributes.

yylval can hold any data type by specifying .str or .int or whatever. 

the first half of the action associated with IDENT is: 'yylval.str = strdup(yytext);', which assigns the lexeme yytext to yylval. yytext reads in your user-inputed text when it is matched with a regex.

then, strdup(yytext) or "string dupe" duplicates the matched text, which is yytext, allocates memory for it, and then puts it into yylval.str so that we have additional information about the lexeme, like about how it is a string.

Now then, because we know that IDENT is a regex and not a token, we return an actual token called IDENTIFIER to the parser to be processed, along with it's information according to yylval like that it is of type <str>, from which it can then be parsed according to the CFG rules.

now we can go define it in our parsing file as "%token <str> IDENTIFIER", from which it will be derived. If it is successfully derived, it will then produce IR or binary code, then it can be executed.

now if you go look at the parser file, you will see that in our CFG, any word that is in all caps, like IDENTIFIER, is a terminal symbol since it is a token, and it's value, the lexeme, according to what yylval put into it, will be the one of the leaves in our parse tree.
*/

yywrap() { }
