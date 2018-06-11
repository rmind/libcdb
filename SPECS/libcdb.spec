%define version	%(cat %{_topdir}/version.txt)

Name:		libcdb
Version:	%{version}
Release:	1%{?dist}
Summary:	The NetBSD's cdb library for manipulating constant databases
Group:		System Environment/Libraries
License:	BSD
URL:		http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libc/cdb/
Source0:	libcdb.tar.gz

BuildRequires:	make
BuildRequires:	libtool
#Requires:	

%description
The NetBSD's cdb library provides a space efficient (key,value) database
based on perfect hashing.  This package provides a shared library.

%prep
%setup -q -c

%build
make %{?_smp_mflags} lib \
    LIBDIR=%{_libdir}

%install
make install \
    DESTDIR=%{buildroot} \
    LIBDIR=%{_libdir} \
    INCDIR=%{_includedir} \
    MANDIR=%{_mandir}

%files
%{_libdir}/*
%{_includedir}/*
%{_mandir}/*

%changelog
