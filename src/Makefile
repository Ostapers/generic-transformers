CAMLP5PP="camlp5o pr_o.cmo ../camlp5/pa_gt.cmo -impl"
OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP)
OCAMLC=ocamlfind c -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)

.SUFFIXES: .cmo .cmx .ml

all: GT.ml.pp GT.cmo GT.cmx GT.cma GT.cmxa

GT.ml.pp: GT.ml
	m4 macro.m4 $< > $@

GT.cmo: GT.ml.pp
	$(OCAMLC) -c -impl $< -o $@

GT.cmx: GT.ml.pp
	$(OCAMLOPT) -c -impl $< -o $@

GT.cma: GT.cmo
	$(OCAMLC)   -linkpkg $< -o $@

GT.cmxa: GT.cmx
	$(OCAMLOPT) -linkpkg $< -o $@

clean:
	$(RM) -f *.cm[ioxa] *.o
