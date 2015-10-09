CAMLP5PP="camlp5o pr_o.cmo"
#OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP) -verbose
OCAMLC=ocamlfind c -package typeutil,camlp5 -pp $(CAMLP5PP) #-verbose

all: plugin.cmo core.cmo extension.cmo pa_gt.cmo

pa_gt.cmo: plugin.cmo core.cmo extension.cmo
	$(OCAMLC) -o $@ -pack $^

plugin.cmo: plugin.ml
	$(OCAMLC) -c $<

#extension.cmo: extension.ml core.cmo
#	ocamlfind c -package typeutil,camlp5 -pp $(CAMLP5PP) -c $<

#core.cmo: core.ml
#	ocamlfind c -package typeutil,camlp5 -pp $(CAMLP5PP) -c $<

extension.cmo: extension.ml core.cmo
	$(OCAMLC) -c $<

core.cmo: core.ml
	$(OCAMLC) -c $<


clean:
	$(RM) -f *.cm[ioxa] *.o
