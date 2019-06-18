(* if ... then ... *)
let a = 3 in
let b = 4 in
  if a < 5 || b < 5 then
    print_int a;
    print_endline ", ";
    print_int b;
    print_endline ";"
;;

(* for ... do ... done *)
for i = 1 to 5 do
  print_int i;
  print_endline ";"
done;;


(* while ... do ... done *)
let a = ref 0 in
while !a < 5 do
  print_int !a;
  print_endline " ... tick";
  a := !a + 1
done;;

exception UserErr of string;;
try
  print_endline "hello";
  raise (UserErr "world")
with
  | UserErr msg ->
    print_endline ("catch exception " ^ msg)
  | _ ->
    print_endline "other exception"
;;
