{pkgs, ...}: let
  nixpkgs = with pkgs; [
    neovim
    stow
    tmux
    git
    gh
    tree
    mas
    tor
    just
    btop
  ];

  brewcasks = [
    "wezterm"
    "notion"
    "notion-calendar"
    "zen-browser"
    "raycast"
    "tor-browser"
    "nikitabobko/tap/aerospace"
  ];

  brewapps = {
    "Encrypto" = 935235287;
    "KakaoTalk" = 869223134;
    "Mozilla VPN" = 1489407738;
  };

  fontpkgs = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
in {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = nixpkgs;
  homebrew = {
    enable = true;
    casks = brewcasks;
    masApps = brewapps;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
  fonts.packages = fontpkgs;

  # system.activationScripts.applications.text = let
  #   env = pkgs.buildEnv {
  #     name = "system-applications";
  #     paths = config.environment.systemPackages;
  #     pathsToLink = "/Applications";
  #   };
  # in
  #   pkgs.lib.mkForce ''
  #     # Set up applications.
  #     echo "setting up /Applications..." >&2
  #     rm -rf /Applications/Nix\ Apps
  #     mkdir -p /Applications/Nix\ Apps
  #     find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
  #     while read src; do
  #       app_name=$(basename "$src")
  #       echo "copying $src" >&2
  #       ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
  #     done
  #   '';
}
