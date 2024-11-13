{...}: let
  modules = [
    ./nix.nix
    ./zsh.nix
  ];
in {
  imports = modules;
}
