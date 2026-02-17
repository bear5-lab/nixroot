
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

let 
  bix = config.bix;
in {
  nixpkgs.overlays = [
    (import ../../overlays)
  ];

  imports = [
    <home-manager/nixos>
    ./inputrc.nix
    ./packages.nix
    ../../options/default.nix
  ];

  # Home manager
  home-manager.backupFileExtension = "backup";
  home-manager.users."${bix.mainUser}" = {
    home.stateVersion = "25.11";
    home.username = "${bix.mainUser}";
    home.homeDirectory = "/home/${bix.mainUser}";

    imports = [
      ../../home/git
      ../../home/alacritty
      ../../home/vim
      ../../home/i18n/input-method/fcitx
    ];
  };
  
  # +------------------------------------------------------------+
  # | Boot Settings                                              |
  # +------------------------------------------------------------+
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = ["zfs" "ntfs"];
  };
  # +------------------------------------------------------------+
  # | Default Settings                                           |
  # +------------------------------------------------------------+

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
  #     "openssl-1.1.1w"
      "qtwebengine-5.15.19"
      ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.completion.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    #pinentryPackage = "tty";
  };

  services.nfs.server.enable = true;
  programs.ssh.startAgent = lib.mkDefault false;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # Enable X11 Fowarding, can be connected with ssh -Y.
    settings.X11Forwarding = true;
  };
  
  # Enable sound
  services.pulseaudio.enable = false;
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

  # bluetooth
  services.blueman.enable = true;

  # +------------------------------------------------------------+
  # | Garbage Collection                                         |
  # +------------------------------------------------------------+

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };
}
