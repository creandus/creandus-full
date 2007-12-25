# Copyright 2006-2007 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Scripts for dynamic user management by package managers - \
data files"
HOMEPAGE="http://soc.pioto.org/"
SRC_URI="http://www.pioto.org/~pioto/gentoo/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}
