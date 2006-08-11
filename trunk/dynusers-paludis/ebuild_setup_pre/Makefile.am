MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~ dynusers_add.bash 

presetuphookdir = $(datadir)/paludis/hooks/ebuild_setup_pre/
presetuphook_SCRIPTS = dynusers_add.bash

EXTRA_DIST = dynusers_add.bash.in

# The script "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
