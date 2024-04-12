%{
#include <stdio.h>
%}

%union {
    char *str;      // String value for IDENTIFIER, CHAR
    int num_int;    // Integer value for INTEGER
    float num_float; // Float value for FLOAT_NUM
    int boolean;    // Boolean value for BOOLEAN
    int datatype;   // Data type value for INT_TYPE, FLOAT_TYPE, CHAR_TYPE, VOID_TYPE, BOOL_TYPE
}

%token <str> IDENTIFIER CHAR
%token <num_int> INTEGER
%token <num_float> FLOAT_NUM
%token <boolean> BOOLEAN
%token <datatype> INT_TYPE FLOAT_TYPE CHAR_TYPE VOID_TYPE BOOL_TYPE
%token IF ELSE_IF ELSE RETURN FOR WHILE
%token LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE SEMICOLON COMMA DOT ASSIGNMENT INCREMENT DECREMENT OPERATOR RELATIONAL ERROR

%%

//make grammar together

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Parser error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}

/*
yyerror(char* s) {
    printf("ERROR: %s\n", s);
    return 0;
}
*/
