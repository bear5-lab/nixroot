{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget 
    gnome.gnome-control-center

    # ---------- System Utils ----------
    rsync usbutils mkpasswd p7zip unzip
    arandr neofetch ffmpeg zstd fd
    xclip fzf xorg.xmodmap xorg.xev xorg.xkbcomp
    pciutils 
    ncdu tree
    termius
    dig # from dns to ip address
    pavucontrol # pulseaudio volume control

    # --------- Browsers ----------- #
    google-chrome tor

    # photo, video viewer and editor
    avidemux feh mplayer vlc libreoffice you-get
    okular poppler_utils

    # --------- screenshot -------------
    scrot flameshot simplescreenrecorder

    # ---------- Development ----------
    cmake gnumake clang clang-tools binutils
    gcc silver-searcher sbcl bazel jdk bazel-buildtools 

    # ---------- Latex --------------- #
    texlive.combined.scheme-full pandoc 
    texstudio

    # web development
    hugo go

    # customized
    tools-scripts
    wechat 

    # vpn
    openconnect openvpn 
    globalprotect-openconnect

    # instant msg
    feishu 
    slack

  ];


}
