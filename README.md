```bash
nix-shell -p git
```

```bash
git clone https://github.com/xonlinex/shiro ~/shiro
cd ~/shiro
```

```bash
cp /etc/nixos/hardware-configuration.nix ~/shiro/hosts/nixos/hardware-configuration.nix
```

```bash
sudo nixos-rebuild switch --flake ~/shiro#nixos
```

```bash
nix run home-manager/master -- switch --flake ~/shiro#xonlinex
```

