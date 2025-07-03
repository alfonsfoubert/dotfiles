{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "alfons-tools";
      paths = [
        bash-completion
        neovim
        go
        tmux
        fd
        ripgrep
        fzf
        lazygit
        eza
        btop
        zoxide
        oh-my-posh
      ];
    };
  };
}
