{ config, pkgs, ...}:
{
  # In another life.
    services.mysql = {
       enable = true;
       package = pkgs.mysql84;
     };

   # For launching Niri.
     services.greetd = {
       enable = true;
       settings.default_session = {
         command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
         user = "greeter";
       };
     };

   # Enable the X11 windowing system.
      services.xserver.enable = true;
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

    # services.xserver.xkb.options = "eurosign:e,caps:escape";

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    # Configure keymap in X11
    services.xserver.xkb.layout = "us";

}
