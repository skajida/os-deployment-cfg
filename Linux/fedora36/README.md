# Fedora 36

#### Create a bootable USB drive
```bash
lsblk
sudo dd if=~/Downloads/Fedora-Workstation-Live-x86_64-36/Fedora-Workstation-Live-x86_64-36-1.5.iso of=/dev/sd? status=progress oflag=sync bs=16M
```

#### Download script
```bash
wget https://raw.githubusercontent.com/skajida/os-instructions/main/Linux/fedora36/setup_system.sh -P ~/Downloads
chmod +x ~/Downloads/setup_system.sh
```
