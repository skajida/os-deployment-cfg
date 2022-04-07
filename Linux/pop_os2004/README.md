# Pop!_OS 20.04

#### Creating a bootable USB drive

```bash
lsblk
sudo dd if=~/Downloads/pop-os_20.04_amd64_nvidia_38.iso of=/dev/sd? status=progress oflag=sync bs=16M
```

#### Downloading script
```bash
wget https://github.com/skajida/os-instructions/raw/master/Linux/pop_os2004/setup_system.sh -P ~/Downloads
chmod +x ~/Downloads/setup_system.sh
```

#### Installing Paint.NET

```bash
sudo apt install playonlinux wine
wget http://dl1.topfiles.net/files/2/61/333/YXNhb2vr8MFTMVBYcktrOGN3eWl4SVVndTFLMkNTUzFBOXJHaDFNSXFSc2twaz06Ogt4ZF3zaspTfvAURvBIqHc/paintnet_3.5.11.exe -P ~/Downloads
```
<pre>
<b>playonlinux</b>
    install a program with a new virtual drive
    install some libraries
    32 bits windows installation
        POL_Install_dotnet40
        POL_Install_gdiplus
    PaintDotNet.exe
</pre>
