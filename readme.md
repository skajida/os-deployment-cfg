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

[`iso`/`torrent` images][docs/images.md]

## To-do

* Check flathub is managed correctly (Fedora)
* Include separated configs for CentOS (crb repo, inxi, speedtest-cli?, old GNOME ver settings)
* Import GPG keyring

* Include separated configs for Pop_OS 24.04
* Include role for home server deployment
