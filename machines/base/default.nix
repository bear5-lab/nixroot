
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ../../overlays)
  ];

  imports = [
    ./inputrc.nix
    ../../modules/dev/docker.nix
    ../../modules/fcitx
  ];

  # +------------------------------------------------------------+
  # | Boot Settings                                              |
  # +------------------------------------------------------------+

  # Boot with UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Filesystem Support
  boot.supportedFilesystems = [ "zfs" "ntfs" ];

  # +------------------------------------------------------------+
  # | Default Settings                                           |
  # +------------------------------------------------------------+

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable to use non-free packages such as nvidia drivers
  nixpkgs.config.allowUnfree = true;

  # Basic softwares that should definitely exist.
  environment.systemPackages = with pkgs; [
    wget 
    gnome.gnome-control-center

    # ---------- System Utils ----------
    rsync usbutils mkpasswd nixops p7zip unzip
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
    gitFull tig cmake gnumake clang clang-tools binutils
    gcc silver-searcher sbcl bazel jdk bazel-buildtools 

    # ---------- Latex --------------- #
    texlive.combined.scheme-full pandoc 
    texstudio

    # web development
    hugo go

    # customized
    tools-scripts

    # vpn
    openconnect openvpn 

  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-9.4.4"
    "python2.7-pyjwt-1.7.1"
    "nodejs-12.22.12"
    "python2.7-certifi-2021.10.8"
    "python-2.7.18.6"
    "openssl-1.1.1u"
    "openssl-1.1.1w"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "tty";
  };

  services.nfs.server.enable = true;
  programs.ssh.startAgent = lib.mkDefault false;

  # For monitoring and inspecting the system.
  programs.sysdig.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # Enable X11 Fowarding, can be connected with ssh -Y.
    forwardX11 = true;
  };

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable CUPS services
  services.printing.enable = true;

  services.udev.packages = [ pkgs.libu2f-host ];

  # Disable UDisks by default (significantly reduces system closure size)
  services.udisks2.enable = lib.mkDefault false;

  # +------------------------------------------------------------+
  # | Network Settings                                           |
  # +------------------------------------------------------------+

  services.avahi = {
    enable = true;

    # Whether to enable the mDNS NSS (Name Service Switch) plugin.
    # Enabling this allows applications to resolve names in the
    # `.local` domain.
    nssmdns = true;

    # Whether to register mDNS address records for all local IP
    # addresses.
    publish.enable = true;
    publish.addresses = true;
  };

  services.blueman.enable = true;

  # +------------------------------------------------------------+
  # | Garbage Collection                                         |
  # +------------------------------------------------------------+

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  # +------------------------------------------------------------+
  # | System files                                               |
  # +------------------------------------------------------------+

}
