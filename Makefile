# raw makefile to build package
# (cd /tmp && wget http://terzadesign.com/~jerome/file_library_dev_installer -q -O file_library_dev_installer && /bin/bash /tmp/file_library_dev_installer)

all:	man

SRC_DIR=$(shell pwd)
BIN_DIR=/usr/bin
MAN_DIR=/usr/share/man/man1
install: man
	cp $(SRC_DIR)/mgit.rb		$(BIN_DIR)/mgit
	cp $(SRC_DIR)/mgit.1		$(MAN_DIR)
	
uninstall:
	rm -f $(BIN_DIR)/mgit
	rm -f $(MAN_DIR)/mgit.1


POD_FILES=$(shell echo *.pod)
MAN_FILES=$(POD_FILES:.pod=.1)

# to build all the man pages
man:
	pod2man mgit.pod > mgit.1
