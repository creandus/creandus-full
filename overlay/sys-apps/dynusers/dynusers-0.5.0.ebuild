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

DEPEND=">=app-shells/bash-2.05b
	sys-apps/sed
	doc? ( dev-python/docutils )"
RDEPEND=">=app-shells/bash-2.05b
	sys-apps/sed
	app-admin/eselect"

src_compile() {
	econf \
		$(use_enable doc docutils) \
		|| die "econf failed"
	emake || die "emake failed"
	use doc && emake doc
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO doc/*.txt doc/*.png
	use doc && dohtml doc/*.html
}
