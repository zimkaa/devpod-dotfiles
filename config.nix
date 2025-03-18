{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      paths = [
        zsh-completions
        neovim
        go
        nodejs_22
        pure-prompt
        fd
        ripgrep
        fzf
        lazygit
        kubectl
        kubectx
        k9s
        fluxcd
      ];
    };
  };
}
