all:
	make -C src

rpm:
	mkdir -p SOURCES && tar czpvf SOURCES/libcdb.tar.gz src man
	rpmbuild -ba -v --define "_topdir ${PWD}" SPECS/libcdb.spec

clean:
	make -C src clean
	rm -rf BUILD BUILDROOT RPMS SOURCES SRPMS
