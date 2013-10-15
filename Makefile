DUMMY : geobacter.pdf

%.pdf : %.tex
	pdflatex $*.tex
	bibtex *.aux
	pdflatex $*.tex
	pdflatex $*.tex

clean : 
	rm -f geobacter.pdf geobacter.aux geobacter.bbl geobacter.blg geobacter.log geobacter.out
