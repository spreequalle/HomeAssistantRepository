# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

MY_PN=${PN/-/_}
DESCRIPTION="A GeoRSS client library."
HOMEPAGE="https://github.com/exxamalte/python-georss-client https://pypi.org/project/georss-client/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/haversine-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/dateparser-0.7.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}