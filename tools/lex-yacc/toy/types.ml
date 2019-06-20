type expr =
  If of expr * expr * expr
| Print of expr
| Assign of string * expr
| Read
| Num of int
| Symbol of string
