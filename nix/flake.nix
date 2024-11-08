{
  description = "doyeon's macos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    self,
    nix-darwin,
    home-manager,
    nix-homebrew,
    ...
  }: {
    darwinConfigurations = {
      "doyeon" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.doyeon.imports = [./modules/home-manager/default.nix];
            };
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "doyeon";
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations."doyeon".pkgs;
    };
  };
}
