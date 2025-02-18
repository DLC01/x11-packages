TERMUX_PKG_HOMEPAGE=https://github.com/tsujan/Arqiver
TERMUX_PKG_DESCRIPTION="A simple Qt archiver manager based on libarchive"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="Yisus7u7 <yisus7u7v@gmail.com>"
TERMUX_PKG_VERSION=0.9.0
TERMUX_PKG_SRCURL=https://github.com/tsujan/Arqiver/releases/download/V${TERMUX_PKG_VERSION}/Arqiver-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=bf3b4be44524b4d6b4096846c304d381e6707681fbb1e69b2847f6876b950593
TERMUX_PKG_DEPENDS="hicolor-icon-theme, qt5-qtbase, qt5-qtsvg, qt5-qtx11extras, libarchive, bsdtar, zip"
TERMUX_PKG_BUILD_DEPENDS="qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
