{ config, pkgs, ...}:
{

  # Zsh's config.
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/mesh/nixos-config/#mesh";
    };
  };

  # Git's Config.
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  # Docker's Config.
  virtualisation.docker = {
    enable = true;  # Enables the Docker daemon and installs it.
  };

}
