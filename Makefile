# to force renew:  make -B img

.DELETE_ON_ERROR:
SHELL = /bin/bash

ROOT_FILE=00_tdom.fr.texinfo
MASTER=tdom.fr
SOURCE=*.texinfo
COL=37  # column to start description

IMG=./images/*

INFO_PATH=/usr/local/share/info/
INFO_PATH_IMAGES=/usr/local/share/info/images

info: $(SOURCE) $(IMG)
	texi2any --info --output=$(MASTER).info --document-language=fr $(ROOT_FILE)

install: info
	gzip -f *.info*
	cp *.info.gz -t $(INFO_PATH)
	rm -f *.info.gz
	cp ./images/* $(INFO_PATH_IMAGES)
	install-info --keep-old --calign=$(COL) $(INFO_PATH)/$(MASTER).info.gz $(INFO_PATH)/dir

all: info

# clean directories
.PHONY : clean all info install
clean:
	rm -f *.info*
	rm -f *~
	rm -f *.gz
