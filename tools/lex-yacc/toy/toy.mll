{
open Toy_grm
exception Lex_eof
}

rule lex_entry = parse
    [' ' '\t' '\r' '\n'] { lex_entry lexbuf }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "print" { PRINT }
  | "read" { READ }
  | "=" { EQ }
  | "+" { PLUS }
  | ';' { COLON }
  | ['0'-'9']+ as lxm { NUM (int_of_string lxm )}
  | ['a'-'z' 'A'-'Z' '_']+ as lxm { IDENT lxm }
  | eof { EOF }

  (*| eof { raise Lex_eof }*)
