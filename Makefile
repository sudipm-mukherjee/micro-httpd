BINDIR =	/usr/local/sbin
MANDIR =	/usr/local/man/man8
CC =		gcc
CFLAGS =	-O
#CFLAGS =	-g
#SYSVLIBS =	-lnsl -lsocket
LDFLAGS =	-s ${SYSVLIBS}
#LDFLAGS =	-g ${SYSVLIBS}

all:		micro_httpd

micro_httpd:	micro_httpd.o
	${CC} ${CFLAGS} micro_httpd.o ${LDFLAGS} -o micro_httpd

micro_httpd.o:	micro_httpd.c
	${CC} ${CFLAGS} -c micro_httpd.c

install:	all
	rm -f ${BINDIR}/micro_httpd
	cp micro_httpd ${BINDIR}
	rm -f ${MANDIR}/micro_httpd.8
	cp micro_httpd.8 ${MANDIR}

clean:
	rm -f micro_httpd *.o core core.* *.core
