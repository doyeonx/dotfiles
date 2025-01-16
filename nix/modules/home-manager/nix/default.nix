{pkgs, ...}: {
  home = {
    username = "doyeon";
    homeDirectory = "/Users/doyeon";
    stateVersion = "24.05";

    # file = {
    #   ".zshrc".source = ~/dotfiles/zshrc/.zshrc;
    #   ".config/wezterm".source = ~/dotfiles/wezterm;
    #   ".config/starship".source = ~/dotfiles/starship;
    #   ".config/nvim".source = ~/dotfiles/nvim;
    #   ".config/tmux".source = ~/dotfiles/tmux;
    # };

    packages = with pkgs; [
      bat
      fzf
      yazi
      zoxide
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
