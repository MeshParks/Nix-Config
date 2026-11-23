# Nixos Config (Home-Manager. But With Flakes and Flatpaks) *Shock
This is my NixOs declarative config while still being on NixOs. 


## How To Get Nixed Installed
### Option A - NixOs Distro.

  1. Firstly, get the iso (minimal) from its official site, prepare a ventoy on a thumbdrive, or prepare it with a tool like balenetcher. 
  2. Restart the computer & Spam the Boot Options Key (Sometimes esc, f9, f12). 


### Option B - Setting Up Home Manager.
  1. Get the nix channel
  
      ```bash
        nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz 
      ```
  2. Updating the channel
  
        ```bash
          nix-channel --update
        ```
  3.  Installing Home Manager

        ```bash
          nix-shell '<home-manager>' -A install
        ```
## Managing Other Packages, Programs & Services With Nix
### Flatpak Package Manager

1. Enabling Flatpak in configuration.nix, which also naturrally installs it.
      ```nix
        service.enable.flatpak = true;
      ```
2. Running this command to let it access flathub app store.
      ```bash
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      ```

## Helpful Residual Nix Commands
1. Switching generations after a rebuild.
      ```bash
        sudo nixos-rebuild switch
      ```
2. With my special setup, with flakes & home-manager. 
      ```bash
        sudo nixos-rebuild switch --flake .#mesh
      ```
3. Checking gnome's version. 
      ```bash
        nix eval .#nixosConfigurations.mesh.pkgs.gnome-shell.version
      ```
4.
