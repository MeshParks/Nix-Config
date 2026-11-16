{ pkgs, ... }: {
  home.username = "mesh";
  home.homeDirectory = "/home/mesh";

  # Required by Home Manager for state compatibility
  home.stateVersion = "24.11";

  # User level packages
  home.packages = with pkgs; [
    # Golang
    go
    gopls

    # Lua
    lua

    # Shell
    zsh
    fish
    eza
    zoxide
    fzf
    curl
    git
    bat
    wget

    # Latte Js Specific
    nodejs_22
    nodejs_26
    yarn
    sqlite

    # Rust Specific
    cargo
    rustc
    rust-analyzer
    clippy

    # Python Helpers (to avoid global pip breakage)
    (python3.withPackages (ps: with ps;  [

      # Data Science
      jupyterlab
      notebook
      numpy
      pandas
      matplotlib
      requests

      # Web Frameworks
      flask
      django
      djangorestframework
    ]))
  ];

  nix.settings.experimental-features = [
    "nix-command" "flakes"
  ];

  # Does exactly that
  programs.home-manager.enable = true;
}
