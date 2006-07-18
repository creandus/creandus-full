CLEANFILES = *~ done-check
MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
			INSTALL COPYING
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
SUBDIRS = . user group

topdatadir = $(localstatedir)/dynusers/data/
topdata_DATA = accounts

EXTRA_DIST = autogen.bash $(topdata_DATA)
