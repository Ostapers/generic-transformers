CAMLP5PP="camlp5o"
#OCAMLOPT=ocamlfind opt  -package typeutil,camlp5 -pp $(CAMLP5PP)
OCAMLC=ocamlfind c -g -package typeutil,camlp5 -I ../camlp5 -pp $(CAMLP5PP)
TARGETS=show.cmo map.cmo foldl.cmo foldr.cmo eq.cmo compare.cmo html.cmo

.SUFFIXES: .cmo .cmx .ml

all: $(TARGETS)

.ml.cmo:
	$(OCAMLC) -c $<

clean:
	$(RM) -f *.cm[ioxa] *.o

install:
	for i in $(TARGETS) ; do \
            /usr/bin/install -c -m 644 $$i `ocamlfind query camlp5`/$$i; \
        done

uninstall:
	for i in $(TARGETS) ; do \
            $(RM) `ocamlfind query camlp5`/$$i; \
        done
