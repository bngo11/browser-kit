# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Proxy for using W3C WebDriver compatible clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver https://github.com/mozilla/geckodriver"
SRC_URI="https://github.com/mozilla/geckodriver/tarball/3bcc92b964ce5719b4bd7077b6bf0056f6364cbe -> geckodriver-0.34.0-3bcc92b.tar.gz
https://direct.funtoo.org/a3/7a/fc/a37afcc02e135702e5001a03e829d066309c1f263401000102e0aa2bb6eaaebee3aac922db6cd6a1b253273dd0afb7abfac6059f79db0319a2f69f30ac9c6dc6 -> geckodriver-0.34.0-funtoo-crates-bundle-cba6ad45f78149d9b78be143c52ba825d15f1642190bf69296205f19019f2e44b48c9525cfd95b87fd18bf54391f6c19b2f322e7805c2a81c5f81fccf512f0b2.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}