## $Id: Makefile,v 1.4 2004/12/05 16:29:33 yozo Exp $

FILES= rotlogs clean cmp-and-remove do-cvs \
       make-fakedist make-kernel make-userland make-xf4 \
       checksites marks picks pu smime vaio xtermtitle \
       getpgpkey viewurl

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
