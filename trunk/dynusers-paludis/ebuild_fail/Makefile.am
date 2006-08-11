MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~ dynusers_failure.bash

failurehookdir = $(datadir)/paludis/hooks/common/
failurehook_SCRIPTS = dynusers_failure.bash

EXTRA_DIST = dynusers_failure.bash.in

# The script "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@

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
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_unpack_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_compile_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_test_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_install_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_strip_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_preinst_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_merge_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_postinst_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_tidyup_fail/
