## $Id: Makefile,v 1.3 2003/03/20 04:05:18 yozo Exp $

FILES= rotlogs clean cmp-and-remove do-cvs \
       make-fakedist make-kernel make-userland make-xf4 \
       base64 checksites marks picks pu smime vaio xtermtitle \
       getpgpkey

INSTALLDIR=${HOME}/bin
INSTALL=/usr/bin/install
DISTDIR=/tmp

default:
	@echo "files: $(FILES)"

diff:
	@for i in $(FILES) ; do \
	  (diff -u $(INSTALLDIR)/$$i ./$$i | jless ) \
	done

install:
	@for i in $(FILES) ; do \
	  echo "installing $$i into $(INSTALLDIR)..." ; \
	  $(INSTALL) -b -m 550 $$i $(INSTALLDIR) ; \
	done

dist:
	echo "creating a distribution tarball..."
	tar czvf $(DISTDIR)/utils.tar.gz $(FILES) Makefile
