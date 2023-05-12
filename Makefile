# to force renew:  make -B img

.DELETE_ON_ERROR:
SHELL = /bin/bash

ROOTDIR = .

MASTER=00_tdom.fr.texinfo

SOURCE=*.texinfo

IMG=./images/*

INFO_PATH=/usr/local/share/info/
INFO_PATH_IMAGES=/usr/local/share/info/images

info: $(SOURCE) $(IMG)
	makeinfo --document-language=fr $(MASTER)
	gzip -f *.info*
	cp *.info*.gz -t $(INFO_PATH)
	rm -f *.info*.gz
#	sudo cp $(IMG) $(INFO_PATH_IMAGES)
	sudo cp ./images/* $(INFO_PATH_IMAGES)

all: info

# clean directories
.PHONY : all clean make-tex lienPDF
clean:
	rm -f *.info*
	rm -f *~
	rm -f *.gz
