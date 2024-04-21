%option noyywrap

%{
#include <stdio.h>
#include "parser.tab.h"
%}


KEYWORD				("int"|"float"|"char"|"void"|"bool"|"if"|"else"|"else if"|"return"|"break"|"continue"|"for"|"while"|"sin"|"cos"|"tan"|"arcsin"|"arccos"|"arctan"|"printf")
IDENT               [a-zA-Z_][a-zA-Z0-9_]*
INT                 [0-9]+
NUM_FLOAT           [0-9]+(\.[0-9]+)?
STRING              \"([^\"\\]|\\.)*\"
OPERATOR            [\+\-\*\/\%\^\&]
RELATIONAL          (==|!=|<=|>=|<|>)
SPACE               [ \t\n\r\f]
COMMENT             \/\/.*|\/\*[^*]*\*+\/* 

%%
{KEYWORD}			{
					if (strcmp(yytext, "int") == 0) {
						return INT_TYPE;
						}
					if (strcmp(yytext, "float") == 0) {
						return FLOAT_TYPE;
						}
					if (strcmp(yytext, "char") == 0) {
						return CHAR_TYPE;
						}					
					if (strcmp(yytext, "void") == 0) {
						return VOID_TYPE;
						}	
					if (strcmp(yytext, "bool") == 0) {
						return BOOL_TYPE;
						}				
					if (strcmp(yytext, "if") == 0) {
						return IF;
						}
					if (strcmp(yytext, "else") == 0) {
						return ELSE;
						}				
					if (strcmp(yytext, "else if") == 0) {
						return ELSE_IF;
						}				
					if (strcmp(yytext, "return") == 0) {
						return RETURN;
						}			
					if (strcmp(yytext, "break") == 0) {
						return BREAK;
						}
					if (strcmp(yytext, "continue") == 0) {
						return CONTINUE;
						}			
					if (strcmp(yytext, "for") == 0) {
						return FOR;
						}			
					if (strcmp(yytext, "while") == 0) {
						return WHILE;
						}				
					if (strcmp(yytext, "sin") == 0) {
						return SIN;
						}
					if (strcmp(yytext, "cos") == 0) {
						return COS;
						}				
					if (strcmp(yytext, "tan")  == 0) {
						return TAN;
						}		
					if (strcmp(yytext, "arcsin") == 0) {
						return ARCSIN;
						}	
					if (strcmp(yytext, "arccos") == 0) {
						return ARCCOS;
						}		
					if (strcmp(yytext, "arctan") == 0) {
						return ARCTAN;
						}					
					if (strcmp(yytext, "printf") == 0) {
						return PRINTF;
						}
					}	
					
{IDENT}				{ printf("IDENTIFIER: %s\n", yytext); yylval.strval = strdup(yytext); return IDENTIFIER; }
{INT}           	{ printf("INTEGER: %s\n", yytext); yylval.num_int = atoi(yytext); return INTEGER;}
{NUM_FLOAT}         { yylval.num_float = atof(yytext); return FLOAT;}
{STRING}			{ yylval.strval = strdup(yytext); return STRING; }

"("					{ return '('; }
")"					{ return ')'; }
";"					{ return ';'; }
","             	{ return ','; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"."                 { return '.'; }
"="                 { return '='; }
"++"                { return INCREMENT; }
"--"                { return DECREMENT; }
{OPERATOR}      	{ yylval.strval = strdup(yytext); 
						if (strcmp(yylval.strval, "+") == 0 || strcmp(yylval.strval, "-") == 0) {
							return ADDITIVE_OPERATOR;
						}
						else if (strcmp(yylval.strval, "*") == 0|| strcmp(yylval.strval, "/") == 0 || strcmp(yylval.strval, "&") == 0) {
							return MULTIPLICATIVE_OPERATOR;
						}
						else {
							return UNKNOWN_OPERATOR;
						}
					}
{RELATIONAL}        { yylval.strval = strdup(yytext); return RELATIONAL; }
{SPACE}             {}
{COMMENT}           {}
.                   { return ERROR; }
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
