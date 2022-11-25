# Fedora 37

#### Create a bootable USB drive
```bash
lsblk
sudo dd if=~/Downloads/Fedora-Workstation-Live-x86_64-37/Fedora-Workstation-Live-x86_64-37-1.7.iso of=/dev/sd? status=progress oflag=sync bs=16M
```

#### Download script
```bash
wget https://raw.githubusercontent.com/skajida/os-instructions/main/Linux/fedora37/setup_system.sh -P ~/Downloads
chmod +x ~/Downloads/setup_system.sh
```
