TERMUX_PKG_HOMEPAGE=https://www.mesa3d.org
TERMUX_PKG_DESCRIPTION="An open-source implementation of the OpenGL specification"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=21.3.1
TERMUX_PKG_SRCURL=https://archive.mesa3d.org/mesa-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d
TERMUX_PKG_DEPENDS="bison, flex, libexpat, libdrm, libxdamage, libxext, zstd, libxml2, libxshmfence, zlib"
TERMUX_PKG_BUILD_DEPENDS="xorgproto, libandroid-shmem-static, libllvm-static"
TERMUX_PKG_CONFLICTS="libmesa"
TERMUX_PKG_REPLACES="libmesa"
TERMUX_PKG_RM_AFTER_INSTALL="include/KHR/khrplatform.h"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
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
-Dshared-llvm=false
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
        termux_setup_cmake

	export LIBS=" -landroid-shmem -llog -latomic -ldl"
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

