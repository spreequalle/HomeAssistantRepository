# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

MY_PN=${PN}4
MY_P=${MY_PN}-${PV}

DESCRIPTION="Pythonic idioms for iterating, searching, and modifying an HTML/XML parse tree"
HOMEPAGE="https://www.crummy.com/software/BeautifulSoup/bs4/"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc test"

# html5lib is optional however hard coding since its use is actively discouraged in the devmanual
RDEPEND="
	$(python_gen_cond_dep 'dev-python/html5lib[${PYTHON_USEDEP}]' python2_7 pypy)
	$(python_gen_cond_dep 'dev-python/lxml[${PYTHON_USEDEP}]' python2_7 'python3*')"
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
	"

S="${WORKDIR}/${MY_P}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	nosetests --verbose -w "${BUILD_DIR}"/lib || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/build/html/. )
	distutils-r1_python_install_all
}
