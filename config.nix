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
        ripgrep
        tmux
        uv
        zoxide
        zsh-completions
        direnv
        dive
        # dotenvx # temporary bag
        bat
        yazi
      ];
    };
  };
}
