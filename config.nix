{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "anton-tools";
      paths = [
        eza
        fd
        fzf
        go-task
        lazygit
        neovim
        oh-my-posh
        pyenv
        ripgrep
        tmux
        uv
        zoxide
        zsh-completions
      ];
    };
  };
}
