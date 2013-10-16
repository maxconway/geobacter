DUMMY : geobacter.pdf

%.pdf : %.tex
	pdflatex $*.tex
	bibtex *.aux
	pdflatex $*.tex
	pdflatex $*.tex

clean : 
	rm -f geobacter.pdf geobacter.aux geobacter.bbl geobacter.blg geobacter.log geobacter.out geobacter.rtf

%.rtf : %.tex
	latex2rtf $*.tex

wordcount : geobacter.tex
	texcount geobacter.tex
