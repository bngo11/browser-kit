# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-1.0.2
aho-corasick-0.7.18
autocfg-1.1.0
base64-0.10.1
base64-0.12.3
base64-0.13.0
bitflags-1.3.2
block-buffer-0.10.2
byteorder-1.4.3
bytes-0.5.6
bytes-1.1.0
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.34.0
cookie-0.12.0
cpufeatures-0.2.2
crc32fast-1.3.2
crypto-common-0.1.3
digest-0.10.3
dirs-2.0.2
dirs-sys-0.3.7
dtoa-0.4.8
fastrand-1.7.0
flate2-1.0.22
fnv-1.0.7
form_urlencoded-1.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-io-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
generic-array-0.14.5
getrandom-0.2.6
h2-0.2.7
hashbrown-0.11.2
headers-0.3.7
headers-core-0.2.0
http-0.2.6
http-body-0.3.1
httparse-1.6.0
httpdate-0.3.2
httpdate-1.0.2
hyper-0.13.10
idna-0.2.3
indexmap-1.8.1
instant-0.1.12
iovec-0.1.4
itoa-0.4.8
itoa-1.0.1
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.122
line-wrap-0.1.1
linked-hash-map-0.5.4
log-0.4.16
matches-0.1.9
memchr-2.4.1
mime-0.3.16
mime_guess-2.0.4
miniz_oxide-0.4.4
mio-0.6.23
miow-0.2.2
mozdevice-0.4.0
mozprofile-0.7.3
mozrunner-0.13.0
mozversion-0.4.2
msdos_time-0.1.6
net2-0.2.37
num-integer-0.1.44
num-traits-0.2.14
once_cell-1.10.0
percent-encoding-2.1.0
pin-project-0.4.29
pin-project-1.0.10
pin-project-internal-0.4.29
pin-project-internal-1.0.10
pin-project-lite-0.1.12
pin-project-lite-0.2.8
pin-utils-0.1.0
plist-0.5.5
podio-0.1.7
proc-macro2-1.0.37
quote-1.0.17
redox_syscall-0.2.13
redox_users-0.4.3
regex-1.5.5
regex-syntax-0.6.25
remove_dir_all-0.5.3
rust-ini-0.10.3
ryu-1.0.9
safemem-0.3.3
same-file-1.0.6
scoped-tls-1.0.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.136
serde_derive-1.0.136
serde_json-1.0.79
serde_repr-0.1.7
serde_urlencoded-0.6.1
serde_yaml-0.8.23
sha-1-0.10.0
slab-0.4.6
socket2-0.3.19
strsim-0.8.0
syn-1.0.91
tempfile-3.3.0
term_size-0.3.2
textwrap-0.11.0
thiserror-1.0.30
thiserror-impl-1.0.30
time-0.1.43
tinyvec-1.5.1
tinyvec_macros-0.1.0
tokio-0.2.25
tokio-util-0.3.1
tower-service-0.3.1
tracing-0.1.32
tracing-core-0.1.24
tracing-futures-0.2.5
try-lock-0.2.3
typenum-1.15.0
unicase-2.6.0
unicode-bidi-0.3.7
unicode-normalization-0.1.19
unicode-segmentation-1.9.0
unicode-width-0.1.9
unicode-xid-0.2.2
unix_path-1.0.1
unix_str-1.0.0
url-2.2.2
urlencoding-1.3.3
uuid-0.8.2
version_check-0.9.4
walkdir-2.3.2
want-0.3.0
warp-0.2.5
wasi-0.10.2+wasi-snapshot-preview1
webdriver-0.44.0
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.5.1
ws2_32-sys-0.2.1
xml-rs-0.8.4
yaml-rust-0.4.5
zip-0.4.2
"

inherit cargo

DESCRIPTION="Proxy for using WebDriver clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver"
SRC_URI="https://api.github.com/repos/mozilla/geckodriver/tarball/v0.30.0 -> geckodriver-0.30.0.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=(
	"README.md"
	"CHANGES.md"
	"CONTRIBUTING.md"
	"doc/TraceLogs.md"
)

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}