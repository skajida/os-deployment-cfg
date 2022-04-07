# Ubuntu 18.04

#### Creating a bootable USB drive

```bash
lsblk
sudo dd if=~/Downloads/ubuntu-18.04.6-desktop-amd64.iso of=/dev/sd? status=progress oflag=sync bs=16M
```

<!-- #### Settings -->

<!-- #### Tweaks -->

#### Atom

<pre>
<b>editor</b>
    font size = 24
    preferred line length = 100
    tab length = 4
    tab type = soft
<b>themes</b>
    font size = 19
</pre>

<!-- #### Remove -->

#### Yandex.Disk repository

```bash
su
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex-disk.list > /dev/null
wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add -
exit
```

#### Enpass repository

```bash
su
bash -c "echo \"deb https://apt.enpass.io/ stable main\" > /etc/apt/sources.list.d/enpass.list"
wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -
exit
```

#### Grub customizer repository
```bash
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
```

#### Install

```bash
sudo apt install chromium-browser doublecmd-gtk gdebi git gnome-music gnome-tweaks gnome-weather grub-customizer inxi neofetch pinta shotwell soundconverter transmission valgrind vim vlc
tracker daemon -s
? easytag gcc-7-multilib jupyter-notebook linux-image-5.0.0-31-lowlatency mediainfo nasm sensors soundconverter
sudo snap install telegram-desktop
```

#### Superuser

```bash
sudo passwd root
```

#### Integrated/Discrete graphics

```bash
sudo prime-select intel/nvidia
```

#### Minimizing by click

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

#### TTL

```bash
sudo bash -c "echo \"net.ipv4.ip_default_ttl=65\" > /etc/sysctl.d/99_default_ttl.conf"
sysctl --system
```

#### Telegram startup

```bash
printf '[Desktop Entry]\nType=Application\nExec=telegram-desktop -startintray\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=Telegram Desktop\nName=Telegram Desktop\nComment[en_US]=Messanger\nComment=Messanger\n' > ~/.config/autostart/telegram-desktop.desktop
```

#### Yandex.Disk setup

```bash
echo "exclude-dirs=\"AESC,ARCHIVE,CS,SERVER\"" >> ~/.config/yandex-disk/config.cfg
```

#### Double Commander settings

```bash
wget https://gitlab.com/skajiDa/os-instructions/-/raw/master/Linux/doublecmd.xml -O ~/.config/doublecmd/doublecmd.xml
```

#### Vim settings

```bash
wget https://gitlab.com/skajiDa/os-instructions/-/raw/master/Linux/vim.tar.gz -O ~/Downloads/vim.tar.gz
mkdir ~/Downloads/vim
tar -xf ~/Downloads/vim.tar.gz -C ~/Downloads/vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/Downloads/vim/.vimrc ~/
cp -r ~/Downloads/vim/colors ~/.vim
rm -r ~/Downloads/vim
rm ~/Downloads/vim.tar.gz
```
`:PlugUpdate`

#### `temp`

**Prince of Persia**
```bash
sudo apt install dosbox
# mount c %PATH%
```

**Duck Game**
* install [protontricks](https://github.com/Matoking/protontricks)
```bash
pipx ensurepath
pipx install protontricks
pipx upgrade protontricks
sudo apt install winetricks
protontricks 312530 dotnet40 dinput
```
