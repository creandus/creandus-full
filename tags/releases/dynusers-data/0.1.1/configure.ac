dnl vim: set sw=4 sts=4 ts=4 noet ft=config foldmethod=marker foldmarker={{{,}}} :

dnl {{{ program, version
AC_INIT([dynusers-data], [0.1.1], [pioto@pioto.org])
AC_PREREQ([2.59])
AC_CONFIG_SRCDIR([accounts])
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

dnl {{{ Generate our final Makefiles as well as some scripts
AC_OUTPUT(
	Makefile
	group/Makefile
	user/Makefile
	)
dnl }}}
