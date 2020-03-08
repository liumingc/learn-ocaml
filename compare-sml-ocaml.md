# Compare SML & OCaml

## Pros & Cons

### SML Pros

Pros

- Better syntax
- infix, infixr, nofix (may cause confusion?)
- When open a module, will show what's inside.(Any visit module method in
  OCaml?)
  This is not a pro. In OCaml, one can `#show_module` to display the contents
  of a module.

Cons

- Bad ecosystem, lack of lib, editor support
- Dead language, stop evolving.
  Or maybe a pro, things won't break up because of incompatible changes.


### OCaml

## Module system

OCaml share the same `struct ... end`, `sig ... end` keywords with SML. But use
`module` instead of `structure`, `module type` instead of `signature`.

And one can use `with t1 = Arg.t` to specify type constraint when using abstract
type.

Assume there are two files,

foo.ml:
```OCaml
let foo () =
    print_endline "foo";;
```

bar.ml:
```OCaml
let bar () =
    print_endline "bar";;

let () =
    Foo.foo ();
    bar ();;
```

To compile the two files:

```sh
ocamlc -c foo.ml
ocamlc -c bar.ml
ocamlc -o a.out foo.cmo bar.cmo
```

Or just in one line:

```sh
ocamlc foo.ml bar.ml
```

When in toplevel, however, need to use `#mod_use "foo.ml"` instead of
`#use "foo.ml"`, in the latter case, `Foo.foo` is not available, the `foo`
function is in the current module.
