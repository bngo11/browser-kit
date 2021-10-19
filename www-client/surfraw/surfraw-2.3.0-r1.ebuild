# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools bash-completion-r1

DESCRIPTION="A fast unix command line interface to WWW"
HOMEPAGE="https://gitlab.com/surfraw/Surfraw"
SRC_URI="https://gitlab.com/surfraw/Surfraw/-/archive/${P}/${PN^}-${P}.tar.bz2"
SLOT="0"
LICENSE="public-domain"
KEYWORDS="amd64 hppa ppc sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris"

RDEPEND="
	dev-lang/perl
"
RESTRICT="test"
DOCS=(
	AUTHORS ChangeLog HACKING NEWS README TODO
)
PATCHES=(
	"${FILESDIR}"/${PN}-2.3.0-completion.patch
)
S=${WORKDIR}/${PN^}-${P}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --with-elvidir='$(datadir)'/surfraw
}

src_install() {
	default

	newbashcomp surfraw-bash-completion ${PN}
	bashcomp_alias ${PN} sr

	docinto examples
	dodoc examples/README
	insinto /usr/share/doc/${PF}/examples
	doins examples/uzbl_load_url_from_surfraw
}

pkg_preinst() {
	has_version "=${CATEGORY}/${PN}-1.0.7"
	upgrade_from_1_0_7=$?
}

pkg_postinst() {
	local moves f

	einfo
	einfo "You can get a list of installed elvi by just typing 'surfraw' or"
	einfo "the abbreviated 'sr'."
	einfo
	einfo "You can try some searches, for example:"
	einfo "$ sr ask why is jeeves gay? "
	einfo "$ sr google -results=100 RMS, GNU, which is sinner, which is sin?"
	einfo "$ sr rhyme -method=perfect Julian"
	einfo
	einfo "The system configuration file is /etc/surfraw.conf"
	einfo
	einfo "Users can specify preferences in '~/.surfraw.conf'  e.g."
	einfo "SURFRAW_graphical_browser=mozilla"
	einfo "SURFRAW_text_browser=w3m"
	einfo "SURFRAW_graphical=no"
	einfo
	einfo "surfraw works with any graphical and/or text WWW browser"
	einfo
	if [[ $upgrade_from_1_0_7 = 0 ]] ; then
		ewarn "surfraw usage has changed slightly since version 1.0.7, elvi are now called"
		ewarn "using the 'sr' wrapper script as described above.  If you wish to return to"
		ewarn "the old behaviour you can add /usr/share/surfraw to your \$PATH"
	fi
	# This file was always autogenerated, and is no longer needed.
	if [ -f "${EROOT}"/etc/surfraw_elvi.list ]; then
		rm -f "${EROOT}"/etc/surfraw_elvi.list
	fi

	# Config file location changes in v2.2.6
	for f in /etc/surfraw.{bookmarks,conf}; do
		if [ -f "${EROOT}"${f} ]; then
			ewarn "${f} has moved to /etc/xdg/config/surfraw/${f##*.} in v2.2.6."
			moves=1
		fi
	done
	if [ "${moves}" == 1 ]; then
		ewarn "You must manually move, and update, the config files listed"
		ewarn "above for surfraw v2.2.6 and above to use them."
	fi
}
