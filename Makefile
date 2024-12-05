LATEXMK = latexmk
LATEXMK_ARGS = -pdfxe -silent
CV_PREFIX = Anthony_Bara_cv
LANGUAGES = fr en

pdf: cv.tex
	@for LANGUAGE in $(LANGUAGES); do \
		echo "Generate $$LANGUAGE CV ..."; \
		sed -i -e 's/\\usepackage\[.*\]{optional}/\\usepackage['"$$LANGUAGE"']{optional}/g' $<; \
		$(LATEXMK) $(LATEXMK_ARGS) -jobname=$(CV_PREFIX)_$$LANGUAGE $<; \
	done

clean-latex:
	@for LANGUAGE in $(LANGUAGES); do \
		echo "Delete $$LANGUAGE compiled files ..."; \
		$(LATEXMK) -silent -c -jobname=$(CV_PREFIX)_$$LANGUAGE; \
	done

clean: clean-latex
	@for LANGUAGE in $(LANGUAGES); do \
		echo "Delete $$LANGUAGE pdf and compile files ..."; \
		$(LATEXMK) -silent -C -jobname=$(CV_PREFIX)_$$LANGUAGE; \
	done

