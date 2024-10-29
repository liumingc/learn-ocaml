open Printf;;

(* binding precedence from high to low:
if
;
try match let fun function
*)
(* if ... then ... *)
let a = 3 in
let b = 4 in
  if a < 5 || b < 5 then
    begin
    print_int a;
    print_endline ", ";
    end;
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

if true then
  print_endline "if-then"
else
  print_endline "else-stmt";
print_endline "after IF-ELSE";;

if false then
  print_endline "THEN stmt";
print_endline "and after then";;

if true then
  if false then
    print_endline "true false"
  else
    print_endline "true true"
;;

try
let e0 = 5 in
let e03 = 4 in
match e0 with
| 1 -> print_endline "e0 = 1"
| 2 -> print_endline "e0 = 2"
| 3 -> match e03 with
  | 4 -> print_endline "e03 = 4"
  | 5 -> print_endline "e03 = 5"
with _ -> ignore ()
;; (* Match_failure *)

let e0 = 5 in
try
  match e0 with
  | 4 -> print_endline "match 4";
    print_endline "match continue"
with
  Match_failure (s, i1, i2) -> Printf.printf "BSC WARN: %s, %d-%d\n" s i1 i2
;;

let e0 = 5 in
match e0 with
| 5 -> print_endline "foo";
  print_endline "bar"
| _ -> print_endline "match otherwise"
;;


