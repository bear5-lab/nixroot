{ config, lib, pkgs, ... }:

let

in {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [ qt6Packages.fcitx5-chinese-addons ];
  };

  # The fcitx5-daemon service will be started before xfce, which breaks some fcitx features.
  # Moreover, fcitx will be started by xfce, so we can safely disable this service.
  systemd.user.services.fcitx5-daemon = lib.mkForce { };
}
