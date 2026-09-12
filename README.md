# config NixOS

## Setup on new machine

```bash
sudo git clone git@github.com:MarcusRabourdin/nixos-config.git /etc/nixos
cd /etc/nixos
sudo chowm -R $USER:users /etc/nixos
nixos-generate-config --show-hardware-config > hardware-configuration.nix
sudo nixos-rebuild switch --flake
```
