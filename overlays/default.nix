self: super:
let 
  unstable-pkgs = import <nixos-unstable> {config.allowUnfree = true;};
in {
  tools-scripts = self.callPackage ../tools {};
  wechat = self.callPackage ../modules/customized/wechat {};
  codex = unstable-pkgs.codex;
  claude-code = unstable-pkgs.claude-code;
 # python310 = unstable-pkgs.python310;
}
