#!/usr/bin/env bash

LIGHT_RED="\e[1;31m"
END="\e[0m"

if [ $# -eq 0 ]; then
    echo -e "${LIGHT_RED}device name expected as argument$END"
    exit 1
fi

# dash to dock installation
version=69
archive=dash-to-dockmicxgx.gmail.com.v$version.shell-extension.zip
uuid=dash-to-dock@micxgx.gmail.com
wget https://extensions.gnome.org/extension-data/$archive -P ~/Downloads
mkdir -p ~/.local/share/gnome-shell/extensions/$uuid
unzip ~/Downloads/$archive -d ~/.local/share/gnome-shell/extensions/$uuid
rm -f ~/Downloads/$archive
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'
gnome-extensions enable $uuid

# device name
hostnamectl set-hostname $1

# system settings

# no such dconf setting lol
# sound -> volume levels -> system sound = 100

# displays
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3700
gsettings set com.system76.hidpi enable false

# mouse & touchpad
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# keyboard shortcuts
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "['<Primary><Alt>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Primary><Alt>f']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Primary><Alt>t']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Primary><Alt>b']"
gsettings set org.gnome.shell.extensions.pop-shell focus-down "['<Super>KP_Down', '<Super>j']"
gsettings set org.gnome.shell.extensions.pop-shell focus-left "['<Super>KP_Left', '<Super>h']"
gsettings set org.gnome.shell.extensions.pop-shell focus-right "['<Super>KP_Right', '<Super>l']"
gsettings set org.gnome.shell.extensions.pop-shell focus-up "['<Super>KP_Up', '<Super>k']"

# region & language
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
gsettings set org.gnome.desktop.input-sources per-window true

# extensions
gsettings set org.gnome.shell disabled-extensions "['pop-shell@system76.com', 'ding@rastersoft.com']"
gsettings set org.gnome.shell enabled-extensions "['alt-tab-raise-first-window@system76.com', 'always-show-workspaces@system76.com', 'pop-shop-details@system76.com', 'system76-power@system76.com', 'ubuntu-appindicators@ubuntu.com', 'dash-to-dock@micxgx.gmail.com']"

# fonts
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab 13'
gsettings set org.gnome.desktop.interface font-name 'Fira Sans Semi-Light 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Semi-Bold 12'

# top bar
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.calendar show-weekdate true

# window titlebars
gsettings set org.gnome.desktop.wm.preferences action-right-click-titlebar 'none'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# workspaces
gsettings set org.gnome.mutter workspaces-only-on-primary true

# dash to dock settings
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'ALL_WINDOWS'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'

# bluetooth disabled by default
sudo bash -c 'echo -e "#!/usr/bin/env bash\nrfkill block bluetooth\nexit 0" > /etc/rc.local' && sudo chmod +x /etc/rc.local

# setting 65 as default ttl
sudo bash -c 'echo "net.ipv4.ip_default_ttl=65" > /etc/sysctl.d/99_default_ttl.conf'
sysctl --system

# signing spotify repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5E3C45D7B312C643

# adding yandex.disk repo
sudo bash -c 'echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" > /etc/apt/sources.list.d/yandex-disk.list'
sudo bash -c "wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add -"

# adding enpass repo
sudo bash -c 'echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list'
sudo bash -c "wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -"

# flathub support
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# updating and installing software
sudo apt update
if [[ $1 == *"thiranger"* ]]; then
    sudo apt remove -y firefox geary gnome-contacts gucharmap libreoffice-common seahorse
    sudo apt install -y atom discord doublecmd-gtk enpass g++-10 gcc-10 gdebi gnome-tweaks google-chrome-stable inxi neofetch spotify-client steam transmission valgrind vim vlc yandex-disk # easytag gnome-music grub-customizer jupyter-notebook mediainfo shotwell soundconverter
    flatpak install -y flathub org.telegram.desktop
fi
sudo apt upgrade -y
sudo apt autoremove -y

# making gcc-10 as default gcc
sudo rm -f /usr/bin/gcc /usr/bin/g++
cd /usr/bin
sudo ln -s gcc-10 /usr/bin/gcc
sudo ln -s g++-10 /usr/bin/g++
cd ~

# superuser
sudo passwd root

if [[ $1 == *"thiranger"* ]]; then
    # favorite apps
    gsettings set org.gnome.shell favorite-apps "['doublecmd.desktop', 'atom.desktop', 'google-chrome.desktop', 'org.telegram.desktop.desktop', 'discord.desktop', 'steam.desktop', 'spotify.desktop']"

    # programming ecosystem
    mkdir -p ~/fedya/prog
    echo -e "CFLAGS+=-std=c11 -O2 -Wall -Wno-pointer-sign -fsanitize=address,undefined\nCPPFLAGS+=-std=c++17 -O2 -Wall -Werror -Wformat-security -Wignored-qualifiers -Winit-self -Wswitch-default -Wfloat-equal -Wshadow -Wpointer-arith -Wtype-limits -Wempty-body -Wlogical-op -Wmissing-field-initializers -Wctor-dtor-privacy -Wnon-virtual-dtor -Wstrict-null-sentinel -Wold-style-cast -Woverloaded-virtual -Wsign-promo -Weffc++\n.PHONY: all clear\n\nall: main\n\nmain: main.o\n\tg++ \$(CPPFLAGS) \$^ -o \$@\n\nmain.o: main.cpp\n\tg++ \$(CPPFLAGS) -c \$< -o \$@\n\nclear:\n\trm -rf *.o" > ~/fedya/prog/Makefile

    # generating ssh key fingerprint
    ssh-keygen -t ed25519 -C "" -f ~/.ssh/id_ed25519 -N ""

    # terminal profile preset
    uuid=$(uuidgen)
    dconfdir=/org/gnome/terminal/legacy/profiles

    gsettings set org.gnome.Terminal.ProfilesList list "$(gsettings get org.gnome.Terminal.ProfilesList list | sed s/.$//), '$uuid']"
    gsettings set org.gnome.Terminal.ProfilesList default "'$uuid'"

    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ background-color 'rgb(46,52,54)'
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ bold-is-bright true
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ cursor-colors-set false
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ foreground-color 'rgb(211,215,207)'
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ palette "['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ visible-name 'Tango'

    # adding telegram to autostart
    mkdir -p ~/.config/autostart
    echo -e "[Desktop Entry]\nType=Application\nName=org.telegram.desktop\nExec=flatpak run --command=telegram-desktop org.telegram.desktop -workdir /home/thiranger/.var/app/org.telegram.desktop/data/TelegramDesktop/ -autostart\nX-Flatpak=org.telegram.desktop" > ~/.config/autostart/org.telegram.desktop.desktop

    # double commander settings
    rawrepositorypath=https://github.com/skajida/os-instructions/raw/master
    filename=doublecmd.xml
    mkdir -p ~/.config/doublecmd
    wget $rawrepositorypath/Linux/$filename -P ~/.config/doublecmd

    # atom editor settings
    mkdir -p ~/.atom
    echo -e '"*":\n  core: {}\n  editor:\n    fontSize: 24\n    preferredLineLength: 100\n    tabLength: 4\n    tabType: "soft"\n  "exception-reporting":\n    userId: "f52a7796-d4a1-472f-bcd6-1c0167a70cb6"\n  "one-dark-ui":\n    fontSize: 19\n  "one-light-ui":\n    fontSize: 19\n  welcome:\n    showOnStartup: false' > ~/.atom/config.cson

    # vim settings
    filename=vim.zip
    mkdir -p ~/.vim/autoload
    wget --trust-server-names https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P ~/.vim/autoload
    wget $rawrepositorypath/Linux/$filename -P ~/Downloads
    unzip ~/Downloads/$filename -d ~/.vim
    mv ~/.vim/.vimrc ~
    rm -f ~/Downloads/$filename
    vim ~/.vimrc
    # :PlugUpdate

    # yandex.disk setup
    yandex-disk setup
    yandex-disk stop
    echo 'exclude-dirs="AESC,ARCHIVE,CS,SERVER"' >> ~/.config/yandex-disk/config.cfg
    yandex-disk start
fi

# EOS
exit 0
