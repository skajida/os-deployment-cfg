# My ansible config

## Downloading config

```bash
wget --show-progress https://github.com/skajida/os-instructions/archive/refs/heads/main.zip -O /tmp/os-deployment-cfg.zip
unzip /tmp/os-deployment-cfg.zip -d ~/Documents/
```

## Images download links

[`iso`/`torrent` images](docs/images.md)

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

## To-do

- [ ] Apply [recommended layout](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#directory-layout)
- [ ] Rename roles config files and add hxcfg deployment
- [ ] ~~Make 110x24 terminal size as default~~

- [ ] Import GPG keyring from secret vault
- [ ] Include separated configs for Pop_OS 24.04
- [ ] Include role for home server deployment
