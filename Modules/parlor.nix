{ config, pkgs, inputs, ...}:
{

# Configure network connections interactively with nmcli or nmtui, so we can get our wifi.
networking.networkmanager.enable = true;

# Sets my time zone.
time.timeZone = "Africa/Lagos";

# Selects internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

# Defines a user account, Didn't forget to set a password with ‘passwd’.
users.users.mesh = {
  	 isNormalUser = true;
  	 extraGroups = [ "wheel" "networkmanager" "docker" ]; # Wheel grants ‘sudo’ privileges for the user.
  	 packages = with pkgs; [
 		 tree
  	 ];
  };

networking.hostName = "mesh"; # Defines my hostname.

boot.supportedFilesystems = [ "ntfs" ];


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true; # allows the use of sysmd-boot
  boot.loader.efi.canTouchEfiVariables = true;

  # Uses the latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.configurationLimit = 6;

  boot.initrd.compressor = "xz";
  boot.initrd.compressorArgs = [ "-9e" "--check=crc32" ];




}
