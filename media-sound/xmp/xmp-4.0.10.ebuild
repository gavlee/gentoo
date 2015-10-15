# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils

DESCRIPTION="Extended Module Player"
HOMEPAGE="http://xmp.sourceforge.net/"
SRC_URI="mirror://sourceforge/xmp/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa oss pulseaudio"

RDEPEND=">=media-libs/libxmp-4.3
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	oss? ( virtual/os-headers )"

DOCS=( README CREDITS )

src_configure() {
	myeconfargs=(
		$(use_enable oss)
		$(use_enable alsa)
		$(use_enable pulseaudio)
	)
	autotools-utils_src_configure
}
