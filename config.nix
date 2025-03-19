{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "anton-tools";
      paths = [
        zsh-completions
        neovim
        fd
        ripgrep
        fzf
        lazygit
        zoxide
        pyenv
        oh-my-posh
        eza
        tmux
        go-task
      ];
    };
  };
}
