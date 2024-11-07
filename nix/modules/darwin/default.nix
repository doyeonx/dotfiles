{...}: let
  modules = [
    ./settings.nix
    ./pkgs.nix
  ];
in {
  imports = modules;
}
