
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.yy.h"
#include "yystype.h"

void yyerror(const char *s);
char *concat(char *s, char *t);

%}
%token REEL
%token LETTRE
%token FRAC
%token SQRT
%token SUM
%token PROD
%token PM
%token MP
%token CAP
%token CUP
%token SUB
%token SUP
%token SUBT
%token SUPT

%left '{' '}'
%left '=' PM MP CAP CUP SUB SUP SUBT SUPT
%left '(' ')'
%left SUM PROD
%left SQRT
%left '-' '+'
%left '*' FRAC
%left '^' '_'
%right MOINSU
%%
line : linesub '\n' {
	printf("<math xmlns=\'http://www.w3.org/1998/Math/MathML\' display='block'>");
	printf("<mrow>\n %s \n</mrow>", $$);
}
linesub : expr
				| expr linesub {$$ = concat($1, $2);}
				;
expr 	: expr '+' expr {
				$$ = concat("<mrow>",$1);
				$$ = concat($$,"<mo>+</mo>");
				$$ = concat($$,$3);
				$$ = concat($$, "</mrow>");
			}
			| expr '-' expr {
				$$ = concat("<mrow>",$1);
				$$ = concat($$,"<mo>-</mo>");
				$$ = concat($$,$3);
				$$ = concat($$, "</mrow>");
			}
			| expr '*' expr {
				$$ = concat("<mrow>",$1);
				$$ = concat($$,"<mo>*</mo>");
				$$ = concat($$,$3);
				$$ = concat($$, "</mrow>");
			}
			| FRAC expr expr {
				$$ = concat("<mfrac><mrow>", $2);
	      $$ = concat($$,"</mrow><mrow>");
	      $$ = concat($$,$3);
	      $$ = concat($$,"</mrow></mfrac>");
			}
			| SQRT acolad {
				$$ = concat("<msqrt><mrow>", $2);
				$$ = concat($$, "</mrow></msqrt>");
			}
			| expr '^' expr {
				$$ = concat("<msup><mrow>", $1);
				$$ = concat($$, "</mrow><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow></msup>");
			}
			| expr '_' expr {
				$$ = concat("<msub><mrow>", $1);
				$$ = concat($$, "</mrow><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow></msub>");
			}
			| expr '=' expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>=</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr PM expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&plusmn;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr MP expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&#x2213;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr CAP expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&cap;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr CUP expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&cup;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr SUB expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&sub;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr SUP expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&sup;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr SUBT expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&sube;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| expr SUPT expr {
				$$ = concat("<mrow>", $1);
				$$ = concat($$, "</mrow><mo>&supe;</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow>");
			}
			| SUM '_' acolad '^' acolad expr {
				$$ = concat("<mrow><munderover><mo>", "&sum;");
				$$ = concat($$, "</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow><mrow>");
				$$ = concat($$, $5);
				$$ = concat($$, "</mrow></munderover>");
				$$ = concat($$, $6);
				$$ = concat($$, "</mrow>");
			}
			| PROD '_' acolad '^' acolad expr {
				$$ = concat("<mrow><munderover><mo>", "&prod;");
				$$ = concat($$, "</mo><mrow>");
				$$ = concat($$, $3);
				$$ = concat($$, "</mrow><mrow>");
				$$ = concat($$, $5);
				$$ = concat($$, "</mrow></munderover>");
				$$ = concat($$, $6);
				$$ = concat($$, "</mrow>");
			}
			| acolad
			;
acolad  : '{' expr '}' { $$ = $2; }
				| subexpr
				;
subexpr : terme
				| '(' expr ')' {
					$$ = concat("(", $2);
					$$ = concat($$, ")");
				}
				;
terme : LETTRE {
				$$ = concat(concat("<mi>",$1),"</mi>");
			}
      | REEL  {
      	$$ = concat(concat("<mn>",$1),"</mn>");
      }
			;
%%
char *concat(char *s, char *t) {
	char *r = malloc(strlen(s) + strlen(t) + 1);
	strncpy(r, s, strlen(s));
	strncpy(r + strlen(s), t, strlen(t));
	r[strlen(s) + strlen(t)] = '\0';
	return r;
}

void yyerror(const char *s) {
 fprintf(stdout,"%s\n", s);
}
int main(void) {
 yyparse();
 return EXIT_SUCCESS;
}
