# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2020-present Fewtarius

PKG_NAME="vlc"
PKG_VERSION="3.0.12"
PKG_SHA256="eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="https://download.videolan.org/pub/videolan/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libdvbpsi gnutls ffmpeg libmpeg2 zlib flac libvorbis libxml2 pulseaudio mpg123"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_AUTORECONF="yes"
PKG_TOOLCHAIN="autotools"

ENABLED_FEATURES="--enable-silent-rules \
            --enable-run-as-root \
            --enable-sout \
            --enable-vlm \
            --enable-v4l2 \
            --enable-mpc \
            --enable-avcodec \
            --enable-avformat \
            --enable-swscale \
            --enable-postproc \
            --enable-libmpeg2 \
            --enable-png \
            --enable-jpeg \
            --enable-libxml2 \
            --enable-alsa \
            --enable-udev \
            --enable-vlc \
            --enable-neon"

DISABLED_FEATURES="--disable-dependency-tracking \
            --without-contrib \
            --disable-nls \
            --disable-rpath \
            --disable-dbus \
            --disable-gprof \
            --disable-cprof \
            --disable-debug \
            --disable-coverage \
            --disable-lua \
            --disable-notify \
            --disable-taglib \
            --disable-live555 \
            --disable-dc1394 \
            --disable-dvdread \
            --disable-dvdnav \
            --disable-opencv \
            --disable-decklink \
            --disable-sftp \
            --disable-vcd \
            --disable-libcddb \
            --disable-dvbpsi \
            --disable-screen \
            --disable-ogg \
            --disable-shout\
            --disable-mod \
            --disable-gme \
            --disable-shine \
            --disable-omxil \
            --disable-mad \
            --disable-merge-ffmpeg \
            --disable-faad \
            --disable-flac \
            --disable-twolame \
            --disable-libtar \
            --disable-a52 \
            --disable-dca \
            --disable-vorbis \
            --disable-tremor \
            --disable-speex \
            --disable-theora \
            --disable-schroedinger \
            --disable-x264 \
            --disable-fluidsynth \
            --disable-zvbi \
            --disable-telx \
            --disable-libass \
            --disable-kate \
            --disable-tiger \
            --disable-libva \
            --disable-vdpau \
            --without-x \
            --disable-xcb \
            --disable-freetype \
            --disable-fribidi \
            --disable-fontconfig \
            --disable-svg \
            --disable-directx \
            --disable-caca \
            --disable-oss \
            --disable-jack \
            --disable-upnp \
            --disable-skins2 \
            --disable-kai \
            --disable-macosx \
            --disable-ncurses \
            --disable-goom \
            --disable-projectm \
            --disable-mtp \
            --disable-lirc \
            --disable-libgcrypt \
            --disable-update-check \
            --disable-kva \
            --disable-bluray \
            --disable-samplerate \
            --disable-sid \
            --disable-dxva2 \
            --disable-dav1d \
            --disable-qt"

	if [ "$PROJECT" == "Amlogic" ]; then 
		ENABLED_FEATURES+=" --enable-pulse"
	else
		DISABLED_FEATURES+=" --disable-pulse"
	fi 

PKG_CONFIGURE_OPTS_TARGET="$ENABLED_FEATURES $DISABLED_FEATURES"

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -lresolv -fopenmp"
}

post_makeinstall_target() {
  rm -fr $INSTALL/usr/share/applications
  rm -fr $INSTALL/usr/share/icons
  rm -fr $INSTALL/usr/share/kde4
  rm -f $INSTALL/usr/bin/rvlc
  rm -f $INSTALL/usr/bin/vlc-wrapper
}
