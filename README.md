# libcdb #

The NetBSD's cdb library provides a space efficient (key,value) database
based on perfect hashing.  This package provides a shared library.

## Examples ##

The following are the C code fragments to demonstrate the use of libcdb.

To create a cdb:

```c
#include <cdbw.h>
...

const char *key = "some-key";
const char *val = "some-key:some-val";
struct cdbw *cdb;

if ((cdb = cdbw_open()) == NULL)
	err(EXIT_FAILURE, "cdbw_open");

if (cdbw_put(cdb, key, strlen(key), val, strlen(val)) == -1)
	err(EXIT_FAILURE, "cdbw_put");

if (cdbw_output(cdb, fd, "my-cdb", NULL) == -1)
	err(EXIT_FAILURE, "cdbw_output");

cdbw_close(cdb);
```

To read a cdb:

```c
#include <cdbr.h>
...

const char key[] = "some-key";
const size_t keylen = sizeof(key) - 1;
struct cdbr *cdb;
const void *data;
size_t len;

if ((cdb = cdbr_open(path, CDBR_DEFAULT)) == NULL)
	err(EXIT_FAILURE, "cdbr_open");

/*
 * Perform a lookup.  Note that it must be validated that the value
 * corresponds to our key, e.g. pref_match() illustrates the prefix check
 * for the example above, where key is a part of the value as a predix.
 */
if (cdbr_find(cdb, key, keylen, &data, &len) == 0 && pref_match(data, key)) {
	/* Found .. */
} else {
	/* Not found .. */
}

cdbr_close(cdb);
```
