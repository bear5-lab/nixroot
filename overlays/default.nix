self: super:
let 
#  unstable-pkgs = import <nixos-unstable> {config.allowUnfree = true;};
in {
  tools-scripts = self.callPackage ../tools {};
  wechat = self.callPackage ../modules/customized/wechat {};
 # python310 = unstable-pkgs.python310;
}
