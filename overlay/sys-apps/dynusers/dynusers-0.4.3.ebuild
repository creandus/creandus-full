# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Scripts for dynamic user management by package managers"
HOMEPAGE="http://soc.pioto.org/"
SRC_URI="http://www.pioto.org/~pioto/gentoo/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="app-shells/bash
	sys-apps/sed
	doc? ( dev-python/docutils )"
RDEPEND="app-shells/bash
	sys-apps/sed
	app-admin/eselect
	sys-apps/dynusers-data"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
	use doc && emake -C doc
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO doc/*.txt
	use doc && dohtml doc/*.html
}
