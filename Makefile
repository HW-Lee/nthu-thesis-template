# Thanks to Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan] for building this script.

MAIN=thesis
LATEX=xelatex
BIBTEX=bibtex
RM=rm -f

.SUFFIXES: .tex

ifdef PASSWORD
all: $(MAIN).pdf $(MAIN)-with-pass.pdf
else
all: $(MAIN).pdf
endif

ifdef WATERMARK
TEXFLAG="\def\withwatermark{1}\input{$(MAIN)}"
else
TEXFLAG=
endif

$(MAIN).pdf: *.tex nthuthesis.cls
	$(LATEX) $(TEXFLAG) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(TEXFLAG) $(MAIN)
	$(LATEX) $(TEXFLAG) $(MAIN)

ifdef PASSWORD
$(MAIN)-with-pass.pdf: $(MAIN).pdf
	pdftk $^ output $@ owner_pw "$(PASSWORD)" allow printing allow ScreenReaders
endif

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg

clean-pdf: 
	$(RM) -f $(MAIN).pdf $(MAIN)-with-pass.pdf

clean-all: clean clean-pdf
