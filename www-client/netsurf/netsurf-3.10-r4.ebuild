# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-minimal desktop

MY_PN=${PN}-all
MY_P=${MY_PN}-${PV}

S="${WORKDIR}"/${MY_P}
DESCRIPTION="A free, open source web browser"
HOMEPAGE="https://www.netsurf-browser.org/"
SRC_URI="http://download.netsurf-browser.org/netsurf/releases/source-full/netsurf-all-3.10.tar.gz"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="*"

IUSE="+bmp +gif +gtk +javascript +jpeg +mng +png +psl +svg +svgtiny +webp
	fbcon gtk2 truetype
"
REQUIRED_USE="|| ( fbcon gtk gtk2 )"
RDEPEND="
	dev-libs/expat
	net-misc/curl
	fbcon? (
		truetype? ( media-fonts/dejavu
			>=media-libs/freetype-2.5.0.1 )
	)
	gtk? ( dev-libs/glib:2
		x11-libs/gtk+:3 )
	gtk2? ( dev-libs/glib:2
		x11-libs/gtk+:2 )
	jpeg? ( >=virtual/jpeg-0-r2:0 )
	mng? ( >=media-libs/libmng-1.0.10-r2 )
	png? ( >=media-libs/libpng-1.2.51:0 )
	svg? ( !svgtiny? ( gnome-base/librsvg:2 ) )
	webp? ( >=media-libs/libwebp-0.3.0 )
"
BDEPEND="
	javascript? ( app-editors/vim-core )
	dev-libs/check
	dev-perl/HTML-Parser
"

DOCS=( netsurf/docs/ netsurf/docs/ideas/{cache,css-engine,render-library}.txt )

src_prepare() {
	# Ensure the framebuffer frontend compiles with gcc-11.2.0
	sed -i \
		-e "s:\"\(const uint.*_section.*\):\"extern \1:" \
		-e "s:\"\(const uint8_t.*font_glyph_data;.*\):\"extern \1:" \
		netsurf/frontends/framebuffer/convert_font.c

	default
}

src_compile() {
	if use gtk ; then
		make clean
		emake TARGET=gtk3 || die
	fi
	if use gtk2 ; then
		make clean
		emake TARGET=gtk2 || die
	fi
	if use fbcon ; then
		make clean
		emake TARGET=framebuffer || die
	fi
}

src_install() {
	sed -e '1iexit;' \
		-i "${S}"/${PN}/utils/git-testament.pl || die

	if use gtk ; then
		emake TARGET=gtk3 DESTDIR="${D}" PREFIX=/usr install
		elog "netsurf gtk3 version has been installed as netsurf-gtk3"
		make_desktop_entry "${EPREFIX}"/usr/bin/netsurf-gtk3 \
						   NetSurf-gtk3 \
						   netsurf \
						   "Network;WebBrowser"
	fi
	if use gtk2 ; then
		emake TARGET=gtk2 DESTDIR="${D}" PREFIX=/usr install
		elog "netsurf gtk2 version has been installed as netsurf-gtk2"
		make_desktop_entry "${EPREFIX}"/usr/bin/netsurf-gtk2 \
						   NetSurf-gtk2 \
						   netsurf \
						   "Network;WebBrowser"
	fi
	if use fbcon ; then
		emake TARGET=framebuffer DESTDIR="${D}" PREFIX=/usr install
		elog "framebuffer binary has been installed as netsurf-fb"
		make_desktop_entry "${EPREFIX}"/usr/bin/netsurf-fb \
						   NetSurf-framebuffer \
						   netsurf \
						   "Network;WebBrowser"
	fi

	insinto /usr/share/pixmaps
	doins ${PN}/frontends/gtk/res/netsurf.xpm

	for doc in `ls */README*`; do
		# install READMEs for all dependencies
		docname=`basename ${doc}`
		pkgname=`dirname ${doc}`
		docinto ${pkgname}
		newdoc ${doc} ${docname}
	done
}