{ config, pkgs, inputs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # *
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  boot.loader.systemd-boot.configurationLimit = 1;

  boot.initrd.compressor = "xz";
  boot.initrd.compressorArgs = [ "-9e" "--check=crc32" ];

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
