{
  pkgs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      build-users-group = nixbld
    '';
    useDaemon = true;
    configureBuildUsers = true;
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  users.users.doyeon = {
    name = "doyeon";
    home = "/Users/doyeon";
  };

  system = {
    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';

    defaults = {
      dock = {
        autohide = true;
      };

      finder = {
        FXPreferredViewStyle = "clmv";
      };

      CustomUserPreferences."com.apple.screencapture" = {
        location = "~/Pictures/screenshots";
        type = "png";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
