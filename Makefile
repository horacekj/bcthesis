OUTPUTS=thesis.pdf
BIB=bibliography.bib
PDFLATEX=pdflatex --shell-escape
AUXFILES=*.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
         *.bbl *.idx *.ind *.ilg *.markdown.*

.PHONY: all clean wipe

all: $(OUTPUTS) clean

%.pdf: %.tex $(BIB)
	$(PDFLATEX) $< # The initial typesetting.
	biber $(basename $<).bcf
	$(PDFLATEX) $< # Update the index after the bibliography insertion.
	# texindy -I latex -C utf8 -L english $(basename $<).idx
	$(PDFLATEX) $< # The final typesetting, now also with index.
	$(PDFLATEX) $<

clean:
	rm -f $(AUXFILES)

wipe:
	rm -f $(OUTPUTS)
