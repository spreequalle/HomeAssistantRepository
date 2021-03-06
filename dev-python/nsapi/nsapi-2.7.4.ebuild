# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="api wrapper for Dutch Railways (NS)"
HOMEPAGE="https://github.com/aquatix/ns-api/ https://pypi.org/project/nsapi/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2018.5[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
