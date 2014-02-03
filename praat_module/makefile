PRAAT = praat
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
PRAAT = /Applications/Praat.app/Contents/MacOS/Praat
endif

all: TEVAexpanded.h TEVAManPages.cpp
	bash makePraat.sh 2>&1
	bash makePraat.sh MinGW 2>&1

TEVAexpanded.praat: ../*.praat
	perl ./expandPraatScripts.pl ../TEVA.praat > TEVAexpanded.praat

%.h: %.praat
	perl ./praatscript2cprogram.pl $<  > $@
	
TEVAManPages.cpp: ../ManPages/*.man
	perl ManPages2CPP.pl ../ManPages/*.man > manual_TEVA.cpp

clean:
	rm -f *expanded.h
	rm -f *expanded.praat
	rm -f *ManPages.cpp
