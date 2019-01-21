PRES=defense
AUXFILES=*.aux *.log *.nav *.out *.snm *.toc *.vrb
DATA=$(wildcard data/*)

all: $(PRES).pdf clean

%.pdf: %.tex Makefile $(DATA)
	rubber --pdf -o $@ $<

clean:
	rm -f $(AUXFILES)

wipe: clean
	rm -f $(PRES).pdf

.PHONY: all clean wipe
