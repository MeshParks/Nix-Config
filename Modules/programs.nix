{ config, pkgs, ...}:
{
  # Z-shell config
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/mesh/nixos-config/#mesh";
    };
  };

  # Git Config
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
    };
  };

}
