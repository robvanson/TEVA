PRAAT = praat
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
PRAAT = /Applications/Praat.app/Contents/MacOS/Praat
endif

all: TEanalysisexpanded.h TEanalysisManPages.cpp
	bash makePraat.sh 2>&1
	bash makePraat.sh MinGW 2>&1

TEanalysisexpanded.praat: ../*.praat
	perl ./expandPraatScripts.pl ../TEanalysis.praat > TEanalysisexpanded.praat

%.h: %.praat
	perl ./praatscript2cprogram.pl $<  > $@
	
TEanalysisManPages.cpp: ../ManPages/*.man
	perl ManPages2CPP.pl ../ManPages/*.man > manual_TEanalysis.cpp

clean:
	rm -f *expanded.h
	rm -f *expanded.praat
	rm -f *ManPages.cpp
