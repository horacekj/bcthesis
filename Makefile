THESIS=thesis
BIB=bibliography.bib
PDFLATEX=pdflatex --shell-escape
AUXFILES=*.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
         *.bbl *.idx *.ind *.ilg *.markdown.*
PARTS=uvod.tex prehled.tex pozadavky.tex merici-vuz.tex sw.tex appendix.tex zaver.tex
GRAPHS=$(patsubst data/graph/%.csv, graph/%.tex, $(wildcard data/graph/*.csv))
DATA=$(wildcard data*)

.PHONY: all clean wipe

all: $(THESIS).pdf clean

$(THESIS).pdf: $(THESIS).tex $(BIB) $(PARTS) $(GRAPHS) $(DATA)
	$(PDFLATEX) $< # The initial typesetting.
	biber $(basename $<).bcf
	$(PDFLATEX) $< # Update the index after the bibliography insertion.
	# texindy -I latex -C utf8 -L english $(basename $<).idx
	$(PDFLATEX) $< # The final typesetting, now also with index.
	$(PDFLATEX) $<

graph/%.tex: data/graph/%.csv data/graph/%.gnu
	mkdir -p graph
	gnuplot -e "input_file='$(filter %.csv, $^)'" -e "output_file='$@'" $(filter %.gnu, $^)

clean:
	rm -f $(AUXFILES)

wipe: clean
	rm -f $(THESIS).pdf
