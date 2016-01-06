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

REGRES_CASES=000 001 002 003 004 005
define TESTRULES
.PHONY: test_$(1) test$(1).native
test$(1).native: regression/test$(1).native
regression/test$(1).native:
	$(OB) -Is src $$@

compile_tests: regression/test$(1).native

run_tests: test_$(1)
test_$(1): #regression/test$(1).native
	@cd regression  && $(TESTS_ENVIRONMENT) ../test$(1).native; \
	if [ $$$$? -ne 0 ] ; then echo "$(1) FAILED"; else echo "$(1) PASSED"; fi
endef
$(foreach i,$(REGRES_CASES),$(eval $(call TESTRULES,$(i)) ) )

tests: compile_tests run_tests
regression: tests
test: tests

