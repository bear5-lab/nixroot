{ config, lib, pkgs, ... }:

{
  imports = [
    ./i3_status.nix
  ];


  config = {
    environment.systemPackages = with pkgs; [
      # Multimedia
      audacious audacity zoom-us thunderbird
    ];

    # Disable the gnome shell as it is not currently used, and will appear
    # in the dmenu so that hinder how chrome is being launched.
    services.gnome.chrome-gnome-shell.enable = false;

    services.xserver = {
      enable = true;
      layout = "us";

      # DPI
      dpi = 100;

      # Enable touchpad support
      libinput.enable = true;

      # Default desktop manager: gnome3.
      desktopManager.gnome.enable = true;
      desktopManager.gnome.extraGSettingsOverrides = ''
        [org.gnome.desktop.peripherals.touchpad]
        click-method='default'
      '';

      displayManager.gdm.enable = true;

      # When using gdm, do not automatically suspend since we want to
      # keep the server running.
      displayManager.gdm.autoSuspend = false;

      displayManager.sddm.enable = false;

      # Extra window manager: i3
      windowManager.i3 = {
        enable = true;
        configFile = ./i3.config;
        extraPackages = with pkgs; [ dmenu i3status-rust i3lock i3lock-fancy ];
      };
    };

    # Font
    fonts.fonts = with pkgs; [
      # Add Wenquanyi Microsoft Ya Hei, a nice-looking Chinese font.
      wqy_microhei
      # Fira code is a good font for coding
      fira-code
      fira-code-symbols
      font-awesome-ttf
      inconsolata
    ];

    console = {
      packages = [ pkgs.wqy_microhei pkgs.terminus_font  ];
      font = "ter-132n";
      keyMap = "us";
    };
    
    i18n = {
      # Input Method
      inputMethod = {
        enabled = "fcitx";
        fcitx.engines = with pkgs.fcitx-engines; [cloudpinyin];
      };
    };
  };
}
