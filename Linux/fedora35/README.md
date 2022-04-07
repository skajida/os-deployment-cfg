# Fedora 35

#### Creating a bootable USB drive
```bash
lsblk
sudo dd if=~/Downloads/Fedora-Workstation-Live-x86_64-35/Fedora-Workstation-Live-x86_64-35-1.2.iso of=/dev/sd? status=progress oflag=sync bs=16M
```

#### Downloading script
```bash
wget https://raw.githubusercontent.com/skajida/os-instructions/main/Linux/fedora35/setup_system.sh -P ~/Downloads
chmod +x ~/Downloads/setup_system.sh
```
