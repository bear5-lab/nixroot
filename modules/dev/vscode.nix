{ config, pkgs, lib, ...}:
with pkgs;
let
  # available extensions can be found:
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vscode-extensions/default.nix
  extensions = (with pkgs.vscode-extensions; [
    ms-vscode.cpptools
    james-yu.latex-workshop
    redhat.vscode-yaml
    ms-python.python
    vscodevim.vim
  ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name="gitlens";
      publisher = "eamodio";
      version = "11.1.3";
      sha256= "1x9bkf9mb56l84n36g3jmp3hyfbyi8vkm2d4wbabavgq6gg618l6";
    }
  ]; 

  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = extensions;
  };
in {
  environment.systemPackages = with pkgs; [
   vscode-with-extensions 
  ];
}

