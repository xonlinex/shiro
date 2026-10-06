#!/usr/bin/env bash

set -e

# 1. Instalar dependencias necesarias para compilar paru
echo "==> Instalando dependencias base para paru..."
sudo pacman -S --needed rust

# 2. Clonar e instalar paru
echo "==> Instalando paru desde AUR..."
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg -si

cd ~

# 3. Instalación de paquetes mediante paru
echo "==> Instalando fuentes..."
paru -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

echo "==> Instalando servidor de audio (PipeWire)..."
paru -S --needed --noconfirm pipewire pipewire-audio pipewire-pulse pipewire-jack

echo "==> Instalando interfaz y gestor de sesión..."
paru -S --needed --noconfirm sddm niri noctalia

# habilitar sddm
sudo systemctl enable sddm.service

echo "==> Instalando herramientas CLI y utilidades de entorno..."
paru -S --needed --noconfirm neovim ghostty tmux zsh starship wl-clipboard

echo "==> ¡Instalación completada!"
