# My ansible config

## Download and run config

**Downloading**

```bash
wget --show-progress https://github.com/skajida/os-instructions/archive/refs/heads/main.zip -O /tmp/os-instr.zip
unzip /tmp/os-instr.zip -d ~/Documents/
```

**Running**

```bash
~/Documents/os-instructions-main/run.sh [hostname]
```

## Creating a bootable USB drive

### Linux

```bash
lsblk
sudo dd status=progress oflag=sync bs=4M if=/path/to/image.iso of=/dev/sd?
```

### Windows

1. **Download [Rufus](https://github.com/pbatard/rufus/releases/latest/)** to burn  Windows image to your USB stick.
2. Select **your drive** and **path** to `.iso` image.
3. Select **GPT** partition scheme.
4. Click **START**. Attention! All data on your flash drive will be erased!

## Images download links

### Linux x86_64

#### Red Hat Enterprise Linux

* [Fedora 37 Workstation](https://mirror.linux-ia64.org/fedora/linux/releases/37/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-37-1.7.iso)
* [CentOS Stream 9](https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-dvd1.iso)

#### Debian

* [Tails 5.11](https://mirrors.edge.kernel.org/tails/stable/tails-amd64-5.11/tails-amd64-5.11.iso)
* [Kali Linux 2023.1](https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-installer-amd64.iso)
* [Ubuntu 22.04](https://releases.ubuntu.com/22.04/ubuntu-22.04.2-desktop-amd64.iso)

#### Server

* [Fedora 37 Server](https://mirror.linux-ia64.org/fedora/linux/releases/37/Server/x86_64/iso/Fedora-Server-dvd-x86_64-37-1.7.iso)
* [Ubuntu Server 22.04](https://releases.ubuntu.com/22.04/ubuntu-22.04.2-live-server-amd64.iso)

## To-do

* Check flathub is managed correctly (Fedora)
* Include separated configs for CentOS (crb repo, inxi, speedtest-cli?, old GNOME ver settings)
* Import GPG keyring

* Include separated configs for Pop_OS 24.04
* Include role for home server deployment
