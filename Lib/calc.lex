%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "yystype.h"
#include "calc.tab.h"
%}
REEL [0-9]?(\.?[0-9]*)?
LETTRE [a-zA-Z]+
FRAC \\frac|\\FRAC
SQRT \\sqrt|\\SQRT
SUM \\sum|\\SUM
PROD \\prod|\\PROD
PM \\pm|\\PM
MP \\mp|\\MP
CAP \\cap|\\CAP
CUP \\cup|\\CUP
SUB \\subset|\\SUBSET
SUP \\supset|\\SUPSET
SUBT \\subseteq|\\SUBSETEQ
SUPT \\supseteq|\\SUPSETEQ

%%
{REEL} {
  char *tmp = malloc(strlen(yytext));
  strcpy(tmp, yytext);
  yylval = tmp;
  return REEL;
}
{FRAC} return FRAC;
{SQRT} return SQRT;
{SUM} return SUM;
{PROD} return PROD;
{PM} return PM;
{MP} return MP;
{CAP} return CAP;
{CUP} return CUP;
{SUB} return SUB;
{SUP} return SUP;
{SUBT} return SUBT;
{SUPT} return SUPT;
\+ return '+';
\- return '-';
\* return '*';
\( return '(';
\) return ')';
\} return '}';
\{ return '{';
\^ return '^';
= return '=';
_ return '_';
\n return '\n';
{LETTRE} {
  char *tmp = malloc(strlen(yytext));
  strcpy(tmp, yytext);
  yylval = tmp;
  return LETTRE;
}
. {}
%%
