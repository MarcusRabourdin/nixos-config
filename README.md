# config NixOS

## Setup on new machine

```bash
set -e
PC_NAME="$1"

if [ -z "$PC_NAME" ]; then
  echo "Usage: $0 <pc_name>"
  exit 1
fi

sudo git clone git@github.com:MarcusRabourdin/nixos-config.git /etc/nixos
cd /etc/nixos

sudo nixos-generate-config --show-hardware-config > /tmp/hw.nix

sudo mkdir -p hosts/$PC_NAME
sudo mv /tmp/hw.nix hosts/$PC_NAME/hardware-configuration.nix
cp hosts/main-nixos/configuration.nix hosts/$PC_NAME/configuration.nix

echo "add $PC_NAME = mkHost \"$PC_NAME\"; 'dans flake.nix'"
echo "then sudo nixos-rebuild switch --flake .#$PC_NAME"
```
