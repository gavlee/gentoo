# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils

DESCRIPTION="Extended Module Player library"
HOMEPAGE="http://xmp.sourceforge.net/"
SRC_URI="mirror://sourceforge/xmp/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="!<media-sound/xmp-4.0.2"
RDEPEND="${DEPEND}"

src_install() {
	autotools-utils_src_install

	doman docs/libxmp.3
	rm -f docs/{COPYING*,Makefile,libxmp.3}
	dodoc -r docs/*
}
