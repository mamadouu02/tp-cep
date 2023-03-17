%{
#include <stdio.h>
#include "contexte.tab.h"
extern int yylex(YYSTYPE *lvalp, YYLTYPE *llocp);
extern void yyerror(YYLTYPE *locp, const char *s);
%}

%union {
    char* s;
    int   i;
}

%token    FONCTION
%token    CONTEXTE
%token    SP
%token    SIGNE
%token    TYPE
%token    SEPARATEUR
%token    PILE
%token    REGISTRE
%token    REGISTRES
%token    SECTION
%token    SEGMENT
%token    MEMOIRE
%token<s> NOMSIMPLE
%token<s> NOMCOMPOSE
%token<i> INT
%token    NEWLINE
%token    IDREG

%locations
%define api.pure full

%%
contexte :
    FONCTION ':' newline
    NOMSIMPLE ':' TYPE newline
    CONTEXTE ':' newline
    liste_contexte
    ;

newline : // on autorise plusieurs retours à la ligne pour les commentaires
    NEWLINE
	| newline NEWLINE
	;

liste_contexte : ; // on autorise les contextes vides pour les interruptions
    | liste_contexte element_contexte
    ;

variable :
    "ra"
	| NOMSIMPLE
    | NOMCOMPOSE
    ;

element_contexte :
    variable ':' localisations newline
    ;

localisations :
    localisation
    | localisations ';' localisation
    ;

localisation :
      REGISTRE IDREG
    | REGISTRES IDREG SEPARATEUR IDREG // mot 64 bits en registres
    | PILE '*' '(' adresse ')'
    | PILE '*' '(' adresse ')' SEPARATEUR '*' '(' adresse ')' // mot 64 bits sur la pile
    | MEMOIRE
    | MEMOIRE ',' SECTION SEGMENT
    ;

adresse :
    SP
    | SP SIGNE INT
    ;
