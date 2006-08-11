AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip

postrmhookdir = $(datadir)/paludis/hooks/ebuild_postrm_post/
postrmhook_SCRIPTS = dynusers_cleanup.bash

commonhookdir = $(datadir)/paludis/hooks/common/
commonhook_SCRIPTS = dynusers_failure.bash

presetuphookdir = $(datadir)/paludis/hooks/ebuild_setup_pre/
presetuphook_SCRIPTS = dynusers_add.bash

CLEANFILES = *~ done-check \
	$(postrmhook_SCRIPTS) \
	$(commonhook_SCRIPTS) \
	$(presetuphook_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
			INSTALL COPYING

EXTRA_DIST = autogen.bash tools \
	$(foreach f, $(postrmhook_SCRIPTS) \
	$(commonhook_SCRIPTS) $(presetuphook_SCRIPTS), $(f).in)

# The script "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@

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
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_unpack_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_compile_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_test_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_install_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_strip_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_preinst_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_merge_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_postinst_fail/
	ln -sf ../common/dynusers_failure.bash $(DESTDIR)$(datadir)/paludis/hooks/ebuild_tidyup_fail/
