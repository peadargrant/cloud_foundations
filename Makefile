# Cloud Foundations Course Makefile

cloud_foundations_notes.pdf: cloud_foundations_notes.tex $(wildcard */*_notes.tex) $(wildcard */*_lab.tex)
	latexmk -g -pdf $(patsubst %.pdf,%,$@) && git add -f cloud_foundations_notes.pdf 

