.PHONY.:	all clean realclean
LATEXMK   = latexmk
LATEXMKFLAGS = -f -pdf -g 
LATEXMKCLEAN = -C -pdf

export TEXINPUTS:=./includes:${TEXINPUTS}
export BSTINPUTS:=./includes:${BSTINPUTS}

SOURCES      = example.tex
EXECS        = $(SOURCES:.tex=.pdf)
BASE         = $(SOURCES:.tex=)

TEXSRC       = $(filter-out $(SOURCES), $(shell ls *.tex))

BIBSRC       = $(shell ls ./*.bib)
BBL          = $(notdir $(BIBSRC:.bib=.bbl))

DEPS         = $(DEP) $(TEXSRC) $(BIBSRC)

all: $(EXECS) 

$(EXECS): %.pdf : %.tex $(DEPS) 
	$(LATEXMK) $(LATEXMKFLAGS) $<
	$(LATEXMK) $(LATEXMKFLAGS) $<

$(BBL): $(BIBSRC)
	bibtex $(BASE)

clean:
	$(LATEXMK) $(LATEXMKCLEAN)
	@rm -f *~
	@rm -f *.fls
	@rm -f *.bbl
	@rm -f *.run.xml
	@rm -f *.apdx

