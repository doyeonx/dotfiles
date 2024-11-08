{...}: {
  users.users.doyeon = {
    name = "doyeon";
    home = "/Users/doyeon";
  };

  system = {
    defaults = {
      dock = {
        autohide = true;
      };
      trackpad = {
      };
      finder = {
        FXPreferredViewStyle = "clmv";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  services.nix-daemon.enable = true;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      build-users-group = nixbld
    '';
    useDaemon = true;
    configureBuildUsers = true;
  };
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
