{pkgs, ...}: let
  nixpkgs = with pkgs; [
    nvim
    stow
    tmux
    git
    gh
    tree
    mas
    tor
    just
  ];

  brewcasks = [
    "firefox"
    "raycast"
    "tor-browser"
    "nikitabobko/tap/aerospace"
  ];

  brewapps = {
    "Encrypto" = 935235287;
    "KakaoTalk" = 869223134;
  };

  fontpkgs = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
in {
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
}
