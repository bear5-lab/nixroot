{ config, pkgs, ... }:

{
  imports = [
    ./base
    ./base/laptop_addon.nix
    ../modules/desktop
    ../dotfiles/home.nix
    ../modules/dev/vim.nix
    ../modules/dev/python.nix
    ../modules/dev/vscode.nix
    ./base/alias.nix
  ];

  users.users."${config.settings.username}".extraGroups = ["docker"];

  services.xserver.libinput.touchpad.naturalScrolling = false;	
  services.xserver.libinput.mouse.leftHanded = true;

  # Machine-specific networking configuration.
  networking.hostName = "Bach";
  # Generated via `head -c 8 /etc/machine-id`
  networking.hostId = "4b41d8c8";

  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?
}
