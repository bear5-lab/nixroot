self: super:
let 
  unstable-pkgs = import (builtins.fetchTarball {
    # 09.16.2020
    url = https://github.com/NixOS/nixpkgs/tarball/441a7da8080352881bb52f85e910d8855e83fc55; 
  }) {config.allowUnfree = true;};
in {
  # version : 0.74.3
  hugo = unstable-pkgs.hugo;
}
