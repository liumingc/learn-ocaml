
let _ =
    let lexbuf = Lexing.from_channel stdin in
    try
        let str = Parse.implementation lexbuf in
        let fmt = Format.std_formatter in
        begin
            Pprintast.structure fmt str;
            (* print_endline "\n==== raw ===="; *)
            Format.print_string "\n\n=== raw ===\n\n";
            Printast.structure 0 fmt str
        end
    with
    | ex -> print_endline (Printexc.to_string ex)
