REGRES_CASES=000 001 002 004
OCAMLF_OPTS=-syntax camlp5o -package logger.syntax,typeutil -ppopt -I -ppopt ../camlp5 -ppopt pa_gt.cmo -ppopt -I -ppopt ../plugins -ppopt eq.cmo -ppopt show.cmo -I ../src #-verbose
TESTS_ENVIRONMENT=./test.sh

.PHONY: all test compile_tests do_tests

test: compile_tests do_tests


define TESTRULES
.PHONY: test$(1)
test$(1).cmi: test$(1).mli
	ocamlfind opt $(OCAMLF_OPTS) -c $$<

test$(1).cmx: test$(1).cmi
test$(1).cmx: test$(1).ml
	ocamlfind opt $(OCAMLF_OPTS) -c $$<

compile_tests: test$(1).native
test$(1).native: test$(1).cmx
	ocamlfind opt $(OCAMLF_OPTS)  GT.cmxa  $$< -linkpkg -o $$@

do_tests: test$(1)
test$(1): test$(1).native
	@$(TESTS_ENVIRONMENT) test$(1).native; \
	if [ $$$$? -ne 0 ] ; then echo "$(1) FAILED"; else echo "$(1) PASSED"; fi

endef
$(foreach i,$(REGRES_CASES),$(eval $(call TESTRULES,$(i)) ) )

clean:
	$(RM) -f *.cm[iox] *.native *.diff *.log
