MANS3=		cdbr.3 cdbw.3 mi_vector_hash.3
MANS5=		cdb.5

IMANDIR3=	$(DESTDIR)/$(MANDIR)/man3/
IMANDIR5=	$(DESTDIR)/$(MANDIR)/man5/

install:
	mkdir -p $(IMANDIR3) && install -c $(MANS3) $(IMANDIR3)
	mkdir -p $(IMANDIR5) && install -c $(MANS5) $(IMANDIR5)

.PHONY: install
