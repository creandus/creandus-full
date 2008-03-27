AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip

preinsthookdir = $(datadir)/paludis/hooks/ebuild_preinst_pre/
preinsthook_SCRIPTS = creandus_cleanup.bash

commonhookdir = $(datadir)/paludis/hooks/common/
commonhook_SCRIPTS = creandus_failure.bash

presetuphookdir = $(datadir)/paludis/hooks/ebuild_setup_pre/
presetuphook_SCRIPTS = creandus_add.bash

CLEANFILES = *~ done-check \
	$(preinsthook_SCRIPTS) \
	$(commonhook_SCRIPTS) \
	$(presetuphook_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
			INSTALL COPYING

EXTRA_DIST = autogen.bash \
	$(foreach f, $(preinsthook_SCRIPTS) $(commonhook_SCRIPTS) \
		$(presetuphook_SCRIPTS), $(f).in)

# Do the proper substitutions in our scripts
dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@SCRIPTDIR\@,@SCRIPTDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	@echo DOSED $@
	@$(dosed) $< > $@

# Setup the symlinks for the failure hooks.
install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_unpack_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_compile_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_test_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_install_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_strip_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_preinst_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_merge_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_postinst_fail/
	$(mkinstalldirs) $(DESTDIR)$(datadir)/paludis/hooks/ebuild_tidyup_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_unpack_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_compile_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_test_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_install_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_strip_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_preinst_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_merge_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_postinst_fail/
	ln -sf ../common/creandus_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_tidyup_fail/
