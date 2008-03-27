dnl vim: set sw=4 sts=4 ts=4 noet ft=config foldmethod=marker foldmarker={{{,}}} :

dnl {{{ program, version
AC_INIT([creandus-paludis], [0.5.0], [pioto@pioto.org])
AC_PREREQ([2.59])
AC_CONFIG_SRCDIR([creandus_add.bash.in])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE([1.9])
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

dnl {{{ check for sed
unset SED
AC_PATH_PROGS(SED, sed)
if test x$SED = "x" ; then
	AC_MSG_ERROR([sed is required])
fi
dnl }}}

dnl {{{ substitution macros
SCRIPTDIR="${datadir}/${PACKAGE/-paludis}"
AC_SUBST(SCRIPTDIR)
dnl }}}

dnl {{{ Generate our final Makefiles as well as some scripts
AC_OUTPUT(
	Makefile
	)
dnl }}}
