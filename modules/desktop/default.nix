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

    services.xserver = {
      enable = true;
      xkb.layout = "us";

      # DPI
      dpi = 100;

      # Extra window manager: i3
      windowManager.i3 = {
        enable = true;
        configFile = ./i3.config;
        extraPackages = with pkgs; [ dmenu i3status-rust i3lock i3lock-fancy ];
      };

      # 25.05 release
      desktopManager.runXdgAutostartIfNone = true;
    };

    # Enable touchpad support
    services.libinput.enable = true;

    # Default desktop manager: gnome3.
    services.desktopManager.gnome.enable = true;
    services.desktopManager.gnome.extraGSettingsOverrides = ''
      [org.gnome.desktop.peripherals.touchpad]
      click-method='default'
    '';

    services.displayManager.gdm.enable = true;

    # When using gdm, do not automatically suspend since we want to
    # keep the server running.
    services.displayManager.gdm.autoSuspend = false;

    services.displayManager.sddm.enable = false;

    # Font
    fonts.packages = with pkgs; [
      # Add Wenquanyi Microsoft Ya Hei, a nice-looking Chinese font.
      wqy_microhei
      # Fira code is a good font for coding
      fira-code
      fira-code-symbols
      font-awesome
      inconsolata
    ];

    console = {
      packages = [ pkgs.wqy_microhei pkgs.terminus_font  ];
      font = "ter-132n";
      keyMap = "us";
    };

    # Font configuration for better Chinese rendering
    fonts.fontconfig.defaultFonts = {
      serif = [ "DejaVu Serif" "WenQuanYi Micro Hei" ];
      sansSerif = [ "DejaVu Sans" "WenQuanYi Micro Hei" ];
      monospace = [ "Fira Code" "WenQuanYi Micro Hei" ];
    };
  };
}
