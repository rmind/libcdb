LIBS=		libcdb.la

CFLAGS=		-std=gnu99 -O2 -W -Wextra -Werror -I.
CFLAGS+=	-DNDEBUG -D__RCSID\(x\)=

libcdb_OBJS=	cdbr.lo cdbw.lo mi_vector_hash.lo

all: libcdb.la

%.lo: %.c
	libtool --mode=compile --tag CC $(CC) $(CFLAGS) $(CPPFLAGS) -c $<

libcdb.la: $(libcdb_OBJS)
	libtool --mode=link --tag CC $(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

clean:
	rm -f *.{l,}o *.la
