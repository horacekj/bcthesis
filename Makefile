# Change content of this variable to match filename
TARGET = overview

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex bibliography.bib
	pdflatex $^

clean:
	rm -rf $(TARGET).aux $(TARGET).log $(TARGET).out

pdfclean: clean
	rm -rf $(TARGET).pdf

%.bbl : bibliography.bib %.bcf
	-biber $(@:.bbl=)
