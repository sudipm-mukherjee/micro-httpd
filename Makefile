# Makefile for micro_httpd
# Author: Daniel Baumann <daniel.baumann@panthera-systems.net>


# Note: If you are using a SystemV-based operating systems, such as Sun Solaris,
#	you will need to uncomment this definition.
#SYSV_LIBS=-lnsl -lsocket

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/sbin
MANDIR=$(PREFIX)/man/man8

CC=gcc
CFLAGS=-Wall -g -O2
LDFLAGS=-g $(SYSVLIBS)


all:		make

make:		micro_httpd

install:	make
		install -d -m 755 $(DESTDIR)/$(BINDIR)
		install -m 755 micro_httpd $(DESTDIR)/$(BINDIR)
		install -d -m 755 $(DESTDIR)/$(MANDIR)
		install -m 644 micro_httpd.8 $(DESTDIR)/$(MANDIR)

uninstall:
		rm -f $(DESTDIR)/$(BINDIR)/micro_httpd
		rm -f $(DESTDIR)/$(MANDIR)/micro_httpd.8

clean:
		rm -f micro_httpd micro_httpd.o
		rm -f core core.* *.core

distclean:	clean


micro_httpd:	micro_httpd.o
		$(CC) $(CFLAGS) micro_httpd.o $(LDFLAGS) -o micro_httpd

micro_httpd.o:	micro_httpd.c
		$(CC) $(CFLAGS) -c micro_httpd.c
