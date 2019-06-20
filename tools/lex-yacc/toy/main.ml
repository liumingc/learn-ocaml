
let run_parser file_name =
  let ins = open_in file_name in
  let lexbuf = Lexing.from_channel ins in
  begin
  try
    while true do
      let _ = Toy_grm.expr Toy.lex_entry lexbuf in
      print_endline "parse one expr"
    done
  with
    Toy.Lex_eof -> ()
  | Parsing.Parse_error ->
      let p = Lexing.lexeme_start_p lexbuf in
      Printf.fprintf
        stderr "%s:%d - %d: syntax error\n"
        (* The pos_fname is not set correctly *)
        p.Lexing.pos_fname p.pos_lnum (p.pos_cnum - p.pos_bol)
  end;
  close_in ins

let _ =
  run_parser Sys.argv.(1)
