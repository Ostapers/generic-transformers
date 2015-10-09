CAMLP5PP="camlp5o pr_o.cmo"
#OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP) -verbose
OCAMLC=ocamlfind c -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)

.SUFFIXES: .cmo .ml

all: show.cmo map.cmo foldl.cmo foldr.cmo eq.cmo compare.cmo html.cmo

#pa_gt.cmo: plugin.cmo core.cmo extension.cmo
#	$(OCAMLC) -o $@ -pack $<

#plugin.cmo: plugin.ml
#	$(OCAMLC) -c $<

#extension.cmo: extension.ml core.cmo
#	ocamlfind c -package typeutil,camlp5 -pp $(CAMLP5PP) -c $<

#core.cmo: core.ml
#	ocamlfind c -package typeutil,camlp5 -pp $(CAMLP5PP) -c $<

#extension.cmo: extension.ml core.cmo
#	$(OCAMLC) -c $<

#core.cmo: core.ml
#	$(OCAMLC) -c $<

.ml.cmo:
	$(OCAMLC) -c $< -o $@

clean:
	$(RM) -f *.cm[ioxa] *.o
