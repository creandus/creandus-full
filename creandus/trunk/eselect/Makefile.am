# Install our scripts in the proper place
eselectmoddir = $(datadir)/eselect/modules/
eselectmod_DATA = \
	users.eselect

EXTRA_DIST = $(eselectmod_DATA:.eselect=.eselect.in)

CLEANFILES = *~ $(eselectmod_DATA)
MAINTAINERCLEANFILES = Makefile.in

# Do the proper substitutions in our scripts
dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@CREANDUS_SCRIPTDIR\@,@CREANDUS_SCRIPTDIR@,g' \
	-e 's,\@CREANDUS_CONFDIR\@,@CREANDUS_CONFDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	@echo DOSED $@
	@$(dosed) $< > $@

# Create a users-update symlink to eselect
install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	cd $(DESTDIR)$(bindir) ; ln -s eselect users-update
