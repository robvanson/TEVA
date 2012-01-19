PRAAT = praat
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
PRAAT = /Applications/Praat.app/Contents/MacOS/Praat
endif

all: *.praat CreateTables.praat
	$(MAKE) -C HTML 2>&1
	$(MAKE) -C praat_module 2>&1

CreateTables.praat: Data/*.Table
	$(PRAAT) tables2scripts.praat

clean:
	rm -f CreateTables.praat
	$(MAKE) -C praat_module clean 2>&1
