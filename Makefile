PROJ=	libcdb

all:
	make -C src

lib:
	make -C src lib

install:
	make -C src install
	make -C man install

rpm:
	mkdir -p SOURCES && tar czpvf SOURCES/$(PROJ).tar.gz src man Makefile
	rpmbuild -ba -v --define "_topdir ${PWD}" SPECS/$(PROJ).spec
	@ echo && printf "\x1B[32mRPM packages:\033[0m\n" && ls -1 RPMS/*

deb:
	cp -R src ./SOURCES
	dpkg-buildpackage -rfakeroot -us -uc -b
	@ echo && printf "\x1B[32mDEB packages:\033[0m\n" && ls -1 ../*.deb

clean:
	make -C src clean
	rm -rf BUILD BUILDROOT RPMS SOURCES SRPMS

.PHONY: all lib install rpm deb clean
