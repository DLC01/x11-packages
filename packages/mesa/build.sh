TERMUX_PKG_HOMEPAGE=https://www.mesa3d.org
TERMUX_PKG_DESCRIPTION="An open-source implementation of the OpenGL specification"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="DLC01"
TERMUX_PKG_VERSION=21.2.5
TERMUX_PKG_SRCURL=https://archive.mesa3d.org/mesa-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=8e49585fb760d973723dab6435d0c86f7849b8305b1e6d99f475138d896bacbb
TERMUX_PKG_DEPENDS="libandroid-shmem, libllvm, bison, flex, libexpat, libdrm, libx11, libxdamage, libxext, zstd, libxml2, libxshmfence, zlib"
TERMUX_PKG_BUILD_DEPENDS="xorgproto"
TERMUX_PKG_CONFLICTS="libmesa"
TERMUX_PKG_REPLACES="libmesa"
TERMUX_PKG_RM_AFTER_INSTALL="include/KHR/khrplatform.h"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dprefix=$TERMUX_PREFIX
-Dgbm=disabled
-Dshader-cache=enabled
-Ddri3=enabled
-Dlibunwind=disabled
-Dopencl-native=false
-Dgallium-vdpau=disabled
-Dgallium-xvmc=disabled
-Dgallium-omx=disabled
-Dgallium-xa=disabled
-Dgallium-va=disabled
-Dmicrosoft-clc=disabled
-Degl=enabled
-Dgles1=enabled
-Dgles2=enabled
-Dlmsensors=disabled
-Dllvm=enabled
-Dglx=dri
-Dplatforms=x11
-Dopengl=true
-Dosmesa=true
-Dvulkan-drivers=[]
-Dgallium-drivers=swrast
-Dshared-glapi=enabled
-Ddri-drivers=[]
"

termux_step_pre_configure() {
	export LDFLAGS=" -landroid-shmem -llog "
}

termux_step_post_massage() {
	cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/lib || exit 1
	if [ ! -e "./libGL.so.1" ]; then
		ln -sf libGL.so libGL.so.1
	fi

	cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/lib || exit 1
	if [ ! -e "./libEGL.so.1" ]; then
		ln -sf libEGL.so libEGL.so.1
	fi
}

termux_step_install_license() {
	install -Dm600 -t $TERMUX_PREFIX/share/doc/mesa $TERMUX_PKG_BUILDER_DIR/LICENSE
}
