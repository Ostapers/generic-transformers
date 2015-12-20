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
	ocamlfind install GT META src/GT.cma src/GT.cmxa src/GT.cmi src/GT.a camlp5/pa_gt.cmo camlp5/pa_gt.cmi
	$(MAKE) -C plugins install

uninstall:
	$(RM) `ocamlfind query GT`/pa_gt.cm* -v
	$(MAKE) -C plugins uninstall
	ocamlfind remove GT

clean:
	$(MAKE) -C camlp5 clean
	$(MAKE) -C plugins clean
	$(MAKE) -C src clean

