# Server-Setup-Scripts

## To set up a Vncserver on AWS Amazon Linux with running Napari

Setting things on amazon linux instance to have a GUI based controller for submitting, monitoring and visualizing jobs and their outputs.

For our AWS instances we start from the post number 2 and setup the various instances numbered according to their tasks:

| Instance Name | Display number | Technical specs | Intended usage |
|:---           |:---:           | :---:           |:---:           |
| AL_KapoorLabs_predict | 2 | Tesla T4 15360MiB, 15.4 GB RAM, 4 vCPU,CUDA Version: 11.6, Deep Learning AMI GPU TensorFlow 2.10.0 (Amazon Linux 2) 20221024 |  Prediction on small scale datasets |
| AL_KapoorLabs_train_mid | 3 | Tesla T4 15360MiB, 31 GB RAM, 4 vCPU,CUDA Version: 11.6, Deep Learning AMI GPU TensorFlow 2.10.0 (Amazon Linux 2) 20221024 |  Training on mid scale datasets, Prediction on mid scale datasets |
| AL_KapoorLabs_train_large | 4 | Tesla T4 15360MiB, 60 GB RAM, 4 vCPU,CUDA Version: 11.6, Deep Learning AMI GPU TensorFlow 2.10.0 (Amazon Linux 2) 20221024 |  Training on large scale datasets, Prediction on large scale datasets |

```
sudo yum update
sudo amazon-linux-extras install mate-desktop1.x
sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'
sudo yum install tigervnc-server
vncpasswd
sudo mkdir /etc/tigervnc
sudo bash -c 'echo localhost > /etc/tigervnc/vncserver-config-mandatory'
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sudo sed -i 's/<USER>/ec2-user/' /etc/systemd/system/vncserver@.service
sudo systemctl daemon-reload
sudo systemctl enable vncserver@: <display number>
sudo systemctl start vncserver@: <display number>
sudo yum install mate-desktop
sudo yum install mate-desktop-environment
```

vi  ~/.vnc/xstartup

### For running MATE desktop

sudo apt-get install mate-desktop-environment


```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```

#### Installing Anaconda and Napari on debian servers

wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh

chmod 777 Anaconda3-2022.10-Linux-x86_64.sh

./Anaconda3-2022.10-Linux-x86_64.sh

conda create -n naparienv python==3.9

pip install oneat

pip install napari[all]

```
sudo yum install -y mesa-libGL-devel
sudo yum install -y libdbusmenu-gtk3
sudo yum install -y libdbusmenu-glib.so.4
sudo yum install -y libdbus-1.so.3
sudo yum install -y libxkbcommon.so.0
sudo yum install -y qt5-qtx11extras-devel
```
To make it executable:

chmod +x ~/.vnc/xstartup

Starting the vncserver
---
Here we start the vnc server on display number 2
vncserver -geometry 1600x900 :2

To connect to this server from laptop type in
---
ssh -N -L 5901:localhost:5901 -i <name>.pem username@ip

E.g. username: ec2-user

ip : 51.xx.ec2-13-38-41-103.eu-west-3.compute.amazonaws.com


## To set up a Vncserver on Debian Linux personal server with running Napari

```
sudo apt-add-repository ppa:ubuntu-mate-dev/xenial-mate
sudo apt-get update & sudo apt-get upgrade
sudo apt-get install tightvnc
sudo apt-get install tightvncserver
vncserver
sudo apt install snapd
sudo snap install core
```
## To run different desktop environments update the xstartup file


vi  ~/.vnc/xstartup

### For running MATE desktop

sudo apt-get install mate-desktop-environment


```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```

### For running lxde desktop
sudo apt-get install lxde

```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```

### For running KDE Plasma desktop

sudo apt-get install kde-plasma-desktop

```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/startplasma-x11
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```


### For running Cinnamon desktop

sudo apt-get install cinnamon-desktop-environment

```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/mate-session
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```


### For running Xfce desktop

sudo apt-get install xfce4 xfce4-goodies

```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/startxfce4
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```


To make it executable:

chmod +x ~/.vnc/xstartup





Starting the vncserver
---
Here we start the vnc server on display number 1
vncserver -geometry 1600x900 :1

To connect to this server from laptop type in
---
ssh -N -L 5901:localhost:5901 username@ip

E.g. username: debian

ip : 50.xx


#### Installing Anaconda and Napari on debian servers

wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh

chmod 777 Anaconda3-2022.10-Linux-x86_64.sh

./Anaconda3-2022.10-Linux-x86_64.sh

conda create -n naparienv python==3.9

pip install oneat

pip install napari[all]

```
sudo apt-get install -y libdbus-1-3 libxkbcommon-x11-0 libxcb-icccm4 
    libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 
    libxcb-xinerama0 libxcb-xinput0 libxcb-xfixes0
```
