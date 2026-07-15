{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "anton-tools";
      paths = [
        bat
        direnv
        dive
        dotenvx # temporary bag
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
        worktrunk
        yazi
        zoxide
        zsh-completions
      ];
    };
  };
}
