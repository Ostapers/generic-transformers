.PHONY: all plugins

all: plugins src/GT.cma src/GT.cmxa
	$(MAKE) -C src

plugins: camlp5/pa_gt.cmo
	$(MAKE) -C plugins

src/GT.cma: camlp5/pa_gt.cmo
	$(MAKE) -C src

src/GT.cmxa: camlp5/pa_gt.cmo
	$(MAKE) -C src

camlp5/pa_gt.cmo:
	$(MAKE) -C camlp5

install:
	ocamlfind install GT META src/GT.cma src/GT.cmxa src/GT.cmi src/GT.a camlp5/pa_gt.cmo
	for i in pa_gt.cmo pa_gt.cmi; do \
            /usr/bin/install -c -m 644 camlp5/$$i `ocamlfind query camlp5`/$$i; \
        done
	$(MAKE) -C plugins install

uninstall:
	ocamlfind remove GT
	$(RM) `ocamlfind query camlp5`/pa_gt.cm* -v
	$(MAKE) -C plugins uninstall

clean:
	$(MAKE) -C camlp5 clean
	$(MAKE) -C plugins clean
	$(MAKE) -C src clean
