# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Proxy for using W3C WebDriver compatible clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver https://github.com/mozilla/geckodriver"
SRC_URI="https://github.com/mozilla/geckodriver/tarball/3bcc92b964ce5719b4bd7077b6bf0056f6364cbe -> geckodriver-0.34.0-3bcc92b.tar.gz
https://direct.funtoo.org/fc/8a/c5/fc8ac55ee8617582f834fee14dcd9a1e9718bc58bbdbc891330b2cbc95be6ef969f59475c7873541f0abbf910e471f8869e1e3b621ce1c47b9251528a2df747c -> geckodriver-0.34.0-funtoo-crates-bundle-cba6ad45f78149d9b78be143c52ba825d15f1642190bf69296205f19019f2e44b48c9525cfd95b87fd18bf54391f6c19b2f322e7805c2a81c5f81fccf512f0b2.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}