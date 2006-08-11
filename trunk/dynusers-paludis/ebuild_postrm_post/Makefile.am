MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~ dynusers_del.bash

postrmhookdir = $(datadir)/paludis/hooks/ebuild_postrm_post/
postrmhook_SCRIPTS = dynusers_del.bash

EXTRA_DIST = dynusers_del.bash.in

# The script "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
