PRAAT = praat
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
PRAAT = /Applications/Praat.app/Contents/MacOS/Praat
endif

NKI_TEVA.htm: %.html html_print_order.txt
	./ConcatHTMLpages.pl > NKI_TEVA.htm

%.html: ../ManPages/*.man
	${PRAAT} ManPages2HTML.praat >/dev/null 2>/dev/null
	./ConvertHTMLpages.sh

