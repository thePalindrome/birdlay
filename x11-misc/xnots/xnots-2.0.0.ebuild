# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3

DESCRIPTION="The sticky note application every UNIX geek dreams of!"
HOMEPAGE="https://thepalindrome.github.io/xnots/"
EGIT_REPO_URI="https://github.com/thepalindrome/xnots"
EGIT_BRANCH="something_completely_different"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+markdown"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	markdown? ( app-text/discount )"
RDEPEND="${DEPEND}"

src_compile() {
	if ! use markdown ; then
		xnotsMarkdown="CONFIG=+no_markdown"
	fi
	eqmake5 "$xnotsMarkdown"
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
