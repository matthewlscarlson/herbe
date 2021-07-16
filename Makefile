CFLAGS = -Wall -Wextra -pedantic -lX11 -lXft -I/usr/include/freetype2 -pthread -lrt

PREFIX ?= /usr/local
CC ?= cc

all: herbe

herbe: herbe.c config.h
	$(CC) herbe.c $(CFLAGS) -o herbe

install: herbe
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f herbe ${DESTDIR}${PREFIX}/bin
	rm -f herbe

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/herbe

.PHONY: all install uninstall
