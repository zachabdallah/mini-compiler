/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    CHAR = 259,                    /* CHAR  */
    STRING = 260,                  /* STRING  */
    INTEGER = 261,                 /* INTEGER  */
    FLOAT = 262,                   /* FLOAT  */
    BOOLEAN = 263,                 /* BOOLEAN  */
    INT_TYPE = 264,                /* INT_TYPE  */
    FLOAT_TYPE = 265,              /* FLOAT_TYPE  */
    CHAR_TYPE = 266,               /* CHAR_TYPE  */
    VOID_TYPE = 267,               /* VOID_TYPE  */
    BOOL_TYPE = 268,               /* BOOL_TYPE  */
    KEYWORD = 269,                 /* KEYWORD  */
    PRINTF = 270,                  /* PRINTF  */
    IF = 271,                      /* IF  */
    ELSE_IF = 272,                 /* ELSE_IF  */
    ELSE = 273,                    /* ELSE  */
    RETURN = 274,                  /* RETURN  */
    BREAK = 275,                   /* BREAK  */
    CONTINUE = 276,                /* CONTINUE  */
    FOR = 277,                     /* FOR  */
    WHILE = 278,                   /* WHILE  */
    INCREMENT = 279,               /* INCREMENT  */
    DECREMENT = 280,               /* DECREMENT  */
    RELATIONAL = 281,              /* RELATIONAL  */
    ERROR = 282,                   /* ERROR  */
    ADDITIVE_OPERATOR = 283,       /* ADDITIVE_OPERATOR  */
    MULTIPLICATIVE_OPERATOR = 284, /* MULTIPLICATIVE_OPERATOR  */
    UNKNOWN_OPERATOR = 285,        /* UNKNOWN_OPERATOR  */
    SIN = 286,                     /* SIN  */
    COS = 287,                     /* COS  */
    TAN = 288,                     /* TAN  */
    ARCSIN = 289,                  /* ARCSIN  */
    ARCCOS = 290,                  /* ARCCOS  */
    ARCTAN = 291                   /* ARCTAN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 6 "parser.y"

    char *strval;      // strvaling value for IDENTIFIER, CHAR
    int num_int;    // Integer value for INTEGER
    float num_float; // Float value for FLOAT
    int boolean;    // Boolean value for BOOLEAN
    int datatype;   // Data type value for INT_TYPE, FLOAT_TYPE, CHAR_TYPE, VOID_TYPE, BOOL_TYPE

#line 108 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
