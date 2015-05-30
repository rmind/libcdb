all:
	make -C src

install:
	make -C src install
	make -C man install

rpm:
	mkdir -p SOURCES && tar czpvf SOURCES/libcdb.tar.gz src man Makefile
	rpmbuild -ba -v --define "_topdir ${PWD}" SPECS/libcdb.spec

clean:
	make -C src clean
	rm -rf BUILD BUILDROOT RPMS SOURCES SRPMS

.PHONY: all install rpm clean
