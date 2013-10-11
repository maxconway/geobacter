DUMMY : geobacter.pdf

%.pdf : %.tex
	pdflatex $*.tex
#	bibtex $*.aux
	pdflatex $*.tex
	pdflatex $*.tex
