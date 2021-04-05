# Define all supported ROS distros

self: super: {
  rosPackages = rec {
    lib = super.lib // import ../lib { inherit lib self; };

    noetic = import ./distro-overlay.nix {
      distro = "noetic";
      python = self.python3;
    } self super;
  };
}
