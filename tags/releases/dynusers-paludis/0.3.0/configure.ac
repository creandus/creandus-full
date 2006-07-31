dnl vim: set sw=4 sts=4 ts=4 noet ft=config foldmethod=marker foldmarker={{{,}}} :

dnl {{{ program, version
AC_PREREQ(2.59)
AC_INIT([ebuild_setup_pre/dynusers_add.bash.in])
AC_CONFIG_AUX_DIR(config)

VERSION_MAJOR=0
VERSION_MINOR=3
VERSION_MICRO=0
VERSION_FULL="$VERSION_MAJOR.$VERSION_MINOR.$VERSION_MICRO"
VERSION="$VERSION_FULL"

AC_SUBST([VERSION_MAJOR])
AC_SUBST([VERSION_MINOR])
AC_SUBST([VERSION_MICRO])
AC_SUBST([VERSION_FULL])

AM_INIT_AUTOMAKE(dynusers-paludis, [$VERSION_FULL])
dnl }}}

dnl {{{ basic toolchain checks
AC_PROG_INSTALL
AC_PROG_MAKE_SET
dnl }}}

dnl {{{ bash checks, stolen from eselect
unset BASH
AC_PATH_PROGS(BASH, bash)
if test x$BASH = "x" ; then
    AC_MSG_ERROR([bash is required])
fi
dnl }}}

dnl {{{ Generate our final Makefiles as well as some scripts
AC_OUTPUT(
	Makefile
	ebuild_setup_pre/Makefile
	ebuild_setup_pre/dynusers_add.bash
	ebuild_postrm_post/Makefile
	ebuild_postrm_post/dynusers_del.bash
	ebuild_fail/Makefile
	ebuild_fail/dynusers_failure.bash
	)
dnl }}}
