{ config, lib, pkgs, inputs, ...}:
{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [

      vis # I did not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default but don't reallly like it as much.
      fastfetch # I have no need, but I must fetch.
      ghostty # Terminal shell emulator.
      gnome-extension-manager
      gnome-tweaks # Why is this a separate app from settings fr.
      obs-studio
      zed-editor # The best text editor.
      vesktop
      vscodium # Alternative.
      btop
      penpot-desktop # Open Figma alternative.
      cowsay
      gparted # Partion Editing.
      steam-run
      blender # In another life.
      lazygit # For Larping.
      jujutsu # Investing in this.
      ntfs3g
      obsidian # Markdown based word editor.

      # Flake Specific
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default # The Best Browser On Earth.
      inputs.helium.packages.${system}.default # And then Helium walked in, yk what?, after a few weeks, it walks back out.
  ];

  environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      cheese
      gnome-music
      epiphany

    ];

    nixpkgs.config.permittedInsecurePackages = [
        "electron-42.11.18"
      ];

  nixpkgs.config.allowUnfree = true; # Allows proprietary software, like obsidian.

  services.flatpak.enable = true;
  # Then We Run, 'flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'

}
