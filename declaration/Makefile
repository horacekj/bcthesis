# Change content of this variable to match filename
TARGET = declaration

all: $(TARGET).pdf clean

$(TARGET).pdf: $(TARGET).tex
	xelatex $^

clean:
	rm -rf $(TARGET).aux $(TARGET).log $(TARGET).out

pdfclean: clean
	rm -rf $(TARGET).pdf

.PHONY: all clean pdfclean
