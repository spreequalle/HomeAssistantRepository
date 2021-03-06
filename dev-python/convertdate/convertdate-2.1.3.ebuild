# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Converts between Gregorian dates and other calendar systems.Calendars included: Baha'i, French Republican, Hebrew, Indian Civil, Islamic, ISO, Julian, Mayan and Persian."
HOMEPAGE="https://github.com/fitnr/convertdate https://pypi.org/project/convertdate/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/ephem-3.7.5.3
		 <dev-python/ephem-3.8
		 >=dev-python/pytz-2014.10
		 <dev-python/pytz-2020"
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
