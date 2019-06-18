# Compare SML & OCaml

## Pros & Cons

### SML Pros

Pros

- Better syntax
- infix, infixr, nofix (may cause confusion?)
- When open a module, will show what's inside.(Any visit module method in
  OCaml?)

Cons

- Bad ecosystem, lack of lib, editor support
- Dead language, stop evolving.


### OCaml

## Module system

OCaml share the same `struct ... end`, `sig ... end` keywords with SML. But use
`module` instead of `structure`, `module type` instead of `signature`.

And one can use `with t1 = Arg.t` to specify type constraint when using abstract
type.
