# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools prefix toolchain-funcs

MY_P="${P/_p/+git}"
MY_PV="${PV/_p/+git}"

S="${WORKDIR}/${MY_P}"
DESCRIPTION="Debian's w3m: WWW browsable pager"
HOMEPAGE="https://github.com/tats/w3m"
SRC_URI="https://github.com/tats/w3m/tarball/7edeee2041c7f8d7d03b6e4bd0d47d45592affb8 -> w3m-0.5.3-7edeee2.tar.gz"

LICENSE="w3m"
SLOT="0"
KEYWORDS="*"
IUSE="X fbcon gdk-pixbuf gpm imlib l10n_de l10n_ja libressl lynxkeymap nls nntp ssl unicode xface"
REQUIRED_USE="X? ( ?? ( gdk-pixbuf imlib ) )
	fbcon? ( ?? ( gdk-pixbuf imlib ) )"

RDEPEND="dev-libs/boehm-gc:=
	sys-libs/ncurses:0=
	sys-libs/zlib
	X? (
		x11-libs/libXdmcp
		x11-libs/libXext
	)
	gdk-pixbuf? ( x11-libs/gdk-pixbuf[X?] )
	!gdk-pixbuf? (
		imlib? ( media-libs/imlib2[X?] )
	)
	gpm? ( sys-libs/gpm )
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
	xface? ( media-libs/compface )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"


post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv tats-w3m* "${S}" || die
	fi
}


src_prepare() {
	default
	sed -i "/^AR=/s:ar:$(tc-getAR):" {.,${PN}img,libwc}/Makefile.in
	hprefixify acinclude.m4
	eautoconf
}

src_configure() {
	local myconf=()
	local image imagelib

	if use gdk-pixbuf; then
		imagelib="gtk2"
	elif use imlib; then
		imagelib="imlib2"
	fi
	if [[ -n "${imagelib}" ]]; then
		use X     && image="${image}${image:+,}x11"
		use fbcon && image="${image}${image:+,}fb"
	fi
	# emacs-w3m doesn't like "--enable-m17n --disable-unicode,"
	# so we better enable or disable both. Default to enable
	# m17n and unicode, see bug #47046.
	if use l10n_ja; then
		myconf+=( --enable-japanese=$(usex unicode U E) )
	else
		myconf+=( --with-charset=$(usex unicode UTF-8 US-ASCII) )
	fi
	# lynxkeymap IUSE flag. bug #49397
	myconf+=( --enable-keymap=$(usex lynxkeymap lynx ${PN}) )

	econf \
		$(use_enable gpm mouse) \
		$(use_enable nls) \
		$(use_enable nntp) \
		$(use_enable ssl digest-auth) \
		$(use_enable xface) \
		$(use_with ssl) \
		--enable-image=${image:-no} \
		--enable-m17n \
		--enable-unicode \
		--with-browser="${EPREFIX}/usr/bin/xdg-open" \
		--with-editor="${EPREFIX}/usr/bin/vi" \
		--with-imagelib="${imagelib:-no}" \
		--with-mailer="${EPREFIX}/bin/mail" \
		--without-migemo \
		--with-termlib=yes \
		"${myconf[@]}"
}

src_install() {
	default

	# http://www.sic.med.tohoku.ac.jp/~satodai/w3m-dev/200307.month/3944.html
	insinto /etc/${PN}
	newins "${FILESDIR}"/${PN}.mailcap mailcap

	insinto /usr/share/${PN}/Bonus
	doins Bonus/{*.{cgi,rb},html*,makeref}

	docinto en
	dodoc doc/{HISTORY,README,keymap,menu}*
	newdoc Bonus/README.eng README.Bonus
	docinto html/en
	dodoc doc/*.html
	if use l10n_de; then
		docinto de
		dodoc doc-de/README*
		docinto html/de
		dodoc doc-de/*.html
	else
		rm -rf "${ED}"/usr/share/man/de
	fi
	if use l10n_ja; then
		docinto ja
		dodoc doc-jp/{HISTORY,README,keymap,menu}*
		newdoc Bonus/README README.Bonus
		docinto html/ja
		dodoc doc-jp/*.html
	else
		rm -rf "${ED}"/usr/share/man/ja
	fi
}