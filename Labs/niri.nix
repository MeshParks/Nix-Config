{ config, pkgs, ...}:
{
  # Niri's config.
  programs.niri.enable = true;

  # Niri's Specific Packages.
  environment.systemPackages = with pkgs; [

    alacritty # Terminal emulator.
    fuzzel
    xwayland-satellite
    wl-clipboard
    waybar
    mako
    swaybg
    swaylock
    brightnessctl
    pavucontrol
    networkmanagerapplet
    bibata-cursors # The only good cursor theme.

  ];

  # In other to run Electron/Chromium apps natively on Wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Font Management.
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

}
