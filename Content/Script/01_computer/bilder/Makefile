all: zahlendarstellung_integer32.png zahlendarstellung_integer08.png

zahlendarstellung_integer32.png: zahlendarstellung_integer32.tex
	pdflatex -shell-escape zahlendarstellung_integer32.tex
	rm zahlendarstellung_integer32.aux zahlendarstellung_integer32.log

zahlendarstellung_integer08.png: zahlendarstellung_integer08.tex
	pdflatex -shell-escape zahlendarstellung_integer08.tex
	rm zahlendarstellung_integer08.aux zahlendarstellung_integer08.log


clean:
	rm zahlendarstellung_integer32.png zahlendarstellung_integer08.png
