CAMLP5PP="camlp5o pr_o.cmo ../camlp5/pa_gt.cmo -impl"
OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP)
OCAMLC=ocamlfind c -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)

CMI_TARGETS=View.cmi HTML.cmi
CMO_TARGETS=View.cmo HTML.cmo GT.cmo
CMX_TARGETS=$(CMO_TARGETS:.cmo=.cmx)

.SUFFIXES: .cmo .cmx .cmi .ml .mli

all: GT.pp $(CMI_TARGETS) $(CMO_TARGETS) $(CMX_TARGETS) GT.cma GT.cmxa

GT.pp: GT.ml
	m4 macro.m4 $< > $@

GT.cmo: GT.pp
	$(OCAMLC) -c -impl $< -o $@

GT.cmx: GT.pp
	$(OCAMLOPT) -c -impl $< -o $@

GT.cma: $(CMO_TARGETS)
	$(OCAMLC)   $< -a -o $@

GT.cmxa: $(CMX_TARGETS)
	$(OCAMLOPT) $< -a -o $@

.ml.cmo:
	$(OCAMLC) -c $< -o $@

.ml.cmx:
	$(OCAMLOPT) -c $< -o $@

.mli.cmi:
	ocamlfind c -c $< -o $@

clean:
	$(RM) -f *.cm[ioxa] *.o
