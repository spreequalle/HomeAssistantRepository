# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
HOMEPAGE="https://github.com/selwin/python-user-agents"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux"
IUSE="test"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}
