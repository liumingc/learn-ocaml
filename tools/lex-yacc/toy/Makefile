toy: types.ml toy.mll toy_grm.mly main.ml
	ocamllex toy.mll
	ocamlyacc toy_grm.mly
	ocamlc -c types.ml
	ocamlc -c toy_grm.mli
	ocamlc -c toy_grm.ml
	ocamlc -c toy.ml
	ocamlc -c main.ml
	ocamlc -o toy types.cmo toy.cmo toy_grm.cmo main.cmo

clean:
	rm toy *.cmo *.cmi toy_grm.ml toy_grm.mli toy.ml
