{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  makeWrapper,

  # nix log ... | grep 'could not satisfy' | awk '{print $7}' | sort | uniq
  alsa-lib,
  at-spi2-core,
  libgcc,
  cairo,
  dbus,
  libdrm,
  fontconfig,
  freetype,
  mesa,
  glib,
  libGL,
  libjack2,
  nspr,
  nss,
  pango,
  libpulseaudio,
  udev,
  libX11,
  libxcb,
  xcbutilwm,
  xcbutilimage,
  xcbutilkeysyms,
  xcbutilrenderutil,
  libXcomposite,
  libXdamage,
  libxkbcommon,
  libXrandr,
  zlib,
  libXtst,
  cups,
  ...
}:

# https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/we/wechat-uos/package.nix
# https://nixos.wiki/wiki/Packaging/Binaries
# NIXPKGS_ALLOW_UNFREE=1 nix-build -E '((import <nixpkgs> {}).callPackage (import ./wechat.nix) { })' --keep-failed --no-out-link
# TODO: Verify if audio call or video call working?
stdenv.mkDerivation {
  pname = "wechat";
  version = "4.0.1";

  src =
    {
      x86_64-linux = fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb";
        hash = "sha256-OYWMSEZj93ObszGswFul2KbrQIEyOvEppqJ4Ff08CqU=";
      };
    }
    .${stdenv.system};

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    alsa-lib
    at-spi2-core
    libgcc
    cairo
    dbus
    libdrm
    fontconfig
    freetype
    mesa
    glib
    libGL
    libjack2
    nspr
    nss
    pango
    libpulseaudio
    udev
    libX11
    libxcb
    xcbutilwm
    xcbutilimage
    xcbutilkeysyms
    xcbutilrenderutil
    libXcomposite
    libXdamage
    libxkbcommon
    libXrandr
    zlib
    libXtst
    cups
  ];

  # TODO: May need buildFHSEnv?
  # sh: 行 1: /usr/bin/lsblk: No such file or directory

  # Keep stages least:
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  # https://github.com/NixOS/nixpkgs/issues/282749
  # SIGABRT: https://discourse.nixos.org/t/unexpected-sigtrap-when-running-electron/7864/2
  # SIGSEGV: https://github.com/NixOS/nixpkgs/pull/354332
  installPhase = ''
    runHook preInstall
    dpkg -x $src $out
    pushd $out
    mv opt/wechat .
    mv usr/share .
    rm -rf opt usr
    popd

    wrapProgram $out/wechat/wechat \
      --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          libGL
          udev
          libpulseaudio
        ]
      }
    substituteInPlace $out/share/applications/wechat.desktop \
      --replace-fail /usr/bin/wechat $out/wechat/wechat \
      --replace-fail /usr/share $out/share
    runHook postInstall

    mkdir -p $out/bin
    ln -s $out/wechat/wechat $out/bin/wechat 
  '';

  meta = {
    homepage = "https://linux.weixin.qq.com";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
