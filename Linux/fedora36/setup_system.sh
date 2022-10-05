#!/usr/bin/env bash

BOLD=$(tput bold)
LIGHT_RED="\e[1;31m"
LIGHT_GREEN="\e[1;32m"
LIGHT_BLUE="\e[1;34m"
DIM_GRAY="\e[2;37m"
END="\e[0m"

seed() {
    if [ $# -ne 1 ]; then
        exit 1
    fi
    echo -e "\t${DIM_GRAY}Starting$END $1…"
}

report() {
    if [ $# -ne 2 ]; then
        exit 1
    fi
    echo -e "[ ${LIGHT_GREEN}OK$END ]\t$DIM_GRAY$1$END $2."
}

if [ $# -ne 1 ]; then
    echo -e "${LIGHT_RED}device name expected as argument$END"
    exit 1
fi

echo -e "Hello, $USER! This script is going to set up your ${BOLD}Fedora $(rpm -E %fedora)$END system."

# device name
hostnamectl set-hostname $1
report "Set up" "Device name to $1"

# system settings
seed "Setting up your system"

# displays
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3700
report "Turned on" "Night light"

# mouse & touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
report "Turned on" "Touchpad tap to click option"

# keyboard shortcuts
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"
# ctrl+alt terminal, calculator, nautilus, browser
schema="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"
gsettings set $schema:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'terminal'
gsettings set $schema:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'
gsettings set $schema:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "['<Primary><Alt>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Primary><Alt>f']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Primary><Alt>b']"
# super+esc screen lock
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>Escape']"
report "Set up" "Keyboard shortcuts"

# region & language
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
gsettings set org.gnome.desktop.input-sources per-window true
report "Set up" "Language layouts"

# date & time
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.datetime automatic-timezone true
report "Set up" "Clock format and automatic timezone"

# fonts
gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 13'
gsettings set org.gnome.desktop.interface font-name 'Cantarell 13'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 13'
report "Set up" "System fonts"

# top bar
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.calendar show-weekdate true
report "Set up" "Top bar"

# window titlebars
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
report "Turned on" "Maximize and minimize titlebar buttons"

# nautilus folders before files
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
report "Set up" "Sort folders before files in Nautilus"

# gnome-weather app
gsettings set org.gnome.GWeather temperature-unit 'centigrade'

# extensions
seed "Setting up your exntensions"

# needs restarting gnome-shell (alt+f2+r for Xorg)
# works on Xorg, but kills entire wayland session
# pkill -HUP gnome-shell

# tray icons
gnome-extensions enable -q appindicatorsupport@rgcjonas.gmail.com
report "Enabled" "Tray icons"

# background logo
gsettings set org.fedorahosted.background-logo-extension logo-always-visible true
report "Enabled" "Background logo"

# bluetooth disabled by default
# sudo sed -ci "s/\(AutoEnable *= *\).*/\1false/" /etc/bluetooth/main.conf
sudo bash -c 'echo -e "#!/usr/bin/env bash\nrfkill block bluetooth\nexit 0" > /etc/rc.d/rc.local' && sudo chmod +x /etc/rc.d/rc.local
report "Disabled" "Bluetooth at startup"

# speeding up dnf
grep -qe fastestmirror /etc/dnf/dnf.conf || sudo bash -c 'echo fastestmirror=1 >> /etc/dnf/dnf.conf'
grep -qe max_parallel_downloads /etc/dnf/dnf.conf || sudo bash -c 'echo max_parallel_downloads=10 >> /etc/dnf/dnf.conf'
report "Turned on" "DNF speed up"

# adding third-party repositories
seed "Adding RPM Fusion"
sudo dnf install -qy https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -qy https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
report "Added" "RPM Fusion repositories"

# adding atom repo
sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sudo bash -c 'echo -e "[atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
report "Added" "Atom Editor repository"

# adding yandex.disk repo
sudo rpm --import http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG
sudo bash -c 'echo -e "[yandex]\nname=Yandex\nfailovermethod=priority\nbaseurl=http://repo.yandex.ru/yandex-disk/rpm/stable/\$basearch\nenabled=1\nmetadata_expire=1d\ngpgcheck=1\ngpgkey=http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG" > /etc/yum.repos.d/yandex-disk.repo'
report "Added" "Yandex.Disk repository"

# flathub support
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-modify --enable flathub
report "Added" "Flathub compatibility"

# updating and installing software
seed "Updating software"
if [[ $1 == *"thiranger"* ]]; then
    sudo dnf remove -qy cheese gnome-boxes gnome-calendar gnome-characters gnome-maps gnome-photos gnome-tour libreoffice* mediawriter rhythmbox totem yelp
    sudo dnf install -qy atom cmake discord file-roller gcc-c++ gnome-music gnome-tweaks inxi neofetch pass python3-pip steam transmission valgrind vim vlc yandex-disk # doublecmd-gtk easytag grub-customizer jupyter-notebook mediainfo shotwell soundconverter
    flatpak install -y --noninteractive flathub com.belmoussaoui.Authenticator com.github.liferooter.textpieces dev.geopjr.Collision org.telegram.desktop # com.spotify.Client
fi
if [ ! -z "$(lspci | grep -i nvidia)" ]; then
    sudo dnf install -qy akmod-nvidia
fi
sudo dnf upgrade -qy
sudo dnf autoremove -qy
report "Set up" "Software stack"

# superuser
sudo passwd root

if [[ $1 == *"thiranger"* ]]; then
    # favorite apps
    gsettings set org.gnome.shell favorite-apps "['atom.desktop', 'firefox.desktop', 'org.telegram.desktop.desktop', 'discord.desktop', 'steam.desktop', 'org.gnome.Music.desktop']"
    report "Set up" "Favorite applications"

    # programming ecosystem
    mkdir -p ~/fedya/prog
    echo -e "CFLAGS   += -std=c11 -O2 -Wall -Wno-pointer-sign -fsanitize=address,undefined\nCPPFLAGS += -std=c++17 -O2 -Wall -Wctor-dtor-privacy -Weffc++ -Wempty-body -Werror -Wfloat-equal -Wformat-security -Wignored-qualifiers -Winit-self -Wlogical-op -Wmissing-field-initializers -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual -Wpointer-arith -Wshadow -Wsign-promo -Wstrict-null-sentinel -Wswitch-default -Wtype-limits\n\n.PHONY: all clear\n\nall: main\n\nmain: main.o\n\tg++ \$(CPPFLAGS) \$^ -o \$@\n\nmain.o: main.cpp\n\tg++ \$(CPPFLAGS) -c \$< -o \$@\n\nclear:\n\trm -rf *.o" > ~/fedya/prog/Makefile
    report "Set up" "$USER programming ecosystem"

    # terminal profile preset
    grep -qe PS1 ~/.bashrc || echo 'PS1="\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\\$ "' >> ~/.bashrc
    source ~/.bashrc

    gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'system'

    uuid=$(uuidgen)
    dconfdir=/org/gnome/terminal/legacy/profiles

    gsettings set org.gnome.Terminal.ProfilesList list "$(gsettings get org.gnome.Terminal.ProfilesList list | sed s/.$//), '$uuid']"
    gsettings set org.gnome.Terminal.ProfilesList default "'$uuid'"

    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ audible-bell false
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ background-color 'rgb(46,52,54)'
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ bold-is-bright true
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ highlight-background-color 'rgb(72,185,199)'
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ highlight-colors-set true
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ foreground-color 'rgb(211,215,207)'
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ palette "['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ use-theme-colors false
    gsettings set org.gnome.Terminal.Legacy.Profile:$dconfdir:/:$uuid/ visible-name 'Tango'
    report "Set up" "Terminal profile preset"

    # allowing telegram to work in the background
    flatpak permission-set background background org.telegram.desktop yes

    # adding telegram to autostart
    mkdir -p ~/.config/autostart
    echo -e "[Desktop Entry]\nType=Application\nName=org.telegram.desktop\nExec=flatpak run --command=telegram-desktop org.telegram.desktop -workdir /home/thiranger/.var/app/org.telegram.desktop/data/TelegramDesktop/ -autostart\nX-Flatpak=org.telegram.desktop" > ~/.config/autostart/org.telegram.desktop.desktop
    report "Added" "Telegram Destop to autostart"

    # atom editor settings
    mkdir -p ~/.atom
    echo -e '"*":\n  core: {}\n  editor:\n    fontSize: 24\n    preferredLineLength: 100\n    tabLength: 4\n    tabType: "soft"\n  "exception-reporting":\n    userId: "'$(uuidgen)'"\n  "one-dark-ui":\n    fontSize: 19\n  "one-light-ui":\n    fontSize: 19\n  welcome:\n    showOnStartup: false' > ~/.atom/config.cson
    report "Set up" "Atom Editor settings"

    # vim settings
    rawrepositorypath=https://github.com/skajida/os-instructions/raw/main
    filename=vim.zip
    mkdir -p ~/.vim/autoload
    wget -q --trust-server-names https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P ~/.vim/autoload
    wget -q $rawrepositorypath/Linux/$filename -P ~/Downloads
    unzip -q ~/Downloads/$filename -d ~/.vim
    mv ~/.vim/.vimrc ~
    rm -f ~/Downloads/$filename
    vim ~/.vimrc
    # :PlugUpdate
    report "Set up" "Vim settings"

    # generating ssh key fingerprint
    ssh-keygen -t ed25519

    # yandex.disk setup
    yandex-disk setup
    yandex-disk stop
    echo 'exclude-dirs="AESC,ARCHIVE,CS,SERVER"' >> ~/.config/yandex-disk/config.cfg
    yandex-disk start
    report "Set up" "Yandex.Disk daemon"
fi

# EOS
exit 0
