DOCFLAGS=-g -d -t -s

docs = API auth_modules datafiles

txtfiles=$(docs:%=%.txt)
htmlfiles=$(docs:%=%.html)

EXTRA_DIST = $(docs:%=%.txt.in) \
	API_flowchart.dia API_flowchart.png \
	API_flowchart2.dia API_flowchart2.png

noinst_DATA=$(txtfiles)

if HAVE_DOCUTILS

doc : $(htmlfiles)

%.html : %.txt
	@echo rst2html $@
	@rst2html.py $(DOCFLAGS) $< $@

else

doc : 
	@echo "You don't have docutils installed!"
	exit 1

endif

CLEANFILES = *~ $(htmlfiles) $(txtfiles)
MAINTAINERCLEANFILES = Makefile.in

dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@VERSION\@,@VERSION@,g' \
	-e 's,\@CREANDUS_SCRIPTDIR\@,@CREANDUS_SCRIPTDIR@,g' \
	-e 's,\@CREANDUS_CONFDIR\@,@CREANDUS_CONFDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	@echo DOSED $@
	@$(dosed) $< > $@
