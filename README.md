# Server-Setup-Scripts

## To set up a Vncserver on AWS Amazon Linux with running Napari



## To set up a Vncserver on Debian Linux personal server with running Napari

´´´
sudo apt-add-repository ppa:ubuntu-mate-dev/xenial-mate
sudo apt-get update & sudo apt-get upgrade
sudo apt-get install tightvnc
sudo apt-get install tightvncserver
vncserver
sudo apt install snapd
sudo snap install core


´´´
## To run different desktop environments update the xstartup file


vi  ~/.vnc/xstartup

### For running MATE desktop

sudo apt-get install mate-desktop-environment


´´´
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
´´´

### For running lxde desktop
sudo apt-get install lxde

´´´
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
´´´

### For running KDE Plasma desktop

sudo apt-get install kde-plasma-desktop

´´´
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/startplasma-x11
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
´´´


### For running Cinnamon desktop

sudo apt-get install cinnamon-desktop-environment

´´´
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
´´´


### For running Xfce desktop

sudo apt-get install xfce4 xfce4-goodies

´´´
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/startxfce4
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
´´´


To make it executable:

chmod +x ~/.vnc/xstartup





Starting the vncserver
---
Here we start he vnc server on display number 1
vncserver -geometry 1600x900 :1

To connect to this server from laptop type in
---
ssh -N -L 5901:localhost:5901 username@ip

E.g. username: debian

ip : 51.210.158.171


## Installing Anaconda and Napari

wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh

chmod 777 Anaconda3-2022.10-Linux-x86_64.sh

./Anaconda3-2022.10-Linux-x86_64.sh

conda create -n naparienv python==3.9

pip install oneat

pip install napari[all]

sudo apt-get install -y libdbus-1-3 libxkbcommon-x11-0 libxcb-icccm4 \
    libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 \
    libxcb-xinerama0 libxcb-xinput0 libxcb-xfixes0

    