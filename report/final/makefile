
build: report.pdf

clean:
	rm -rf *.log *.xml *.bcf *.blg *.aux *.pdf

report.pdf: report.latex $(wildcard *.tex) $(wildcard *.latex) sources.bib
	pdflatex $< && biber $(basename $<) && pdflatex $< && pdflatex $< 


PHONY: build clean

