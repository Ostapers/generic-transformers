
all: src/GT.cma src/GT.cmxa
	$(MAKE) -C src

clean:
	$(MAKE) -C camlp5 clean
	$(MAKE) -C plugins clean
	$(MAKE) -C src clean

src/GT.cma: camlp5/pa_gt.cmo
	$(MAKE) -C src

camlp5/pa_gt.cmo:
	$(MAKE) -C camlp5
