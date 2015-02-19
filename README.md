# libcdb #

The NetBSD's cdb library provides a space efficient (key,value) database
based on perfect hashing.  This package provides a shared library.

## Examples ##

To create a cdb:

```c
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
const char *key = "some-key";
struct cdbr *cdb;
const void *data;
size_t len;

if ((cdb = cdbr_open(path, CDBR_DEFAULT)) == NULL)
	err(EXIT_FAILURE, "cdbr_open");

if (cdbr_find(cdb, key, strlen(key), &data, &len) == 0 &&
    prefix_match(data, key)) {
	/*
	 * Note: prefix_match() validates that the value corresponds
	 * to our key (done using a prefix in the example above).
	 */
}

cdbr_close(cdb);
```
