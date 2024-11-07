{pkgs, ...}: {
  home = {
    username = "doyeon";
    homeDirectory = "/Users/doyeon";
    stateVersion = "24.05";

    files = {
      # ".zshrc".source = ~/dotfiles/zshrc/.zshrc;
      # ".config/wezterm".source = ~/dotfiles/wezterm;
      # ".config/starship".source = ~/dotfiles/starship;
      # ".config/nvim".source = ~/dotfiles/nvim;
      # ".config/nix".source = ~/dotfiles/nix;
      # ".config/tmux".source = ~/dotfiles/tmux;
    };

    packages = with pkgs; [
      cmatrix
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
