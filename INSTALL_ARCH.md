# My Arch installation and settings

## Wifi

https://wiki.archlinux.org/title/Iwd#iwctl

`iwctl`

> station wlan0 connect your-wifi-name

## Clock

`timedatectl`

## Disk

`fdisk /dev/nvme0n1`

1. EFI (don't remove or format)
2. +4Gb swap
3. +90G root
4. home dir

Format:
```
mkfs.ext4 /dev/nvme0n1p3
mkfs.ext4 /dev/nvme0n1p4  (dont't if you need to keep the data)
mkswap /dev/nvme0n1p2
```

Mount:
```
mount /dev/nvme0n1p3 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
mount --mkdir /dev/nvme0n1p4 /mnt/home
swapon /dev/nvme0n1p2
```

## Install essentials
```
pacstrap -K /mnt base linux linux-firmware vim iwd
```

## fstab
```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Chroot
```
arch-chroot /mnt
```

## Time
```
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
hwclock --systohc
```

## Localization
Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and nl_BE.UTF-8 UTF-8
`locale-gen`

Create the locale.conf(5) file, and set the LANG variable accordingly:
/etc/locale.conf
LANG=en_US.UTF-8

## Network
set hostname in /etc/hostname
`pacman -Suy networkmanager`
`systemctl enable NetworkManager.service`

## Root passwd
`passwd`

## Grub
`pacman -S grub efibootmgr`

remove old boot entries from EFI:
`efibootmgr --delete-bootnum --bootnum XXXX --unicode`

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot
```
exit
reboot
```

## If you broke Grub (again)
```
ls (hd0,gpt1)/
set root=(hd0,gpt3)
linux (hd0,gpt1)/vmlinuz-linux root=/dev/nvme0n1p3
initrd (hd0,gpt1)/initramfs-linux.img
boot
```

## Wifi
`nmcli device wifi connect your_wifi password your_password`

## User
```
useradd -m -G wheel roel4d
passwd roel4d
```

## Sudo
as root:
```
pacman -Syu sudo
ln -s /usr/bin/vim /usr/bin/vi
visudo
```

## Fonts
`pacman -Suy ttf-jetbrains-mono ttf-fira-code ttf-liberation noto-fonts nerd-fonts`

## Sound
`sudo pacman -Suy pipewire pipewire-audio pipewire-jack sof-firmware pipewire-pulse`

## Bluetooth
```
sudo pacman -Suy bluez bluez-utils
sudo systemctl --now enable bluetooth.service
```

## Sway (OLD)
```
sudo pacman -Su sway swaylock swayidle swaybg waybar foot fuzzel wmenu brightnessctl
```

## Gnome
```
sudo pacman -Suy gnome gnome-extra extra/xorg-xwayland
sudo systemctl enable gdm.service
```

### Shortcuts (Settings -> Keyboard)
- Launchers:
    - Launch help browser: disable
    - Home folder: super + h
- Navigation:
    - Move window to workspace 1..4 -> shift + super + 1..4
    - Switch to workspace 1..4 -> super + 1..4
    - Switch to workspace left/right -> ctrl + left/right
- Windows:
    - Close window: super + w
    - Toggle fullscreen mode: super + f
- Custom shortcuts:
    - chromium: super + b
    - gnome-terminal: super + return

## Vim
```
sudo pacman -Suy stow vim
stow vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
:PlugInstall

## Generate SSH Key
`ssh-keygen -t ed25519 -C "your_email@example.com"`

## Git
```
pacman -Syu git less lazygit
git config --global user.email your_email
git config --global user.name roel4d
git config --global init.defaultBranch main
```

## Chrome
`sudo pacman -Suy chromium`

## Bitwarden
```
pacman -Suy bitwarden
echo '-ozone-platform=wayland' > ~/.config/electron-flags.conf
```

## Dropbox
```
pacman -Syu base-devel python-pgpme libappindicator-gtk3
git clone https://aur.archlinux.org/dropbox.git
makepkg -si
```

## RDP
`sudo pacman -Suy remmina freerdp`

## Energy
```
pacman -Suy tlp ethtool smartmontools
sudo systemctl --now enable tlp.service
sudo systemctl --now enable NetworkManager-dispatcher.service
```

## SSH server
```
pacman -Syu openssh
sudo systemctl --now enable sshd
```

## Midnight Commander
`sudo pacman -Suy mc`
Change settings with F9 -> options
Appearance: modarin256
Panel Options: Use SI size units + Lynx-like motion

## TMUX (OLD)
```
sudo pacman -Suy tmux
stow tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Start tmux and install plugins with `ctrl-b I`

## Misc
sudo pacman -Suy fd ripgrep fzf
