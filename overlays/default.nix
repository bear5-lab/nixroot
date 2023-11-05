self: super:
let 
#  unstable-pkgs = import <nixos-unstable> {config.allowUnfree = true;};
in {
  tools-scripts = self.callPackage ../tools {};
 # python310 = unstable-pkgs.python310;
}
