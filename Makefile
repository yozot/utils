## $Id: Makefile,v 1.1 2002/12/05 17:34:57 yozo Exp $

FILES= rotlogs clean cmp-and-remove do-cvs \
       make-fakedist make-kernel make-userland make-xf4 \
       base64 checksites marks picks pu smime vaio xtermtitle

INSTALLDIR=${HOME}/bin
INSTALL=/usr/bin/install

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
