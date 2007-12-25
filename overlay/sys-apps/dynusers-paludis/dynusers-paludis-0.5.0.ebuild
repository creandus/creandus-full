# Copyright 2006-2007 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Scripts for dynamic user management by package managers - Paludis hooks"
HOMEPAGE="http://soc.pioto.org/"
SRC_URI="http://www.pioto.org/~pioto/gentoo/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=app-shells/bash-2.05b
	sys-apps/sed"
RDEPEND=">=app-shells/bash-2.05b
	>=sys-apps/paludis-0.4.4
	=sys-apps/dynusers-0.5*"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}
