
let run_parser file_name =
  let ins = open_in file_name in
  let lexbuf = Lexing.from_channel ins in
  begin
  try
    let exp_list = Toy_grm.start Toy.lex_entry lexbuf in
    let rec handle_exp_list = function
    | [] -> print_newline ()
    | x::rest ->
      Types.print_expr x;
      print_endline ";";
      handle_exp_list rest
    in
    handle_exp_list exp_list
  with
  | Parsing.Parse_error ->
      let p = Lexing.lexeme_start_p lexbuf in
      Printf.fprintf stderr "%s:%d - %d: syntax error\n"
        p.pos_fname p.pos_lnum (p.pos_cnum - p.pos_bol)
  end;
  close_in ins
;;

let _ =
  run_parser Sys.argv.(1)
