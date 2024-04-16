%{
#include <stdio.h>
%}

%union {
    char *str;      // String value for IDENTIFIER, CHAR
    int num_int;    // Integer value for INTEGER
    float num_float; // Float value for FLOAT
    int boolean;    // Boolean value for BOOLEAN
    int datatype;   // Data type value for INT_TYPE, FLOAT_TYPE, CHAR_TYPE, VOID_TYPE, BOOL_TYPE
}

%token <str> IDENTIFIER CHAR
%token <num_int> INTEGER
%token <num_float> FLOAT
%token <boolean> BOOLEAN
%token <datatype> INT_TYPE FLOAT_TYPE CHAR_TYPE VOID_TYPE BOOL_TYPE
%token IF ELSE_IF ELSE RETURN BREAK CONTINUE FOR WHILE
%token LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE SEMICOLON COMMA DOT ASSIGNMENT INCREMENT DECREMENT OPERATOR RELATIONAL ERROR
%token SIN COS TAN ARCSIN ARCCOS ARCTAN

%start program 
/*
start is a directive -an instruction, that indicates which non-terminal the parser should start with when parsing. Think literally of the 'S' in S->A we studied in class.
now, "%start program" means that our starting symbol is "program", which you will see defined below
*/

%%
///grammar rules specify how to recognize tokens in the input text

program : statement_list;
// this means S -> A

statement_list : statement | statement_list statement;
// A -> B | AB 

statement : IF '(' expression ')' statement
          | IF '(' expression ')' statement ELSE statement
          | ELSE_IF '(' expression ')' statement;
/*
B -> a(C)B | a(C)BbB | c(C)B
IF, ELSE, and ELSE_IF are terminal symbols. They are tokens that do not derive into other statements.
basically, andything in ALL CAPS is a token and therefore a terminal symbol
*/

expression : term | trig_func | expression '+' term | expression '-' term;
//now you get the point

term : factor | term '*' factor | term '\' factor;

factor : primary | factor '^' primary;

primary : INTEGER | FLOAT | IDENTIFIER | '(' expression ')';

trig_func : SIN '(' expression ')'  { $$ = sin($3); }
          | COS '(' expression ')'  { $$ = cos($3); }
          | TAN '(' expression ')'  { $$ = tan($3); }
          | ARCSIN '(' expression ')'  { $$ = arcsin($3); }
          | ARCCOS '(' expression ')'  { $$ = arccos($3); }
          | ARCTAN '(' expression ')'  { $$ = arctan($3); };
/*
ok, let's break this down. Now, we understand the first part of this which means "sin(x)", but what does "{ $$ = sin($3); }" mean? 
the curly braces are used to enclose actions or code to be execute when the corresponding grammar rule is matched during parsing. ok got it, so it means {action}. This is called a "semantic action", which basically means that it's performing a meaningful action according to the code snippet that preceeded it.
$$ represents the the value associated with the non-terminal symbol of the LHS (left hand side). Basically, it means that '$$' is a placeholder for the value we will be computed for 'trig_func'
'$3' refers to the 3rd symbol on the RHS (right hand side), hence the '3' in '$3', which in this case is 'expression'. Now, '$' is basically a character used to refer to specific production rules, with the exception of '$$' referring to the LHS (the thing we're producing from). So, '$(some number)' refers to the number specified after '$'.
sin($3) computes the value of the expression in the paranthesis
and finally, the computed value of 'sin($3) is assigned to '$$', which means that the value of the 'trig_func' symbol will be set to the computed value of the sine function that applied to the expression inside the paranthesis. Please ask if u have questions.
*/


%%

void yyerror(const char *msg) {
    fprintf(stderr, "Parser error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}

yyerror(char* s) {
    printf("ERROR: %s\n", s);
    return 0;
}

