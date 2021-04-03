self: super:
let 
  unstable-pkgs = import (builtins.fetchTarball {
    # 09.16.2020
    url = https://github.com/NixOS/nixpkgs/tarball/441a7da8080352881bb52f85e910d8855e83fc55; 
  }) {config.allowUnfree = true;};

  pkgs_210226 = import (builtins.fetchGit {
    name = "version-210226";
    url = "https://github.com/NixOS/nixpkgs/"; 
    rev = "36126fdbfabe7aa34d4f84d1ee9ac06cd371aada";
  }) {config.allowUnfree = true;};

in {
  # version : 0.74.3
  hugo = unstable-pkgs.hugo;

  ethminer = pkgs_210226.ethminer;

  ros2nix = self.callPackage ../pkgs/ros/ros2nix {};
}
