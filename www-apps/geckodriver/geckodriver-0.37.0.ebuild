# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Proxy for using W3C WebDriver compatible clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver https://github.com/mozilla/geckodriver"
SRC_URI="https://github.com/mozilla/geckodriver/tarball/5b520a5c4dbf1f32c06fa76a1c2245fc1606db1d -> geckodriver-0.37.0-5b520a5.tar.gz
https://direct.funtoo.org/da/36/43/da3643e7532a9b6af71d639fe41b3eddaf628740cd4f83bdc5d294a2388ce5f8a93c929ec1a64e53cf6c07a794124f04f0c786ba2c5bc90a6430f9aff9dc8066 -> geckodriver-0.37.0-funtoo-crates-bundle-a3eafe38d46ffc4f3f0c7b5dcc02bb70cb03d67657a048b25cf2dbcfe4edca0a2ae06af1277fe526f7b3b62139d3cccdda83ff231ae28646330759c88a6cf0f6.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}