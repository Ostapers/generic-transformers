CAMLP5PP="camlp5o pr_o.cmo ../camlp5/pa_gt.cmo -impl"
OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP)
OCAMLC=ocamlfind c -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)

.SUFFIXES: .cmo .cmx .ml

all: GT.pp GT.cmo GT.cmx GT.cma GT.cmxa

GT.pp: GT.ml
	m4 macro.m4 $< > $@

GT.cmo: GT.pp
	$(OCAMLC) -c -impl $< -o $@

GT.cmx: GT.pp
	$(OCAMLOPT) -c -impl $< -o $@

GT.cma: GT.cmo
	$(OCAMLC)   $< -a -o $@

GT.cmxa: GT.cmx
	$(OCAMLOPT) $< -a -o $@

clean:
	$(RM) -f *.cm[ioxa] *.o
