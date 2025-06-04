{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    alacritty 
  ];
  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;

    programs.bash = {
    enable = true;
    initExtra = ''
      alias ls='ls --color=auto'
      PS1="\[\033[38;5;81m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} \\$ \[$(tput sgr0)\]"
    '';
  };
}
