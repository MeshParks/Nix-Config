{ config, lib, pkgs, inputs, ...}:
{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [

      vis # Minimal Vim esque tty editor.
      fastfetch # I have no need, but I must fetch.
      ghostty # Terminal shell emulator.
      gnome-extension-manager # 
      gnome-tweaks
      zed-editor # The best text editor.
      vesktop # Discord client.
      vscodium # Open sourced build of VS code.
      btop
      penpot-desktop # Figma alternative
      cowsay 
      gparted # Partition tool
      steam-run
      blender
      opencode
      jujutsu # Git variant,
      bibata-cursors # Cursor theme
      ntfs3g 
      obsidian # Markdown based word editor.

      # Flake Specific
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default # The Best Browser On Earth
      inputs.helium.packages.${system}.default # And then Helium walked in
  ];

  environment.gnome.excludePackages = with pkgs;[
    # I have little to no need for these. 
      gnome-tour
      cheese
      gnome-music
      epiphany
    ];

    nixpkgs.config.permittedInsecurePackages = [
        "electron-42.11.18" # needed this cause it was a missing dependecy.
      ];

  nixpkgs.config.allowUnfree = true; # Allows proprietary software, like obsidian.
  programs.firefox.enable = true; # Enables firefox
  services.flatpak.enable = true;
  # Then We Run, flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

}
