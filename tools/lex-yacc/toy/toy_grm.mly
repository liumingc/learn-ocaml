%{
open Types
%}

%token IF THEN ELSE
%token PLUS EQ
%token READ PRINT
%token SEMICOMMA
%token <int> NUM
%token <string> IDENT
%type <Types.expr> expr
%start expr

%%

expr :
   IF expr THEN expr ELSE expr
   {
     If ($2, $4, $6)
   }
  | PRINT expr
    { Print $2 }
  | READ { Read }
  | NUM { Num $1 }
  | IDENT { Symbol $1 }
  | IDENT EQ expr { Assign ($1, $3) }
;

%%

