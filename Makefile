THESIS=thesis
BIB=bibliography.bib
PDFLATEX=pdflatex --shell-escape
AUXFILES=*.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
         *.bbl *.idx *.ind *.ilg *.markdown.*
PARTS=uvod.tex prehled.tex

.PHONY: all clean wipe

all: $(THESIS).pdf clean

$(THESIS).pdf: $(THESIS).tex $(BIB) $(PARTS)
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
