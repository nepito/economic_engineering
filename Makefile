.PHONY: \
		check \
		clean \
		coverage \
		linter \
		mutants \
		results \
		setup \
		tests

define lint
	R -e "library(lintr)" \
	  -e "lint_dir('R', linters = with_defaults(line_length_linter(120)))" \
	  -e "lint_dir('tests', linters = with_defaults(line_length_linter(120)))" \
	  -e "lint_dir('src', linters = with_defaults(line_length_linter(120)))"
endef

check:
	R -e "library(styler)" \
	  -e "resumen <- style_dir('R')" \
	  -e "resumen <- rbind(resumen, style_dir('tests'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE

clean:
	cd reports && ls | egrep --invert-match "*.tex|*.md|*.bib" | xargs --delimiter="\n" rm --force --recursive
	rm --force --recursive EconEngy.Rcheck
	rm --force --recursive reports/figures
	rm --force --recursive tests/testthat/_snaps
	rm --force EconEngy_*.tar.gz
	rm --force --recursive reports/pythontex-files-predicting_targets_and_costs
	rm --force NAMESPACE
	rm --force Rplots.pdf

coverage: setup
	Rscript tests/testthat/coverage.R

format:
	R -e "library(styler)" \
	  -e "style_dir('R')" \
	  -e "style_dir('src')" \
	  -e "style_dir('tests')"

linter:
	$(lint)
	if $(lint) | grep -e "\^" ; then exit 1 ; else exit 0 ; fi

mutants: tests
	@echo "🙁🏹 No mutation testing on R 👾🎉👾"

results: src/FeralCatEradication.R
	mkdir reports/figures/ --parents
	Rscript src/FeralCatEradication.R

setup:
	R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check EconEngy_0.3.0.tar.gz && \
	R CMD INSTALL FEconEngy_0.3.0.tar.gz
	
tests:
	R -e "devtools::test()"
