
build: report.pdf

clean:
	rm -rf *.log *.xml *.bcf *.blg *.aux *.pdf

report.pdf: report.latex $(wildcard *.txt) $(wildcard *.tex) $(wildcard *.latex) sources.bib $(wildcard *.s) $(wildcard *.py)
	pdflatex $< && biber $(basename $<) && pdflatex $< && pdflatex $< 


PHONY: build clean

