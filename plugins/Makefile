CAMLP5PP="camlp5o"
#OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP)
OCAMLC=ocamlfind c -g -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)
TARGETS=show.cmo foldl.cmo foldr.cmo eq.cmo compare.cmo html.cmo map_gt_plugin.cmo
INSTALL_PROGRAM=install
INSTALL_DATA=install -m 644

.SUFFIXES: .cmo .cmx .cmi .ml

all: $(TARGETS)

.ml.cmo:
	$(OCAMLC) -c $<

clean:
	$(RM) -f *.cm[ioxa] *.o

install:
	for i in $(TARGETS) $(subst .cmo,.cmi,$(TARGETS)) ; do \
	  $(INSTALL_DATA) -v $$i `ocamlfind query GT`/$$i; \
        done

uninstall:
	for i in $(TARGETS) $(subst .cmo,.cmi,$(TARGETS)) ; do \
	    $(RM) `ocamlfind query GT`/$$i; \
	done
