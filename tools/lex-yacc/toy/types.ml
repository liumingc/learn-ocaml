type expr =
  | If of expr * expr * expr
  | Print of expr
  | Assign of string * expr
  | Read
  | Num of int
  | Symbol of string
  | Seq of expr * expr

type prog = expr list
;;

let rec print_expr e =
  match e with
  | If (e1, e2, e3) ->
    print_string "IF ";
    print_expr e1;
    print_string " THEN ";
    print_expr e2;
    print_string " ELSE ";
    print_expr e3
  | Print e ->
    print_string "PRINT ";
    print_expr e
  | Assign (ident, e) ->
    print_string ident;
    print_string " := ";
    print_expr e
  | Num n ->
    print_int n
  | Symbol s ->
    print_string s
  | _ ->
    (*print_endline "Not supported expr!"*)
    print_endline " ... "
