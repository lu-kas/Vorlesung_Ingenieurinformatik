FILES = zahlendarstellung_integer32.png \
	zahlendarstellung_integer08.png \
	zahlendarstellung_integer08_5.png \
	zahlendarstellung_integer08_107.png \
	algorithmus.png

all: $(FILES)

%.png: %.tex
	pdflatex -shell-escape $<
	rm $(basename $<).aux $(basename $<).log

clean:
	rm $(FILES)
